nome_usuario = input("Digite o nome de usuário: ")

if not nome_usuario:
    print("O nome do usuário é obrigatório")
else:
    senha_usuario = input("Digite a senha: ")
    if not senha_usuario:
        print("A senha do usuário é obrigatória")
    else:
        if (nome_usuario == 'admin' or nome_usuario == 'gestor') and senha_usuario == '1234':
            print("Acesso permitido")
        else:
            if (nome_usuario != 'admin' and nome_usuario != 'gestor') and senha_usuario != '1234':
                print("Acesso negado")
                print("O nome do usuário e a senha estão incorretos")
            elif nome_usuario != 'admin' and nome_usuario != 'gestor':
                print("Acesso negado")
                print("O nome do usuário está incorreto")
            elif senha_usuario != '1234':
                print("Acesso negado")
                print("A senha está incorreta")
