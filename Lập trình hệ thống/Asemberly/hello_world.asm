.model small

.stack 100h

.data 
     meg db 10, 13,'hello world$' 
     
.code 
    main proc
        mov ax, @data
        mov ds, ax
        
        mov dx, offset meg
        mov ah, 09h
        int 21h
        .exit
    main endp
    end main