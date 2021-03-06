; Listing generated by Microsoft (R) Optimizing Compiler Version 19.00.24210.0 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?WriteCommand@@YAXEE@Z				; WriteCommand
PUBLIC	?ReadCommand@@YAEE@Z				; ReadCommand
PUBLIC	?PrintBatterySN@@YAEXZ				; PrintBatterySN
PUBLIC	?QueryCommand@@YAEXZ				; QueryCommand
PUBLIC	??_C@_0BM@BFBIJMGP@BOYCEHONG?3?5the?5Count?5is?5?$CFd?6?$AA@FNODOBFM@ ;  ?? ::FNODOBFM::`string'
PUBLIC	??_C@_0P@FNOIOCCN@BOYCEHONG?3?5?$CFs?6?$AA@FNODOBFM@ ;  ?? ::FNODOBFM::`string'
EXTRN	DbgPrint:PROC
EXTRN	__GSHandlerCheck:PROC
EXTRN	__security_check_cookie:PROC
EXTRN	__security_cookie:QWORD
;	COMDAT pdata
pdata	SEGMENT
$pdata$?ReadCommand@@YAEE@Z DD imagerel $LN9
	DD	imagerel $LN9+85
	DD	imagerel $unwind$?ReadCommand@@YAEE@Z
pdata	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$?PrintBatterySN@@YAEXZ DD imagerel $LN8
	DD	imagerel $LN8+230
	DD	imagerel $unwind$?PrintBatterySN@@YAEXZ
pdata	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$?QueryCommand@@YAEXZ DD imagerel $LN5
	DD	imagerel $LN5+36
	DD	imagerel $unwind$?QueryCommand@@YAEXZ
pdata	ENDS
;	COMDAT ??_C@_0P@FNOIOCCN@BOYCEHONG?3?5?$CFs?6?$AA@FNODOBFM@
text$s	SEGMENT
??_C@_0P@FNOIOCCN@BOYCEHONG?3?5?$CFs?6?$AA@FNODOBFM@ DB 'BOYCEHONG: %s', 0aH
	DB	00H						;  ?? ::FNODOBFM::`string'
text$s	ENDS
;	COMDAT ??_C@_0BM@BFBIJMGP@BOYCEHONG?3?5the?5Count?5is?5?$CFd?6?$AA@FNODOBFM@
text$s	SEGMENT
??_C@_0BM@BFBIJMGP@BOYCEHONG?3?5the?5Count?5is?5?$CFd?6?$AA@FNODOBFM@ DB 'B'
	DB	'OYCEHONG: the Count is %d', 0aH, 00H	;  ?? ::FNODOBFM::`string'
text$s	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$?QueryCommand@@YAEXZ DD 030402H
	DD	06001601H
	DD	02204H
xdata	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$?PrintBatterySN@@YAEXZ DD 04151aH
	DD	06001602H
	DD	070029206H
	DD	imagerel __GSHandlerCheck
	DD	040H
xdata	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$?ReadCommand@@YAEE@Z DD 030802H
	DD	06001601H
	DD	02208H
xdata	ENDS
; Function compile flags: /Odtp
; File c:\users\boyce_hong\desktop\acpitool-src-104\ntmdrv\mydriver2\ec.cpp
;	COMDAT ?QueryCommand@@YAEXZ
_TEXT	SEGMENT
Data$ = 0
?QueryCommand@@YAEXZ PROC				; QueryCommand, COMDAT

; 49   : {

$LN5:
	sub	rsp, 24

; 50   : 	UINT8 Data = 0;

	mov	BYTE PTR Data$[rsp], 0
$LN2@QueryComma:

; 51   : 
; 52   : 	//while (_inp(EC_SC) & 0x02); //No need to judge the SCI_EVT bit.
; 53   : 	//_outp(EC_SC, 0x84);
; 54   : 	//while (!(_inp(EC_SC) & 0x01));
; 55   : 	while (_inp(EC_SC) & 0x20);//Wait system to QueryEC command

	in	al, 102					; 00000066H
	movsx	eax, al
	and	eax, 32					; 00000020H
	test	eax, eax
	je	SHORT $LN3@QueryComma
	jmp	SHORT $LN2@QueryComma
$LN3@QueryComma:

; 56   : 	Data = _inp(EC_DATA);

	in	al, 98					; 00000062H
	mov	BYTE PTR Data$[rsp], al

; 57   : 
; 58   : 	//DebugPrint(("BOYCEHONG: [1] _Q%02x\n", Data));
; 59   : 
; 60   : 	return Data;

	movzx	eax, BYTE PTR Data$[rsp]

; 61   : }

	add	rsp, 24
	ret	0
