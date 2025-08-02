.data
menu: 			.asciiz "\n\n======= MENU DE OPCOES =======\n1) Conversor de Metros\n2) Soma de 4 Inteiros\n3) Media Aritmetica de 3 Notas\n4) Media Ponderada de 3 Notas\n5) Calculos com um Numero Positivo\n6) Calculo de Idade\n7) Conversor de Segundos\n8) Calcular Conta da Lanchonete\n0) Sair\nEscolha uma opcao: "
erro_opcao: 	.asciiz "Opcao invalida! Tente novamente.\n"
pula_linha: 	.asciiz "\n"

prompt_metros: 		.asciiz "Digite o valor em metros: "
res_decimetros: 	.asciiz " em decimetros: "
res_centimetros: 	.asciiz " em centimetros: "
res_milimetros: 	.asciiz " em milimetros: "

prompt_int: 		.asciiz "Digite um numero inteiro: "
res_soma: 			.asciiz "A soma dos numeros e: "

prompt_nota: 		.asciiz "Digite uma nota: "
prompt_peso: 		.asciiz "Digite o peso da nota: "
res_media_ari: 		.asciiz "A media aritmetica e: "
res_media_pon: 		.asciiz "A media ponderada e: "

prompt_num_pos: 	.asciiz "Digite um numero positivo e maior que zero: "
res_quadrado: 		.asciiz "Numero ao quadrado: "
res_cubo: 			.asciiz "Numero ao cubo: "
res_raiz_quad: 		.asciiz "Raiz quadrada aproximada do numero: "
res_raiz_cub: 		.asciiz "Raiz cubica aproximada do numero: "

prompt_ano_nasc: 	.asciiz "Digite o ano de nascimento: "
prompt_ano_atual: 	.asciiz "Digite o ano atual: "
res_idade_atual: 	.asciiz "A idade atual e: "
res_idade_2027: 	.asciiz "A idade em 2027 sera: "

prompt_segundos: 	.asciiz "Digite o total de segundos: "
res_tempo_prefixo: 	.asciiz " segundos sao "
res_horas: 			.asciiz " horas, "
res_minutos: 		.asciiz " minutos e "
res_segundos: 		.asciiz " segundos."

prompt_hamburguer: 		.asciiz "Quantidade de Hamburgueres (R$ 3.00): "
prompt_cheeseburger: 	.asciiz "Quantidade de Cheeseburgers (R$ 2.50): "
prompt_fritas: 			.asciiz "Quantidade de Fritas (R$ 2.50): "
prompt_refri: 			.asciiz "Quantidade de Refrigerantes (R$ 1.00): "
res_conta: 				.asciiz "O valor total da conta e: R$ "

.align 2
zero_float: .float 0.0
tres_float: .float 3.0
dez_float: .float 10.0
cem_float: .float 100.0
mil_float: .float 1000.0
preco_hamburguer: .float 3.00
preco_cheeseburger: .float 2.50
preco_fritas: .float 2.50
preco_refri: .float 1.00
one_third_float: .float 0.3333333
two_float: .float 2.0
f_3600: .float 3600.0
f_60: .float 60.0
f_100: .float 100.0
f_0_5: .float 0.5

.text
.globl main

main:
loop_menu:
	li $v0, 4
	la $a0, menu
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	beq $t0, 0, sair
	beq $t0, 1, call_opcao1
	beq $t0, 2, call_opcao2
	beq $t0, 3, call_opcao3
	beq $t0, 4, call_opcao4
	beq $t0, 5, call_opcao5
	beq $t0, 6, call_opcao6
	beq $t0, 7, call_opcao7
	beq $t0, 8, call_opcao8

	li $v0, 4
	la $a0, erro_opcao
	syscall
	j loop_menu

call_opcao1: 
	jal opcao1
	j loop_menu
call_opcao2: 
	jal opcao2
	j loop_menu
call_opcao3: 
	jal opcao3
	j loop_menu
call_opcao4: 
	jal opcao4
	j loop_menu
