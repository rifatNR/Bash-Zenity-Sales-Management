data=$(
	zenity --forms --title="Add Product" --text="Add new product" --add-entry="Name" --add-entry="Price" --add-entry="Stock"
)

ret=$?
echo $ret

IFS="|" read -r name price stock <<< "$data" ;

echo $data

echo $name
echo $price
echo $stock

if [[ $ret == 1 ]]
then
	echo "No product added."
	bash options.sh
	exit 99;
fi

if [[ $ret == 0 ]]
then
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
fi
