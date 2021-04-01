How to run python and R code in ArnetMiner folder: 

1-Run network_graph_similarity.R in R_training folder to genarate the adjacent matrix ad_matrix_training.csv from the graph and three type of similairty features between each two nodes in the train network graph: invlogweighted, Jaccard, and dice that are stored in the following csv files repectively:

-invlogweighted_train.csv

-Jaccard_train.csv 

-dice_train.csv

Those files are needed as an arguments/inputs to main.py script

2- Similarly, run network_graph_similarity.R in R_testing folder to genarate the adjacent matrix ad_matrix_testing.csv from the graph and three type of similairty features between each two nodes in the test network graph: invlogweighted, Jaccard, and dice that are stored in the following csv files repectively:

-invlogweighted_test.csv

-Jaccard_test.csv 

-dice_test.csv 

Those files are needed as an arguments to main.py script.
3- Run main.py to profuce co_author_Affiliations_train.csv, co_author_R_intersts_train.csv, co_author_Affiliations_test.csv and co_author_R_intersts_test.csv needed as
arguments/inputs to aff_similarity.R and rs_similarity.R in R_training and R_testing folders respectively.
4- run aff_similarity.R and rs_similarity.R in R_training folder to produce cos_sim_RS_train.csv and cos_sim_aff_train.csv needed as
argumenta/inputs to main.py
5- simlarly run aff_similarity.R and rs_similarity.R in R_testing folder to produce cos_sim_RS_test.csv and cos_sim_aff_test.csv needed as
argumenta/inputs to main.py
6-run main.py that used all inputs from previous steps.


Note:

In steps from 1 to 7, we get the coauthors data for training and testing by reading the information of the 1st 5000 authors
in AMiner_Author_50000.txt. However, if we need to work on half of ArnetMiner and dblp datasets, we to consider the all or half of authors in
AMiner_Author.txt
