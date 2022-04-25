
file="product.csv"
while IFS= read -r line
do
  echo "$line"
  echo "-----"
done < "$file"


echo "||||||||||||||||||||||||||||||||||||||||||||||"

# ! Reads CSV file line by line
while IFS=',' read -ra array; do
  ar1+=("${array[0]}")
  ar2+=("${array[1]}")
  ar3+=("${array[2]}")
  ar4+=("${array[3]}")
done < "$file"                                                     


# printf '%s\n' "${ar1[@]}" "${ar2[@]}" "${ar3[@]}" "${ar4[@]}"

printf '%s\n' "${ar1[@]}"




# Result: 
: '
Name,Price,Stock
-----
Poteto,50,1000
-----
Chips,10,5000
-----
Biscuits,60,
-----
Juice,,20
-----
Mobile,500,7
-----
xChips,56,896
-----
Ring Chips,15,965
-----
||||||||||||||||||||||||||||||||||||||||||||||
Name
Poteto
Chips
Biscuits
Juice
Mobile
xChips
Ring Chips

'
