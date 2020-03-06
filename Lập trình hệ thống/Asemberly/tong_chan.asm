.model small
;.386

.stack 100h

.data
    array dw 10, 13, 5, 9   
    len_array = ($-array)/2 
    
.code
    main proc
    
    mov ax, @data
    mov ds, ax
    
    ;ket qua tong cac phan tu chan se duoc luu trong AX
    xor ax, ax
    xor si, si
    mov cx, len_array
    mov bx, cx
    shl bx, 1 ; nhan 2 lan bx
                   
    lap: 
        cmp si, bx
        jae next ; si >= bx thi ket thuc lap
        ; kiem tra phan tu array[si] la chan hay le
        mov dx, array[si]
        test dx, 1
        jnz incre 
        add ax, dx     
        incre: 
            add si, 2
        loop lap
        
        ;day ket qua vao stack
        push ax
    
    next:
        mov bh, 10
        div bh 
        inc cx
        
        xor dx, dx
        mov dl, ah
        push dx
        
        xor ah, ah
        or ax, ax
        jnz next
        
    print:
        pop dx
        or dx, 30h
        
        mov ah, 02h
        int 21h
        loop print
    .exit  
                   
    main endp
    end main
    
 