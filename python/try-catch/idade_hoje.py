def calcular_idade(ano):
    return 2023 - ano_de_nascimento


while True:
    try:
        nome_usuario = input('Digite seu nome completo: ')
        ano_de_nascimento = int(input('Digite seu ano de nascimento (entre 1922 e 2022): '))

        if 1922 <= ano_de_nascimento <= 2022:
            idade = calcular_idade(ano_de_nascimento)
            print(f'Olá {nome_usuario}! Nesse ano você completa ou completou {idade} anos de idade!')
            break
        else:
            print('Digite um ano válido!\n')

    except ValueError:
        print("Digite um número válido!\n")
