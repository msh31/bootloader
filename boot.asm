bits 16             ; tells NASM to generate 16bit code (cpu is in real mode for backwards compatibility reasons) 
org 0x7C00          ; set the origin address, this is the address the bios loads the bootloader from and is standard

start:              
    mov ah, 0x0E    ; BIOS teletype function (needd to understand this better, but its somethin to do with mimicking an old teletype (old typewrite like device))
    mov al, 'A'     ; character to print
    int 0x10        ; call the BIOS
    
    jmp $           ; create an infinite loop by jumping to the current address (this one)

times 510-($-$$) db 0 ; fill to byte 510 with zeros (need to understand this better)
dw 0xAA55           ; the boot signature (at bytes 510 & 511)