?QueryCommand@@YAEXZ ENDP				; QueryCommand
_TEXT	ENDS
; Function compile flags: /Odtp
; File c:\users\boyce_hong\desktop\acpitool-src-104\ntmdrv\mydriver2\ec.cpp
;	COMDAT ?PrintBatterySN@@YAEXZ
_TEXT	SEGMENT
Count$ = 32
SMBDataBase$ = 33
i$1 = 36
SN$ = 40
__$ArrayPad$ = 64
?PrintBatterySN@@YAEXZ PROC				; PrintBatterySN, COMDAT

; 27   : {

$LN8:
	push	rdi
	sub	rsp, 80					; 00000050H
	mov	rax, QWORD PTR __security_cookie
	xor	rax, rsp
	mov	QWORD PTR __$ArrayPad$[rsp], rax

; 28   : 	UINT8 Count, SMBDataBase = 0x1C;

	mov	BYTE PTR SMBDataBase$[rsp], 28

; 29   : 	char SN[20] = { 0 };

	mov	BYTE PTR SN$[rsp], 0
	lea	rax, QWORD PTR SN$[rsp+1]
	mov	rdi, rax
	xor	eax, eax
	mov	ecx, 19
	rep stosb

; 30   : 
; 31   : 	WriteCommand(0X19, 0X00);           //reset SMB_status

	xor	edx, edx
	mov	cl, 25
	call	?WriteCommand@@YAXEE@Z			; WriteCommand

; 32   : 	WriteCommand(0x1A, 0x16);           //write SMB_Addr

	mov	dl, 22
	mov	cl, 26
	call	?WriteCommand@@YAXEE@Z			; WriteCommand

; 33   : 	WriteCommand(0x1B, 0X20);           //SBS Command ManufacturerName

	mov	dl, 32					; 00000020H
	mov	cl, 27
	call	?WriteCommand@@YAXEE@Z			; WriteCommand

; 34   : 	WriteCommand(0X18, 0X0B);           //protocol

	mov	dl, 11
	mov	cl, 24
	call	?WriteCommand@@YAXEE@Z			; WriteCommand
$LN2@PrintBatte:

; 35   : 	while (ReadCommand(0X19) != 0x80);    //check status 

	mov	cl, 25
	call	?ReadCommand@@YAEE@Z			; ReadCommand
	movzx	eax, al
	cmp	eax, 128				; 00000080H
	je	SHORT $LN3@PrintBatte
	jmp	SHORT $LN2@PrintBatte
$LN3@PrintBatte:

; 36   : 	Count = ReadCommand(0x3C);         //block count

	mov	cl, 60					; 0000003cH
	call	?ReadCommand@@YAEE@Z			; ReadCommand
	mov	BYTE PTR Count$[rsp], al

; 37   : 	DebugPrint(("BOYCEHONG: the Count is %d\n", Count));

	movzx	eax, BYTE PTR Count$[rsp]
	mov	edx, eax
	lea	rcx, OFFSET FLAT:??_C@_0BM@BFBIJMGP@BOYCEHONG?3?5the?5Count?5is?5?$CFd?6?$AA@FNODOBFM@
	call	DbgPrint

; 38   : 
; 39   : 	for (int i = 0; i < Count; ++i)          // read

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN6@PrintBatte
$LN4@PrintBatte:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN6@PrintBatte:
	movzx	eax, BYTE PTR Count$[rsp]
	cmp	DWORD PTR i$1[rsp], eax
	jge	SHORT $LN5@PrintBatte

; 40   : 	{
; 41   : 		SN[i] = ReadCommand(SMBDataBase + i);

	movzx	eax, BYTE PTR SMBDataBase$[rsp]
	add	eax, DWORD PTR i$1[rsp]
	movzx	ecx, al
	call	?ReadCommand@@YAEE@Z			; ReadCommand
	movsxd	rcx, DWORD PTR i$1[rsp]
	mov	BYTE PTR SN$[rsp+rcx], al

; 42   : 	}

	jmp	SHORT $LN4@PrintBatte
$LN5@PrintBatte:

; 43   : 	DebugPrint(("BOYCEHONG: %s\n", SN));

	lea	rdx, QWORD PTR SN$[rsp]
	lea	rcx, OFFSET FLAT:??_C@_0P@FNOIOCCN@BOYCEHONG?3?5?$CFs?6?$AA@FNODOBFM@
	call	DbgPrint

; 44   : 
; 45   : 	return 0;

	xor	al, al

; 46   : }

	mov	rcx, QWORD PTR __$ArrayPad$[rsp]
	xor	rcx, rsp
	call	__security_check_cookie
	add	rsp, 80					; 00000050H
	pop	rdi
	ret	0
