echo "Hello World"



input="product.csv"
while IFS= read -r line
do
  echo "$line"
  echo "-----"
done < "$input"


echo "||||||||||||||||||||||||||||||||||||||||||||||"

while IFS=',' read -ra array; do
  ar1+=("${array[0]}")
  ar2+=("${array[1]}")
  ar3+=("${array[2]}")
  ar4+=("${array[3]}")
done < "$input"                                                     


# printf '%s\n' "${ar1[@]}" "${ar2[@]}" "${ar3[@]}" "${ar4[@]}"

printf '%s\n' "${ar1[@]}"
