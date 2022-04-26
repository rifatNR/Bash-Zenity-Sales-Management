file="product.csv"
OLDIFS=$IFS
IFS=','

for i in $(seq 1 10)
do
	echo "$i"
	echo "$i"
	echo "$i"
done | zenity --list --title="Your Products" --text="List of your products" --column="Name" --column="Price" --column="Stock"

zenity --list \
  --title="Your Products" \
  --column="Name" --column="Price" --column="Stock" \
	while read name price stock
	do
		992383 Normal "GtkTreeView crashes on multiple selections" \
	done < $file

IFS=$OLDIFS



# Result: Shows two zenity list popup with 1 2 3 4 ... Random Data
