file="product.csv"
OLDIFS=$IFS
IFS=','
[ ! -f $file ] && { echo "$file file not found"; exit 99; }

PRODUCTS=()

x=0
while read id name price stock
do
	PRODUCT["id"]=$id
	PRODUCT["name"]=$name
	PRODUCT["price"]=$price
	PRODUCT["stock"]=$stock

	y=0
	for key in "${!PRODUCT[@]}"; do
	  echo $x"_"$y
	  PRODUCTS[$x"_"$y]=${PRODUCTS[$key]}
	  ((y++))
	done
	echo "-----------"
	((x++))
done < $file

IFS=$OLDIFS


echo ${PRODUCTS["3_2"]}

: ' 
declare -A identification0=(
    [id]=$id
    [name]=$name
    [price]=$price
    [stock]=$stock
)
'
