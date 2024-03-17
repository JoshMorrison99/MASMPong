STACK SEGMENT PARA STACK
    DB 64 DUP (' ')
STACK ENDS

DATA SEGMENT PARA 'DATA'

DATA ENDS

CODE SEGMENT PARA 'CODE'

    MAIN PROC FAR

        MOV AH,00h      ;set the configuration to video mode
        MOV AL,12h      ;choose the video mode
        INT 10h         ;execute the configuration

        MOV AH,0Bh      ;set the configuration to background color
        MOV BH,00h      ;set the configuration to background color
        MOV BL,04h      ;set background color to red
        INT 10h         ;execute the configuration

        MOV AH,0Ch      ;set the configuration to writing a pixel
        MOV AL,0Fh      ;choose the pixel color to be white
        MOV BH,00h      ;set the page number
        MOV CX,0Ah      ;set x=10
        MOV DX,0Ah      ;set y=10
        INT 10h         ;execute the configuration
        
        RET
    MAIN ENDP

CODE ENDS
END
