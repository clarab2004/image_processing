using Images, Random

# Carregando as imagens 
img_b = load("C:\\Users\\eeude\\Downloads\\Mistura_Imagens\\mistura_imagens\\bumper.jpg")
img_c = load("C:\\Users\\eeude\\Downloads\\Mistura_Imagens\\mistura_imagens\\city.jpg")
img_f = load("C:\\Users\\eeude\\Downloads\\Mistura_Imagens\\mistura_imagens\\flats.jpg")
img_r = load("C:\\Users\\eeude\\Downloads\\Mistura_Imagens\\mistura_imagens\\raisin.jpg")

# Tamanho das imagens (linha,coluna)
size_b = size(img_b)
size_c = size(img_c)
size_f = size(img_f)
size_r = size(img_r)

# Definindo tamanho das novas imagens
l = minimum([size_b[1], size_c[1], size_f[1], size_r[1]])  # menor número de linhas
c = minimum([size_b[2], size_c[2], size_f[2], size_r[2]])  # menor número de colunas

function image_min_size(img, target_c, target_l)
    return img[1:target_l, 1:target_c]  
end

# Imagens com mesmo número de pixels 
img_new_b = image_min_size(img_b, l, c)
img_new_c = image_min_size(img_c, c, l)
img_new_f = image_min_size(img_f, c, l)
img_new_r = image_min_size(img_r, c, l)

#### Comandos básicos
## Mostrar imagem 
#display(img_b)

# Definindo a matriz A
# function generate_random_mixing_matrix(n)
#     A = rand(n, n) 
#     A = A ./ sum(A, dims=2)  # Soma das linhas é igual a 1
#     return A
# end
# A = generate_random_mixing_matrix(n)
######## Deu errado :(

#A = [0 0 0 1; 1 0 0 0; 0 1 0 0; 0 0 1 0]
#A = [0.267305 0.312555 0.191876 0.228264; 0.292697 0.276259 0.221022 0.210021; 0.195759 0.321557 0.214679 0.268005; 0.309699 0.297611 0.282556 0.110134]
#A = [-2  3  0  0;  4 -5  2  0; -3  0  5 -1;  1  1 -1  0]
#A = [-48 -2  51  0; -33  4  38 -8; -36 41   4 -8; -86 10   1 76]



# Empilhando as colunas da matriz-imagem
# I_b = vec(img_new_b)
# I_c = vec(img_new_c)
# I_f = vec(img_new_f)
# I_r = vec(img_new_r)

S = hcat(vec(img_new_b), vec(img_new_c), vec(img_new_f), vec(img_new_r))

# Número de imagens
#n = size(S, 2)
# println(n)
# sizeS = size(S)
# println(sizeS)

# Imagens misturadas 
|#Mix = A*S
# Transpondo a matriz S para que tenha 4 linhas (uma por imagem)
S = transpose(S)  # Agora S tem 4 linhas e T colunas

# Número de imagens
n = size(S, 1)  # Agora o número de imagens está nas linhas

# Produto das imagens com a matriz de mistura A
Mix = A * S

# Agora vamos desvetorizar cada linha da matriz Mix
# Mix é uma matriz de 4 linhas e T colunas, e cada linha deve ser convertida de volta para uma imagem

function desvetorizar_para_imagem_linhas(matriz, l, c)
    imagens = []
    for i in 1:size(matriz, 1)  # Para cada linha
        push!(imagens, reshape(matriz[i, :], l, c))  # Redimensiona a linha para l x c e adiciona a imagem
    end
    return imagens
end

# Desvetorizando as imagens (cada linha será uma imagem)
imagens_resultantes = desvetorizar_para_imagem_linhas(Mix, l, c)

# Exibindo as imagens resultantes
for img in imagens_resultantes
    display(img)
end

