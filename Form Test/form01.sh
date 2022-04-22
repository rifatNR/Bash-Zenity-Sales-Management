#!/bin/sh

zenity --forms --title="Sale" \
	--text="Enter information for the sale." \
	--separator="," \
	--add-entry="Buyers Name" \
	--add-entry="Product Name" \
	--add-entry="Quantity" \
	--add-entry="Due" \
	--add-calendar="Date" >> addr.csv

case $? in
    0)
        echo "Friend added.";;
    1)
        echo "No friend added."
	;;
    -1)
        echo "An unexpected error has occurred."
	;;
esac

