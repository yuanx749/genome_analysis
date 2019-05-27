library(DESeq2)
library(gplots)

directory <- "~/genome_analysis/analyses/05_rna_mapping/03-htseq/"
sampleNames <- c("continuous_29", "continuous_30", "mineral_31", "mineral_32", "continuous_33")
sampleFiles <- grep(".txt", list.files(directory), value = TRUE)
sampleCondition <- c("continuous", "continuous", "mineral", "mineral", "continuous")
sampleTable <- data.frame(sampleName = sampleNames, fileName = sampleFiles, condition = sampleCondition)
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, directory = directory, design = ~condition)
ddsHTSeq$condition <- factor(ddsHTSeq$condition, levels = c("mineral", "continuous"))
dds <- DESeq(ddsHTSeq)
res <- results(dds)
rld <- rlog(dds)
write.csv(res, file = "table3.csv")

topPadjGenes <- head(order(res$padj), 15)
heatmap.2(assay(rld)[topPadjGenes, ],
  scale = "row", trace = "none", dendrogram = "row",
  col = redblue(255), key = TRUE, margins = c(8, 10), cexCol = 1.2, srtCol = 45, main = "Genes with largest padj"
)
topLfcGenes <- head(order(abs(res$log2FoldChange), decreasing = TRUE), 15)
heatmap.2(assay(rld)[topLfcGenes, ],
  scale = "row", trace = "none", dendrogram = "row",
  col = redblue(255), key = TRUE, margins = c(8, 10), cexCol = 1.2, srtCol = 45, main = "Genes with largest absolute log2foldchange"
)
