org 100h

.model small

.stack 100H 

.data
T1 db  "  _______ _                      _____                                            "
T2 db  " |__   __| |                    / ____| ___   ___                                 "
T3 db  "    | |  | |__   ___           | |__   / _ \ / _ \                                "
T4 db  "    | |  | '_ \ / _ \          | |__| | | | | | | |                               "
T5 db  "    | |  | | | |  __/          | |____| |_| | |_| |                               "
T6 db  "   _|_|_ |_| |_|\___> _         \_____|\___/|\___/|                               "
T7 db  "  / ____|    _|_|_   | |                  / |   / |                               "
T8 db  " | |      __|_|_|_|__| |__   ___  _  _   //||  //||                               "
T9 db  " | |     / _` | | / _|  _ \ / _ \| |/ \ (( || (( ||                               "
T10 db " | |____| (_| | || |_| | | |  __/| |/`\) \\||  \\||                               "
T11 db "  \_____|\__,_|_| \__|_| |_|\___)|_|      \_|   \_|                               "

MSG_GameOver1 db "  ___   __   _  _  ____     __   _  _  ____  ____ " 
MSG_GameOver2 db " / __) / _\ ( \/ )(  __)   /  \ / )( \(  __)(  _ \"
MSG_GameOver3 db "( (_ \/    \/ \/ \ ) _)   ( () )\ \/ / ) _)  )   /"
MSG_GameOver4 db " \___/\_/\_/\_)(_/(____)   \__/  \__/ (____)(__\_)"

OptionsPosition db 1
                            
                                      
eggX dw 0                                    
eggY dw 155

remX dw 440
remY dw 320

frX dw 150
frY dw 150
                                      
wrtX dw 440
wrtY dw 320 
 
pnt dw 0
 
MISS dw 0
;--------------------------------------
StartLabelFalse db   " Start The Game "
StartLabelTrue db    ">Start The Game<"

StartLocation dw ?  ;Variable


ExitLabelFalse db    "     Exit       "
ExitLabelTrue db     "    >Exit<      "

EndLocation dw ?  ;Variable 
;---------------------------------------
.code
;$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Menu:
call ClearAllRegistersAndVariables
call DrawMainMenu
call FunctionalMainMenu
pop ax
cmp ax,1
je StartTheGame
cmp ax,2
je Exit 

jmp Menu


StartTheGame:
call ClearAllRegistersAndVariables
call ClearScreen
call frame    

proc ClearAllRegistersAndVariables
xor ax,ax
xor bx,bx
xor dx,dx
xor cx,cx
 

ret 
endp ClearAllReg


;~~~~~~~~~~~~~~~~~~It will Clear the full screen~~~~~~~~~~~~~~~~~~~~
proc ClearScreen
ClearField:
mov dl,0        ;set cursor to 0,0
mov dh,0  
clear:          ;clear the console...
mov bh, 0
mov ah, 0x2
int 0x10
mov cx, 80      ; print chars
mov bh, 0
mov bl, 00d     ; green bg/blue fg
mov al, 0       ;'*'    ;0x20   ; blank char
mov ah, 0x9
int 0x10
inc dh
cmp dh,25d
jne clear
ret

endp ClearScreen

proc FunctionalMainMenu

Options:
 mov ah,1h ;Check if any key was pressed in the keyboard!
int 16h
jnz UpOrDown;key was pressed!
jmp Options ;key wasent pressed!

UpOrDown:
mov ah,0h;Get the key that was pressed!
int 16h

cmp ah,48h ;up key
je UpKey
cmp ah,50h ;down key
je DownKey
cmp al,13
je OptionClicked
jmp Options

UpKey:
cmp OptionsPosition,1
je Buttom
mov dh,OptionsPosition
mov dl,0
push dx
call ChangeManuPosition

dec OptionsPosition

mov dh,OptionsPosition
mov dl,1
push dx
call ChangeManuPosition
jmp Options

;upper then 1?
Buttom:

mov dh,OptionsPosition  ;unmark befor
mov dl,0
push dx
call ChangeManuPosition

mov OptionsPosition,3
 
