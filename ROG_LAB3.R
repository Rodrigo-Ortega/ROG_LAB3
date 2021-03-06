# Hecho con gusto por Rodrigo Ortega Garc�a

# T1_03_ESPACIO PRODUCTO(2) - RELACIONAMIENTO "CASO REAL": EXPORTACIONES HIDALGUENSES

# Objetivo: Estimar el relacionamiento (relatedness, proximidad, m�trica de distancia entre productos)
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz de datos
# 2. Calcular co ocurrencias entre lugares y productos 
# 3. Estimar el relacionamiento, teniendo como input las co ocurrencias
# 4. Graficar
# 5. Exportar los resultados para trabajarlos con cytoscape o gephi

#######################################
# practica 2: exportaciones hidalguenses #
#######################################
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
# estima el relacionamiento o proximidad pero normalizado, para asegurar que el numero de co ocurrencias que observamos
# es mayor al numero de co ocurrencias probables (probailidad condicional)
#tie and Surfboard puede que no esten tan relacionados, abajo de  1 no es relacionado mientras que mayor a 1 si es relacionado

#opcional (s�lo para trabajar con datos binarios)
r[r<1] = 0
r[r>1] = 1
r
library (igraph)
g1=graph_from_adjacency_matrix(r,mode="undirected")
plot(g1)
#exportar resultados del relacionamiento binario
write.csv(r,file = "relatedness.csv")
write.csv(C,file = "coocurrences.csv")