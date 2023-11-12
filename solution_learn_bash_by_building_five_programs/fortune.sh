#!/bin/bash

# Program to tell a persons fortune

echo -e "\n~~ Fortune Teller ~~\n"

GET_FORTUNE() {
  if [[ ! $1 ]]
  then
    echo Ask a yes or no question:
  else
    echo Try again. Make sure it ends with a question mark:
  fi

  read QUESTION
  RESPONSES=("Yes" "No" "Maybe" "Outlook good" "Don't count on it" "Ask again later")

  ANSWER=${RESPONSES[ (( $RANDOM%5 )) ]}
  echo -e "\n$ANSWER"
}
GET_FORTUNE
until [[ $QUESTION =~ \?$ ]]  # If the question ends with a ? mark.
do
  GET_FORTUNE again # Passing a default argument without ? mark.
done
