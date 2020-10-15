#!/bin/bash 
declare -A singlet doublet
read -p "How many times do you want to flip the coin: " n
count1=0; count2=0; c1=0; c2=0; c3=0; c4=0;
for (( i=1; i<=$n; i++ ))
do
x=$((RANDOM%2)); y=$((RANDOM%2));
if [ $x -eq 1 ]; then
	singlet[No.($i)flip]=H
	((count1++))
	if [ $y -eq 1 ]; then
		doublet[No.($i)flip]=HH
		((c1++))
	else
		doublet[No.($i)flip]=HT
		((c2++))
	fi
else
	singlet[No.($i)flip]=T
	((count2++))
	if [ $y -eq 1 ]; then
                doublet[No.($i)flip]=TH
                ((c3++))
        else
                doublet[No.($i)flip]=TT
		((c4++))
	fi
fi
done
echo "singlet: ${singlet[@]}"
echo "doublet: ${doublet[@]}"

function perc() {
factor=$(($1*100))
percent=$(perl -E "say $factor/$n")
echo "combination: $percent %"
}
echo "H"; perc "$count1"
echo "T"; perc "$count2"
echo "HH"; perc "$c1"
echo "HT"; perc "$c2"
echo "TH"; perc "$c3"
echo "TT"; perc "$c4"



