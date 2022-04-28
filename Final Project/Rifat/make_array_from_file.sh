file="product.csv"
OLDIFS=$IFS
IFS=','
[ ! -f $file ] && { echo "$file file not found"; exit 99; }

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


echo ${IDS[@]}
echo ${NAMES[@]}
echo ${PRICES[@]}
echo ${STOCKS[@]}
