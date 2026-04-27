;Aluna : Leticia de Oliveira Santos
;GRR: 20244503
main:	
    sub r3, r3		
    sub r0, r0
	addi 7
	addi 1
	sub r1, r1
    brzr r1, r0
break: 		;coloquei o fim no inicio para facilitar o calculo do PC
	ebreak	
loop_soma:	
	sub r0, r0
	addi 7
	addi 3			; r0 =  (10 = tamanho do vetor)
	sub r1, r1	
	add r1, r0		; r1 = 10
	sub r1, r3		; r1 = 10 - i
	sub r0, r0
	addi 6
	brzr r1, r0		; se r1 == 0, vai para o break
	sub r0, r0
	addi 7
	addi 7
	addi 7
	addi 7
	addi 7
	addi 4			; r0 = endereço base de A
	add r0, r3      ; r0 = endereço de A + i
	ld r1, r0		; r1 = A[i]
	addi 7
	addi 3          ; r0 = endereço base de B
	ld r2, r0		; r2 = B[i]
	addi 7
	addi 3          ; r0 = endereço base de R
	add r1, r2		; r1 = A[i] + B[i]
	st r1, r0       ; R[i] = r1 = A[i] + B[i]
	sub r0, r0
	addi 1
	add r3, r0		;incrementa o iterador (i+1)
	sub r0, r0
	addi 3
	addi 4    		;r0 = endereço do loop_soma em cima
	sub r1, r1
	brzr r1, r0		;salto incondicional

;vetor A {0, 2, 4, 6, 8, 10, 12, 14, 16, 18}
.bits8 0x00 
.bits8 0x02
.bits8 0x04
.bits8 0x06
.bits8 0x08
.bits8 0x0A
.bits8 0x0C
.bits8 0x0E
.bits8 0x10
.bits8 0x12

;vetor B {1, 3, 5 , 7, 9, 11, 13, 15, 17, 19}
.bits8 0x01
.bits8 0x03
.bits8 0x05
.bits8 0x07
.bits8 0x09
.bits8 0x0B
.bits8 0x0D
.bits8 0x0F
.bits8 0x11
.bits8 0x13

;vetor R {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
.bits8 0x00  
.bits8 0x00
.bits8 0x00
.bits8 0x00
.bits8 0x00
.bits8 0x00
.bits8 0x00
.bits8 0x00
.bits8 0x00
.bits8 0x00