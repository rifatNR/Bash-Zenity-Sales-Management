# You must place file "COPYING" in same folder of this script.

ans=$(zenity --text-info \
       --title="Product Info" \
       --text="ASKDHAJKSHDKAJSHDKJA" \
       --extra-button "Update"  \
       --filename=$FILE )
       
echo $?
echo $ans

case $? in
    0)
        echo "Start installation!"
	# next step
	;;
    1)
        echo "Stop installation!"
	;;
    -1)
        echo "An unexpected error has occurred."
	;;
esac
