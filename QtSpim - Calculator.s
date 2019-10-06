#гкиас сеттас P3150156
.text
.globl main
main:

lw $t4,con1 #continue = 1

again1: 
bne $t4,1,exit1 #while(continue == 1)

la $a0,entn1 #Prints "Enter an integer1: "    
li $v0,4 
syscall

li $v0,5 #Reads number1
syscall

move $t1,$v0

move $t2,$t1

la $a0,line #Changes line
li $v0,4 
syscall

again2:
lb $t5,ison 
beq $t3,$t5,exit2 #while(!operator.equals("="))

la $a0,ento #Prints "Enter an operator: "
li $v0,4 
syscall

li   $v0, 8  
la   $a0, buffer    
li   $a1, 2      
move $t3,$a0   
syscall

lb $t3,0($t3)

la $a0,line #Changes line
li $v0,4 
syscall

lb $t5,pros 
beq $t3,$t5,ok1 #if(operator.equals("+"))
lb $t5,afai
beq $t3,$t5,ok1 #if(operator.equals("-"))
lb $t5,poll 
beq $t3,$t5,ok1 #if(operator.equals("*"))
lb $t5,diai
beq $t3,$t5,ok1 #if(operator.equals("/"))
lb $t5,poil
beq $t3,$t5,ok1 #if(operator.equals("%"))
lb $t5,ison
beq $t3,$t5,ok1 #if(operator.equals("="))

la $a0,err #Prints "Error"
li $v0,4
syscall

j rip #Sends to rip

ok1:
lb $t5,ison
beq $t3,$t5,ok2 #if(!operator.equals("="))

la $a0,entn2 #Prints "Enter an integer2: "   
li $v0,4 
syscall

li $v0,5 #Reads number2
syscall

move $t0,$v0

la $a0,line #Changes line
li $v0,4 
syscall

bne $t0,$zero,ok3 #if(number2 == 0)
lb $t5,diai 
bne $t3,$t5,ok4 #if(operator.equals("/"))

la $a0,err #Prints "Error"
li $v0,4
syscall

j rip #Sends to rip

ok4:
lb $t5,poil 
bne $t3,$t5,ok3 #if(operator.equals("%"))

la $a0,err #Prints "Error"
li $v0,4
syscall

j rip #Sends to rip

ok3:
lb $t5,pros 
bne $t3,$t5,act1 #if(operator.equals("+"))

add $t2,$t1,$t0 #result = number1 + number2

j ok2 #Sends to ok2

act1:
lb $t5,afai
bne $t3,$t5,act2 #if(operator.equals("-"))

sub $t2,$t1,$t0 #result = number1 - number2

j ok2 #Sends to ok2

act2:
lb $t5,poll
bne $t3,$t5,act3 #if(operator.equals("*"))

mul $t2,$t1,$t0 #result = number1 * number2

j ok2 #Sends to ok2

act3:
lb $t5,diai
bne $t3,$t5,act4 #if(operator.equals("/"))

div $t2,$t1,$t0 #result = number1 / number2

j ok2 #Sends to ok2

act4:
lb $t5,poil
bne $t3,$t5,ok2 #if(operator.equals("%"))

rem $t2,$t1,$t0 #result = number1 / number2

j ok2 #Sends to ok2


j again2 

exit2:

ok2:

la $a0,res #Prints "Result: "
li $v0,4
syscall

li $v0,1 #Prints the result
move $a0,$t2
syscall

la $a0,line #Changes line
li $v0,4 
syscall

la $a0,que #Prints "Continue:1 / Exit:0"
li $v0,4
syscall

li $v0,5 #Reads continue
syscall

move $t4,$v0

la $a0,line #Changes line
li $v0,4 
syscall

j again1

exit1:

rip:

la $a0,exit #Prints "Exiting program..."
li $v0,4
syscall


li $v0,10
syscall

.data
con1: .word 1
entn1: .asciiz "Enter an integer1: "
entn2: .asciiz "Enter an integer2: "
ento: .asciiz "Enter an operator: "
err: .asciiz "Error"
res: .asciiz "Result: "
que: .asciiz "Continue:1 / Exit:0\n"
line: .asciiz "\n"
exit: .asciiz "Exiting program...\n"
buffer: .space 2
pros: .asciiz "+"
afai: .asciiz "-"
poll: .asciiz "*"
diai: .asciiz "/"
ison: .asciiz "="
poil: .asciiz "%"