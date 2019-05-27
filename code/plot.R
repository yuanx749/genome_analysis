# Put the table*.csv files in the same directory of this script

table1 <- read.csv(file = "table1.csv", header = TRUE, sep = ",")
table2 <- read.csv(file = "table2.csv", header = TRUE, sep = ",")
res <- read.csv(file = "table4.csv", header = TRUE, sep = ",", row.names = 1)

# Upregualations in mineral
plot.new()
with(res, plot(log2FoldChange, -log10(padj),
  pch = 20, xaxt = "n",
  main = "Volcano plot", xlab = expression(log[2](FoldChange)), ylab = expression(-log[10](padj))
))
axis(1, xaxp = c(-5, 5, 4))
abline(v = 0, col = "black", lty = 2)
abline(v = -2.5, col = "black", lty = 2)
abline(v = 2.5, col = "black", lty = 2)
abline(h = -log10(0.05), col = "black", lty = 3)
genes1 <- union(
  subset(table1, Category == "Chemotaxis", select = ID)$ID,
  subset(table2, Category == "Chemotaxis", select = ID)$ID
)
genes2 <- union(
  subset(table1, Category == "Metal resistance", select = ID)$ID,
  subset(table2, Category == "Metal resistance", select = ID)$ID
)
genes3 <- union(
  subset(table1, Category == "Motility", select = ID)$ID,
  subset(table2, Category == "Motility", select = ID)$ID
)
genes4 <- union(
  subset(table1, Category == "Polysaccharide", select = ID)$ID,
  subset(table2, Category == "Polysaccharide", select = ID)$ID
)
with(res[genes4, ], points(log2FoldChange, -log10(padj), pch = 20, col = "violet", cex = 1.5))
with(res[genes3, ], points(log2FoldChange, -log10(padj), pch = 20, col = "yellow", cex = 1.5))
with(res[genes2, ], points(log2FoldChange, -log10(padj), pch = 20, col = "orange", cex = 1.5))
with(res[genes1, ], points(log2FoldChange, -log10(padj), pch = 20, col = "red", cex = 1.5))
legend("top",
  legend = c("Chemotaxis", "Metal resistance", "Motility", "Polysaccharide"),
  col = c("red", "orange", "yellow", "violet"), pch = 16
)
mtext("mineral", side = 1, line = 3, at = -5)
mtext("continuous", side = 1, line = 3, at = 5)

# Downregulations in mineral
plot.new()
with(res, plot(log2FoldChange, -log10(padj),
  pch = 20, xaxt = "n",
  main = "Volcano plot", xlab = expression(log[2](FoldChange)), ylab = expression(-log[10](padj))
))
axis(1, xaxp = c(-5, 5, 4))
abline(v = 0, col = "black", lty = 2)
abline(v = -2.5, col = "black", lty = 2)
abline(v = 2.5, col = "black", lty = 2)
abline(h = -log10(0.05), col = "black", lty = 3)
genes5 <- union(
  subset(table1, Category == "ATP synthase", select = ID)$ID,
  subset(table2, Category == "ATP synthase", select = ID)$ID
)
genes6 <- union(
  subset(table1, Category == "Carbon fixation", select = ID)$ID,
  subset(table2, Category == "Carbon fixation", select = ID)$ID
)
genes7 <- union(
  subset(table1, Category == "Oxidative stress response", select = ID)$ID,
  subset(table2, Category == "Oxidative stress response", select = ID)$ID
)
with(res[genes7, ], points(log2FoldChange, -log10(padj), pch = 20, col = "purple", cex = 2))
with(res[genes6, ], points(log2FoldChange, -log10(padj), pch = 20, col = "blue", cex = 1.5))
with(res[genes5, ], points(log2FoldChange, -log10(padj), pch = 20, col = "green", cex = 1.5))
legend("top",
  legend = c("ATP synthase", "Carbon fixation", "Oxidative stress response"),
  col = c("green", "blue", "purple"), pch = 16
)
mtext("mineral", side = 1, line = 3, at = -5)
mtext("continuous", side = 1, line = 3, at = 5)
