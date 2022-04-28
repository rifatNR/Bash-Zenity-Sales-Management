file="users.csv"
data=`zenity --title="Login" --password --username`

ret=$?

IFS=','
IFS="|" read -r username password <<< "$data" ;

if [[ $ret == 1 ]]
then
	bash app.sh
	exit 99;
fi

echo $username
echo $password

if [ "$username" == "" ] | [ "$password" == "" ]
then
	zenity --error --text="Username or Password cannot be empty" --width=250
	bash login.sh
	exit 99;
fi


# Checking if user  exist ===================================

while read existing_username existing_password
do
	if [[ $existing_username == $username ]]; 
	then
		if [[ $password != $existing_password ]]
		then
			zenity --error --text="Wrong Password. Please try again." --width=250
			bash login.sh
		else
			zenity --notification --window-icon="info" --text="Login Succesful"
			cd ./$username
			bash options.sh
		fi
		exit 99;
	fi
done < $file

zenity --error --text="User not found" --width=250
bash login.sh
# ============================================================
