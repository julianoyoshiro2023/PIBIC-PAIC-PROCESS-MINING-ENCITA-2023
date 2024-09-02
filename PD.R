GD_alpha = read.csv('PD_alpha.csv')
GD_inductive = read.csv('PD_inductive.csv')
GD_heuristics = read.csv('PD_heuristics.csv')
N=10^5

set.seed(11238)


#################### FITNESS ########################## 

alpha = GD_alpha$Fitness
inductive = GD_inductive$Fitness
heuristics = GD_heuristics$Fitness

###################################### Alpha Miner

# Amostra original 
amostra = alpha

# Tamanho da reamostragem é metade do tamanho original da amostra considerada
n=length(amostra)/2
xb0 = mean(amostra)

# Hipóteses iniciais:
# H0: mi = xb0
# HA: mi > xb0

mi=xb0

E=c()
s0=sd(amostra)
XB=c(xb0)
pvalue = 1
i = 1

while(pvalue >=alfa){
  
  ## Simulação Bootstrap não-paramétrico
  for(u in 1:N){
    amostrau=sample(amostra,n,replace=TRUE)
    xbu=mean(amostrau)
    XB[u+1]=xbu
    ## Cálculo e armazenamento da estatística para cada exemplo simulado
    ## O desvio padrão altera significativamnte conforme o aumento do número de exemplos simulados
    E[u]=(xbu-mi)/sd(XB)
  }
  
  ## Estatística da amostra original
  Est=(xb0-mi)/(s0/sqrt(2*n))
  
  ## Calculo do p-valor pela quantidade de casos positivos dividido pela quanidade de reamostragem total
  pvalue=sum(E>Est)/N #
  
  print(paste0("(", i, ") p-value: ",  pvalue))
  i = i + 1
  
  mi = mi - 0.001
}

hist(E, breaks=40)

# Média da amostra original
fitness_mean_alpha = xb0
# Desvio padrão da amostra original
fitness_sd_alpha = s0
# Média do teste de hipóteses do erro tipo I (alfa = 0.01)
mi_fitness_alpha = mi

# Conclusão:
print(paste0("Há uma confiança de 99% em aceitar que a média amostral é superior a  ", mi_fitness_alpha))


###################################### Inductive Miner

## O teste de hipóteses para métrica fitness do inductive miner não será feita devido ao fato
## de que o valor da métrica retornou valor 1 para todos os exemplos

# Amostra original 
amostra = inductive

# Média da amostra original
fitness_mean_inductive = mean(amostra)
# Desvio padrão da amostra original
fitness_sd_inductive = sd(amostra)
# Como não é possível aplicar teste de hipóteses, atribui-se valor NaN para a média do teste de hipóteses
mi_fitness_inductive <- NaN

###################################### Heuristics Miner


# Amostra original 
amostra = heuristics

# Tamanho da reamostragem é metade do tamanho original da amostra considerada
n=length(amostra)/2
xb0 = mean(amostra)

# Hipóteses iniciais:
# H0: mi = xb0
# HA: mi > xb0

mi=xb0
E=c()
s0=sd(amostra)
XB=c(xb0)
pvalue = 1
i = 1

while(pvalue >=alfa){
  
  ## Simulação Bootstrap não-paramétrico
  for(u in 1:N){
    amostrau=sample(amostra,n,replace=TRUE)
    xbu=mean(amostrau)
    XB[u+1]=xbu
    ## Cálculo e armazenamento da estatística para cada exemplo simulado
    ## O desvio padrão altera significativamnte conforme o aumento do número de exemplos simulados
    E[u]=(xbu-mi)/sd(XB)
  }
  
  ## Estatística da amostra original
  Est=(xb0-mi)/(s0/sqrt(2*n))
  
  ## Calculo do p-valor pela quantidade de casos positivos dividido pela quanidade de reamostragem total
  pvalue=sum(E>Est)/N #
  
  print(paste0("(", i, ") p-value: ",  pvalue))
  i = i + 1
  
  mi = mi - 0.001
}

hist(E, breaks=40)

# Média da amostra original
fitness_mean_heuristics = xb0
# Desvio padrão da amostra original
fitness_sd_heuristics = s0
# Média do teste de hipóteses do erro tipo I (alfa = 0.01)
mi_fitness_heuristics = mi

# Conclusão:
print(paste0("Há uma confiança de 99% em aceitar que a média amostral é superior a  ", mi_fitness_heuristics))

