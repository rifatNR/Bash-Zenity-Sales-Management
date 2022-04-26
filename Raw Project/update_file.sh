file="product.csv"
file2="product02.csv"
OLDIFS=$IFS
IFS=','
[ ! -f $file ] && { echo "$file file not found"; exit 99; }

IDS=()
NAMES=()
PRICES=()
STOCKS=()

true > $file2

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

IFS=$OLDIFS

#echo ${IDS[@]}
#echo ${NAMES[@]}
#echo ${PRICES[@]}
#echo ${STOCKS[@]}



for (( i=0; i<=${#IDS[@]}-1; i++ ))
do
	id=${IDS[i]}
	name=""
	price=""
	stock=""
	
	# Name
	if [ ${NAMES[i]} == "X" ];
	then
		name=""
	else
		name=${NAMES[i]}
	fi
	
	# Price
	if [ ${PRICES[i]} == "X" ];
	then
		price=""
	else
		price=${PRICES[i]}
	fi
	
	# Stock
	if [ ${STOCKS[i]} == "X" ];
	then
		stock=""
	else
		stock=${STOCKS[i]}
	fi
	
	
	if [[ $i == 5 ]]
	then
		name="Mango Juice"
	fi
	
	echo -e $id,$name,$price,$stock >> $file2
done
