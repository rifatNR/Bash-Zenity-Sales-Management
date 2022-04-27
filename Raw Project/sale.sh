# RUN: bash sale.sh 5 20 "John Doe" 2 05-04-2022

# ==================== Copy CSV to Array ===========
file="product02.csv"
file2="product02.csv"
sale_file="sales.csv"

OLDIFS=$IFS
IFS=','
[ ! -f $file2 ] && { echo "$file2 file not found"; exit 99; }
[ ! -f $sale_file ] && { echo "$sale_file file not found"; exit 99; }

IDS=()
NAMES=()
PRICES=()
STOCKS=()

while read id name price stock
do
	if [ -z "${name}" ]; then name="X"; fi
	if [ -z "${price}" ]; then price="X"; fi
	if [ -z "${stock}" ]; then stock="X"; fi
	
	IDS+=($id)
	NAMES+=($name)
	PRICES+=($price)
	STOCKS+=($stock)

done < $file

SALES_IDS=()
while read sales_id product_name price customer_name quantity due date
do

	
	IDS+=($id)
	NAMES+=($name)
	PRICES+=($price)
	STOCKS+=($stock)

done < $file

IFS=$OLDIFS

# =================================================

sale_id=""
product_name=""
sale_price=""
customer_name=$3
quantity=$2
due=$4
date=$5

for (( i=0; i<=${#IDS[@]}-1; i++ ))
do
	id=${IDS[i]}
	name=${NAMES[i]}
	price=${PRICES[i]}
	stock=""
	
	
	if [[ $i == $1 ]]
	then
		new_stock=$((${STOCKS[i]}-$2))
		
		if [[ $new_stock -gt -1 ]]
		then
			sale_id=$id
			product_name=$name
			sale_price=$price
			
			bash update.sh $id $name $price $new_stock
		else
			echo "Not enough stock."
			exit 99;
		fi
		
	fi
done

# ================== Add Sales ==================

echo -e $sale_id,$product_name,$sale_price,$customer_name,$quantity,$due,$date >> $sale_file





