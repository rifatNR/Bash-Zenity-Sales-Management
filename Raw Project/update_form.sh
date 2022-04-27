# RUN: bash update_form.sh 5

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
    		bash update_form.sh $1
    	else
    		echo $name
			echo $price
			echo $stock
			bash update.sh $1 $name $price $stock
			echo "Product added."
			zenity --notification --window-icon="info" --text="Product Updated"
			bash product_list.sh
    	fi
    	;;
    1)
	echo "Product not updated.";;
    -1)
	echo "An unexpected error has occurred.";;
esac