mov dh,OptionsPosition    ;mark after
mov dl,1
push dx
call ChangeManuPosition




jmp Options

DownKey:
                                                    
cmp OptionsPosition,3
je Top
mov dh,OptionsPosition
mov dl,0
push dx
call ChangeManuPosition

inc OptionsPosition

mov dh,OptionsPosition
mov dl,1 
push dx
call ChangeManuPosition
jmp Options

;lower then 3?
Top:

mov dh,OptionsPosition  ;unmark befor
mov dl,0
push dx
call ChangeManuPosition

mov OptionsPosition,1
 
mov dh,OptionsPosition    ;mark after
mov dl,1
push dx
call ChangeManuPosition


jmp Options


OptionClicked: 
xor ax,ax
pop [150]
mov al, OptionsPosition
push ax
push [150] 

ret
endp FunctionalMainMenu    



;chnage the selected menu item...
;get param in stack High- Option kind. Low- 0=true 1=false
proc ChangeManuPosition
pop [150]
pop dx
cmp dh,1
je SC
cmp dh,3

;Exit Unmark/mark
EC:
cmp dl,1
je ECmark
ECunmark:;unmark
mov dx,EndLocation 
mov bp,offset ExitLabelFalse 

jmp doneMarking


ECmark:;mark
mov dx,EndLocation 
mov bp,offset ExitLabelTrue

jmp doneMarking

;Start unmark/mark
SC:
cmp dl,1
je SCmark
SCunmark:;unmark
mov dx,StartLocation 
mov bp,offset StartLabelFalse
jmp doneMarking


SCmark:;mark

mov dx,StartLocation 
mov bp,offset StartLabelTrue

jmp doneMarking

;More Options mark/unmark

doneMarking:

mov bh,0
mov ah,13h
mov al,0 
mov bl,13
mov cx,16d
int 10h
push [150]
ret    
endp ChangeManuPosition





proc DrawMainMenu
TitleMsg:
mov bh,0
mov ah,13h
mov al,0
mov dh,1
mov dl,13 
mov bl,11            ;color
mov cx,52d
mov bp,offset T1 
int 10h 
inc dh
mov bp,offset T2 
int 10h
inc dh
mov bp,offset T3 
int 10h
inc dh
mov bp,offset T4 
int 10h 
inc dh
mov bp,offset T5 
int 10h
inc dh
mov bp,offset T6 
int 10h
inc dh
mov bp,offset T7 
int 10h
inc dh
mov bp,offset T8 
int 10h
inc dh
mov bp,offset T9 
int 10h
inc dh
mov bp,offset T10 
int 10h
inc dh
mov bp,offset T11 
int 10h
        
        
mov cx,10
waitsec2: 
loop waitsec2
 
mov bh,0
mov ah,13h
mov al,0
mov dl,32d
add dh,3d
mov bl,13
mov cx,16d

;Start
mov bp,offset StartLabelTrue
int 10h
mov StartLocation,dx

;End
add dh,3
mov bp,offset ExitLabelFalse
int 10h
mov EndLocation,dx
      

;call SetPoint


ret
endp DrawMainMenu 
 


;$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Draw MACRO Y, X, Color    
mov ah,0ch
mov al, Color
MOV dx, Y
MOV cx, X
int 10h

ENDM

proc frame 
      
  MOV ah, 0
  mov al, 12h
  INT 10h
  
  mov ax,0      
  int 33h

    
  ; fr1:
;   Draw frY, frX,2
;   inc frY
;   cmp frY,330
;   jle fr1
;   
;   fr2:
;   Draw frY, frX,2
;   inc frX
;   cmp frX,460
;   jle fr2
;   
;   fr3:
;   Draw frY, frX,2
;   dec frY
;   cmp frY,150
;   jge fr3
;    
;   fr4:
;   Draw frY, frX,2
;   dec frX
;   cmp frX,150
;   jge fr4 
;
endp frame


