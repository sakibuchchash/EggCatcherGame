org 100h
.model small
Draw MACRO Y, X, Color    
mov ah,0ch
mov al, Color
MOV dx, Y
MOV cx, X

int 10h
ENDM 
.data
                                      
                                        ;Will be used for Bar Previous Top Location [- Future Level planning -]
eggX dw 0                                      ;Will be used for Bar Previous Left Location
eggY dw 50

remX dw 300
remY dw 180

frX dw 10
frY dw 10
                                      ;This var will hold the Bar Y-axis
wrtX dw 300
wrtY dw 180 
 
pnt dw 0 
 
.code

       
  MOV ah, 0
  mov al, 13h
  INT 10h
  
  mov ax,0      
  int 33h
proc frame
    
   fr1:
   Draw frY, frX,2
   inc frY
   cmp fry,190
   jle fr1
   
   fr2:
   Draw frY, frX,2
   inc frX
   cmp frX,310
   jle fr2
   
   fr3:
   Draw frY, frX,2
   dec frY
   cmp frY,10
   jge fr3
    
   fr4:
   Draw frY, frX,2
   dec frX
   cmp frX,10
   jge fr4 

endp frame


proc catcher
 
   
    l1:
    
    add  wrtX,2
    Draw wrtY, wrtX,4 
    Draw remY, remX,0
    inc remX 
   
   ;cccccccccccccccccccccccc  
    cmp eggY,50
    jg E2
    
    MC:
     
     ;.....................
      cmp eggY,180
      je point
     
     
       dec eggY
       add eggY,1
      
      Draw eggY,eggX,0
      add eggX,2
      Draw eggY,eggX,0
      add eggX,2
      
      
      Draw eggY,eggX,0
      add eggY,2
      Draw eggY,eggX,0
      add eggY,2
      
    
      Draw eggY,eggX,0
      sub eggY,2
      Draw eggY,eggX,0
      sub eggY,2
      
      
      Draw eggY,eggX,0
      sub eggX,2
      Draw eggY,eggX,0
      sub eggX,2
      
      
    ;.....................
    
    mov eggY,50  
    mov ax,3      
    int 33h
      
    shr cx,1
    mov eggX,cx
    cmp bx,1
    jne CM1   
    
    E2:
    mov ax,wrtX
    sub ax,1
    cmp eggX,ax
    je MC
    cmp eggY,200
    jge MC
   
   ;ccccccccccccccccccccccccc
    EGG1:
     
   
    ;####################################################
       dec eggY
       add eggY,1
      
      Draw eggY,eggX,0
      add eggX,2
      Draw eggY,eggX,0
      add eggX,2
      
      
      Draw eggY,eggX,0
      add eggY,2
      Draw eggY,eggX,0
      add eggY,2
      
    
      Draw eggY,eggX,0
      sub eggY,2
      Draw eggY,eggX,0
      sub eggY,2
      
      
      Draw eggY,eggX,0
      sub eggX,2
      Draw eggY,eggX,0
      sub eggX,2
      
      
      ;*****************
      
      ;--------------
      add  wrtX,1 
      inc remX
      ;--------------
       
      add eggY,2
                
                
      Draw eggY,eggX,4
      add eggY,2
      Draw eggY,eggX,4
      add eggY,2
                
                
      Draw eggY,eggX,4
      add eggX,2 
      Draw eggY,eggX,4
      add eggX,2 
       
                
                
      Draw eggY,eggX,4
      sub eggY,2
      Draw eggY,eggX,4 
      sub eggY,2 
                
                
      Draw eggY,eggX,4
      sub eggX,2
      Draw eggY,eggX,4
      sub eggX,2
    
      ;--------------
      add  wrtX,1 
      inc remX
      ;-------------- 
      
     
    ;####################################  
    
    CM1:
    cmp wrtX,300
    jle l1 
    
    mov remX,330
    
    l2:
    sub  wrtX,1
    Draw wrtY, wrtX,4 
    
    Draw remY, remX,0
    dec remX
      
   ;cccccccccccccccccccccccc  
    cmp eggY,50
    jg E3
    
    MC2:
    
    ;.....................
    cmp eggY,180
    je point
    
       dec eggY
       add eggY,1
      
      Draw eggY,eggX,0
      add eggX,2
      Draw eggY,eggX,0
      add eggX,2
      
      
      Draw eggY,eggX,0
      add eggY,2
      Draw eggY,eggX,0
      add eggY,2
      
    
      Draw eggY,eggX,0
      sub eggY,2
      Draw eggY,eggX,0
      sub eggY,2
      
      
      Draw eggY,eggX,0
      sub eggX,2
      Draw eggY,eggX,0
      sub eggX,2
     
    ;.....................
    
    
    mov eggY,50  
    mov ax,3      
    int 33h
      
    shr cx,1
    mov eggX,cx
    cmp bx,1
    jne CM2   
    
    E3:
    mov ax,wrtX
    sub ax,1
    cmp eggX,ax
    je MC2
    cmp eggY,200
    jge MC2 
   
   ;ccccccccccccccccccccccccc

    EGG2:   
     ;####################################################
       dec eggY
       add eggY,1
      
      Draw eggY,eggX,0
      add eggX,2
      Draw eggY,eggX,0
      add eggX,2
      
      
      Draw eggY,eggX,0
      add eggY,2
      Draw eggY,eggX,0
      add eggY,2
      
    
      Draw eggY,eggX,0
      sub eggY,2
      Draw eggY,eggX,0
      sub eggY,2
      
      
      Draw eggY,eggX,0
      sub eggX,2
      Draw eggY,eggX,0
      sub eggX,2
      
      
      ;*****************
      
     ;-------------
       sub  wrtX,1
       dec remX
     ;-------------
       
      add eggY,2
                
                
      Draw eggY,eggX,4
      add eggY,2
      Draw eggY,eggX,4
      add eggY,2
                
                
      Draw eggY,eggX,4
      add eggX,2 
      Draw eggY,eggX,4
      add eggX,2 
       
                
                
      Draw eggY,eggX,4
      sub eggY,2
      Draw eggY,eggX,4 
      sub eggY,2 
                
                
      Draw eggY,eggX,4
      sub eggX,2
      Draw eggY,eggX,4
      sub eggX,2
    
      ;-------------
       sub  wrtX,1
       dec remX
      ;-------------
    ;#################################### 
    
    CM2:
    cmp wrtX,40
    jge l2
    mov remX,10  
    jmp l1
   
endp catcher 


point:
     add pnt,10
     ;jmp catcher
     
     cmp pnt,10
     je pri
     jmp catcher
     pri:
     mov ah,0
     mov al,04h
     int 10h
     mov ah,0bh
     mov bh,00h
     mov bl,3
     int 10h
     mov ah,02
     mov bh,0
     mov dh,200
     mov dl,50
     int 10h
     mov ah,9
     
     
     

