.include "./m328Pdef.inc"

;Pila
ldi r16, LOW(RAMEND)      
out SPL, r16              
ldi r16, HIGH(RAMEND)
out SPH, r16              

;Timer
ldi r16, (1<<WGM12)       
sts TCCR1B, r16           

;Puertos del selector
ldi r16, 0x00             
sts DDRD, r16
ldi r16, 0xFF             
sts PORTD, r16

;Frecuencias
ldi r17, 100              
ldi r18, 50               

;Registros de comparacion
ldi r20, HIGH(159)        
ldi r21, LOW(159)         
sts OCR1AH, r20
sts OCR1AL, r21


loop:
    
    sbis PIND, PD2         
    rjmp frequency_increase 
    rjmp loop

frequency_increase:
    
    add r17, r18            
    ldi r22, 0             
    ldi r23, 0
    sts OCR1AH, r23
    sts OCR1AL, r22  
    sbi PORTD, PD2          
    rjmp loop          

