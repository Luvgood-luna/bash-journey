#! /bin/bash

#Display top 5 Memory-consuming processes
echo "top 5 memory consuming processes are"
echo "------------------------------------------"
echo " "

#Using top to get the top 5 memory consuming process

#top -b -n 1| head -n 12 | tail -n 5

#using ps
ps aux --sort=-%mem |head -n 6
