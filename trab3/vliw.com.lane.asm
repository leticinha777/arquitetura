inicializacao
0:  [ movh 0         | nop               | sub R3, R3   | sub R2, R2   ] // R0_h=0. R3=0 (índice i). R2=0.
1:  [ movl 3         | nop               | sub R1, R1   | nop          ] // R0_l=3 (R0=3). Zera R1.
2:  [ nop            | nop               | add R2, R0   | nop          ] // R2 = 3 (Início do laço)
loop
3:  [ st R3, R3      | nop               | nop          | nop          ] // M[R3] = R3 (Grava A[i])

// --- 2. Inicializa B[i] = i + 20 --- (20 dec = 0x14 Hex)
4:  [ movh 1         | nop               | nop          | nop          ] // High(R0)=1
5:  [ movl 4         | nop               | add R1, R3   | nop          ] // Low(R0)=4 (R0=20). R1=i
6:  [ nop            | nop               | add R1, R0   | nop          ] // R1 = i + 20 (Valor de B)
7:  [ movh 0         | nop               | nop          | nop          ] // High(R0)=0
8:  [ movl 12        | nop               | nop          | nop          ] // Low(R0)=12 (R0=12)
9:  [ nop            | nop               | add R0, R3   | nop          ] // R0 = 12 + i (Endereço de B)
10: [ st R1, R0      | nop               | nop          | nop          ] // M[i+12] = R1 (Grava B[i])

// --- 3. Inicializa R[i] = 0 --- (24 dec = 0x18 Hex)
11: [ movh 1         | nop               | sub R1, R1   | nop          ] // High(R0)=1. Zera R1.
12: [ movl 8         | nop               | nop          | nop          ] // Low(R0)=8 (R0=24)
13: [ nop            | nop               | add R0, R3   | nop          ] // R0 = 24 + i (Endereço de R)
14: [ st R1, R0      | nop               | nop          | nop          ] // M[i+24] = 0 (Zera R[i])

// --- 4. Soma R[i] = A[i] + B[i] ---
15: [ ld R1, R3      | nop               | nop          | nop          ] // R1 = M[i] (Lê A[i] da memória)
16: [ movh 0         | nop               | nop          | nop          ] // High(R0)=0
17: [ movl 12        | nop               | nop          | nop          ] // Low(R0)=12
18: [ nop            | nop               | add R0, R3   | nop          ] // R0 = 12 + i
19: [ ld R0, R0      | nop               | nop          | nop          ] // R0 = M[i+12] (Lê B[i] da memória)
20: [ nop            | nop               | add R1, R0   | nop          ] // R1 = A[i] + B[i] (Faz a soma)
21: [ movh 1         | nop               | nop          | nop          ] // High(R0)=1
22: [ movl 8         | nop               | nop          | nop          ] // Low(R0)=8 (R0=24)
23: [ nop            | nop               | add R0, R3   | nop          ] // R0 = 24 + i (Endereço de R)
24: [ st R1, R0      | nop               | nop          | nop          ] // M[i+24] = R1 (Salva soma final)

// --- 5. Controle e Incremento do Laço ---
25: [ movh 0         | nop               | nop          | nop          ] // High(R0)=0
26: [ movl 1         | nop               | nop          | nop          ] // Low(R0)=1
27: [ nop            | nop               | add R3, R0   | nop          ] // R3 = i + 1 (Incrementa índice)
28: [ movh 0         | nop               | nop          | nop          ] // High(R0)=0
29: [ movl 12        | nop               | nop          | nop          ] // Low(R0)=12
30: [ nop            | nop               | sub R0, R3   | nop          ] // R0 = 12 - (i+1). 
31: [ nop            | brzi 2            | nop          | nop          ] // Se R0==0 (atingiu 12), PC=PC+2
32: [ nop            | jr R2             | nop          | nop          ] // Salta de volta para PC=3

// --- 6. FIM DO PROGRAMA (Break / Halt) ---
33: [ nop            | nop               | sub R0, R0   | nop          ] // Garante R0=0 para o salto
34: [ nop            | brzi 0            | nop          | nop          ] // PC = PC + 0 (Loop infinito)