.model small 
;.386

.stack 100h
.data
    array dw 1,4,5,6,8, 100
    len = ($ - array)/2  

.code 
    main proc
    mov ax, @data
    mov ds, ax
    
    
    xor si, si
    xor ax, ax
    mov cx, len
    
    ;tinh tong cua mang, tong luu trong ax
    lap:
        add ax,array[si]
        add si,2
        loop lap 
    
    xor cx, cx
    ;day ket qua vao stack
    comp:
        xor bx, bx
        mov bh, 10
        div bh
        
        xor dx, dx
        mov dl, ah
        push dx
        
        xor ah, ah
        
        inc cx
        
        cmp ax, 0
        JA comp
     
     ;in ket qua ra man hinh
     print:
        xor dx, dx
        pop dx
        or dx, 30h
        
        mov ah, 02h
        int 21h
        
        loop print       
        
    .exit
    main endp
    end main