call_opcao5: 
	jal opcao5
	j loop_menu
call_opcao6: 
	jal opcao6
	j loop_menu
call_opcao7: 
	jal opcao7
	j loop_menu
call_opcao8: 
	jal opcao8
	j loop_menu

arredondar_duas_casas:
	l.s $f20, f_100 
	l.s $f21, f_0_5 
	mul.s $f12, $f12, $f20 
	add.s $f12, $f12, $f21 
	trunc.w.s $f12, $f12 
	cvt.s.w $f12, $f12 
	div.s $f12, $f12, $f20 
	jr $ra

opcao1:
	li $v0, 4
	la $a0, prompt_metros
	syscall
	li $v0, 6
	syscall
	l.s $f10, dez_float
	l.s $f11, cem_float
	l.s $f12, mil_float
	mul.s $f2, $f0, $f10
	mul.s $f3, $f0, $f11
	mul.s $f4, $f0, $f12
	li $v0, 2
	mov.s $f12, $f2
	syscall
	li $v0, 4
	la $a0, res_decimetros
	syscall
	li $v0, 2
	mov.s $f12, $f3
	syscall
	li $v0, 4
	la $a0, res_centimetros
	syscall
	li $v0, 2
	mov.s $f12, $f4
	syscall
	li $v0, 4
	la $a0, res_milimetros
	syscall
	jr $ra

opcao2:
	li $t1, 0
	li $t2, 4
loop_soma:
	li $v0, 4
	la $a0, prompt_int
	syscall
	li $v0, 5
	syscall
	add $t1, $t1, $v0
	subi $t2, $t2, 1
	bnez $t2, loop_soma
	li $v0, 4
	la $a0, res_soma
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	jr $ra

opcao3:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)

	l.s $f10, zero_float
	li $t0, 3
loop_media_ari:
	li $v0, 4
	la $a0, prompt_nota
	syscall
	li $v0, 6
	syscall
	add.s $f10, $f10, $f0
	subi $t0, $t0, 1
	bnez $t0, loop_media_ari
	
	l.s $f12, tres_float
	div.s $f12, $f10, $f12
	
	jal arredondar_duas_casas 
	
	li $v0, 4
	la $a0, res_media_ari
	syscall
	li $v0, 2
	syscall
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	jr $ra

opcao4:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	l.s $f10, zero_float
	l.s $f11, zero_float
	li $t0, 3
loop_media_pon:
	li $v0, 4
	la $a0, prompt_nota
	syscall
	li $v0, 6
	syscall
	mov.s $f1, $f0
	li $v0, 4
	la $a0, prompt_peso
	syscall
	li $v0, 6
	syscall
	mov.s $f2, $f0
	mul.s $f3, $f1, $f2
	add.s $f10, $f10, $f3
	add.s $f11, $f11, $f2
	subi $t0, $t0, 1
	bnez $t0, loop_media_pon
	
	div.s $f12, $f10, $f11
	
	jal arredondar_duas_casas 
	
	li $v0, 4
	la $a0, res_media_pon
	syscall
	li $v0, 2
	syscall
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	jr $ra

opcao5:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)

	li $v0, 4
	la $a0, prompt_num_pos
	syscall
	li $v0, 6
	syscall
	
	mul.s $f12, $f0, $f0
	li $v0, 4
	la $a0, res_quadrado
	syscall
	li $v0, 2
	syscall
	li $v0, 4
	la $a0, pula_linha
	syscall
	
	mul.s $f12, $f0, $f0
	mul.s $f12, $f12, $f0
	li $v0, 4
	la $a0, res_cubo
	syscall
	li $v0, 2
	syscall
	li $v0, 4
	la $a0, pula_linha
	syscall
	
	li $v0, 4
	la $a0, res_raiz_quad
	syscall
	sqrt.s $f12, $f0
	jal arredondar_duas_casas
	li $v0, 2
	syscall
	li $v0, 4
	la $a0, pula_linha
	syscall
	
	li $v0, 4
	la $a0, res_raiz_cub
	syscall
	l.s $f2, two_float
	l.s $f3, one_third_float
	l.s $f4, tres_float
	div.s $f20, $f0, $f4
	li $t0, 15
