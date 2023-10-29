INPUT=./Shell_Userlist.csv
IFS=','
while read ID PRENOM NOM MDP ROLE
    do
        if [ $ID = Id ]; then return
        else
            echo "ID: $ID"
            echo "PRENOM: $PRENOM"
            echo "NOM: $NOM"
            echo "MDP: $MDP"
            echo "ROLE: $ROLE"
            echo "-"
            egrep "^$PRENOM$NOM" /etc/passwd >/dev/null
            if [ $? -eq 0 ]; then
                echo "$PRENOM$NOM exists!"
                if [ $ROLE = Admin ]; then
                    sudo adduser "$PRENOM$NOM" sudo
                    echo "Welcome, Administrator"
                fi
                sudo chpasswd <<<"$PRENOM$NOM:$MDP"
                chage -l $PRENOM$NOM
            else
                echo "$PRENOM$NOM does not exist, creating."
                userpass=$(perl -e 'print crypt($ARGV[0], "password")' $MDP)
                sudo useradd -m -p "$userpass" "$PRENOM$NOM"
                if [ $ROLE = Admin ]; then
                    sudo adduser "$PRENOM$NOM" sudo
                    echo "Welcome, Administrator"
                fi
                [ $? -eq 0 ] && echo "$PRENOM$NOM has been sucessfully added to system !" || echo "Failed to add $PRENOM$NOM !"
            fi
            echo "---------------"
        fi
    done < $INPUT