#################### PRECISION ##########################

alpha = GD_alpha$Precision
inductive = GD_inductive$Precision
heuristics = GD_heuristics$Precision

###################################### Alpha Miner

# Amostra original 
amostra = alpha

# Tamanho da reamostragem é metade do tamanho original da amostra considerada
n=length(amostra)/2
xb0 = mean(amostra)

# Hipóteses iniciais:
# H0: mi = xb0
# HA: mi > xb0

mi=xb0
E=c()
s0=sd(amostra)
XB=c(xb0)
pvalue = 1
i = 1

while(pvalue >=alfa){
  
  ## Simulação Bootstrap não-paramétrico
  for(u in 1:N){
    amostrau=sample(amostra,n,replace=TRUE)
    xbu=mean(amostrau)
    XB[u+1]=xbu
    ## Cálculo e armazenamento da estatística para cada exemplo simulado
    ## O desvio padrão altera significativamnte conforme o aumento do número de exemplos simulados
    E[u]=(xbu-mi)/sd(XB)
  }
  
  ## Estatística da amostra original
  Est=(xb0-mi)/(s0/sqrt(2*n))
  
  ## Calculo do p-valor pela quantidade de casos positivos dividido pela quanidade de reamostragem total
  pvalue=sum(E>Est)/N #
  
  print(paste0("(", i, ") p-value: ",  pvalue))
  i = i + 1
  
  mi = mi - 0.001
}

hist(E, breaks=40)

# Média da amostra original
precision_mean_alpha = xb0
# Desvio padrão da amostra original
precision_sd_alpha = s0
# Média do teste de hipóteses do erro tipo I (alfa = 0.01)
mi_precision_alpha = mi

# Conclusão:
print(paste0("Há uma confiança de 99% em aceitar que a média amostral é superior a  ", mi_precision_alpha))

###################################### Inductive Miner

# Amostra original 
amostra = inductive

# Tamanho da reamostragem é metade do tamanho original da amostra considerada
n=length(amostra)/2
xb0 = mean(amostra)

# Hipóteses iniciais:
# H0: mi = xb0
# HA: mi > xb0

mi=xb0
E=c()
s0=sd(amostra)
XB=c(xb0)
pvalue = 1
i = 1

while(pvalue >=alfa){
  
  ## Simulação Bootstrap não-paramétrico
  for(u in 1:N){
    amostrau=sample(amostra,n,replace=TRUE)
    xbu=mean(amostrau)
    XB[u+1]=xbu
    ## Cálculo e armazenamento da estatística para cada exemplo simulado
    ## O desvio padrão altera significativamnte conforme o aumento do número de exemplos simulados
    E[u]=(xbu-mi)/sd(XB)
  }
  
  ## Estatística da amostra original
  Est=(xb0-mi)/(s0/sqrt(2*n))
  
  ## Calculo do p-valor pela quantidade de casos positivos dividido pela quanidade de reamostragem total
  pvalue=sum(E>Est)/N #
  
  print(paste0("(", i, ") p-value: ",  pvalue))
  i = i + 1
  
  mi = mi - 0.001
}

hist(E, breaks=40)

# Média da amostra original
precision_mean_inductive = xb0
# Desvio padrão da amostra original
precision_sd_inductive = s0
# Média do teste de hipóteses do erro tipo I (alfa = 0.01)
mi_precision_inductive = mi

# Conclusão:
print(paste0("Há uma confiança de 99% em aceitar que a média amostral é superior a  ", mi_precision_inductive))

###################################### Heuristics Miner


# Amostra original 
amostra = heuristics

# Tamanho da reamostragem é metade do tamanho original da amostra considerada
n=length(amostra)/2
xb0 = mean(amostra)

# Hipóteses iniciais:
# H0: mi = xb0
# HA: mi > xb0

mi=xb0
E=c()
s0=sd(amostra)
XB=c(xb0)
pvalue = 1
i = 1

while(pvalue >=alfa){
  
  ## Simulação Bootstrap não-paramétrico
  for(u in 1:N){
    amostrau=sample(amostra,n,replace=TRUE)
    xbu=mean(amostrau)
    XB[u+1]=xbu
    ## Cálculo e armazenamento da estatística para cada exemplo simulado
    ## O desvio padrão altera significativamnte conforme o aumento do número de exemplos simulados
    E[u]=(xbu-mi)/sd(XB)
  }
  
  ## Estatística da amostra original
  Est=(xb0-mi)/(s0/sqrt(2*n))
  
  ## Calculo do p-valor pela quantidade de casos positivos dividido pela quanidade de reamostragem total
  pvalue=sum(E>Est)/N #
  
  print(paste0("(", i, ") p-value: ",  pvalue))
  i = i + 1
  
  mi = mi - 0.001
}

