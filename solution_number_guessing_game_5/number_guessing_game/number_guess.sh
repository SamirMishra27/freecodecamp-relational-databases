#!/bin/bash

# Variables
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Script starts here
echo -e "Enter your username:\n"
read USERNAME

USER_DATA=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME';")

# If username does not exist
if [[ -z $USER_DATA ]]
then
    INSERT_USER=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME');")

    echo -e "Welcome, $USERNAME! It looks like this is your first time here.\n"
else
    MATCHES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM games LEFT JOIN users USING (user_id) WHERE username = '$USERNAME';")

    BEST_GUESS=$($PSQL "SELECT MIN(guess_attempts) from games LEFT JOIN users USING (user_id) WHERE username = '$USERNAME';")

    echo -e "Welcome back, $USERNAME! You have played $MATCHES_PLAYED games, and your best game took $BEST_GUESS guesses.\n"
fi

# generate secret number
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

# and guesses count
GUESS_COUNT=0

# Start guess game
echo -e "Guess the secret number between 1 and 1000:\n"
USER_GUESS=-1

while [[ $USER_GUESS -ne $SECRET_NUMBER ]]
do
    read USER_GUESS
    $(( GUESS_COUNT+=1 ))  # Increments and returns the newly updated value.

    if ! [[ $USER_GUESS =~ ^[0-9]+$ ]] || [[ -z $USER_GUESS ]]
    then
        echo -e "That is not an integer, guess again:\n"
        continue
    fi

    if [[ $USER_GUESS -gt $SECRET_NUMBER ]]
    then
        echo -e "It's lower than that, guess again:\n"
        continue
    fi

    if [[ $USER_GUESS -lt $SECRET_NUMBER ]]
    then
        echo -e "It's higher than that, guess again:\n"
        continue
    fi
done

echo -e "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!" # :) :)

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME';")

INSERT_GAME_DATA=$($PSQL "INSERT INTO games (user_id, secret_number, guess_attempts) VALUES ($USER_ID, $SECRET_NUMBER, $GUESS_COUNT);")

exit 0
# END #
