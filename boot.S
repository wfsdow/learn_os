;主引导程序
;-------------------------------------
SECTION MBR vstart=0x7c00
	mov ax, cs
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov fs, ax
	mov sp, 0x7c00
	
;清屏利用0x60功能号，上卷全部行，则可清屏
	mov ax, 0x600
	mov bx, 0x700
	mov cx, 0
	mov dx, 0x184f
	
	int 10

;下面3行代码获取光标位置
	mov ah, 3
	mov bh, 0
	
	int 0x10 
	
;打印字符串
	mov ax, message
	mov bp, ax
	
	mov cx, 5
	mov ax, 0x1301
	mov bx, 0x2
	int 0x10
;程序在此悬停
	jmp $
	
	message db "1 MBR"
	times 510-($-$$) db 0
	db 0x55, 0xaa
	
	