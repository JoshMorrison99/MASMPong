### Lesson 7

**1) How to get system time in Assembly**
To get the system time just need to call `INT 21h` with the value `AH = 2Ch`
![image](https://github.com/JoshMorrison99/MASMPong/assets/25315255/7ddb2cc9-7509-4e32-b434-60b4b48c3c1d)

<br/>
<br/>

**2) Game Loop**
The game loop is an infinite loop that will update the graphics.
- In the CHECK_TIME label we get the system time and check if it has changed. If the time has changed then we update the ball x position by 1 and draw the ball. If the time hasn't changed then we check again to see if the time has changed.
```
CHECK_TIME:
    MOV AH,2Ch      ;get the system time
    INT 21h         ;interupt to get system time CH = hour(0 to 23) CL = minute (0 to 59) DH = second (0 to 59) DL = centiseconds (0 to 99)

    CMP DL,TIME_AUX ;is the current time equal to the previous one (TIME_AUX)?
    JE CHECK_TIME   ;if it is the same, check again


    MOV TIME_AUX,DL ;update time
    INC BALL_X
    CALL DRAW_BALL

    JMP CHECK_TIME  ;after everything checks time again
```

![image](https://github.com/JoshMorrison99/MASMPong/assets/25315255/f988f85b-8f07-4e66-a36f-797845bc18e6)


**References**
- https://www.youtube.com/watch?v=TrE9QrRl0ts&list=PLvpbDCl_H7mfgmEJPl1bTHlH5g-f0kWDM&index=7&ab_channel=ProgrammingDimension
- http://bbc.nvg.org/doc/Master%20512%20Technical%20Guide/m512techb_int21.htm
