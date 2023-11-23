#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ Welcome To Salon Camp! ⛺ ~~~~~\n"
echo -e "\n~~~ Salon Appointment Scheduler ~~~\n"

MAIN_MENU() {
    if [[ $1 ]]
    then
        echo -e "\n$1"
    fi

    echo "How may I help you?"
    echo "
        1. Book an appointment
        2. See your appointments
        3. Exit
    "
    read MAIN_MENU_SELECTION

    case $MAIN_MENU_SELECTION in
        1) BOOK_MENU ;;
        2) SEE_VIEW ;;
        3) EXIT ;;
        *) MAIN_MENU "Please enter a valid option." ;;
    esac
}

BOOK_MENU() {
    # get services
    AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services;")

    # show services
    echo -e "\nWe offer these services:"
    echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
    do
        echo "$SERVICE_ID) $NAME"
    done

    #  ask for which service to book
    echo -e "\nWhich service would you like to book?"
    read SERVICE_ID_SELECTED

    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")

    # if the input is not a number or not in service menu
    if ! [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]] || [[ -z $SERVICE_NAME ]]
    # send to main menu
    then
        echo "That is not a valid service number."
        BOOK_MENU
    else
        # get customer info
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE

        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")

        # if customer doesn't exist
        if [[ -z $CUSTOMER_NAME ]]
        # get new customer name
        then
            echo -e "\nWhat's your name?"
            read CUSTOMER_NAME

            # insert new customer
            INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
        fi

        # get customer_id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

        # get service time
        echo -e "\nEnter a suitable time for the service:"
        read SERVICE_TIME

        # insert customer appointment
        INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")

        echo -e "I have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')."
    fi
}

SEE_VIEW () {
    # Ask customer phone no
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")

    # if customer doesn't exist
    if [[ -z $CUSTOMER_ID ]]
    # Redirect to main menu
    then
        echo -e "\nNo record found with this number!"
        MAIN_MENU
    fi

    # get all appointments
    APPOINTMENTS=$($PSQL "SELECT customers.name, appointment_id, time, services.name FROM customers INNER JOIN appointments USING (customer_id) INNER JOIN services USING (service_id) WHERE customers.customer_id = $CUSTOMER_ID;")

    # if no appointments
    if [[ -z $APPOINTMENTS ]]
    # redirect to main menu
    then
        echo -e "\nIt seems that you do not have any appointments."
    else
      echo -e "\nHere are your appointments:"
      echo "$APPOINTMENTS" | while read NAME BAR APPOINTMENT_ID BAR TIME BAR SERVICE_NAME
      do
          echo "$NAME - $APPOINTMENT_ID: $SERVICE_NAME at time $TIME"
      done
    fi
}

EXIT() {
    echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU
