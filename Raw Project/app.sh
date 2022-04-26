function addForm {
	data=$(
		zenity --forms --title="New book" --text="Add new book" \
	       --add-entry="Name" \
	       --add-entry="Price" \
	       --add-entry="Stock"
       )
	
	
	IFS="|" read -r name price stock <<< "$data" ;
	
	case $? in
	    0)
		echo $name
		echo $price
		echo $stock
		bash add.sh $name $price $stock
		echo "Product added.";;
	    1)
		echo "No product added."
		;;
	    -1)
		echo "An unexpected error has occurred."
		;;
	esac
}


ans=$(zenity --info \
--title="Options" \
--text "Select an option:" \
--extra-button "Add" \
--extra-button "Update"  \
--extra-button "Sale"  \
--ok-label="Back")

echo $?
echo $ans

if [[ $ans == "Add" ]]
then
	echo "Adding New Item"
	addForm
fi

if [[ $ans == "Update" ]]
then
	echo "Updating Existing Item"
fi





