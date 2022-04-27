ans=$(zenity --info \
--title="Options" \
--text "Select an option:" \
--extra-button "Add" \
--extra-button "Update"  \
--extra-button "Product List"  \
--extra-button "Sale"  \
--ok-label="Back")

echo $?
echo $ans

if [[ $ans == "Add" ]]
then
	echo "Adding New Item"
	bash add_form.sh
fi

if [[ $ans == "Update" ]]
then
	echo "Updating Existing Item"
fi

if [[ $ans == "Product List" ]]
then
	echo "Product List Shown"
	bash product_list.sh
fi



