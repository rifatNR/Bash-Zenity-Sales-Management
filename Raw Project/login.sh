
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
	zenity --info --text="Login Succesful" --width=250
	bash options.sh
fi
