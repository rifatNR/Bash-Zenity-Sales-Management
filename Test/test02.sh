
file="product.csv"

while IFS=, read -r field1 field2 field3
do
    echo "$field1 : $field2 : $field3"
done < $file
