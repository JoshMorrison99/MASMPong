### Lesson 4

In this lesson we learned how to use graphics by changing the background color of the window and writing a single pixel to the screen.

![image](https://github.com/JoshMorrison99/MASMPong/assets/25315255/30314539-c604-4d93-8990-8354741e5387)

![image](https://github.com/JoshMorrison99/MASMPong/assets/25315255/7676a2bf-f4db-4ca2-b528-60d6d71d64f1)


```
MOV AH,00h      ;set the configuration to video mode
MOV AL,12h      ;choose the video mode
INT 10h         ;execute the configuration
```

Set to video mode `MOV AH,00h`:
- https://en.wikipedia.org/wiki/INT_10H

![image](https://github.com/JoshMorrison99/MASMPong/assets/25315255/06950443-fe53-4f54-975c-139abc76421f)

Set the video mode: `MOV AL,12h`
- https://mendelson.org/wpdos/videomodes.txt
```
12h = G  80x30  8x16  640x480   16/256K  .   A000 VGA,ATI VIP
```

---

```
MOV AH,0Bh      ;set the configuration to background color
MOV BH,00h      ;set the configuration to background color
MOV BL,04h      ;set background color to red
INT 10h         ;execute the configuration
```

![image](https://github.com/JoshMorrison99/MASMPong/assets/25315255/759a9e3d-a727-4127-96c0-ef663504f79f)


Set the background color:
- `MOV BL,04h`
- https://en.wikipedia.org/wiki/BIOS_color_attributes

![image](https://github.com/JoshMorrison99/MASMPong/assets/25315255/0a8a1db6-3113-4a80-a69b-4cd4f8a6938b)

---

```
MOV AH,0Ch      ;set the configuration to writing a pixel
MOV AL,0Fh      ;choose the pixel color to be white
MOV BH,00h      ;set the page number
MOV CX,0Ah      ;set x=10
MOV DX,0Ah      ;set y=10
INT 10h         ;execute the configuration
```

![image](https://github.com/JoshMorrison99/MASMPong/assets/25315255/21e93670-73ce-41cd-a623-b8b8d7cbd06d)




*References*
- https://www.youtube.com/watch?v=Pub0TdAgT2s&list=PLvpbDCl_H7mfgmEJPl1bTHlH5g-f0kWDM&index=4&ab_channel=ProgrammingDimension
- https://en.wikipedia.org/wiki/BIOS_color_attributes
- https://stanislavs.org/helppc/int_10-0.html
- https://en.wikipedia.org/wiki/INT_10H
