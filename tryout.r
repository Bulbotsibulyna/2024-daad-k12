#BiocManager::install("biomaRt", type = "source")
library(biomaRt)
library(data.table)

de_tab <- read.csv("c:\\Users\\Sasha\\Documents\\R\\2024-daad-k12\\DESeq2-results-sorted.csv")
genes <- unique(de_tab$X) 
genes <- sub("\\..*", "", de_tab$X)

de_tab$X <- genes
genes_l <- list(genes)
genes
ensembl <- useMart("ensembl", dataset = "mmusculus_gene_ensembl", host = "https://www.ensembl.org")
genes_ids <- getBM(filters = "ensembl_gene_id",
               attributes = c("external_gene_name","ensembl_gene_id"),
               values = genes,
               mart = ensembl)
print(genes_ids)