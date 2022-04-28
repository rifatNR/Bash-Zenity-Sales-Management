# RUN: bash add.sh "Mouse" 7 567


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

id=${#IDS[@]}
name=$1
price=$2
stock=$3

echo -e $id,$name,$price,$stock >> $file2
