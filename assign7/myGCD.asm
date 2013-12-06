				

				include PCMAC.INC
				.model small
				.586
				.data
M   			Dw	?
N       		Dw  ?
prompt			db "myGCD is being accessed!", 10, 13, "$"	

				.code
				extrn PutDec: near
				PUBLIC myGCD
myGCD			proc



				mov N, ax
				mov M, bx

if_6:			mov ax, N
				cmp ax, 0
				jg else_6
				mov N, 1
				mov ax, N
				jmp end_if_6

if_7:			mov ax, M
				cmp ax, 0
				jg else_7
				mov N, 1
				mov ax, N
				jmp end_if_7 





if_5:			mov ax, N
				cmp ax, 0
				jne else_5
				mov ax, M
				mov N, ax
				jmp end_if_5
				
else_7:
else_6:
else_5:

;				GCD()

if_2:			mov ax, M
				cwd         
   				xor  ax, dx  
   				sub  ax, dx  

   				or   bx, bx
   				jge  end_if_2
   				neg  bx
   				mov M, bx
end_if_2:	


;				GCD(-32768, -32768)

if_3:			mov ax, N
				mov bx, M
				cmp ax, -32768
				jne end_if_3
				cmp bx, -32768
				jne end_if_3
				mov N, -32768
				jmp else_3

end_if_3:

if_4:			mov ax, N
				mov bx, M
				cmp bx, -32768
				jne end_if_4
				cmp ax, -32768
				je end_if_4
				mov M, 16384

end_if_4:		







;		calculates GCD


while_1:
				mov ax, M
				cmp ax, N
				je end_while_1

body_1:

if_1:			mov ax, N
				cmp ax, M
				jle else_1
				mov ax, N
				sub ax, M
				mov N, ax
				jmp end_1
else_1:			mov ax, M
				sub ax, N
				mov M, ax

end_1:

				jmp while_1


				

end_while_1:
				mov ax, N
				mov bx, M
end_if_5:
end_if_6:
end_if_7:
else_3:



				

	
				ret
myGCD			endp
				end