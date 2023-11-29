def calculadora(numero1, numero2, operacao):
    if operacao == 1:
        resultado = numero1 + numero2
        print(f"{numero1} + {numero2} = {resultado}\n")
    elif operacao == 2:
        resultado = numero1 - numero2
        print(f"{numero1} - {numero2} = {resultado}\n")
    elif operacao == 3:
        resultado = numero1 * numero2
        print(f"{numero1} x {numero2} = {resultado}\n")
    elif operacao == 4:
        resultado = numero1 / numero2
        print(f"{numero1} / {numero2} = {resultado}\n")


controle = True

while controle:
    operacao = int(input("Escolha uma operação:\n1 = Soma\n2 = Subtração\n3 = Multiplição\n4 = Divisão\n0 = SAIR\n"))

    if operacao == 0:
        break
    elif operacao != 1 and operacao != 2 and operacao != 3 and operacao != 4:
        print("Essa opção não existe!\n")
        continue

    numero1 = int(input("Digite o primeiro número: "))
    numero2 = int(input("Digite o segundo número: "))

    calculadora(numero1, numero2, operacao)