loop_cbrt:
	mul.s $f21, $f20, $f20
	div.s $f22, $f0, $f21
	mul.s $f23, $f2, $f20
	add.s $f24, $f23, $f22
	mul.s $f20, $f3, $f24
	subi $t0, $t0, 1
	bnez $t0, loop_cbrt
	mov.s $f12, $f20
	jal arredondar_duas_casas
	li $v0, 2
	syscall
	li $v0, 4
	la $a0, pula_linha
	syscall

	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra

opcao6:
	li $v0, 4
	la $a0, prompt_ano_nasc
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, prompt_ano_atual
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	
	sub $t2, $t1, $t0
	li $v0, 4
	la $a0, res_idade_atual
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	li $v0, 4
	la $a0, pula_linha
	syscall
	
	li $t3, 2027
	sub $t4, $t3, $t0
	li $v0, 4
	la $a0, res_idade_2027
	syscall
	li $v0, 1
	move $a0, $t4
	syscall
	jr $ra

opcao7:
	li $v0, 4
	la $a0, prompt_segundos
	syscall
	
	li $v0, 6 
	syscall
	mov.s $f1, $f0 
	
	li $v0, 2
	mov.s $f12, $f1
	syscall
	li $v0, 4
	la $a0, res_tempo_prefixo
	syscall
	
	l.s $f2, f_3600
	l.s $f3, f_60

	div.s $f4, $f0, $f2
	trunc.w.s $f5, $f4
	cvt.s.w $f6, $f5
	
	mul.s $f7, $f6, $f2
	sub.s $f0, $f0, $f7
	
	div.s $f8, $f0, $f3
	trunc.w.s $f9, $f8
	cvt.s.w $f10, $f9
	
	mul.s $f11, $f10, $f3
	sub.s $f12, $f0, $f11
	round.w.s $f12, $f12
	
	mfc1 $t2, $f5
	mfc1 $t4, $f9
	mfc1 $t5, $f12
	
	li $v0, 1
	move $a0, $t2
	syscall
	li $v0, 4
	la $a0, res_horas
	syscall
	li $v0, 1
	move $a0, $t4
	syscall
	li $v0, 4
	la $a0, res_minutos
	syscall
	li $v0, 1
	move $a0, $t5
	syscall
	li $v0, 4
	la $a0, res_segundos
	syscall

	jr $ra

opcao8:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	l.s $f10, zero_float
	
	li $v0, 4
	la $a0, prompt_hamburguer
	syscall
	li $v0, 5
	syscall
	mtc1 $v0, $f1
	cvt.s.w $f1, $f1
	l.s $f2, preco_hamburguer
	mul.s $f3, $f1, $f2
	add.s $f10, $f10, $f3
	
	li $v0, 4
	la $a0, prompt_cheeseburger
	syscall
	li $v0, 5
	syscall
	mtc1 $v0, $f1
	cvt.s.w $f1, $f1
	l.s $f2, preco_cheeseburger
	mul.s $f3, $f1, $f2
	add.s $f10, $f10, $f3
	
	li $v0, 4
	la $a0, prompt_fritas
	syscall
	li $v0, 5
	syscall
	mtc1 $v0, $f1
	cvt.s.w $f1, $f1
	l.s $f2, preco_fritas
	mul.s $f3, $f1, $f2
	add.s $f10, $f10, $f3
	
	li $v0, 4
	la $a0, prompt_refri
	syscall
	li $v0, 5
	syscall
	mtc1 $v0, $f1
	cvt.s.w $f1, $f1
	l.s $f2, preco_refri
	mul.s $f3, $f1, $f2
	add.s $f10, $f10, $f3
	
	li $v0, 4
	la $a0, res_conta
	syscall
	
	mov.s $f12, $f10
	jal arredondar_duas_casas 
	
	li $v0, 2
	syscall
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	jr $ra

sair:
	li $v0, 10
	syscall