inp=$1

echo "rachit" > rachit
for((i=1;i<=31;i++))    do
        let j=i+1
        cat $1 | cut -d',' -f"$i"-"$j" | sed 's/\]//g' | sed 's/\[//g'  | sed 's/ //g'>> rachit
done

cat top > temp
cat rachit | grep "'" | grep ',' | sed "s/'//g" | sed 's/,/ -> /g' | sed ':a;N;$!ba;s/\n/\\n/g' > temp2

cat temp2 | sed 's/\\n/\n/g' | sed 's/ -> /\n/g' > temp3
#ip=$(cat temp3 | sort | uniq -c | sort -k2nr | head -n 1 | awk '{print $2;}')
ip=$(/sbin/ip route | awk '/default/ { print $3 }')

cat temp2 >> temp
echo "\n" >> temp
cat bottom1 >> temp
echo $ip >> temp
cat bottom2 >> temp

cat temp | sed ':a;N;$!ba;s/\n//g' > temp2
cat temp2 > topology.json
