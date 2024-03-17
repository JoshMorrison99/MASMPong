STACK SEGMENT PARA STACK
    DB 64 DUP (' ')
STACK ENDS

DATA SEGMENT PARA 'DATA'

    BALL_X DW 0Ah       ;set x=10
    BALL_Y DW 0Ah       ;set y=10
    BALL_SIZE DW 08h    ;size of the ball (8x8 pixels)

DATA ENDS

CODE SEGMENT PARA 'CODE'

    MAIN PROC FAR
    ASSUME CS:CODE,DS:DATA,SS:STACK ;assume as code, data and stack segments the respective registers
    PUSH DS                         ;push to the stack the DS segment
    SUB AX,AX                       ;clean the AX register
    PUSH AX                         ;push AX to the stack
    MOV AX,DATA                     ;save on the AX register the contents of the DATA segment
    MOV DS,AX                       ;save on the DS segment the contents of AX
    POP AX                          ;release the top item from the stack tot he AX register
    POP AX                          ;release the top item from the stack tot he AX register

        MOV AH,00h      ;set the configuration to video mode
        MOV AL,12h      ;choose the video mode
        INT 10h         ;execute the configuration

        MOV AH,0Bh      ;set the configuration to background color
        MOV BH,00h      ;set the configuration to background color
        MOV BL,04h      ;set background color to red
        INT 10h         ;execute the configuration

        CALL DRAW_BALL

        RET
    MAIN ENDP

    DRAW_BALL PROC NEAR

        MOV CX,BALL_X    ;set the initial position of x
        MOV DX,BALL_Y    ;set the initial position of y

        DRAW_BALL_HORIZONTAL:
            MOV AH,0Ch      ;set the configuration to writing a pixel
            MOV AL,0Fh      ;choose the pixel color to be white
            MOV BH,00h      ;set the page number
            INT 10h         ;execute the configuration

            INC CX          ;CX = CX + 1
            MOV AX,CX       ;CX - BALL_X > BALL_SIZE (True -> We go to the next line, False -> We go to the next column)
            SUB AX,BALL_X
            CMP AX,BALL_SIZE
            JNG DRAW_BALL_HORIZONTAL

            MOV CX,BALL_X   ;the CX register goes back to the inital column
            INC DX          ;we advance one line
            
            MOV AX,DX       ;DX - BALL_Y > BALL_SIZE (True -> we exit this procedure, False -> we continue to the next line)
            SUB AX,BALL_Y
            CMP AX,BALL_SIZE
            JNG DRAW_BALL_HORIZONTAL            


        RET
    DRAW_BALL ENDP

CODE ENDS
END
