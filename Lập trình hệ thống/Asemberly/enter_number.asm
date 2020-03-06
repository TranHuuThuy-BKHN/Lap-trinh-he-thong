.model small
;.386

.stack 100h

.data
    meg db 'Enter your number = $'
    meg_print db 10, 13, 'Number :$'


.code

    main proc
        
        mov ax, @data
        mov ds, ax
        
        ;hien thi thong bao nhap so
        mov dx, offset meg
        mov ah, 09h
        int 21h
        
        xor cx, cx
        push 0
        ;nhap gia tri so cho toi khi nhan enter
    input: 
        mov ah, 0h
        int 16h
        
        cmp al, 13
        jz next        
        
        cmp al, 30h
        JB input
        
        cmp al, 39h
        JA input  
        
        xor dx, dx
        mov dl, al
        mov ah, 02h
        int 21h
        
        xor dx, 30h
        
        pop ax
        mov bh, 10
        mul bh
        add ax, dx
        push ax
        
        inc cx 
        jmp input
        
        
    next:pop ax
               
               
        ;day cac chu so vao stack
        xor si, si  
    push_stack:              
        mov bh, 10 
        div bh
        
        xor bx, bx 
        mov bl, ah
        and ax, 00FFh
        
        push bx
        inc si    
        loop push_stack
         
        ;lay lai so chua so
        mov cx, si
        
        mov dx, offset meg_print
        mov ah, 09h
        int 21h
        
     print:
        pop dx
        xor dx, 30h
        
        mov ah, 02h
        int 21h
        loop print
        
        
        pop ax
            
        .exit
        
    main endp
    
    end main