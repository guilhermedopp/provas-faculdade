entrada_valor = input("Digite o valor total da compra: ")

pos_ponto = entrada_valor.find(".")
if pos_ponto != -1:
    inteiro = entrada_valor[:pos_ponto]
    decimal = entrada_valor[pos_ponto + 1:]
else:
    inteiro = entrada_valor
    decimal = ""

numeros = "0123456789"
inteiro_ok = inteiro != "" and all(digito in numeros for digito in inteiro)
decimal_ok = decimal == "" or all(digito in numeros for digito in decimal)

if inteiro_ok and decimal_ok:
    valor_compra = float(inteiro + "." + decimal) if decimal != "" else float(inteiro)
else:
    valor_compra = 0

if valor_compra > 0:
    status_fidelidade = input("O cliente é fidelizado? (True/False): ").strip().lower()
    if status_fidelidade == "true" or status_fidelidade == "false":
        cliente_fiel = status_fidelidade == "true"

        total_compras_str = input("Digite a quantidade de compras realizadas: ")
        if total_compras_str != "" and total_compras_str[0] in numeros and all(c in numeros for c in total_compras_str):
            total_compras = int(total_compras_str)

            possui_cupom = input("O cliente tem cupom especial? (True/False): ").strip().lower()
            if possui_cupom == "true" or possui_cupom == "false":
                cupom_valido = possui_cupom == "true"

                if (cliente_fiel and total_compras > 5) or cupom_valido:
                    valor_desconto = valor_compra * 0.10
                    valor_final = valor_compra - valor_desconto
                    print(f"Desconto aplicado: R$ {valor_desconto:.2f}")
                    print(f"Valor final da compra: R$ {valor_final:.2f}")
                else:
                    print(f"Valor final da compra: R$ {valor_compra:.2f}")
            else:
                print("Valor inválido para cupom. Digite True ou False.")
        else:
            print("Quantidade de compras inválida. Digite um número inteiro positivo.")
    else:
        print("Valor inválido para fidelizado. Digite True ou False.")
else:
    print("Valor da compra inválido. Digite um número maior que zero.")
