        v.movh 0
        v.movl 0
        v.and VR[2], VR[1] ; VR[2] = 0
        v.movh 1
        v.movl 8 ; VR[1] = 24
        v.add VR[2], VR[1] ; VR[2] = 24
        v.add VR[2], VR[0] ; VR[2] = 24 + VR[0]
        v.movh 0
        v.movl 0
        v.and VR[3], VR[1] ; VR[3] = 0
        s.movh 0
        s.movl 3
        s.add SR[3], SR[1]
loop_Rz:v.st VR[3], VR[2] ; M[VR[2]] = 0
        v.addi 4 ; VR[1] = 4
        v.add VR[2], VR[1] ; VR[2] = VR[2] + 4
        s.movh 0
        s.movl 1
        s.add SR[1], SR[0]
        s.sub SR[3], SR[1]
        s.movh 1
        s.movl 12
        s.add SR[2], SR[1]
        s.brzr SR[3], SR[2]
        s.movh 0
        s.movl 13
        s.add SR[2], SR[1]
        s.brzr SR[0], SR[2]
fora_Rz:v.movh 0
        v.movl 0
        v.and VR[2], VR[1] ; VR[2] = 0
        v.add VR[2], VR[0] ; VR[2] = VR[0]
        v.and VR[3], VR[1] ; VR[3] = 0
        v.add VR[3], VR[0] ; VR[3] = VR[0]
        s.movh 0
        s.movl 3
        s.add SR[3], SR[1]
loop_A: v.st VR[3], VR[2] ; M[VR[2]] = VR[3]
        v.addi 4 ; VR[1] = VR[1] + 4
        v.add VR[2], VR[1] ; VR[2] = VR[2] + 4
        v.addi 4 ; VR[1] = VR[1] + 4
        v.add  VR[3], VR[1] ; VR[3] = VR[3] + 4
        s.movh 0
        s.movl 1
        s.add SR[1], SR[0]
        s.sub SR[3], SR[1]
        s.movh 3
        s.movl 6
        s.add SR[2], SR[1]
        s.brzr SR[3], SR[2]
        s.movh 2
        s.movl 5
        s.add SR[2], SR[1]
        s.brzr SR[0], SR[2]
fora_A: v.movh 0
        v.movl 0
        v.and VR[2], VR[1] ; VR[2] = 0
        v.movh 0
        v.movl 12 ; VR[1] = 12
        v.add VR[2], VR[1] ; VR[2] = 12
        v.add VR[2], VR[0] ; VR[2] = 12 + VR[0]
        v.and VR[3], VR[1] ; VR[3] = 0
        v.movh 1
        v.movl 4 ; VR[1] = 20
        v.add  VR[3], VR[1] ; VR[3] = 20
        v.add  VR[3], VR[0] ; VR[3] = 20 + VR[0]
        s.movh 0
        s.movl 3
        s.add SR[3], SR[1]
loop_B: v.st VR[3], VR[2] ; M[VR[2]] = VR[3]
        v.addi 4 ; VR[1] = VR[1] + 4
        v.add VR[2], VR[1]
        v.addi 4 ; VR[1] = VR[1] + 4
        v.add VR[3], VR[1]
        s.movh 0
        s.movl 1
        s.add SR[1], SR[0]
        s.sub SR[3], SR[1]
        s.movh 5
        s.movl 6
        s.add SR[2], SR[1]
        s.brzr SR[3], SR[2]
        s.movh 4
        s.movl 5
        s.add SR[2], SR[1]
        s.brzr SR[0], SR[2]
fora_B: v.movh 0
        v.movl 0
        v.and VR[2], VR[1] ; VR[2] = 0
        v.add VR[2], VR[0] ; VR[2] = VR[0]
        s.movh 0
        s.movl 3
        s.add SR[3], SR[1]
loop_S: v.ld VR[3], VR[2] ; VR[3] = M[VR[2]]
        v.movh 0
        v.movl 12 ; VR[1] = 12
        v.add VR[1], VR[2] ; VR[1] = VR[2] + 12
        v.ld VR[1], VR[1] ; VR[1] = M[VR[1]]
        v.add  VR[3], VR[1] ; VR[3] recebe a soma de A e B
        v.movh 1
        v.movl 8 ; VR[1] = 24
        v.add VR[1], VR[2] ; VR[1] = VR[2] + 24 (vai para o endereço de R)
        v.st VR[3], VR[1] ; guarda em VR[3] o valor da soma
        v.addi 4 ; VR[1] = VR[1] + 4
        v.add VR[2], VR[1] ; VR[2] = VR[2] + 4
        s.movh 0
        s.movl 1
        s.add SR[1], SR[0]
        s.sub SR[3], SR[1]
        s.movh 7
        s.movl 5
        s.add SR[2], SR[1]
        s.brzr SR[3], SR[2]
        s.movh 5
        s.movl 13
        s.add SR[2], SR[1]
        s.brzr SR[0], SR[2]
fim:    s.brzr SR[0], SR[0]
