library(ComplexHeatmap)
library(circlize)
library(readr)
library(RColorBrewer)
deseq2_heatmap_nares <- read_csv("D:/Masters material/thesis/requirements for download 16s biom/gut/stamp_input/conference_data/deseq2_heatmap_nares.csv")
#deseq2_heatmap_nares <- read_csv("deseq2_heatmap_gut.csv")
#coul <- c("#66C2A5","#FC8D62")
#hn = HeatmapAnnotation(Pathway_type = colnames(deseq2_heatmap_nares), annotation_name_side = "left", col = list(Sample_type= c("Prediabetic" = "#66C2A5", "Control" = "#FC8D62")))
#Pathway_type = final_common_FDR$`kegg pathway map`
x = deseq2_heatmap_nares$...1
deseq2_heatmap_nares[,1] = NULL
rownames(deseq2_heatmap_nares) = x
deseq2_heatmap_nares = as.matrix(deseq2_heatmap_nares)
mat = t(deseq2_heatmap_nares)


f1 = colorRamp2(seq(min(mat), max(mat), length = 3), c("blue", "red", "yellow"))
Heatmap(mat, rect_gp = gpar(col = "grey", lwd = 2),
        column_names_gp = gpar(fontsize = 8), row_names_gp = gpar(fontface = "bold", fontsize= 9), 
        heatmap_legend_param = list(title = "Enrichment", legend_height = unit(4, "cm")), 
        col = f1, width = ncol(mat)*unit(0.5, "cm"), 
        height = nrow(mat)*unit(1, "cm"), cluster_rows = FALSE,
        clustering_distance_columns = "euclidean",
        clustering_method_columns = "complete")
