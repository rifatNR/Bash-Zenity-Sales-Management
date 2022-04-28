sudo chmod -R 777 ./Base_Template

file="users.csv"

data=`zenity --title="Register Account" --password --username`

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
	bash signup.sh
	exit 99;
fi

# Checking if user already exist ============================

while read existing_username existing_password
do
	if [[ $existing_username == $username ]]; 
	then
		zenity --error --text="User already exist" --width=250
		bash signup.sh
		exit 99;
	fi

done < $file
# ============================================================


cp -R ./Base_Template ./$username # Copying & Renaming base file

echo -e $username,$password >> $file # Adding new user

zenity --notification --window-icon="info" --text="User Successfully Registerred. Please Login"

bash login.sh
