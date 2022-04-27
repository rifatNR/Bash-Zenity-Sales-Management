

data=$(
	zenity --forms --title="Update Product" --text="Update a product" \
	--add-entry="Quantity" \
	--add-entry="Customer" \
	--add-entry="Due" \
	--add-calendar="Date"
)


IFS="|" read -r quantity customer_name due date <<< "$data" ;

echo $?

echo $quantity
echo $customer_name
echo $due
echo $date
