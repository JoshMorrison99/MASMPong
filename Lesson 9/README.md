### Lesson 9

In this lesson we check if the ball location is greater than or less than the window width or height. The first thing we need to do is get the width and height of the window.
<br/>
We can see in the CLEAR_SCREEN Procedure that we initalize the window mode using `12h`<br/>
```
CLEAR_SCREEN PROC NEAR
        MOV AH,00h      ;set the configuration to video mode
        MOV AL,12h      ;choose the video mode
        INT 10h         ;execute the configuration
```

<br/>
<br/>

The `12h` window mode has a dimension of `640x480`<br/>

```
12h = G  80x30  8x16  640x480   16/256K  .   A000 VGA,ATI VIP
```

https://mendelson.org/wpdos/videomodes.txt

<br/>

The next step is to reverse the velocity of the ball when the ball location is greater than the window size. (Remember that we cannot compare 2 variables in MASM, you need to write the variable to a register and then compare). The below code is the logic for ball on the x-axis when the ball location is greater than the screen size.

```
MOV AX,WINDOW_WIDTH         ;BALL_X > WINDOW_WIDTH - BALL_SIZE (X -> collided)
SUB AX,BALL_SIZE
SUB AX,WINDOW_BOUNDS
CMP BALL_X,AX
JG NEG_VELOCITY_X


NEG_VELOCITY_X:
    NEG BALL_VELOCITY_X     ;BALL_VELOCITY_X = -BALL_VELOCITY_X
    RET
```

<br/>

The logic for the other axis is similar to the above.

<br/>

**References**
- https://www.youtube.com/watch?v=ILTI1zF7Htc&list=PLvpbDCl_H7mfgmEJPl1bTHlH5g-f0kWDM&index=9&ab_channel=ProgrammingDimension
- https://mendelson.org/wpdos/videomodes.txt
