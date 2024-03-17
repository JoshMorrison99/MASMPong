### Lesson 8

**1) Illegal Operation**
- The following operation will give an ERROR "Improper operand type". This is because you cannot use 2 variables together. To fix this, we need to use the variable and the register.
```
ADD BALL_X,BALL_VELOCITY_X  ;increment the BALL_X value by BALL_VELOCITY_X (BALL_X = BALL_X + 2)
ADD BALL_Y,BALL_VELOCITY_Y  ;increment the BALL_Y value by BALL_VELOCITY_Y (BALL_Y = BALL_Y + 2)
```
![image](https://github.com/JoshMorrison99/MASMPong/assets/25315255/d3bfc1cc-6e97-4041-9201-ff2a69800ca8)

<br/>

*Fix*
```
MOV AX,BALL_VELOCITY_X
ADD BALL_X,AX  ;increment the BALL_X value by BALL_VELOCITY_X (BALL_X = BALL_X + 2)

MOV AX,BALL_VELOCITY_Y
ADD BALL_Y,AX  ;increment the BALL_Y value by BALL_VELOCITY_Y (BALL_Y = BALL_Y + 2)
```
![image](https://github.com/JoshMorrison99/MASMPong/assets/25315255/55538dd5-245c-4962-97cd-8731677424f2)

<br/>

**2) Clearing the Trail**
- To clear the white trail left when the ball moves we will need to write the screen to red and then call the DRAW_BALL procedure after every update.
```
CLEAR_SCREEN PROC NEAR
    MOV AH,00h      ;set the configuration to video mode
    MOV AL,12h      ;choose the video mode
    INT 10h         ;execute the configuration

    MOV AH,0Bh      ;set the configuration to background color
    MOV BH,00h      ;set the configuration to background color
    MOV BL,04h      ;set background color to red
    INT 10h         ;execute the configuration

    RET
CLEAR_SCREEN ENDP
```

![image](https://github.com/JoshMorrison99/MASMPong/assets/25315255/790b6b37-e029-4262-9478-ca4d57b33bd7)


<br/>

**References**
- https://www.youtube.com/watch?v=amG4R38uWWU&list=PLvpbDCl_H7mfgmEJPl1bTHlH5g-f0kWDM&index=8&ab_channel=ProgrammingDimension
