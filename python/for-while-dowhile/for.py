
# FOR
print("FOR")
for andar in range(20, 0, -1):
    if andar != 13:
     print(andar)

# WHILE
print("WHILE")
andar = 20
while andar > 0:
    if andar != 13:
        print(andar)
    andar -= 1

# DO WHILE
print("DO WHILE")
andar = 20
while True:
    if andar != 13:
        print(andar)
    andar -= 1

    if andar == 0:
        break