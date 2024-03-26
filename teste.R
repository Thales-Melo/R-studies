library(rvest)
library(tidyverse)
library(magrittr)


link <- "https://www.chancedegol.com.br/rkclub.htm"


webpage <- read_html(link)

tabela <- webpage %>% html_table(header = T)

print(tabela)

view(tabela)

names <- webpage %>% html_nodes("img+ font") %>% html_text()

posicoes <- webpage %>% html_nodes("td td tr+ tr td:nth-child(1) font") %>% html_text()

pontuacao <- webpage %>% html_nodes("tr+ tr td~ td+ td font") %>% html_text()

data <- data.frame(
  posicao = posicoes,
  time = names,
  pontuacao = pontuacao
)

# Substituir vírgulas por pontos nas strings
pontuacao_corrigida <- sub(",", ".", pontuacao)


pontuacao_num <- as.numeric(pontuacao_corrigida)

media <- mean(pontuacao_num)

print(media)

write_excel_csv(data, file = "teste.csv")

view(data)

#####################################################

o_que_procuro_para_susbtituir <- "palavra"
o_que_quero_substituir_por <- "batata"
meu_texto <- "quero substituir essa palavra"

texto_final <- stringr::str_replace( meu_texto, o_que_procuro_para_susbtituir, o_que_quero_substituir_por)

print(texto_final)



# TRATAMENTO DE VALORES AUSENTES

# Remover linhas ou colunas com valores ausentes: 
# Você pode usar a função na.omit() para remover
# linhas ou colunas que contenham valores ausentes.
dados_limpos <- na.omit(dados)


# Preencher valores ausentes com um valor específico:
# Você pode usar a função na.fill() para preencher
# os valores ausentes com um valor específico.
dados_sem_na <- na.fill(dados, value = 0)


# DUPLICATAS

# Para lidar com valores duplicados nos seus dados, 
# você pode usar a função unique() para remover duplicatas
# e a função duplicated() para identificar duplicatas.
dados_sem_duplicatas <- unique(dados)

linhas_duplicadas <- dados[duplicated(dados), ]


