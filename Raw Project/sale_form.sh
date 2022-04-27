

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

if [ "$quantity" == "" ] | [ "$customer_name" == "" ] | [ "$due" == "" ] | [ "$date" == "" ]
then
	zenity --error --text="Please fill the required field!" --width=250
	bash sale_form.sh $1
else
	bash sale.sh $1 $quantity $customer_name $due $date
	echo "Product is being sold."
fi

