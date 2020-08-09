library(EconGeo)
M = as.matrix(
  read.csv("C:/Users/turismo/Dropbox/DCEA/4to. Semestre/Ciencia de datos/Documentos para laboratorios/LAB3/rca_2014.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))
head (M[,1:10])
dim (M)
co.occurrence(M)
# co-ocurrencia entre personas/paises/estados
C=co.occurrence(t(M))
# co-ocurrencia entre productos t es transpuesta
C
r
r[r<1] = 0
r[r>1] = 1
r
library (igraph)
g1=graph_from_adjacency_matrix(r,mode="undirected")
plot(g1)
#exportar resultados del relacionamiento binario
write.csv(r,file = "relatedness.csv")
write.csv(C,file = "coocurrences.csv")