#! /bin/bash

cat $1 | sed -E 's/catnip/dogchow/gi; s/cat/dog/gi; s/meow|meowzer/woof/gi;'

# End of script