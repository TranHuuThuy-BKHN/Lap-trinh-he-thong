.model small

.stack 100h

.data
    number dw 324,48, 989, 30 dup(1234)
    len = ($ - number)/2
    
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        ;so phan tu can hien thi cua mang
        mov cx, len
        ;gan si bang zero
        xor si, si
                              
    Lap: ;chuyen gia tri vao thanh ghi ax
        mov ax, number[si] 
        add si, 2
           
        ;day so vong lap vao stack       
        push cx
        xor cx, cx
        xor bx, bx
         
         comp: 
            mov bh,10     
            div bh 
            
            mov bl, al
            xor al, al
            
            ;so du o AH, day no vao stack
            push ax   
            inc cx
            
            ;xoa trang AH
            xor ah, ah
            mov al, bl
         
            ;thiet lap co de jump, neu la zero thi ko jump
            xor bx, bx
            or bx, ax
               
            jne comp  
        
         
         write:
             pop dx  
             rol dx, 8
             
             or dx, 30h
             mov ah, 02h
             int 21h 
             
             loop write   
       
         pop cx
      
         ;xuong dong hien thi so tiep theo cua mang
         mov dx, 10
         mov ah, 02h
         int 21h
         
         mov dx, 13
         mov ah, 02h
         int 21h
     
           
     loop Lap
        
        .exit
        
           
    main endp
    end main