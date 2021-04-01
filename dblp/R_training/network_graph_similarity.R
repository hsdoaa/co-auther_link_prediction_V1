install.packages("igraph")
install.packages("reshape2")
install.packages("linkprediction")
library(igraph)
library(MASS)
#<-read.table("weighted_coauthor_edge_list10000.csv", header=FALSE,sep=",")


e3<-read.csv(file="train_dataset.csv", header=FALSE) # read  the 'co-authership per year 1990 from 1990.csv file
typeof(e3)
#G<-graph.adjacency(e3)
e3[,1]<-as.character(e3[,1]) 
e3[,2]<-as.character(e3[,2])


e3<-as.matrix(e3)


g<-graph.edgelist(e3[,1:2],directed=FALSE)
typeof(g)
V(g)
train_nodes<-V(g)$name# To get node names
write.matrix(train_nodes,file="train_nodes_ArnetMiner.txt") #To retrieve the names of all the vertices in the graph g
ad_matrix_training<-get.adjacency(g,sparse=FALSE)
#write.matrix(ad_matrix_training,file="ad_matrix_training.txt")
write.matrix(ad_matrix_training,file="ad_matrix_training.csv",sep = ",")

library(reshape2) # To import melt function
x_train<-melt(ad_matrix_training) # melt to create an edge list from the matrix ad_matrix_tesing
write.matrix(x_train,file="edge_list_train.txt")



#reading testing data
#et<-read.csv(file="coauthor_testing.csv", header=FALSE)


#et[,1]<-as.character(et[,1]) 
#et[,2]<-as.character(et[,2])
#et<-as.matrix(et)


#gt<-graph.edgelist(et[,1:2],directed=FALSE)
#typeof(gt)
#V(gt)
#test_nodes<-V(gt)$name  #to retrieve the names of all the vertices in graph gt
#write.matrix(test_nodes,file="test_nodes_ArnetMiner.txt")  
#ad_matrix_testing<-get.adjacency(gt,sparse=FALSE)
#write.matrix(ad_matrix_testing,file="ad_matrix_testing.txt")

#library(reshape2) # To import melt function
#x_test<-melt(ad_matrix_testing) # melt to create an edge list from the matrix ad_matrix_tesing
#write.matrix(x_test,file="edge_list_test_labe.txt")

####E(g)$weight<-as.numeric(e3[,3])
#####layout <- layout.reingold.tilford(g, circular=T)
#####plot(g, layout=layout,edge.width=E(g)$weight)


#TO get the weighted adjacency matrix from the network:
#ad_matrix<-get.adjacency(g,attr ='weight',sparse=FALSE) #attr='weight' makes sure that the weights are shown in the adjacency matrix.
#ad_matrix<-get.adjacency(g,sparse=FALSE) #for sparse, make sparse=TRUE attr='weight' makes sure that the weights are shown in the adjacency matrix.
##library(MASS)
#write.matrix(ad_matrix,file="ad_matrix.txt")

#library(reshape2) # To import melt function
#x<-melt(ad_matrix) # melt to create an edge list from the matrix ad_matrix, Please refer to:
# https://stackoverflow.com/questions/13204046/how-to-create-an-edge-list-from-a-matrix-in-r
#x1<-x$Var1
#y<-x$Var2
#z<-x$value
#to write adjacancy matrix to a text file
#library(MASS)
#write.matrix(ad_matrix,file="ad_matrix.txt")
#write.matrix(x,file="edge_list_traing_labe.txt")
#write.matrix(x1,file="var1_edge_list.txt")
#write.matrix(y,file="var2_edge_list.txt")
#write.matrix(z,file="value_edge_list.txt")
#ad_matrix[0,]


options(max.print=999999)


#calculate similarity scores for each two vertices using jaccard network topology feature
jaccard<-similarity.jaccard(g, vids = V(g), mode = c("all", "out", "in","total"), loops = FALSE)
# to write output jaccard to CSV file
write.table(jaccard, file = "jaccard_train.csv",row.names=FALSE, na="",col.names=FALSE, sep=",")

#==========================================================================================
#library(reshape2) # To import melt function
#xj<-melt(jaccard) # melt to create an edge list from the matrix jaccard, Please refer to:
# https://stackoverflow.com/questions/13204046/how-to-create-an-edge-list-from-a-matrix-in-r
#x11<-xj$Var1
#yj<-xj$Var2
#zj<-xj$value
#to write adjacancy matrix to a text file
#library(MASS)
#write.matrix(jaccard,file="jaccard.txt")
#write.matrix(xj,file="edge_list_j.txt")
#write.matrix(x11,file="var1_edge_list_j.txt")
#write.matrix(yj,file="var2_edge_list_j.txt")
#write.matrix(zj,file="value_edge_list_j.txt")
#jaccard[0,]

#=====================================================================================

#calculate similarity scores for each two vertices using invlogweighted method 
invlogweighted<-similarity.invlogweighted(g, vids = V(g), mode = c("all", "out", "in", "total"))
# to write output invlogweighted to CSV file
write.table(invlogweighted, file = "invlogweighted_train.csv",row.names=FALSE, na="",col.names=FALSE, sep=",")


#calculate similarity scores for each two vertices using dice method 
dice<-similarity.dice(g, vids = V(g), mode = c("all", "out", "in","total"), loops = FALSE)
# to write output dice to CSV file
write.table(dice, file = "dice_train.csv",row.names=FALSE, na="",col.names=FALSE, sep=",")


