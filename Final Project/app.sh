# For Zenity Help: zenity --help-general

ans=$(zenity --question --text="Welcome to the sales management system." --ok-label="Login" --extra-button "Signup" --cancel-label="Quit" --width=300)

ret=$?
echo $ans

if [[ $ret == 0 ]]
then
	bash login.sh
fi

if [[ $ans == "Signup" ]]
then
	bash signup.sh
fi
