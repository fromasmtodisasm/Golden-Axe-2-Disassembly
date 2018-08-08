VectorTable:	
					dc.l $FF0766            ; Initial stack pointer value
					dc.l $072B80  	        ; Start of program (dc.l $072B80)
					dc.l $FFFFFFFF          ; Bus error
					dc.l $FFFFFFFF          ; Address error
					dc.l $FFFFFFFF          ; Illegal instruction
					dc.l $FFFFFFFF          ; Division by zero
					dc.l $FFFFFFFF          ; CHK exception
					dc.l $FFFFFFFF          ; TRAPV exception
					dc.l $FFFFFFFF          ; Privilege violation
					dc.l $FFFFFFFF          ; TRACE exception
					dc.l $FFFFFFFF          ; Line-A emulator
					dc.l $FFFFFFFF          ; Line-F emulator
					dc.l $FFFFFFFF          ; Unused (reserved) 1
					dc.l $FFFFFFFF          ; Unused (reserved) 2
					dc.l $FFFFFFFF          ; Unused (reserved) 3
					dc.l $FFFFFFFF          ; Unused (reserved) 4
					dc.l $600001BE          ; Unused (reserved) 5
Reserved_6: 		dc.l $45F900FF          ; CODE XREF: ROM:0000A200↓j ; Unused (reserved) 6
					dc.l $27343239          ; Unused (reserved) 7
					dc.l $FF2DB8            ; Unused (reserved) 8
					dc.l $670CE741          ; Unused (reserved) 9
					dc.l $5D41D4C1          ; Unused (reserved) 10
					dc.l $252FF00           ; Unused (reserved) 11
					dc.l $4E75429A          ; Unused (reserved) 12
					dc.l $429A4E75          ; Spurious exception
					dc.l $0000DD5E          ; IRQ level 1
					dc.l $0000DD5E          ; IRQ level 2
					dc.l $0000DD5E          ; IRQ level 3
					dc.l $0000DD5E          ; IRQ level 4 (horizontal retrace interrupt)
					dc.l $0000DD5E          ; IRQ level 5		 
					dc.l $0000DD60          ; IRQ level 6 (vertical retrace interrupt)
					dc.l $0000DD60          ; IRQ level 7
TRAP_00:            dc.l $48E70600          ; CODE XREF: sub_AB34+A↓j ; sub_EC38+32↓p ; TRAP #00 exception
					dc.l $3C0E3A06          ; TRAP #01 exception
					dc.l $2463FFF           ; TRAP #02 exception
					dc.l $464000            ; TRAP #03 exception
					dc.l $33C600C0          ; TRAP #04 exception	
					dc.l $0004E55D          ; TRAP #05 exception
					dc.l $2450003           ; TRAP #06 exception
					dc.l $33C500C0          ; TRAP #07 exception
TRAP_07:            dc.l $00044CDF          ; DATA XREF: ROM:off_746BA↓o; TRAP #08 exception
					dc.l $604E75            ; TRAP #09 exception
TRAP_10:            dc.l $427900FF          ; CODE XREF: sub_E6FE+16↓p ; TRAP #10 exception
					dc.l $2DB808B9          ; TRAP #11 exception
					dc.l $000000FF          ; TRAP #12 exception
					dc.l $76A608C           ; TRAP #13 exception
TRAP_14:            dc.l $49F900FF          ; CODE XREF: ROM:00000254↓p ; TRAP #14 exception
					dc.l $66E041F9          ; TRAP #15 exception
					dc.l $000548CE          ; Unused (reserved) 1
					dc.l $612849F9          ; Unused (reserved) 2
					dc.l $FF4620            ; Unused (reserved) 3
					dc.l $41F90004          ; Unused (reserved) 4
					dc.l $662A611A          ; Unused (reserved) 5
					dc.l $49F900FF          ; Unused (reserved) 6
					dc.l $6BE041F9          ; Unused (reserved) 7
					dc.l $00042DE6          ; Unused (reserved) 8
					dc.l $610C49F9          ; Unused (reserved) 9
					dc.l $FFFC80            ; Unused (reserved) 10
					dc.l $41F90005          ; Unused (reserved) 11
					dc.l $65A84EF9          ; Unused (reserved) 12
UnusedReserved13:   dc.l $00072D22          ; Unused (reserved) 13
					dc.l $FFFFFFFF          ; Unused (reserved) 14
					dc.l $FFFFFFFF          ; Unused (reserved) 15
DTRAP_12:           dc.l $FFFFFFFF          ; DATA XREF: ROM:000000B0↑o ; Unused (reserved) 16
				
Header:             dc.b "SEGA MEGA DRIVE " ; Console name
					dc.b "(C)SEGA 1991.OCT" ; Copyrght holder and release date
					dc.b "GOLDEN AXE 2"     ; Domestic name
					dc.b "                                    "
					dc.b "GOLDEN AXE 2"		; International name
					dc.b "                                    "
					dc.b "GM 00001122-00"	; Version number
					dc.w $4C69				; Checksum		
					dc.w $4A20				; J - JoyPad I/O Support
					dc.b "              "  
					dc.l 0					; Start address of ROM
					dc.l __end				; End address of ROM		
					dc.l $FF0000			; Start address of RAM
					dc.l $FFFFFF			; End address of RAM		
					dc.l $20202020          ; SRAM enabled
					dc.l $20202020          ; Unused
					dc.l $20202020          ; Start address of SRAM
					dc.l $20202020          ; End address of SRAM
					dc.l $20202020          ; Unused
					dc.l $20202020          ; Unused
					dc.b "                                        " ; Notes (unused)
					dc.b "JUE             "                         ; Country codes
EndOfHeader:
					
	__start:
	; ---------------------------------------------------------------------------
					move.l  #$1000100,d6
					cmpi.l  #$12345678,($FF0400).l
					bne.s   loc_218
					move.l  ($FF078A).l,d6

	loc_218:                                ; CODE XREF: ROM:00000210↑j
					movea.l #$FF0408,a0
					move.w  #$1EFD,d0

__end    ; Very last line, end of ROM address