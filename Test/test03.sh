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



# Result:
: '
Name : Name
Price : Price
Stock : Stock
--------------
Name : Poteto
Price : 50
Stock : 1000
--------------
Name : Chips
Price : 10
Stock : 5000
--------------
Name : Biscuits
Price : 60
Stock : 
--------------
Name : Juice
Price : 
Stock : 20
--------------
Name : Mobile
Price : 500
Stock : 7
--------------
Name : xChips
Price : 56
Stock : 896
--------------
Name : Ring Chips
Price : 15
Stock : 965
--------------
'
