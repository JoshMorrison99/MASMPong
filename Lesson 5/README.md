### Lesson 5

**1) Data Segment**
- We use the Data segment to store the value of the ball location (x=10, y=10).
- DW stands for "Define Word" it has a storage space of 16 bits. The BALL_X is then being stored in CX which is also 16 bits.
```
DATA SEGMENT PARA 'DATA'

    BALL_X DW 0Ah       ;set x=10
    BALL_Y DW 0Ah       ;set y=10

DATA ENDS
```

<br/>
<br/>

**2) What is Assume?**
The ASSUME directive in assembly language is used to inform the assembler about the segment register assumptions within the program. When you use the ASSUME directive with segment register assumptions like CS:CODE, DS:DATA, and SS:STACK, you are not providing new information to the compiler about what these registers are. Instead, you are instructing the assembler to associate specific segments (defined in your code) with these predefined segment registers. This association helps the assembler correctly generate machine code instructions that access the appropriate memory segments during program execution.
> DS is called data segment register. It points to the segment of the data used by the running program. You can point this to anywhere you want as long as it contains the desired data.
If you are using directives like .code and .data to define segments in an assembly language program, you generally do not need to use the ASSUME directive explicitly. Directives such as .code, .data, and .stack (or similar directives depending on the assembler) implicitly define the segment associations.
```
.code
MAIN PROC
    ; Code goes here
MAIN ENDP
END MAIN

.data
BALL_X DW 0Ah
BALL_Y DW 0Ah
```

<br/>
<br/>

**3) Why is the Stack Needed?**
- I asked chatGPT to optimize the code and it gave me an easier understanding.
- In the optimized code, the step MOV DS, AX is needed to set the data segment register (DS) to point to the data segment (DATA). This step is essential for accessing and manipulating data variables defined in the data segment.
```
DATA SEGMENT PARA 'DATA'

    BALL_X DW 0Ah       ; Set x=10
    BALL_Y DW 0Ah       ; Set y=10

DATA ENDS

CODE SEGMENT PARA 'CODE'

    MAIN PROC FAR
        MOV AX, DATA   ; Load the data segment address into AX
        MOV DS, AX     ; Set DS to point to the data segment

        MOV AH, 00h    ; Set the video mode configuration
        MOV AL, 12h    ; Choose the video mode
        INT 10h        ; Execute the configuration

        MOV AH, 0Bh    ; Set the background color configuration
        MOV BH, 00h    ; Set the page number
        MOV BL, 04h    ; Set background color to red
        INT 10h        ; Execute the configuration

        MOV AH, 0Ch    ; Set the configuration to write a pixel
        MOV AL, 0Fh    ; Choose the pixel color to be white
        MOV BH, 00h    ; Set the page number
        MOV CX, BALL_X ; Load x coordinate
        MOV DX, BALL_Y ; Load y coordinate
        INT 10h        ; Execute the configuration
        
        RET            ; Return from the main procedure
    MAIN ENDP

CODE ENDS
END MAIN
```

Segment Registers: In x86 assembly language programming, memory addressing is segmented, meaning that different parts of memory are accessed using segment registers (CS, DS, ES, SS, FS, GS). Each segment register points to a specific segment of memory, such as the code segment, data segment, stack segment, etc.

Accessing Data Variables: When you define data variables like BALL_X and BALL_Y in the data segment (DATA), the CPU needs to know which segment of memory these variables belong to. The DS register is used to point to the data segment, allowing the program to access and manipulate these data variables correctly.

Segmentation in Real Mode: In real mode of x86 architecture (used in your code), segmentation is used to address memory. The DS register plays a crucial role in this segmentation by specifying the base address of the data segment. Without setting DS appropriately, attempts to access data variables in the data segment may result in accessing incorrect memory locations or even program crashes.

Therefore, the step MOV DS, AX in the optimized code is necessary to ensure that the DS register points to the correct data segment (DATA), enabling proper access and manipulation of data variables within the program.


If you do not specify MOV AX, DATA to load the data segment address into the AX register and subsequently MOV DS, AX to set the DS register to point to that address, the CPU will not have a correct data segment base address to use for memory access operations related to data variables like BALL_X and BALL_Y.

In such a case, when your program attempts to access data variables without setting up the data segment register (DS), the CPU will likely use the default data segment base address that was set up during system boot or by the assembler's default configuration. This default value may not be what you expect, and it can lead to accessing incorrect memory locations or causing program crashes.

To summarize, without setting up the data segment register (DS) correctly using MOV DS, AX after loading the data segment address into AX, the CPU will try to access memory using whatever default data segment base address is currently in the DS register. This can lead to unpredictable behavior and should be avoided by explicitly setting up segment registers as needed for your program's memory operations.

> To answer the question, the stack isn't needed to get the data in BALL_X and BALL_Y.

*Pixel when DS register knows the address of the Data Segment*
![image](https://github.com/JoshMorrison99/MASMPong/assets/25315255/e7aceedb-f816-4f3b-b17e-eea67eb9f260)

*Pixel when DS register DOES NOT know the address of the Data Segment*
- The pixel doesn't appear in this boot because it is taking the value of whatever was previously in the DS register / the default value in the DS register. The value is trash data.
```
STACK SEGMENT PARA STACK
    DB 64 DUP (' ')
STACK ENDS

DATA SEGMENT PARA 'DATA'

    BALL_X DW 0Ah       ;set x=10
    BALL_Y DW 0Ah       ;set y=10

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
        MOV CX,BALL_X      
        MOV DX,BALL_Y      
        INT 10h         ;execute the configuration
        
        RET
    MAIN ENDP

CODE ENDS
END
```
![image](https://github.com/JoshMorrison99/MASMPong/assets/25315255/77b76e15-1c34-4eb0-a8ae-73e823f681a5)



**References**
- https://www.youtube.com/watch?v=qUGChq5sPcA&list=PLvpbDCl_H7mfgmEJPl1bTHlH5g-f0kWDM&index=5&ab_channel=ProgrammingDimension
- https://www.tek-tips.com/viewthread.cfm?qid=717198
