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

prompt			db 13, "Enter the first integer:", 10, 13, "$"	
prompt1			db "Enter the second integer:", 10, 13, "$"
ask				db "Continue? ( y / n )", 10, 13, "$"
N				dw ?

M				dw ?
newLine			db 10, 13, "$"
GCD      		dw ?
userInput		db 'y'
yes				db 'y'
conclude		db ", the greatest common demoninator (GCD) is $"
prompt2			db "For the integers of $"
prompt3			db " and $"
prompt4			db ". $"

				.code

				extrn GetDec: NEAR
				extrn PutDec: NEAR
				extrn myGCD: NEAR 


main			proc
				_Begin

while_2:
				mov al, userInput
				cmp al, yes
				jne end_while_2

body_2:
				call getNum

				call getGCD

				call putGCD

				_PutStr ask
				_GetCh

				mov UserInput, al
				jmp while_2
end_while_2:		
				
				_Exit 0

main			endp

getNum			proc

				_PutStr newLine
				_PutStr prompt


				call GetDec ;; I have the number in ax register
				mov N, ax ;; putting ax register in variable


				_PutStr prompt1

				call GetDec
				mov M, ax

				_PutStr prompt2

				
				mov ax, N

				call PutDec

				_PutStr prompt3

				mov ax, M

				call PutDec

				ret

getNum			endp

getGCD			proc	

				mov ax, N
				mov bx, M


				call myGCD


				mov N, ax
				mov M, bx

getGCD			endp

putGCD			proc

				_PutStr conclude


				mov ax, N

				call PutDec

				_PutStr prompt4

				_PutStr newLine


putGCD			endp


				end main
