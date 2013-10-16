;;		Name:			Kody Wildfeuer	
;;		Class:			CSc314
;;		Assign:			Three
;;		Date:			October 12, 2013
;;		Due:			October 16, 2013
;;		
;;		Description:	This program prints out the current date by using a macro called GetDate. A sample
;;		output is the following: 
;;		Today's date is: 10-12-2013. 




include PCMAC.INC
		.MODEL	SMALL
		.586	; Allows Pentium Instructions. Must follow .MODEL
		
		.STACK	100h
		
		.DATA
Message	DB		'Hrmm, I wonder what the date is?', 13, 10,'$'
OutMsg	DB		'Today''s date is: $'
day		DB		?
year	DW		?
weekday	DB		?

		

		.CODE
		EXTRN PutDec : NEAR
main	PROC
		_Begin
		_PutStr Message
		_PutStr OutMsg
		_GetDate

		mov day, dl

		mov weekday, al

		mov year, cx

		mov al, dh
		mov ah, 0 ;

		call PutDec

		_PutCh '-'

		mov al, day
		mov ah, 0 ;

		call PutDec

		_PutCh '-'

		mov ax, year;

		call PutDec






		



		_Exit 0 ;

main	ENDP	


		END		main ;			Tells where to start execution