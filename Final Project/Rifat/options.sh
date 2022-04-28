ans=$(zenity --info \
--title="Welcome" \
--text="Select an option"
--extra-button "Add" \
--extra-button "Product List"  \
--extra-button "Sales Report"  \
--width=300 \
--ok-label="Logout")

ret=$?
echo $ans

if [[ $ans == "Add" ]]
then
	echo "Adding New Item"
	bash add_form.sh
fi

if [[ $ans == "Sales Report" ]]
then
	echo "Showing Sales List"
	bash sale_list.sh
fi

if [[ $ans == "Product List" ]]
then
	echo "Product List Shown"
	bash product_list.sh
fi

if [[ $ret == 0 ]]
then
	zenity --notification --window-icon="info" --text="Logout Successful"
	bash app.sh
fi



