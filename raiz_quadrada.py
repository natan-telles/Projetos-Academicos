n = 20
estimativa = 1

for i in range(0,10):
    estimativa = (estimativa + n/estimativa)/2

print(f"estimativa da raiz {n} : {estimativa}")