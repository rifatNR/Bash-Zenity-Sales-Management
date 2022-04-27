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
# =================================================
 
for (( i=1; i<${#IDS[*]}; ++i)); do
    data+=( "${IDS[$i]}" "${NAMES[$i]}" "${PRICES[$i]}" "${STOCKS[$i]}" )
done

ans=$(zenity --list --column="ID" --column="Name" --column="Price" --column="Stock" --width 350 --height 550 "${data[@]}")

echo $ans
echo $?

if [[ $ans != "" ]]
then
	echo "Showing Selected Item"
	bash view.sh $ans
else
	bash options.sh
fi



