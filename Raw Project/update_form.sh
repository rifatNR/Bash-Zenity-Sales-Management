# RUN: bash update_form.sh 5

data=$(
	zenity --forms --title="Update Product" --text="Update a product" --add-entry="Name" --add-entry="Price" --add-entry="Stock"
)

ret=$?
echo $ret

IFS="|" read -r name price stock <<< "$data" ;

echo $name
echo $price
echo $stock

if [[ $ret == 1 ]]
then
	echo "No product updated."
	bash options.sh
	exit 99;
fi

if [[ $ret == 0 ]]
then
	if [ "$name" == "" ] | [ "$price" == "" ] | [ "$stock" == "" ]
	then
		zenity --error --text="Please fill the required field!" --width=250
		bash update_form.sh $1
	else
		bash update.sh $1 $name $price $stock
		echo "Product added."
		zenity --notification --window-icon="info" --text="Product Updated"
		bash product_list.sh
	fi
fi