?PrintBatterySN@@YAEXZ ENDP				; PrintBatterySN
_TEXT	ENDS
; Function compile flags: /Odtp
; File c:\users\boyce_hong\desktop\acpitool-src-104\ntmdrv\mydriver2\ec.cpp
;	COMDAT ?ReadCommand@@YAEE@Z
_TEXT	SEGMENT
Data$ = 0
SMBAddr$ = 32
?ReadCommand@@YAEE@Z PROC				; ReadCommand, COMDAT

; 14   : {

$LN9:
	mov	BYTE PTR [rsp+8], cl
	sub	rsp, 24

; 15   : 	UINT8 Data = 0;

	mov	BYTE PTR Data$[rsp], 0
$LN2@ReadComman:

; 16   : 	while (_inp(EC_SC) & 0x02);

	in	al, 102					; 00000066H
	movsx	eax, al
	and	eax, 2
	test	eax, eax
	je	SHORT $LN3@ReadComman
	jmp	SHORT $LN2@ReadComman
$LN3@ReadComman:

; 17   : 	_outp(EC_SC, 0x80);

	mov	dx, 102					; 00000066H
	mov	al, 128					; 00000080H
	out	dx, al
$LN4@ReadComman:

; 18   : 	while (_inp(EC_SC) & 0x02);

	in	al, 102					; 00000066H
	movsx	eax, al
	and	eax, 2
	test	eax, eax
	je	SHORT $LN5@ReadComman
	jmp	SHORT $LN4@ReadComman
$LN5@ReadComman:

; 19   : 	_outp(EC_DATA, SMBAddr);

	mov	dx, 98					; 00000062H
	movzx	eax, BYTE PTR SMBAddr$[rsp]
	out	dx, al
$LN6@ReadComman:

; 20   : 	while (!(_inp(EC_SC) & 0x01));

	in	al, 102					; 00000066H
	movsx	eax, al
	and	eax, 1
	test	eax, eax
	jne	SHORT $LN7@ReadComman
	jmp	SHORT $LN6@ReadComman
$LN7@ReadComman:

; 21   : 	Data = _inp(EC_DATA);

	in	al, 98					; 00000062H
	mov	BYTE PTR Data$[rsp], al

; 22   : 
; 23   : 	return Data;

	movzx	eax, BYTE PTR Data$[rsp]

; 24   : }

	add	rsp, 24
	ret	0
?ReadCommand@@YAEE@Z ENDP				; ReadCommand
_TEXT	ENDS
; Function compile flags: /Odtp
; File c:\users\boyce_hong\desktop\acpitool-src-104\ntmdrv\mydriver2\ec.cpp
;	COMDAT ?WriteCommand@@YAXEE@Z
_TEXT	SEGMENT
SMBAddr$ = 8
SMBData$ = 16
?WriteCommand@@YAXEE@Z PROC				; WriteCommand, COMDAT

; 4    : {

	mov	BYTE PTR [rsp+16], dl
	mov	BYTE PTR [rsp+8], cl
$LN2@WriteComma:

; 5    : 	while (_inp(EC_SC) & 0x02);

	in	al, 102					; 00000066H
	movsx	eax, al
	and	eax, 2
	test	eax, eax
	je	SHORT $LN3@WriteComma
	jmp	SHORT $LN2@WriteComma
$LN3@WriteComma:

; 6    : 	_outp(EC_SC, 0x81);

	mov	dx, 102					; 00000066H
	mov	al, 129					; 00000081H
	out	dx, al
$LN4@WriteComma:

; 7    : 	while (_inp(EC_SC) & 0x02);

	in	al, 102					; 00000066H
	movsx	eax, al
	and	eax, 2
	test	eax, eax
	je	SHORT $LN5@WriteComma
	jmp	SHORT $LN4@WriteComma
$LN5@WriteComma:

; 8    : 	_outp(EC_DATA, SMBAddr);

	mov	dx, 98					; 00000062H
	movzx	eax, BYTE PTR SMBAddr$[rsp]
	out	dx, al
$LN6@WriteComma:

; 9    : 	while (_inp(EC_SC) & 0x02);

	in	al, 102					; 00000066H
	movsx	eax, al
	and	eax, 2
	test	eax, eax
	je	SHORT $LN7@WriteComma
	jmp	SHORT $LN6@WriteComma
$LN7@WriteComma:

; 10   : 	_outp(EC_DATA, SMBData);

	mov	dx, 98					; 00000062H
	movzx	eax, BYTE PTR SMBData$[rsp]
	out	dx, al

; 11   : }

	ret	0
?WriteCommand@@YAXEE@Z ENDP				; WriteCommand
_TEXT	ENDS
END
