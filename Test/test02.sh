
file="product.csv"

while IFS=, read -r field1 field2 field3
do
    echo "$field1 : $field2 : $field3"
done < $file



# Result :
: '
Name : Price : Stock
Poteto : 50 : 1000
Chips : 10 : 5000
Biscuits : 60 : 
Juice :  : 20
Mobile : 500 : 7
xChips : 56 : 896
Ring Chips : 15 : 965
'
