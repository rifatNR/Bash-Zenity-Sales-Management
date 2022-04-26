file="product.csv"
OLDIFS=$IFS
IFS=','

[ ! -f $file ] && { echo "$file file not found"; exit 99; }

PRODUCTS=()

while read id name price stock
do
	echo "ID : $id"
	echo "Name : $name"
	echo "Price : $price"
	echo "Stock : $stock"
	echo "--------------"
	PRODUCTS+=($name)
done < $file

IFS=$OLDIFS


echo ${PRODUCTS[@]}


