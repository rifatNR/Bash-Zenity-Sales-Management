# RUN: bash update.sh 5 "Books" 50 10

# ==================== Copy CSV to Array ===========
file="product02.csv"
file2="product02.csv"
OLDIFS=$IFS
IFS=','
[ ! -f $file2 ] && { echo "$file2 file not found"; exit 99; }

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

IFS=$OLDIFS

#echo ${IDS[@]}
#echo ${NAMES[@]}
#echo ${PRICES[@]}
#echo ${STOCKS[@]}
# =================================================

true > $file2 # Makes the file empty

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
	
	
	if [[ $i == $1 ]]
	then
		name=$2
		price=$3
		stock=$4
	fi
	
	echo -e $id,$name,$price,$stock >> $file2
done
