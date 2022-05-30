pgpathlog=/var/lib/postgresql/data/log
wdList=("Mon Tue Wed Thu Fri Sat Sun")
for wd in $wdList
do
hList=("00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23")
for h in $hList
do
$(touch ${pgpathlog}/postgresql-${wd}-${h}.csv)
$(chmod 600 ${pgpathlog}/postgresql-${wd}-${h}.csv)
$(chown 999:999 ${pgpathlog}/postgresql-${wd}-${h}.csv)
done
done
