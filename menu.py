def menu():
        print ("======= Menu ========")
        print ("0 - Sair")
        print ("1 - Somar")
        print ("2 - Subtrair")
        print ("3 - Multiplicar")
        print ("4 - Dividir")
        opcao = int(input("Escolha uma opção:"))
        return opcao

op = menu()

print("Você escolheu:", op)

if op == 1:
    print("Você escolheu somar")
    num1 = int(input("Digite o primeiro número:"))
    num2 = int(input("Digite o segundo número:"))
    print("O resultado é:", num1 + num2)