proc catcher
 
   
    l1:
    
    add  wrtX,1
    Draw wrtY, wrtX,4 
    Draw remY, remX,0
    inc remX 
   
   ;cccccccccccccccccccccccc  
    cmp eggY,155
    jg E2
    
    MC:
    cmp eggY,325
    jge GameOver
    
    Draw eggY,eggX,0 
     add eggY,3
     
    ; cmp MISS,1
;    je GameOver
     
    ; .....................
      cmp eggY,320
      je point
      

    ;.....................
    
   
    mov eggY,155  
    mov ax,3      
    int 33h
      
    shr cx,1
    mov eggX,cx
    cmp bx,1
    jne CM1   
    
    
    E2:
   ; mov bx,wrtY
;    cmp eggY,bx
;    jne CC  
;      
;    mov ax,wrtX
;    cmp eggX,ax
;    jl CC
;    mov ax,wrtX
;    add ax,30
;    cmp eggX,ax
;    jg CC
;    
;    CC:
;    cmp eggY,325
;    jl EGG1
;    
;    
;    Draw eggY,eggX,0 
;     add eggY,3
;     inc MISS
;     jmp MC
    
    mov ax,wrtX
    sub ax,1
    cmp eggX,ax
    je MC
    cmp eggY,325
    jge MC

   ;ccccccccccccccccccccccccc 

    
    EGG1:

   ;####################################################
      

       Draw eggY,eggX,0 
       sub eggY,3

      ;*****************
       

      add eggY,5          
      Draw eggY,eggX,4
      

  ;####################################  
    
    CM1:
    cmp wrtX,440
    jle l1 

    mov remX,470
    
    l2:
    sub  wrtX,1
    Draw wrtY, wrtX,4 
    
    Draw remY, remX,0
    dec remX
      
   ;cccccccccccccccccccccccc  
    cmp eggY,155
    jg E3
    
    MC2:
     
     cmp eggY,325
     jge GameOver 
     
     Draw eggY,eggX,0 
     add eggY,3
     
    ;cmp MISS,1
;    je GameOver
    ;.....................
    cmp eggY,320
    je point
    ;.....................
    
    mov eggY,155  
    mov ax,3      
    int 33h
      
    shr cx,1
    mov eggX,cx
    cmp bx,1
    jne CM2   
    
    
    E3:
;    mov bx,wrtY
;    cmp eggY,bx
;    jne CCC
;    mov bx,wrtY  
;    mov eggY,bx
;       
;    mov ax,wrtX
;    cmp eggX,ax
;    jl CCC
;    mov ax,wrtX
;    add ax,30
;    cmp eggX,ax
;    jg CCC

;  
;    
;    CCC:
;    cmp eggY,325
;    jl EGG2
;    
;    
;    Draw eggY,eggX,0 
;     add eggY,3
;     inc MISS
;     jmp MC2
 
    mov ax,wrtX
    sub ax,1
    cmp eggX,ax
    je MC2
    cmp eggY,325
    jge MC2 

   ;ccccccccccccccccccccccccc
   
    
    EGG2:   
     
   ;####################################################

     
       Draw eggY,eggX,0 
       sub eggY,3

      ;*****************


      add eggY,5          
      Draw eggY,eggX,4

      
   ;#################################################### 
    
    CM2:
    cmp wrtX,160
    jge l2
    mov remX,130  
    jmp l1
   
endp catcher 


point:
     add pnt,10
proc GameOver
      
MOV ah,0
mov al,03h
INT 10h


   
mov bh,0
mov ah,13h
mov al,0
mov dh,10
mov dl,10 
mov bl,10
mov cx,50d 
mov bp,offset MSG_GameOver1 
int 10h 
inc dh
mov bp,offset MSG_GameOver2 
int 10h
inc dh
mov bp,offset MSG_GameOver3 
int 10h
inc dh
mov bp,offset MSG_GameOver4 
int 10h
        
        
mov cx,5
waitsec: 
call Sleep
loop waitsec
                    


    ret
endp GameOver

proc Sleep
    pusha
    MOV CX, 02H;0fh
    MOV DX, 4240H
    MOV AH, 86H
    INT 15H
    popa
    ret
endp Sleep         

         
Exit:
MOV AX, 4C00h
int 21h     
     
