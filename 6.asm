start:
    sub r1, r1      ; i = 0

loop:
    ; carrega A[i]
    sub r0, r0
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 5          ; r0 = 40 (&A[0])
    add r0, r1      ; r0 = &A[i]
    sub r2, r2
    add r2, r0      ; r2 = &A[i]
    ld r2, r2       ; r2 = A[i]

    ; carrega B[i]
    sub r3,r3
    sub r0, r0
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 1          ; r0 = 50 (endereço do inicío do vetor b)
    add r0, r1      
    add r3, r0      
    ld r3, r3       ; r3 = B[i]

    add r2, r3      ; r2 = A[i] + B[i]

    ; guarda r[i]
    sub r3, r3 
    sub r0, r0
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 4          ; r0 = 60 (inicio do vetor r)
    add r0, r1     ; r0 = &R[i]
    add r3, r0      
    st r2, r3       ; guarda o resultado em &R[i]

    ; incrementa i
    sub r0, r0
    addi 1
    add r1, r0      

    ; calcula a condição de parada
    sub r0, r0
    addi 7
    addi 3          ; r0 = 10
    sub r0, r1      ; r0 = 10 - i
    add r3, r0      ; r3 = condição
    
    sub r2, r2
    sub r0, r0
    addi 7
    addi 7
    addi 7
    addi 7
    addi 7
    addi 3          ; r0 = 38 (Endereço do ebreak lá embaixo)
    add r2, r0           
    brzr r3, r2     ; Se i=10 (r3 == 0), pula para o fim

    ; volta para o inicio do loop
    sub r2, r2     
    sub r0, r0      
    addi 1          ; r0 vira 1
    
    add r2, r0      ; r2 = 1
    
    sub r0, r0      
    brzr r0, r1    ; condição sempre é verdadeira

fim:
    ebreak

; Endereço 40 (vetor_a)
.bits8 0
.bits8 2
.bits8 4
.bits8 6
.bits8 8
.bits8 10
.bits8 12
.bits8 14
.bits8 16
.bits8 18

; Endereço 50 (vetor_b)
.bits8 1
.bits8 3
.bits8 5
.bits8 7
.bits8 9
.bits8 11
.bits8 13
.bits8 15
.bits8 17
.bits8 19

; Endereço 60 (vetor_r)
.bits8 0
.bits8 0
.bits8 0
.bits8 0
.bits8 0
.bits8 0
.bits8 0
.bits8 0
.bits8 0
.bits8 0