hist(E, breaks=40)


# Média da amostra original
precision_mean_heuristics = xb0
# Desvio padrão da amostra original
precision_sd_heuristics = s0
# Média do teste de hipóteses do erro tipo I (alfa = 0.01)
mi_precision_heuristics = mi

# Conclusão:
print(paste0("Há uma confiança de 99% em aceitar que a média amostral é superior a  ", mi_precision_heuristics))


#################### SIMPLICITY ##########################

alpha = GD_alpha$Simplicity
inductive = GD_inductive$Simplicity
heuristics = GD_heuristics$Simplicity

###################################### Alpha Miner

# Amostra original 
amostra = alpha

# Tamanho da reamostragem é metade do tamanho original da amostra considerada
n=length(amostra)/2
xb0 = mean(amostra)

# Hipóteses iniciais:
# H0: mi = xb0
# HA: mi > xb0

mi=xb0
E=c()
s0=sd(amostra)
XB=c(xb0)
pvalue = 1
i = 1

while(pvalue >=alfa){
  
  ## Simulação Bootstrap não-paramétrico
  for(u in 1:N){
    amostrau=sample(amostra,n,replace=TRUE)
    xbu=mean(amostrau)
    XB[u+1]=xbu
    ## Cálculo e armazenamento da estatística para cada exemplo simulado
    ## O desvio padrão altera significativamnte conforme o aumento do número de exemplos simulados
    E[u]=(xbu-mi)/sd(XB)
  }
  
  ## Estatística da amostra original
  Est=(xb0-mi)/(s0/sqrt(2*n))
  
  ## Calculo do p-valor pela quantidade de casos positivos dividido pela quanidade de reamostragem total
  pvalue=sum(E>Est)/N #
  
  print(paste0("(", i, ") p-value: ",  pvalue))
  i = i + 1
  
  mi = mi - 0.001
}

hist(E, breaks=40)


# Média da amostra original
simplicity_mean_alpha = xb0
# Desvio padrão da amostra original
simplicity_sd_alpha = s0
# Média do teste de hipóteses do erro tipo I (alfa = 0.01)
mi_simplicity_alpha = mi

# Conclusão:
print(paste0("Há uma confiança de 99% em aceitar que a média amostral é superior a  ", mi_simplicity_alpha))

###################################### Inductive Miner

# Amostra original 
amostra = inductive

# Tamanho da reamostragem é metade do tamanho original da amostra considerada
n=length(amostra)/2
xb0 = mean(amostra)

# Hipóteses iniciais:
# H0: mi = xb0
# HA: mi > xb0

mi=xb0
E=c()
s0=sd(amostra)
XB=c(xb0)
pvalue = 1
i = 1

while(pvalue >=alfa){
  
  ## Simulação Bootstrap não-paramétrico
  for(u in 1:N){
    amostrau=sample(amostra,n,replace=TRUE)
    xbu=mean(amostrau)
    XB[u+1]=xbu
    ## Cálculo e armazenamento da estatística para cada exemplo simulado
    ## O desvio padrão altera significativamnte conforme o aumento do número de exemplos simulados
    E[u]=(xbu-mi)/sd(XB)
  }
  
  ## Estatística da amostra original
  Est=(xb0-mi)/(s0/sqrt(2*n))
  
  ## Calculo do p-valor pela quantidade de casos positivos dividido pela quanidade de reamostragem total
  pvalue=sum(E>Est)/N #
  
  print(paste0("(", i, ") p-value: ",  pvalue))
  i = i + 1
  
  mi = mi - 0.001
}

hist(E, breaks=40)


# Média da amostra original
simplicity_mean_inductive = xb0
# Desvio padrão da amostra original
simplicity_sd_inductive = s0
# Média do teste de hipóteses do erro tipo I (alfa = 0.01)
mi_simplicity_inductive = mi

# Conclusão:
print(paste0("Há uma confiança de 99% em aceitar que a média amostral é superior a  ", mi_simplicity_inductive))

###################################### Heuristics Miner


# Amostra original 
amostra = heuristics

# Tamanho da reamostragem é metade do tamanho original da amostra considerada
n=length(amostra)/2
xb0 = mean(amostra)

