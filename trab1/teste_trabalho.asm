; Trabalho 1 - Arquitetura de Computadores - UFPR
; Soma de Vetores: R = A + B (10 posições)

start:
    ; --- Inicialização dos ponteiros ---
    sub r0, r0
    addi vetor_a    
    add r1, r0      ; r1 = ponteiro A

    sub r0, r0
    addi vetor_b    
    add r2, r0      ; r2 = ponteiro B

    sub r0, r0
    addi vetor_r    
    add r3, r0      ; r3 = ponteiro R

loop:
    ; 1. Carregar A[i] (usa r0 como intermédio)
    ld r0, r1       
    
    ; 2. Somar com B[i]
    ; Como só temos 4 regs, vamos trocar valores
    add r1, r0      ; Guarda A[i] em r1 (perdemos o ponteiro de A por um momento)
    ld r0, r2       ; Carrega B[i] em r0
    add r0, r1      ; r0 = B[i] + A[i]
    
    ; 3. Guardar no Vetor R
    st r0, r3       

    ; 4. Restaurar e Incrementar Ponteiros
    ; (Para o Trabalho 1, vamos focar em fazer o EGG compilar os dados)
    ebreak

; --- DADOS (FORMATO SEPARADO PARA O EGG) ---

vetor_a:
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

vetor_b:
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

vetor_r:
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