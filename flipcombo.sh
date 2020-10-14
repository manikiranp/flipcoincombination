#!/bin/bash 
declare -A singlet
read -p "How many times do you want to flip the coin: " n
count1=0; count2=0;
for (( i=1;i<=$n; i++ ))
do
x=$((RANDOM%2))
if [ $x -eq 1 ]; then
	echo "Its Heads!"
	singlet[No.($i)flip]=H
	((count1++))
else
	echo "Its Tails!"
	singlet[No.($i)flip]=T
	((count2++))
fi
done
echo "Head Singlet:$count1 times"
echo "Tail Singlet:$count2 times"
echo "Singlet: ${singlet[@]}"
function perc() {
factor=$(perl -E "say $1/$n")
percent=$(perl -E "say $factor*100")
if [ $1 -eq $count1 ]; then
	echo "H singlet combination: $percent %"
else 
	echo "Y singlet combination: $percent %"
fi
}
perc "$count1"
perc "$count2"
