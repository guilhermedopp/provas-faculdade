# Guilherme de Oliveira Pontes Pinto

def validar_nota(nota):
    try:
        nota_float = float(nota)
        if 0 <= nota_float <= 10:
            return True
        else:
            return False
    except (ValueError, TypeError):
        raise ValueError("Erro. O valor digitado deve ser numérico.") 