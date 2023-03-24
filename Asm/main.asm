format PE Console

entry start 

include 'win32a.inc' 

section '.data' data readable writeable 

a dd ?
b dd ?
c dd ?
d dd ?
e dd ?

SpecD db '%d %d %d %d %d', 0 
MsgEntry db 'Please, enter 5 unsigned decimal numbers from 0 to 255 inclusively:', 0x0D, 0x0A, 0
MsgEntered db 0x0D, 0x0A, 0x0D, 0x0A,'Entered numbers (decimal):', 0x0D, 0x0A, 0
MsgRes db 0x0D, 0x0A, 0x0D, 0x0A,'Result (decimal):', 0x0D, 0x0A, 0
MsgKey db 0x0D, 0x0A, 0x0D, 0x0A,'Press any key...', 0x0D, 0x0A, 0

section '.text' code readable executable

start: 
    cinvoke printf, MsgEntry
    cinvoke scanf, SpecD, a, b, c, d, e      
    cinvoke printf, MsgEntered
    cinvoke printf, SpecD, [a], [b], [c], [d], [e]
  
    push [e]
    push [d]
    push [c]
    push [b]
    push [a]
  
    xor ecx, ecx
     
operation:
    mov al, [esp + ecx * 4] 
    add al, 'M' 
    add al, cl  
    xor al, 'Z' 
    mov [esp + ecx * 4], al
    
    inc ecx
    cmp ecx, 5
    jge result
    
    jmp operation
      
result:
    pop [a]
    pop [b]
    pop [c]
    pop [d]
    pop [e]
    
    cinvoke printf, MsgRes
    cinvoke printf, SpecD, [a], [b], [c], [d], [e] 
    cinvoke printf, MsgKey
    cinvoke getch 
  
    invoke ExitProcess, 0

section '.idata' data import readable 
      library kernel, 'kernel32.dll', msvcrt, 'msvcrt.dll'

import kernel, ExitProcess, 'ExitProcess'
        
import msvcrt, puts, 'puts', printf, 'printf', scanf, 'scanf', getch, '_getch'