
data=`zenity --password --username`

ret=$?

if [[ $ret == 1 ]]
then
	bash app.sh
	exit 99;
fi

IFS="|" read -r username password <<< "$data" ;

echo $username
echo $password

if [[ $password != "sadd" ]]
then
	zenity --error --text="Wrong Password. Please try again." --width=250
	bash login.sh
else
	zenity --notification --window-icon="info" --text="Login Succesful"
	bash options.sh
fi
