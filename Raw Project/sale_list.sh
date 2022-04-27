# ==================== Copy CSV to Array ===========
file="sales.csv"
OLDIFS=$IFS
IFS=','
[ ! -f $file ] && { echo "$file file not found"; exit 99; }

IDS=()
NAMES=()
PRICES=()
CUSTOMER=()
QUANTITY=()
DUE=()
DATE=()

while read id name price customer quantity due date
do
	if [ -z "${name}" ]; then name="X"; fi
	if [ -z "${price}" ]; then price="X"; fi
	if [ -z "${customer}" ]; then customer="X"; fi
	if [ -z "${quantity}" ]; then quantity="X"; fi
	if [ -z "${due}" ]; then due="X"; fi
	if [ -z "${date}" ]; then date="X"; fi
	
	IDS+=($id)
	NAMES+=($name)
	PRICES+=($price)
	CUSTOMER+=($customer)
	QUANTITY+=($quantity)
	DUE+=($due)
	DATE+=($date)

done < $file
# =================================================

for (( i=1; i<${#IDS[*]}; ++i)); do
    data+=( "${IDS[$i]}" "${NAMES[$i]}" "${PRICES[$i]}" "${CUSTOMER[$i]}" "${QUANTITY[$i]}" "${DUE[$i]}" "${DATE[$i]}" )
done

ans=$(zenity --list --column="ID" \
				--title="Sales Report" \
				--column="Name" --column="Price" \
				--column="Custimer Name" \
				--column="Quantity" \
				--column="Due" \
				--column="Date" \
				--width 600 --height 550 "${data[@]}")

ret=$?
echo $ans
echo $ret

if [[ $ret == 0 ]]
then
	bash product_list.sh
fi

if [[ $ret == 1 ]]
then
	bash options.sh
fi


