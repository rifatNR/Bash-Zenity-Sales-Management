cat product.csv |          # get data from file
  sed '1 d' |              # delete csv header row
  tr ',' '\n' |            # put each csv field on a separate line
  zenity --list --title="Your Products" --text="List of your products" --column="Name" --column="Price" --column="Stock" # render data in zenity dialog
