if [ "$2" = "+" ]
then
	somme=$(("$1+$3"));
elif [ "$2" = "-" ]
then
	somme=$(("$1-$3"));
elif [ "$2" = "x" ]
then
	somme=$(("$1*$3"));
elif [ "$2" = "/" ]
then
	somme=$(("$1/$3"));
else
    return 0;
fi