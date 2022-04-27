data=$(
	zenity --forms --title="New book" --text="Add new book" \
       --add-entry="Name" \
       --add-entry="Price" \
       --add-entry="Stock"
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
    		zenity --notification --window-icon="info" --text="Please fill the required field!"
    	else
    		echo $name
			echo $price
			echo $stock
			bash add.sh $name $price $stock
			echo "Product added."
    	fi
    	;;
    1)
	echo "No product added.";;
    -1)
	echo "An unexpected error has occurred.";;
esac