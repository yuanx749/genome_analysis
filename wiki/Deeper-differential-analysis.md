# Deeper analysis of the differential expression results
After grouping genes into functional categories, we can investigate the differential expression of RNA transcripts in each systems between continuous and mineral cultures, and compare with the results in the paper.

Here is a [table](/res/table4.csv) with columns of predicted gene names for specific inspection.

Volcano plot combines the statistical significance and the magnitude of change for visual identification of meaningful points. The horizontal dashed line shows adjusted p values equals to 0.05 with points above having padj < 0.05.

![volcano1](/res/Rplot3.png)

We can expect that in bioleaching experiments, genes in metal resistance, chemotaxis and motility systems are upregulated. The plot reveals significant increased level of RNA counts from these genes in mineral culture, especially in motility system. In the paper, large negative log2 fold change values are also observed in these genes.

![volcano2](/res/Rplot4.png)

Among the differences observed between continuous and bioleaching cultures, some systems shows slightly increased level of transcripts counts in continuous cultures and decreased counts in mineral cultures. The downregulation of genes related to ATP synthesis in mineral sample possibly indicates a shift of electron transport away from ATP generation. The reduction of level of transcripts involving carbon fixation pathways could indicate reduced demand of organic carbon, which could be caused by redistribution of more resource for cell maintenance under stress conditions, leading to slow growth rather than active growth in continuous cultures.

It is surprising that genes relate to oxidative stress response exhibit more transcript counts in continuous culture than mineral culture, since they are supposed to mitigate the damage of ROS produced at mineral surface.

The results above are all consistent with the results from the paper.

![paper](/res/zam0031882910004.jpg)