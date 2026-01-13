#!/bin/bash
if [ -f lab.txt ]; then
	variable=$(echo "4a455355537b594f555f464f554e445f5448455f464c41477d" | xxd -r -p)
	echo $variable >> lab.txt
else 
	echo "You havent created lab.txt"
	echo "Create it first"
fi
