		include PCMAC.INC
		.model small
		.586
		.stack 100h
		.data
theChar	db '?'
prompt	db "Enter a character", 10, 13, "$"
prompt2	db "Enter a number", 10, 13, "$"
theNum	db	'?'
		.code

moveChar	proc
			_Begin
	
			_PutStr prompt2

			mov theNum, al

			_PutStr prompt
			_GetCh



			mov theChar, al





if_1:      
			cmp theNum, 1
			jge then_1
			cmp theNum, 5
			jle else_1



then_1:


			mov cx,78
for_1:		_PutCh theChar
			call Delay
			_PutCh 8
			_PutCh ' '
			dec cx
			jnz for_1
			
			mov cx, 78
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


else_1:		jmp moveChar



		
	
			
			_Exit 0
moveChar	endp

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