### Lesson 2

**1) What is DB?**<br/>
In MASM (Microsoft Macro Assembler) and x86 assembly language programming, DB stands for "Define Byte." It is a directive used to allocate memory and define one or more bytes of data in a data segment.
For example, suppose you want to define a byte variable named MyByte with an initial value of 42 (decimal). You can do so using DB as follows:

```assembly
MyByte DB 42
```

<br/>
<br/>

**2) Memory Layout**<br/>
```
----------------------------------  <- Memory Address Space
|       Stack Segment (STACK)     |
|--------------------------------|
|                                |
|                                |
|                                |
|--------------------------------|
|        Data Segment (DATA)      |
|--------------------------------|
|                                |
|--------------------------------|
|       Code Segment (CODE)      |
|--------------------------------|

```

<br/>
<br/>

**3) What is PARA?**<br/>
The PARA keyword in MASM indicates the use of the paragraph memory addressing scheme for a segment, where each paragraph is 16 bytes long.

<br/>
<br/>

**4) What are other memory addressing schemes**<br/>
In MASM (Microsoft Macro Assembler) and x86 assembly language programming, there are several memory addressing schemes available, each with its characteristics and usage. Here are some of the commonly used memory addressing schemes:

BYTE:
- Organizes memory as a sequence of individual bytes (8 bits each).
- Addresses are specified in byte units, i.e., each address refers to a single byte of memory.

WORD:
- Organizes memory as a sequence of 16-bit words.
- Addresses are specified in word units, where each address refers to a 16-bit (2-byte) memory location.

DWORD (Double Word):
- Organizes memory as a sequence of 32-bit double words.
- Addresses are specified in double word units, where each address refers to a 32-bit (4-byte) memory location.

FWORD (Far Word):
- Similar to a word, but used in segmented memory models.
- Addresses are specified in far word units, which combine a segment address and an offset address.

QWORD (Quad Word):
- Organizes memory as a sequence of 64-bit quad words.
- Addresses are specified in quad word units, where each address refers to a 64-bit (8-byte) memory location.

TBYTE (10-Byte):
- Organizes memory as 10-byte chunks.
- Addresses are specified in 10-byte units, often used in advanced memory operations.

PARA:
- Organizes memory in segments, where each segment consists of 16 bytes (1 paragraph).
- Addresses are specified in paragraph units, typically used in older x86 systems and assembly language programming.

PAGE:
- Organizes memory in pages, where each page is typically 4 KB (4096 bytes) in size.
- Addresses are specified in page units, used in memory management and virtual memory systems.

LINE:
- Organizes memory in lines, where each line is a fixed number of bytes (commonly used in graphics programming).
- Addresses are specified in line units, often used for pixel manipulation and screen drawing operations.

<br/>
<br/>

**5) What is INT**<br/>
In assembly language programming for x86 processors, INT stands for "Interrupt." It is a processor instruction used to generate a software interrupt, which is a mechanism for triggering specific software routines called interrupt service routines (ISRs) or interrupt handlers.
```
INT interrupt_number

MOV DL, 'A'     ; Load the ASCII value of 'A' into DL
MOV AH, 2       ; Set AH to 2 (DOS function for displaying a character)
INT 21h         ; Call the DOS interrupt 21h to display the character in DL
```

<br/>
<br/>

*Reference*
- https://www.youtube.com/watch?v=RhsaakpatqI&list=PLvpbDCl_H7mfgmEJPl1bTHlH5g-f0kWDM&index=2&ab_channel=ProgrammingDimension