# Hipóteses iniciais:
# H0: mi = xb0
# HA: mi > xb0

mi=xb0
E=c()
s0=sd(amostra)
XB=c(xb0)
pvalue = 1
i = 1

while(pvalue >=alfa){
  
  ## Simulação Bootstrap não-paramétrico
  for(u in 1:N){
    amostrau=sample(amostra,n,replace=TRUE)
    xbu=mean(amostrau)
    XB[u+1]=xbu
    ## Cálculo e armazenamento da estatística para cada exemplo simulado
    ## O desvio padrão altera significativamnte conforme o aumento do número de exemplos simulados
    E[u]=(xbu-mi)/sd(XB)
  }
  
  ## Estatística da amostra original
  Est=(xb0-mi)/(s0/sqrt(2*n))
  
  ## Calculo do p-valor pela quantidade de casos positivos dividido pela quanidade de reamostragem total
  pvalue=sum(E>Est)/N #
  
  print(paste0("(", i, ") p-value: ",  pvalue))
  i = i + 1
  
  mi = mi - 0.001
}

hist(E, breaks=40)


# Média da amostra original
simplicity_mean_heuristics = xb0
# Desvio padrão da amostra original
simplicity_sd_heuristics = s0
# Média do teste de hipóteses do erro tipo I (alfa = 0.01)
mi_simplicity_heuristics = mi

# Conclusão:
print(paste0("Há uma confiança de 99% em aceitar que a média amostral é superior a  ", mi_simplicity_heuristics))

####################  GENERALIZATION ##########################

alpha = GD_alpha$Generalization
inductive = GD_inductive$Generalization
heuristics = GD_heuristics$Generalization

###################################### Alpha Miner

# Amostra original 
amostra = alpha

# Tamanho da reamostragem é metade do tamanho original da amostra considerada
n=length(amostra)/2
xb0 = mean(amostra)

# Hipóteses iniciais:
# H0: mi = xb0
# HA: mi > xb0

mi=xb0
E=c()
s0=sd(amostra)
XB=c(xb0)
pvalue = 1
i = 1

while(pvalue >=alfa){
  
  ## Simulação Bootstrap não-paramétrico
  for(u in 1:N){
    amostrau=sample(amostra,n,replace=TRUE)
    xbu=mean(amostrau)
    XB[u+1]=xbu
    ## Cálculo e armazenamento da estatística para cada exemplo simulado
    ## O desvio padrão altera significativamnte conforme o aumento do número de exemplos simulados
    E[u]=(xbu-mi)/sd(XB)
  }
  
  ## Estatística da amostra original
  Est=(xb0-mi)/(s0/sqrt(2*n))
  
  ## Calculo do p-valor pela quantidade de casos positivos dividido pela quanidade de reamostragem total
  pvalue=sum(E>Est)/N #
  
  print(paste0("(", i, ") p-value: ",  pvalue))
  i = i + 1
  
  mi = mi - 0.001
}

hist(E, breaks=40)


# Média da amostra original
generalization_mean_alpha = xb0
# Desvio padrão da amostra original
generalization_sd_alpha = s0
# Média do teste de hipóteses do erro tipo I (alfa = 0.01)
mi_generalization_alpha = mi

# Conclusão:
print(paste0("Há uma confiança de 99% em aceitar que a média amostral é superior a  ", mi_generalization_alpha))

###################################### Inductive Miner

# Amostra original 
amostra = inductive

# Tamanho da reamostragem é metade do tamanho original da amostra considerada
n=length(amostra)/2
xb0 = mean(amostra)

# Hipóteses iniciais:
# H0: mi = xb0
# HA: mi > xb0

mi=xb0
E=c()
s0=sd(amostra)
XB=c(xb0)
pvalue = 1
i = 1

while(pvalue >=alfa){
  
  ## Simulação Bootstrap não-paramétrico
  for(u in 1:N){
    amostrau=sample(amostra,n,replace=TRUE)
    xbu=mean(amostrau)
    XB[u+1]=xbu
    ## Cálculo e armazenamento da estatística para cada exemplo simulado
    ## O desvio padrão altera significativamnte conforme o aumento do número de exemplos simulados
    E[u]=(xbu-mi)/sd(XB)
  }
  
  ## Estatística da amostra original
  Est=(xb0-mi)/(s0/sqrt(2*n))
  
  ## Calculo do p-valor pela quantidade de casos positivos dividido pela quanidade de reamostragem total
  pvalue=sum(E>Est)/N #
  
  print(paste0("(", i, ") p-value: ",  pvalue))
  i = i + 1
  
  mi = mi - 0.001
}

