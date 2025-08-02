# Guilherme de Oliveira Pontes Pinto

from util import validar_nota

notas_turma = []

def adicionar_nota():
    nota_input = input("Digite a nota do aluno: ")
    
    if validar_nota(nota_input):
        notas_turma.append(float(nota_input))
        print("Nota adicionada com sucesso!\n")
    else:
        raise ValueError("Erro: A nota informada deve ser entre 0 e 10.")
        
def relatorio_final():
    if not notas_turma:
        print("\nA lista de notas está vazia. Adicione notas para gerar o relatório.\n")
        return
    
    aprovados = 0
    reprovados = 0
    
    for nota in notas_turma:
        if nota >= 7.0:
            aprovados += 1
        else:
            reprovados += 1
            
    media_geral = sum(notas_turma) / len(notas_turma)
    
    print("\n --- Relatório Final da Turma --- ")
    print(f"Média Geral: {media_geral:.2f}")
    print(f"Quantidade de alunos aprovados: {aprovados}")
    print(f"Quantidade de alunos reprovados: {reprovados}")
    print("-----------------------------\n")
    
def menu():
    while True:
        print(" --- Menu ---")
        print("1.Adicionar notas")
        print("2.Relatório Final")
        print("3.Sair")
        
        opcao = input("Escolha uma opção: ")
        
        if opcao == '1':
            try:
                adicionar_nota()
            except ValueError as e:
                print(f"\n{e}\n")
        elif opcao == '2':
            relatorio_final()
        elif opcao == '3':
            print("Encerrando o programa.")
            break
        else:
            print("\nOpção inválida. Tente novamente.\n")
            
if __name__ == "__main__":
    menu()