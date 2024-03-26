library(dplyr)

# Criando um dataframe de exemplo
dados <- data.frame(
  id = 1:5,
  nome = c("João", "Maria", "Pedro", "Ana", "José"),
  idade = c(25, 30, 35, 40, 45),
  salario = c(2500, 3000, 3500, 4000, NA)
)

# Filtrando linhas com idade maior que 30
dados_filtrados <- filter(dados, idade > 30)

# Selecionando apenas as colunas id e nome
dados_selecionados <- select(dados, id, nome)

# Adicionando uma nova coluna calculada (idade em meses)
dados_mutados <- mutate(dados, idade_meses = idade * 12)

# Ordenando os dados por idade
dados_ordenados <- arrange(dados, idade)

# Resumindo os dados, calculando a média de idade e salário
dados_resumidos <- summarize(dados, media_idade = mean(idade, na.rm = TRUE), media_salario = mean(salario, na.rm = TRUE))

# Agrupando os dados por idade e calculando a média de salário para cada grupo
dados_agrupados <- group_by(dados, idade)
media_salario_por_idade <- summarize(dados_agrupados, media_salario = mean(salario, na.rm = TRUE))



######################################



library(ggplot2)

# Criando um gráfico de dispersão simples
grafico_dispersao <- ggplot(dados, aes(x = idade, y = salario)) +
  geom_point() +
  labs(title = "Salário por Idade", x = "Idade", y = "Salário")

# Criando um histograma simples
histograma <- ggplot(dados, aes(x = salario)) +
  geom_histogram(binwidth = 500) +
  labs(title = "Distribuição de Salários", x = "Salário", y = "Frequência")

# Criando um gráfico de barras simples
grafico_barras <- ggplot(dados, aes(x = nome, y = idade)) +
  geom_bar(stat = "identity") +
  labs(title = "Idade por Nome", x = "Nome", y = "Idade")

# Criando um gráfico de linha simples
grafico_linha <- ggplot(dados, aes(x = idade, y = salario, color = nome)) +
  geom_line() +
  labs(title = "Salário ao longo do tempo", x = "Idade", y = "Salário")


#################################



library(tidyr)

# Criando um dataframe de exemplo
dados_largos <- data.frame(
  id = 1:3,
  nome = c("João", "Maria", "Pedro"),
  genero = c("M", "F", "M"),
  idade_2019 = c(25, 30, 35),
  idade_2020 = c(26, 31, 36)
)

# Transformando os dados de formato largo para longo
dados_longos <- gather(dados_largos, ano, idade, idade_2019:idade_2020)

# Transformando os dados de formato longo para largo
dados_largos <- spread(dados_longos, key = ano, value = idade)



##########################


string <- "banana"
for (i in 1:nchar(string)) {
  nova_string <- paste(substr(string, 1, i - 1), "x", substr(string, i + 1, nchar(string)), sep = "")
  print(nova_string)
}
# Saída:
# "xanana"
# "bxnana"
# "banana"
# "banxna"
# "banaxa"
# "bananx"



###############




string1 <- "Olá"
string2 <- "mundo"
concatenado <- paste(string1, string2)
# Ou use paste0() para evitar espaços extras
# concatenado <- paste0(string1, string2)
print(concatenado)  # Saída: "Olá mundo"
