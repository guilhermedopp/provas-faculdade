media_str = input("Digite a média do estudante (0 a 10): ")
aulas_dadas_str = input("Digite a quantidade de aulas dadas: ")
faltas_str = input("Digite a quantidade de faltas do estudante: ")

if not media_str or not aulas_dadas_str or not faltas_str:
    print("Algum dado obrigatório não foi preenchido ou houve o preenchimento incorreto de algum dado")
else:
    eh_numero_media = True
    tem_ponto_media = False
    for char in media_str:
        if not ('0' <= char <= '9' or char == '.'):
            eh_numero_media = False
            break
        elif char == '.':
            if tem_ponto_media:
                eh_numero_media = False
                break
            tem_ponto_media = True

    eh_inteiro_aulas = True
    for char in aulas_dadas_str:
        if not ('0' <= char <= '9'):
            eh_inteiro_aulas = False
            break

    eh_inteiro_faltas = True
    for char in faltas_str:
        if not ('0' <= char <= '9'):
            eh_inteiro_faltas = False
            break

    if not eh_numero_media or not eh_inteiro_aulas or not eh_inteiro_faltas:
        print("Algum dado obrigatório não foi preenchido ou houve o preenchimento incorreto de algum dado")
    else:
        media = float(media_str)
        aulas_dadas = int(aulas_dadas_str)
        faltas = int(faltas_str)

        if not (0 <= media <= 10) or aulas_dadas <= 0 or not (0 <= faltas <= aulas_dadas):
            print("Algum dado obrigatório não foi preenchido ou houve o preenchimento incorreto de algum dado")
        else:
            frequencia = ((aulas_dadas - faltas) / aulas_dadas) * 100

            if frequencia < 75:
                print("Não pode fazer recuperação devido a quantidade de faltas")
            elif media >= 7:
                print("Aprovado")
            elif media >= 4:
                print("Pode fazer recuperação")
            else:
                print("Não pode fazer a recuperação devido a média ser inferior a 4")