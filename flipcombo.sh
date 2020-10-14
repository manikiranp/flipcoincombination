#!/bin/bash 
echo "Day 10 Assignment: flipcoin combination"
echo "Flipping a coin...."
x=$((RANDOM%2))
if [ $x -eq 1 ]; then
	echo "Its Heads!"
else
	echo "Its Tails!"
fi
