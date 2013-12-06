;;		Name:			Kody Wildfeuer	
;;		Class:			CSc314
;;		Assign:			Six
;;		Date:			November 19, 2013
;;		Due:			November 20, 2013
;;		
;;		Description:	This program prompts the user for a number for ;;      the amount of times they wish to have a character move across 
;;		the terminal screen. The number must be between 1 and 5, all ;;      others will be rejected. Then, the program prompts the user for 
;;      a character they wish to display. The character will be 
;;      display across the screen from left to right and back again, 
;;      repeated the amount of times given by the user.  







		include PCMAC.INC
		.model small
		.586
		.stack 100h
		.data
theChar	db '?'
prompt	db "Enter a character", 10, 13, "$"
prompt2	db "Enter a number between 1 and 5", 10, 13, "$"
theNum	dw	?	
		.code

		extrn PutDec:near
		extrn GetDec:near

moveChar	proc
			_Begin



if_2:	     ;; if theNum > 0 || theNum <=5  

			;; prompt for number
			_PutStr prompt2 


			call GetDec ;; I have the number in ax register
			mov theNum, ax ;; putting ax register in variable


			cmp theNum, 1 ;; comparing num and 1 
			jl else_2  ;; jump to else if less than
			
			cmp theNum, 5 ;; comparing num and 1
			jg else_2  ;; jump to else if greater than




			_PutStr prompt  ;; prompt user for character
			_GetCh  ;; I have char in al register



			mov theChar, al ;; store char in variable





then_2:    ;; if theNum is greater than 0 or less than or equal to 5 then do this



while_1:	cmp theNum, 0  ;;compare theNum to zero
			jle end_while  ;;jump to end of while if less or equal to 0
			dec theNum	 ;; decrement theNum, which stores user input for number of times they wish to loop

body_1:		;; body of while loop


			mov cx,78




			;; for loop that moves the character from left to right across terminal screen

for_1:		_PutCh theChar		
			call delay          
			_PutCh 8			
			_PutCh ' '			
			dec cx
			jnz for_1
			
			mov cx, 79



			;; for loop that brings the character from right to left across terminal screen
for_3:		
			call Delay
			_PutCh 8
			_PutCh 8
			_PutCh theChar
			_PutCh ' '
			_PutCh 8
			
			

			dec cx
			jnz for_3
			_PutCh 8


			;; jumps to top of while
			jmp while_1



			jmp end_if_2


			;; reprompt user if number entered is not valid
else_2:		jmp if_2

end_if_2:

end_while:
		
	
			
			_Exit 0
moveChar	endp

			


			;; delay procedure is used to slow speed of movement across 
			;; the terminal screen, so it is visible to those that are
			;; human... all too human. 

delay		proc
			
			push cx
			mov cx,-1
for_2:		nop
			dec cx
			jnz for_2
			pop cx
			
			ret
delay		endp
			end moveChar