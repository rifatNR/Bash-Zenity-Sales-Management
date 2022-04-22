echo "Hello World"



input="product.csv"
while IFS= read -r line
do
  echo "$line"
  echo "-----"
done < "$input"
