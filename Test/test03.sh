file="product.csv"
OLDIFS=$IFS
IFS=','

[ ! -f $file ] && { echo "$file file not found"; exit 99; }

while read name price stock
do
	echo "Name : $name"
	echo "Price : $price"
	echo "Stock : $stock"
	echo "--------------"
done < $file

IFS=$OLDIFS
