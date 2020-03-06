.model small
;.386
.stack 100h

.data
    meg db 'Enter lower characters :$'
    meg2 db 10, 13, 'Upper :$'
    
    upper_string db 20 dup('$')
.code
    main proc 
        mov ax, @data
        mov ds, ax
        
        ;hien thi thong bao nhap chuoi ki tu
        mov dx, offset meg
        mov ah, 09h
        int 21h
        
        xor si, si
        ;nhap chuoi ki tu thuong cho den khi nhao vao enter
        lap:   
            mov ah, 0h
            int 16h
            
            cmp al, 13
            jz next
            
            cmp al, 32
            jz store
            
            cmp al, 97
            jb lap
            
            cmp al, 123
            ja lap
            
            xor al, 20h; chuyen thanh chu hoa    
                      
         store:             
            xor dx, dx
            mov dl, al
            
            mov upper_string[si], al
            
            cmp al, 32
            jz print
            or dl, 20h       
        print:   
            inc si
            mov ah, 02h
            int 21h
            
            jmp lap
                    
         next:
            mov dx, offset meg2
            mov ah, 09h
            int 21h 
            
            mov dx, offset upper_string
            mov ah, 09h
            int 21h      
        .exit
        
    main endp
    
    end main