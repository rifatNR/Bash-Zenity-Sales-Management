

data=$(
	zenity --forms --title="Sell Product" --text="Sell a product" \
	--add-entry="Quantity" \
	--add-entry="Customer" \
	--add-entry="Due" \
	--add-calendar="Date"
)

ret=$?
echo $ans
echo $ret

IFS="|" read -r quantity customer_name due date <<< "$data" ;

echo $quantity
echo $customer_name
echo $due
echo $date

if [[ $ret == 1 ]]
then
	bash product_list.sh
	exit 99;
fi

if [ "$quantity" == "" ] | [ "$customer_name" == "" ] | [ "$due" == "" ] | [ "$date" == "" ]
then
	zenity --error --text="Please fill the required field!" --width=250
	bash sale_form.sh $1
else
	bash sale.sh $1 $quantity $customer_name $due $date
	echo "Product is being sold."
fi

