;;		Name:			Kody Wildfeuer	
;;		Class:			CSc314
;;		Assign:			Four
;;		Date:			October 27, 2013
;;		Due:			October 28, 2013
;;		
;;		Description:	This program takes in a Celsius value and converts the number
;;		into its Fahrenheit equivalent. 
;;		Example input: -3		Example Output: 26 


			include pcmac.inc
			.model small
			.586
			.stack 100h
			.data

prompt		db "Enter Celcius number ->","$"
answer2		db " degrees Fahrenheit",13,10,"$"

			.code
			extrn PutDec:near
			extrn GetDec:near
convert		proc
			_Begin
			_PutStr prompt
			call GetDec   ;I have the number in Celsius within the ax register
			
			;;convert Celsius to fahrenheit
			mov bx, 9		;; move 9 into bx register
			imul bx			;; multiply ax register by 9
			add ax, 160		;; add ax and 160
			cwd
			mov bx, 5		;; move 5 into bx register
			idiv bx			;; divide ax by 5
			
			call PutDec		; Displays the ax register (Fahrenheit temp) to screen
			_PutStr answer2
			
			
			_Exit 0
convert 	endp
			end convert
			
			