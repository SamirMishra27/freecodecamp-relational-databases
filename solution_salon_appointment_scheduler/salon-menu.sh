#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon -c --tuples-only"
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
    echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
    do
        echo "$SERVICE_ID) $NAME"
    done

    #  ask for which service to book
    echo -e "\nWhich service would you like to book?"
    read SERVICE_ID_SELECTED

    # if the input is not a number or not in service menu
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]] || [[ -z $($PSQL "SELECT $SERVICE_ID_SELECTED FROM services;") ]]
    # send to main menu
    then
        echo "That is not a valid service number."
        BOOK_MENU
    else
        # get customer info
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE

        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$PHONE_NUMBER'")

        # if customer doesn't exist
        if [[ -z $CUSTOMER_NAME ]]
        # get new customer name
        then
            echo -e "\nWhat's your name?"
            read CUSTOMER_NAME

            # insert new customer
            INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$PHONE_NUMBER')")
        fi

        # get customer_id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$PHONE_NUMBER'")

        # get service time
        echo -e "\nEnter a suitable time for the service"
        read SERVICE_TIME

        # if not a valid time
        if [[ ! $SERVICE_TIME =~ ^\d{1,2}:\d{2}$ ]]
        then
            echo "That is not a valid time."
            BOOK_MENU

        # insert customer appointment
        INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, $SERVICE_TIME);")

        echo -e "I have put you down for a $NAME at $SERVICE_TIME, $CUSTOMER_NAME"
}

SEE_VIEW () {}

EXIT() {
    echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU
