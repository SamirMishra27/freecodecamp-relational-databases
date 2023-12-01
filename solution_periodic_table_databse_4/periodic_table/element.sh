#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -t -c"
SELECT_QUERY="SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM elements AS e INNER JOIN properties AS p USING(atomic_number) INNER JOIN types AS t USING(type_id) "

DISPLAY_ELEMENT_INFO() {
    echo "$1" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
    do
        # echo "$ATOMIC_NUMBER $NAME $SYMBOL $TYPE $ATOMIC_MASS $MELTING_POINT $BOILING_POINT"
        echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
}

if [[ -z $1 ]]
then
    echo -e "Please provide an element as an argument."
else
    WHERE_CALUSE="WHERE atomic_number = $1;"
    DATA=$($PSQL "$SELECT_QUERY $WHERE_CALUSE")

    if [[ $DATA ]]
    then
        DISPLAY_ELEMENT_INFO $DATA
        exit 0
    fi

    WHERE_CALUSE="WHERE symbol = '$1';"
    DATA=$($PSQL "$SELECT_QUERY $WHERE_CALUSE")

    if [[ $DATA ]]
    then
        DISPLAY_ELEMENT_INFO $DATA
        exit 0
    fi

    WHERE_CALUSE="WHERE name = '$1';"
    DATA=$($PSQL "$SELECT_QUERY $WHERE_CALUSE")

    if [[ $DATA ]]
    then
        DISPLAY_ELEMENT_INFO $DATA
        exit 0
    fi

    echo -e "I could not find that element in the database."
fi
