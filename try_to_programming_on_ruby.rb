#купюри
n500=0,	n200=0,		n100=2,	n50=1,	  n20=2,	  n10=4,	  n5=1,	  n2=0,	  n1=2

accounts=[[3321,'Volodymyr','mypass',422],[5922,'Iryna','ho#ll_§1',5301]]
arg=0
def Compare(a,b,c)
give =false
if c>=b
		if a>0
		count=c/b
			if (count<=a)
				c=c-count*b
				a=a-count
				if c==0
								give=true
				end
			else
				count=a
				c=c-count*b
				a=a-count
				if c==0
						give=true
				end
			end
		end
	end
return give
end
def Give(num,sumi)
	give=false
	
	give=Compare(num[0],500,sumi)
	if give!=true
	give=Compare(num[1],200,sumi)
	end
	if give!=true
	give=Compare(num[2],100,sumi)	
	end
	if give!=true
give=Compare(num[3],50,sumi)
end
	if give!=true
give=Compare(num[4],20,sumi)
end
	if give!=true
give=Compare(num[5],10,sumi)
end
	if give!=true
give=Compare(num[6],5,sumi)
end
	if give!=true
give=Compare(num[7],2,sumi)
end
	if give!=true
give=Compare(num[8],1,sumi)
end	
	return give
end
def Withdraw(accounts,numeric,sum,ind)
	max=numeric[0]*500+numeric[1]*200+numeric[2]*100+numeric[3]*50+numeric[4]*20+numeric[5]*10+numeric[6]*5+numeric[7]*2+numeric[8]*1
	if sum.to_i>accounts[ind][3]
		 puts
		 puts 'ERROR: INSUFFICIENT FUNDS!! PLEASE ENTER A DIFFERENT AMOUNT:'
		 sum=gets.chomp
		 Withdraw(accounts,numeric,sum,ind)
	end
	if sum.to_i>max
		 puts
		 puts 'ERROR: THE MAXIMUM AMOUNT AVAILABLE IN THIS ATM IS ₴'+max.to_s+'. PLEASE ENTER A DIFFERENT AMOUNT:'
		 sum=gets.chomp
		Withdraw(accounts,numeric,sum,ind)
	end
	sumi=sum.to_i
	num=numeric
	give = Give(num,sumi)
	if give==false
		puts
		puts 'ERROR: THE AMOUNT YOU REQUESTED CANNOT BE COMPOSED FROM BILLS AVAILABLE IN THIS ATM. PLEASE ENTER A DIFFERENT AMOUNT:'
		sum=gets.chomp
		Withdraw(accounts,numeric,sum,ind)
	else
		new=accounts[ind][3]-sum.to_i
		puts
		puts 'Your New Balance is ₴'+new.to_s
	end
end
def Main (accounts)
numeric=[0,0,2,1,2,4,1,0,2]
	 login=false
	def Log (accounts)
	 	 login=false
		 while login==false
		  	puts 'Please Enter Your Account Number:'
		  	puts '>'
			account=gets.chomp
			puts 'Enter Your Password:'
			puts '>'
		  	pass=gets.chomp
			if ((account==accounts[0][0].to_s)and(pass==accounts[0][2]))
			  		login=true
					index=0;
			else 
					if ((account==accounts[1][0].to_s)and(pass==accounts[1][2]))
						login=true
						index=1;
					else
						puts '	ERROR: ACCOUNT NUMBER AND PASSWORD DON\'T MATCH'
					end
			end
		end
		index;
	end
	ind=Log (accounts);
	puts 
	puts 'Hello, '+accounts[ind][1]+'!'
	puts 
	def print
		puts 'Please Choose From the Following Options:'
		 puts '1. Display Balance'
		 puts '2. Withdraw'
		 puts '3. Log Out'
		 puts 
 	end
	 print
	 choice=gets.chomp
	def UserChoice (accounts, choice, ind ,numeric)
		 if choice==1.to_s 
			puts 'Your Current Balance is ₴'+accounts[ind][3].to_s+'.'
			puts
			 print
			 choice=gets.chomp
			  UserChoice(accounts, choice,ind,numeric )
		 else
			 if choice==2.to_s  
			 puts 'Enter Amount You Wish to Withdraw:'
sum=gets.chomp
			 Withdraw(accounts,numeric,sum,ind)
			 	puts
			 print
			 choice=gets.chomp
			  UserChoice(accounts, choice,ind,numeric )
			 else
				 if choice==3.to_s  
				 Main (accounts)
				 end
			end
		 end
	 end
	 UserChoice(accounts, choice,ind,numeric )
end
Main (accounts)
STDIN.getc