hist(E, breaks=40)


# Média da amostra original
generalization_mean_inductive = xb0
# Desvio padrão da amostra original
generalization_sd_inductive = s0
# Média do teste de hipóteses do erro tipo I (alfa = 0.01)
mi_generalization_inductive = mi

# Conclusão:
print(paste0("Há uma confiança de 99% em aceitar que a média amostral é superior a  ", mi_generalization_inductive))

###################################### Heuristics Miner


# Amostra original 
amostra = heuristics

# Tamanho da reamostragem é metade do tamanho original da amostra considerada
n=length(amostra)/2
xb0 = mean(amostra)

# Hipóteses iniciais:
# H0: mi = xb0
# HA: mi > xb0

mi=xb0
E=c()
s0=sd(amostra)
XB=c(xb0)
pvalue = 1
i = 1

while(pvalue >=alfa){
  
  ## Simulação Bootstrap não-paramétrico
  for(u in 1:N){
    amostrau=sample(amostra,n,replace=TRUE)
    xbu=mean(amostrau)
    XB[u+1]=xbu
    ## Cálculo e armazenamento da estatística para cada exemplo simulado
    ## O desvio padrão altera significativamnte conforme o aumento do número de exemplos simulados
    E[u]=(xbu-mi)/sd(XB)
  }
  
  ## Estatística da amostra original
  Est=(xb0-mi)/(s0/sqrt(2*n))
  
  ## Calculo do p-valor pela quantidade de casos positivos dividido pela quanidade de reamostragem total
  pvalue=sum(E>Est)/N #
  
  print(paste0("(", i, ") p-value: ",  pvalue))
  i = i + 1
  
  mi = mi - 0.001
}

hist(E, breaks=40)


# Média da amostra original
generalization_mean_heuristics = xb0
# Desvio padrão da amostra original
generalization_sd_heuristics = s0
# Média do teste de hipóteses do erro tipo I (alfa = 0.01)
mi_generalization_heuristics = mi

# Conclusão:
print(paste0("Há uma confiança de 99% em aceitar que a média amostral é superior a  ", mi_generalization_heuristics))



# Armazenamento dos resultados em arquivo .csv
name = c("Alpha Miner", "Inductive Miner", "Heuristics Miner")

fitness_mean <- c(fitness_mean_alpha, fitness_mean_inductive, fitness_mean_heuristics)
precision_mean <- c(precision_mean_alpha, precision_mean_inductive, precision_mean_heuristics)
simplicity_mean <- c(simplicity_mean_alpha, simplicity_mean_inductive, simplicity_mean_heuristics)
precision_mean <- c(precision_mean_alpha, precision_mean_inductive, precision_mean_heuristics)
generalization_mean <- c(generalization_mean_alpha, generalization_mean_inductive, generalization_mean_heuristics)

fitness_sd <- c(fitness_sd_alpha, fitness_sd_inductive, fitness_sd_heuristics)
precision_sd <- c(precision_sd_alpha, precision_sd_inductive, precision_sd_heuristics)
simplicity_sd <- c(simplicity_sd_alpha, simplicity_sd_inductive, simplicity_sd_heuristics)
precision_sd <- c(precision_sd_alpha, precision_sd_inductive, precision_sd_heuristics)
generalization_sd <- c(generalization_sd_alpha, generalization_sd_inductive, generalization_sd_heuristics)

fitness_alfa <- c(mi_fitness_alpha, mi_fitness_inductive, mi_fitness_heuristics)
precision_alfa <- c(mi_precision_alpha, mi_precision_inductive, mi_precision_heuristics)
simplicity_alfa <- c(mi_simplicity_alpha, mi_simplicity_inductive, mi_simplicity_heuristics)
generalization_alfa <- c(mi_generalization_alpha, mi_generalization_inductive, mi_generalization_heuristics)

df <- data.frame(name, fitness_mean, precision_mean, simplicity_mean, generalization_mean, fitness_sd, precision_sd, simplicity_sd, generalization_sd, fitness_alfa, precision_alfa, simplicity_alfa, generalization_alfa)

print (df)

write.csv(df, "C:\\Users\\julia\\CLEMATIS\\PD_Teste_Hipoteses.csv", row.names=FALSE)