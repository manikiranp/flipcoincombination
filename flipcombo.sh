#!/bin/bash 
declare -A singlet doublet triplet
read -p "How many times do you want to flip the coin: " n
count1=0; count2=0; c1=0; c2=0; c3=0; c4=0; p1=0; p2=0; p3=0; p4=0; p5=0; p6=0; p7=0; p8=0;
for (( i=1; i<=$n; i++ ))
do
x=$((RANDOM%2)); y=$((RANDOM%2)); z=$((RANDOM%2));
if [ $x -eq 1 ]; then
	singlet[No.($i)flip]=H
	((count1++))
	if [[ $y -eq $x && $z -eq $x ]]; then
		doublet[No.($i)flip]=HH
		triplet[No.($i)flip]=HHH
		((c1++)); ((p1++))
	elif [[ $y -eq $x && $z -ne $x ]]; then
		doublet[No.($i)flip]=HH
		triplet[No.($i)flip]=HHT
		((c1++)); ((p2++))
	elif [[ $y -ne $x && $z -eq $x ]]; then
                doublet[No.($i)flip]=HT
                triplet[No.($i)flip]=HTH
                ((c2++)); ((p3++))
	else
		doublet[No.($i)flip]=HT
                triplet[No.($i)flip]=HTT
                ((c2++)); ((p4++))
	fi
else
	singlet[No.($i)flip]=T
	((count2++))
	if [[ $y -eq $x && $z -eq $x ]]; then
                doublet[No.($i)flip]=TT
		triplet[No.($i)flip]=TTT
                ((c3++)); ((p5++))
	elif [[ $y -eq $x && $z -ne $x ]]; then
                doublet[No.($i)flip]=TT
                triplet[No.($i)flip]=TTH
                ((c3++)); ((p6++))
	elif [[ $y -ne $x && $z -eq $x ]]; then
                doublet[No.($i)flip]=TH
                triplet[No.($i)flip]=THT
                ((c4++)); ((p7++))
	else
                doublet[No.($i)flip]=TH
                triplet[No.($i)flip]=THH
                ((c4++)); ((p8++))
	fi
fi
done
echo "singlet: ${singlet[@]}"
echo "doublet: ${doublet[@]}"
echo "triplet: ${triplet[@]}"

function perc() {
factor=$(($1*100))
percent=$(($factor/$n))
echo "combination: $percent %"
max[$2]=$percent
}
echo "H"; perc "$count1" "1"
echo "T"; perc "$count2" "2"
echo "HH"; perc "$c1" "3"
echo "HT"; perc "$c2" "4"
echo "TH"; perc "$c3" "5"
echo "TT"; perc "$c4" "6"
echo "HHH"; perc "$p1" "7"
echo "HHT"; perc "$p2" "8"
echo "HTH"; perc "$p3" "9"
echo "HTT"; perc "$p4" "10"
echo "TTT"; perc "$p5" "11"
echo "TTH"; perc "$p6" "12"
echo "THT"; perc "$p7" "13"
echo "THH"; perc "$p8" "14"
IFS=$'\n' sorted=($(sort -nr <<<"${max[*]}")); unset IFS
echo "Winning combination percentage: ${sorted[0]}"
