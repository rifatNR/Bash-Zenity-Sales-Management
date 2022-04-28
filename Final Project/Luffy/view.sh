# ==================== Copy CSV to Array ===========
file="product02.csv"
file2="product02.csv"
OLDIFS=$IFS
IFS=','
[ ! -f $file2 ] && { echo "$file2 file not found"; exit 99; }

# RUN: bash view.sh 5
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
# =================================================

for (( i=0; i<=${#IDS[@]}-1; i++ ))
do
	id=${IDS[i]}
	name=${NAMES[i]}
	price=${PRICES[i]}
	stock=${STOCKS[i]}
	
	if [[ $i == $1 ]]
	then
		ans=$(zenity --info --title=$name --text="Name: $name \nPrice: $price \nStock: $stock" --width=300 \
		--extra-button "Sell" --extra-button "Update" --ok-label="Back")
		
		echo $ans
		if [[ $ans == "Update" ]]
		then
			bash update_form.sh $1
		fi
	
		if [[ $ans == "Sell" ]]
		then
			bash sale_form.sh $1
		fi
		
		if [[ $ans == "" ]]
		then
			bash product_list.sh
		fi
	fi
	
	
done
