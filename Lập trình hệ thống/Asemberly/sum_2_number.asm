.model small
;.386

.stack 100h

.data
    meg1 db 'Enter number 1 :$'
    meg2 db 10, 13,'Enter number 2 :$'
    meg3 db 10, 13,'Sum :$'
    number1 dw ?  
    number2 dw ? 
 
.code
    main proc
        
        mov ax, @data
        mov ds, ax
        
        mov dx, offset meg1; thong bao nhap so thu nhat, ket qua luu AX
        mov ah, 09h
        int 21h 
        
        push 0
    scanf1:
        mov ah, 0h
        int 16h
        
        cmp al, 13
        jz next1    ;enter thi ket thuc  
        
        ;kiem tra la so hay khong
        cmp al, 30h
        jb scanf1
        cmp al, 39h
        ja scanf1
                  
        xor dx, dx
        mov dl, al
        xor dx, 30h
            
        ;nhan 10 tung so trong stack
        pop ax
        mov bh, 10
        mul bh
        ; cong voi gia tri vua nhap
        
        add ax, dx
        push ax ; day vao stack
        
        ;hien thi so vua nhap ra man hinh
        or dx, 30h
        mov ah, 02h
        int 21h
        
        jmp scanf1
        
     next1: 
        pop number1 ; lay so thu nhat ra khoi stack
        
        mov dx, offset meg2; thong bao nhap so thu hai, ket qua luu AX
        mov ah, 09h
        int 21h         
        
        
        push 0
     scanf2:
        mov ah, 0h
        int 16h
        
        cmp al, 13
        jz next2    ;enter thi ket thuc  
        
        ;kiem tra la so hay khong
        cmp al, 30h
        jb scanf2
        cmp al, 39h
        ja scanf2
                  
        xor dx, dx
        mov dl, al   
        xor dx, 30h
              
        ;nhan 10 tung so trong stack
        pop ax
        mov bh, 10
        mul bh
        ; cong voi gia tri vua nhap
        
        add ax, dx
        push ax ; day vao stack
        
        ;hien thi so vua nhap ra man hinh
        or dx, 30h
        mov ah, 02h
        int 21h
        
        jmp scanf2  
     next2:  
        pop number2 ; lay so thu hai ra khoi stack  
           
        ;hien thi thong bao in ket qua    
        mov dx, offset meg3
        mov ah, 09h
        int 21h
        
        mov ax, number1
        add ax, number2
        
        xor cx, cx 
     push_printf:       
        mov bh, 10
        div bh
                
        xor bx, bx
        mov bl, ah
        ;day chu so thu duoc vao stack
        push bx
        ; ax = al
        xor ah, ah
        inc cx
        
        or ax, ax
        jnz push_printf 
          
     printf:
        pop dx
        or dx, 30h
        mov ah, 02h
        int 21h
        loop printf      
        .exit
      
        
    main endp
    end main