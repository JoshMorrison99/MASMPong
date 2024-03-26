### Lesson 10

In this lesson we make the ball return to the original (X,Y) position after the ball hits the left or right bounds. Previously, the ball would bounce all the wall, but now the ball will jump to the (X,Y) starting position.

<br/>
<br/>

We do this by setting the varaibles for the ball starting positions.
- The 100d means that it is 100 in decimal (you can also do 64h, in this case it would be 100 in hex)
```
BALL_X_ORIGINAL = 100d ;the ball X start position
BALL_Y_ORIGINAL = 100d ;the ball Y start position
```

<br/>
<br/>

When the ball hits the window bound we call the RESET_POSITION procedure.
```
MOV AX,WINDOW_BOUNDS
CMP BALL_X,AX               ;BALL_X < 0 (X -> collided)
JL RESET_POSITION
```

<br/>
<br/>

The RESET_POSITION procedure will just set the value of the ball position to the value we specified for the ball starting position.
```
RESET_BALL_POSITION PROC NEAR 

    MOV AX, BALL_X_ORIGINAL ;set AX to the value of the original ball position
    MOV BALL_X, AX          ;update he ball x position to the original ball position

    MOV AX, BALL_Y_ORIGINAL ;set AX to the value of the original ball position
    MOV BALL_Y, AX          ;update he ball y position to the original ball position

    RET
RESET_BALL_POSITION ENDP
```
<br/>
<br/>

**References**
- https://www.youtube.com/watch?v=mSGY8qz9N_c&list=PLvpbDCl_H7mfgmEJPl1bTHlH5g-f0kWDM&index=10
