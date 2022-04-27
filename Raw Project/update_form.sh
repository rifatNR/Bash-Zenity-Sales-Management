data=$(
	zenity --forms --title="Update Product" --text="Update a product" --add-entry="Name" --add-entry="Price" --add-entry="Stock"
)


IFS="|" read -r name price stock <<< "$data" ;

echo $?

echo $name
echo $price
echo $stock

case $? in
    0)
    	if [ "$name" == "" ] | [ "$price" == "" ] | [ "$stock" == "" ]
    	then
    		zenity --error --text="Please fill the required field!" --width=250
    		bash add_form.sh
    	else
    		echo $name
			echo $price
			echo $stock
			bash add.sh $name $price $stock
			echo "Product added."
			zenity --notification --window-icon="info" --text="Product Added"
			bash product_list.sh
    	fi
    	;;
    1)
	echo "No product added.";;
    -1)
	echo "An unexpected error has occurred.";;
esac
