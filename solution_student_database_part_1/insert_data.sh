#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database.

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
cat courses.csv | while IFS="," read MAJOR COURSE
do
  # echo $MAJOR $COURSE

  if [[ $MAJOR != major ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major = '$MAJOR';")
    echo $MAJOR_ID

    # if not found
    if [[ -z $MAJOR_ID ]]
    # insert major
    then
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors (major) VALUES ('$MAJOR');")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi
      # echo INSERT_MAJOR_RESULT
    fi

    # get new major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major = '$MAJOR';")

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course = '$COURSE';")

    # if not found
    if [[ -z $COURSE_ID ]]
    # insert course
    then
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses (course) VALUES ('$COURSE');")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into courses, $COURSE
      fi
      # echo $INSERT_COURSE_RESULT
    fi

    # get new course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course = '$COURSE';")

    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses (major_id, course_id) VALUES ($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into majors_courses, $MAJOR_ID, $COURSE_ID
    fi
    # echo $MAJOR_ID, $COURSE_ID
  fi
done

cat students.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  # echo $FIRST

  if [[ $FIRST != "first_name" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major = '$MAJOR';")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # set to null
      MAJOR_ID=NULL
    # echo $MAJOR_ID
    fi

    # insert student
    INSERT_STUDENT_RESULT=$($PSQL "INSERT INTO students (first_name, last_name, major_id, gpa) VALUES ('$FIRST', '$LAST', $MAJOR_ID, $GPA);")
    if [[ $INSERT_STUDENT_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into students, $FIRST, $LAST
    fi
  # echo $INSERT_STUDENT_RESULT
  fi
done
