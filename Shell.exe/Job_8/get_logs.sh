FILE=number_connection-$DATE

DATE=$(date "+%d-%m-%y-%H:%M")

cat auth.log | grep Sami | grep login | wc -l

if [ ! -d Backup] ; then
    mkdir Backup
if [ -Z $1] ; then
    echo "utilisation $0 USERNAME"
    exit 1
fi

UTILISATEUR = $1

COUNT=$(sudo cat /var/log/auth.log | grep $UTILISATEUR | wc -l)

echo "Nombre de connection de $UTILISATEUR" COUNT" > $FileFILE
tar -cvf Backup/$FILE.tar $FILE