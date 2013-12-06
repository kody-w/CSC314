;;		Name:			Kody Wildfeuer	
;;		Class:			CSc314
;;		Assign:			Seven
;;		Date:			November 23, 2013
;;		Due:			December 2, 2013





				include PCMAC.INC
				.model small
				.586
				.stack 100h
				.data

prompt			db "Enter the first integer", 10, 13, "$"	
prompt1			db "Enter the second integer", 10, 13, "$"
theFirstNumber	dw ?
theSecondNumber	dw ?
newLine			db 10, 13, "$"
GCD      		dw ?

M   			DB	?
N       		DB  ?

				.code
				EXTRN myGCD : NEAR
				extrn GetDec: NEAR
				extrn PutDec: NEAR


main			proc
				_Begin

				_PutStr prompt


				call GetDec ;; I have the number in ax register
				mov theFirstNumber, ax ;; putting ax register in variable


				_PutStr prompt1

				call GetDec
				mov theSecondNumber, ax

				
				mov ax, theFirstNumber

				call PutDec

				_PutStr newLine

				mov ax, theSecondNumber

				call PutDec

				_PutStr newLine


				;; Start of GCD


if_1:			mov ax, theFirstNumber
				cmp ax, theSecondNumber
				jle else_1
				mov ax, theFirstNumber
				sub ax, theSecondNumber
				mov GCD, ax
				jmp end_1
else_1:			mov ax, theSecondNumber
				sub ax, theFirstNumber
				mov GCD, ax

end_1:




				call myGCD


			
		
				
				_Exit 0

main			endp

				end main
