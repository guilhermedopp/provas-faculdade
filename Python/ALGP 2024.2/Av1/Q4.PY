temperatura_str = input("Digite a temperatura (0 a 100 °C): ")
umidade_str = input("Digite a umidade relativa do ar (0 a 100%): ")
vento_str = input("Digite a velocidade do vento (km/h, maior que 0): ")

if not temperatura_str or not umidade_str or not vento_str:
    print("Algum dado obrigatório não foi preenchido ou houve o preenchimento incorreto de algum dado")
else:
    eh_numero_temp = True
    for char in temperatura_str:
        if not ('0' <= char <= '9' or char == '.'):
            eh_numero_temp = False
            break

    eh_numero_umid = True
    for char in umidade_str:
        if not ('0' <= char <= '9' or char == '.'):
            eh_numero_umid = False
            break

    eh_numero_vento = True
    for char in vento_str:
        if not ('0' <= char <= '9' or char == '.'):
            eh_numero_vento = False
            break

    if not eh_numero_temp or not eh_numero_umid or not eh_numero_vento:
        print("Algum dado obrigatório não foi preenchido ou houve o preenchimento incorreto de algum dado")
    else:
        temperatura = float(temperatura_str)
        umidade = float(umidade_str)
        vento = float(vento_str)

        if not (0 <= temperatura <= 100) or not (0 <= umidade <= 100) or vento <= 0:
            print("Algum dado obrigatório não foi preenchido ou houve o preenchimento incorreto de algum dado")
        else:
            if temperatura > 30 and umidade < 40:
                print("Clima seco e quente")
            elif umidade >= 85 and 20 <= temperatura <= 28:
                print("Clima chuvoso")
            elif vento >= 40:
                print("Clima com vento forte")
            else:
                print("Clima estável")