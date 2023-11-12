#!/bin/bash

echo -e "\n~~ Questionnaire ~~\n"

QUESTION1="What's your name?"

echo $QUESTION1

read NAME

# echo Your name is $NAME.

QUESTION2="Where are you from?"

echo $QUESTION2

read LOCATION

# echo Hello $NAME from $LOCATION!

QUESTION3="What's your favorite coding website?"

echo $QUESTION3

read WEBSITE

echo -e "Hello $NAME from $LOCATION. I learned that your favorite coding website is $WEBSITE!\n"

# ----- The end ----- #