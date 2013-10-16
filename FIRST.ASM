;; First.ASM--Our first Assembly Language Program. This Program
;;		displays the line 'Hello, my name is Bill Jones'

		.MODEL	SMALL
		.586	; Allows Pentium Instructions. Must follow .MODEL
		
		.STACK	100h
		
		.DATA
Message	DB		'Hello, my name is Kody Wildfeuer!', 13, 10,
		'The best movie I saw last summer was This Is The End.', 13, 10, '$'

		.CODE
Hello	PROC
		mov		ax, @data
		mov		ds, ax
		mov		dx, OFFSET Message
		mov		ah, 9h ;		Function code for 'display string'
		int		21h ;			Standard way to call MSDOS
		mov		al,	0 ;			Return code of 0
		mov		ah, 4ch ;		Exit back to MSDOS
		int		21h
Hello	ENDP	


		END		HELLO ;			Tells where to start execution