def calculadora(numero1, numero2, operacao):
    if operacao == 1:
        resultado = numero1 + numero2
        print(f"{numero1} + {numero2} = {resultado}")
    elif operacao == 2:
        resultado = numero1 - numero2
        print(f"{numero1} - {numero2} = {resultado}")
    elif operacao == 3:
        resultado = numero1 * numero2
        print(f"{numero1} - {numero2} = {resultado}")
    elif operacao == 4:
        resultado = numero1 / numero2
        print(f"{numero1} / {numero2} = {resultado}")
    else:
        print("Essa opção não existe!")


operacao = int(input("Escolha uma operação:\n1 = Soma\n2 = Subtração\n3 = Multiplição\n4 = Divisão\n0 = SAIR\n"))

numero1 = int(input("Digite o primeiro número: "))
numero2 = int(input("Digite o segundo número: "))
calculadora(numero1, numero2, operacao)






