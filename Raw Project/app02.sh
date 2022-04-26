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
	
	echo -e $id,$name,$price,$stock >> $file2
done < $file

IFS=$OLDIFS

echo ${IDS[@]}
echo ${NAMES[@]}
echo ${PRICES[@]}
echo ${STOCKS[@]}
