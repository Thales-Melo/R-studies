library(rvest)
library(tidyverse)
library(magrittr)


link <- "https://www.chancedegol.com.br/rkclub.htm"


webpage <- read_html(link)


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


view(data)


# view(names

