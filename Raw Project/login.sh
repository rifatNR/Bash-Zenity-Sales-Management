
ENTRY=`zenity --password --username`

ret=$?

if [[ $ret == 1 ]]
then
	bash app.sh
fi

if [[ $ret == 0 ]]
then
	echo "User Name: `echo $ENTRY | cut -d'|' -f1`"
 	echo "Password : `echo $ENTRY | cut -d'|' -f2`"
fi
