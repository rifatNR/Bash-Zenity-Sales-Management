sudo chmod -R 777 ./Base_Template

data=`zenity --title="Register Account" --password --username`

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

cp -R ./Base_Template ./$username
zenity --notification --window-icon="info" --text="User Successfully Registerred. Please Login"
bash login.sh
