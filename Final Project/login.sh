
data=`zenity --title="Login" --password --username`

ret=$?

if [[ $ret == 1 ]]
then
	bash app.sh
	exit 99;
fi

IFS="|" read -r username password <<< "$data" ;

echo $username
echo $password

if [ $username == "" ] | [ $password == "" ]
then
	zenity --error --text="Username or Password cannot be empty" --width=250
	bash login.sh
	exit 99;
fi

if [[ $password != "sadd" ]]
then
	zenity --error --text="Wrong Password. Please try again." --width=250
	bash login.sh
else
	zenity --notification --window-icon="info" --text="Login Succesful"
	cd ./$username
	bash options.sh
fi
