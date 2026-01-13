#!/bin/bash
echo "Enter kernel version"
echo "Answer Format: *.**.**"
echo "Your answer: "
mynegamynega=$(uname -r)
answer=""
read answer
if [ $answer == $mynegamynega ]; then
	echo -e "Congrats, you have found your true kernel and your flag file!"
	echo -e "FLAG FILE:minilab/task5/trash/KkBay0QTU5Xt.txt"
else 
	echo -e "
	$(date +"%H:%M:%S").587028 main     Log opened $(date +"%Y-%m-%dT%H:%M:%S").587018000Z
[   10.458173] $(date +"%H:%M:%S").587168 main     OS Product: Linux
[   10.458208] $(date +"%H:%M:%S").587212 main     OS Release: $answer+kali-amd64
[   10.458242] $(date +"%H:%M:%S").587246 main     OS Version: #1 SMP PREEMPT_DYNAMIC Kali $answer-1kali1 (2025-12-08)
[   10.458282] $(date +"%H:%M:%S").587278 main     [INFO] Executable didn't give related output file:minilab/task5/czecher.sh
	       $(date +"%H:%M:%S").587278 main 	[INFO] error.log: Wrong kernel, try again, with correct one
               $(date +"%H:%M:%S").587279 main     Process ID: 626
               $(date +"%H:%M:%S").587280 main     Package type: LINUX_64BITS_GENERIC
	       [   10.465760] $(date +"%H:%M:%S").594710 main     7.2.4 r170995 started. Verbose level = 0 " >> logs/kernel.log
