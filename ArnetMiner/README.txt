
1-Run network_graph_similarity.R in R_training folder to genarate ad_matrix_training.csv, invlogweighted_train.csv,
Jaccard_train.csv, dice_train.csv needed as an arguments/inputs to main.py program
2- Similarly, run network_graph_similarity.R in R_testing folder to genarate ad_matrix_testing.csv, invlogweighted_test.csv,
Jaccard_test.csv, dice_test.csv needed as an arguments to main program
3- Run utilities.py to profuce co_author_Affiliations_train.csv, co_author_R_intersts_train.csv, co_author_Affiliations_test.csv and co_author_R_intersts_test.csv needed as
arguments/inputs to aff_similarity.R and rs_similarity.R in R_training and R_testing folders respectively.
4- run aff_similarity.R and rs_similarity.R in R_training folder to produce cos_sim_RS_train.csv and cos_sim_aff_train.csv needed as
argumenta/inputs to main.py
5- simlarly run aff_similarity.R and rs_similarity.R in R_testing folder to produce cos_sim_RS_test.csv and cos_sim_aff_test.csv needed as
argumenta/inputs to main.py
6-run main.py that used all inputs from previous steps.
7-remove the previous steps when using large connected components on the graph of half of  ArnetMiner and dblP datasets produced by largest_connected_component.R 

Note:

In steps from 1 to 7, we get the coauthos data for training and testing by reading the information of the 1st 5000 authors
in AMiner_Author_50000.txt. However, if we need to work on half of ArnetMiner and dblp datasets, we to consider the all or half of authors in
AMiner_Author.txt
