#!/bin/bash

#linux fundamentals
#each task needs to be passed to execution as an argument

#USAGE: ./tasks.sh number
#EXAMPLE: ./tasks.sh 1
#	  ./tasks.sh 2
#
whattodocolor='\e[2;36m'
questioncolor='\e[1;35m'
#blinking colors
successcheckoutcolor='\e[5;32m'
failurecheckoutcolor='\e[5;31m'
colorreset='\e[0m'
bor=(0 0 0 0 0 0 0 0 0 0)
taskanswer=""
case "$1" in
	1)
		echo -e "${whattodocolor}Task 1!\nOpen new terminal(ctrl+alt+t)"
		echo -e "Navigate to the directory of lab"
		echo -e "PS: If you want to take a hint, just write hint and enter."
		echo -e "PS: Taking hint will drop your score by 1, we will know!"
		aluminium=$(find . -maxdepth 1 -type f | wc -l | sha256sum | awk '{print $1}')

		while true; do
			echo -e "${questioncolor}How many file are there inside the directory of lab?"
			echo -e "Your Answer:${colorreset} "
			read taskanswer
			#Needed Debugging
			#echo $taskanswer
			#echo $taskanswer | sha256sum | awk '{print $1}'
			#echo $aluminium
			if [[ $(echo $taskanswer | sha256sum | awk '{print $1}') == "$aluminium" ]];then
				echo -ne "${successcheckoutcolor}Congratulations! You have found the answer\r"
				sleep 3
				echo -e "${colorreset}Congratulations! You have found the answer"
				bor[0]=$((bor[0] + 10))
				echo -e "TASK 1:${bor[0]}\n" >> .notext
				exit 0
			elif [[ $taskanswer == "hint" ]];then
				echo -e "${whattodocolor}Try to find showing all files(including hidden ones)\nin the help menu or man page of ls \nThen count the ones without / at the end.${colorreset}"
				bor[0]=$((bor[0] - 1))
				if [ ${bor[0]} -le -10 ];then
					echo -ne "${failurecheckoutcolor}You tried all your chances.\nDont Worry! You can still answer others\r"
					sleep 3
					echo -e "${colorreset}You tried all your chances.\nDont Worry! You can still answer others"
					echo -e "TASK 1:${bor[0]}\n" >> .notext
					exit 0
				fi
			else
				bor[0]=$((bor[0] - 1))
				if [ ${bor[0]} -le -10 ];then
					echo -ne "${failurecheckoutcolor}You tried all your chances.\nTry your luck in next question.\r"
					sleep 3
					echo -e "${colorreset}You tried all your chances.\nTry your luck in next question."
					echo -e "TASK 1:${bor[0]}\n" >> .notext
					exit 0
				fi
				echo -ne "${failurecheckoutcolor}Wrong Answer, Try again\r"
				sleep 3
				echo -e "${colorreset}Wrong Answer, Try again"
			fi
		done
		;;
	2)
		
		echo -e "${whattodocolor}Task 2!\n(Open another terminal again."
		echo -e "Create a file with the name lab.txt inside minilab folder."
		echo -e "Now execute lab.sh"
		while true;do
			echo -e "${questioncolor}What is written inside lab.txt?"
			echo -e "Your Answer:${colorreset} "
			read taskanswer
			ferium=$(cat .answerlab.txt | sha256sum | awk '{print $1}')
			if [[ $(echo $taskanswer | sha256sum | awk '{print $1}') == $ferium ]];then
				echo -ne "${successcheckoutcolor}You're goddamn right!\r"
				sleep 3
				echo -e "${colorreset}You're goddamn right!"
				bor[1]=$((bor[1] + 10))
				echo -e "TASK 2:${bor[1]}\n" >> .notext
				exit 0
			elif [[ $taskanswer == "hint" ]];then
				echo -e "${whattodocolor}Try using touch for creating lab.txt, ./lab.sh for executing and then cat command to see what is inside${colorreset}"
				bor[1]=$((bor[1] - 1))
				
			else
				bor[1]=$((bor[1] - 1))
				if [ ${bor[1]} -le -10 ];then
					echo -ne "${failurecheckoutcolor}You tried all your chances.\nTry your luck in next question.\r"
					sleep 3
					echo "${colorreset}You tried all your chances.\nTry your luck in next question."
					echo -e "TASK 2:${bor[1]}\n" >> .notext
					exit 0
					
				fi
				echo -ne "${failurecheckoutcolor}Wrong Answer, Try Again\r"
				sleep 3
				echo -e "${colorreset}Wrong Answer, Try again"
			fi
		done
		;;
	3)
		echo -e "|${whattodocolor}Task 3!\n(You guessed right, open new terminal)"
		echo -e "|Navigate to the minilabs directory"
		echo -e "|Move .exception file without changing to task3 directory"
		echo -e "|Copy .nothere file inside task2 directory\n\t|with changing its name to .here.sh\n\t|to task3 directory"
		echo -e "|Delete .shouldntbehere file inside task3"
		echo -e "|Now execute .here.sh inside task3 directory"
		echo -e "|If everything done right, check what is inside .exception file inside task3 directory"
		fluorium=$(echo "SkVTVVN7Q1BfUk1fTVZ9Cg==" | base64 -d | head -c -1 | sha256sum | awk '{print $1}') 
		while true; do
			echo -e "${questioncolor}What is the flag?"
			echo -e "Your Answer${colorreset} "
			read taskanswer
			if [[ $(echo $taskanswer | head -c -1 |sha256sum | awk '{print $1}') == $fluorium ]];then
				echo -ne "${successcheckoutcolor}Go to the next question, Nailed this one\r"
				sleep 3
				echo -e "${colorreset}Go to the next question, Nailed this one"
				bor[2]=$((bor[2] + 10))
				echo -e "TASK 2:${bor[2]}\n" >> .notext
				exit 0
			elif [[ $taskanswer == "hint" ]];then
				echo -e "${whattodocolor}Try to use cp, rm and mv commands after execute .here.sh${colorreset}"
			else
				echo -ne "${failurecheckoutcolor}Wrong Answer, Try again.\r"
				sleep 3
				echo -e "${colorreset}Wrong Answer, Try again."
				bor[2]=$((bor[2] - 1))
				if [[ ${bor[2]} -le -10 ]];then
					echo -ne "${failurecheckoutcolor}Try next question, you have failed this one.\r"
					sleep 3
					echo -e "${colorreset}Try next question, you have failed this one."
					exit 0
				fi
			fi
		done
		;;
	4)
		echo -e "${whattodocolor}Task 4.1"
		echo -e "Locate valid log file in the task4/"
		echo -e "Find failed attempts or errors in the log file"
		echo -e "Analyze failed execution attemts"
		echo -e "Try to do what needs to be changed"
		echo -e "You can try executing the file and see results if you have done it all correct\n"
		echo -e "it will create a flag file"
		while true; do
			echo -e "${questioncolor}What is the flag here"	
			echo -e "Your Answer:${colorreset} "
			read taskanswer
			germanium=$(echo "536b565456564e375a4441784d5759344d444d314f44497a597a557a597a
51305a546b314d6a686b4d545132596d466b4e57466959325131596a4578
4e4464694e5463325a474932595467310a596a5977593251774d6a4a6b4d
3245335958304b0a" | xxd -r -p | base64 -d)
			if [[ $taskanswer == $germanium ]];then
				echo -ne "${successcheckoutcolor}Nice job, mate, continue with the next question\r"
				sleep 3
				echo -e "${colorreset}Nice job, mate, continue with the next question"
				bor[3]=$((bor[3] + 10))
				echo -e "TASK 4:${bor[3]}\n" >> .notext
				exit 0
			elif [[ $taskanswer == "hint" ]];then
				echo -e "${whattodocolor}You will have no hint this task(You can ask the teachs)"
			else
				echo -ne "${failurecheckoutcolor}Wrong answer, Try again!\r"
				sleep 3
				echo -e "${colorreset}Wrong answer, Try again!"
				bor[3]=$((bor[3] - 1))
				if [[ ${bor[3]} -le -10 ]];then
					echo -ne "${failurecheckoutcolor}Better luck next time.\r"
					sleep 3
					echo -ne "${colorreset}Better luck next time."
					exit 0
				fi
			fi
		done
		;;
	5)
		echo -e "${whattodocolor}Task5!"
		echo -e "You have done well, this is the last task."
		echo -e "Navigate into task5/ directory. You will see bunch of files and 2 directory"
		echo -e "To understand what is wrong with the system, you should find the true kernel log of your system"
		echo -e "Look at your kernel version and search that inside log file"
		echo -e "You will see the corresponding executable inside that log"
		echo -e "Try to run that executable and see what it says"
		echo -e "After everything done, you will get a flag${colorreset}"
		while true; do
			echo -e "${questioncolor}What is flag?${colorreset}"
			read taskanswer
			archium="7674dd3dd67ba7d2dd9f9baeb9ac1881"
			if [[ $(echo $taskanswer | md5sum | awk '{print $1}') == $archium ]];then
				echo -ne "${successcheckoutcolor}Correct Answer, Congrats! You have done it\r"
				sleep 3
				echo -e "${colorreset}Correct Answer, Congrats! You have done it"
				bor[4]=$((bor[4] + 10 ))
				echo "TASK 5:${bor[4]}\n" >> .notext
				exit 0
			elif [[ $taskanswer == "hint" ]];then
				echo -e "HINT: You can use uname with -r flag to find your kernel and pass it as argument to corresponding executable."
				echo -e "The flag file that executable gives you contains 2 factor encode."
				echo -e "first decode from hex, then find the encode type that ends with '=' symbol."
				bor[4]=$((bor[4] - 1))
				if [[ ${bor[4]} -le -10 ]];then
					echo -ne "${failurecheckoutcolor}Used all chances, and hints. Try more attentive approach\r"
					sleep 3
					echo -e "${colorreset}Used all chances, and hints. Try more attentive approach"
					echo "TASK 5:${bor[4]}\n" >> .notext
					exit 0
				fi
			else
				bor[4]=$((bor[4] - 1))
				if [[ ${bor[4]} -le -10 ]];then
					echo -ne "${failurecheckoutcolor}Enough Guess. Try more executive approach\r"
					sleep 3
					echo -e "${colorreset}Enough Guess. Try more executive approach"
					echo "TASK 5:${bor[4]}\n" >> .notext
					exit 0
				fi
				echo -ne "${failurecheckoutcolor}Wrong Answer, Try Again.\r"
				sleep 3
				echo -e "${colorreset}Wrong Answer, Try Again."
			fi
		done
		;;
	*)
		echo -ne "${failurecheckoutcolor}Wrong Usage\r"
		sleep 3
		echo -e "${colorreset}Wrong Usage"
		echo -e "USAGE: ./tasks.sh number"
		echo -e "Available numbers:1,2,3,4,5"
		exit 0	
		;;
esac
