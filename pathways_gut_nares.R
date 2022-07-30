library(readxl)
library(circlize)
pathways_nares_gut <- read_excel("pathways_nares_gut.xlsx")
pathways_nares_gut = as.data.frame(pathways_nares_gut)
rownames(pathways_nares_gut) = pathways_nares_gut[,1]
pathways_nares_gut[,1] = NULL
pathways_nares_gut = as.matrix(pathways_nares_gut)
pathways_nares_gut = t(pathways_nares_gut)

circos.par(start.degree = 90,track.margin = c(0.01, 0.05),
           track.height = 0.05,
           gap.after = c(rep(3, nrow(pathways_nares_gut)-1), 20, "Parkinson's disease"=2,
                         "Cardiac muscle contraction"=2,"Colorectal cancer"=2,
                         "Influenza A"=2,"p53 signaling"=2,
                         "Small cell lung cancer"=2,"Toxoplasmosis"=2,
                         "Viral myocarditis"=2,"alpha-Linolenic acid metabolism"=2,
                         "Mineral absorption"=2,"RIG-I-like receptor signaling"=2,
                         "Membrane and intracellular structural molecules"=2,
                         "Bacterial motility proteins"=2,
                         "Lipopolysaccharide biosynthesis proteins"=2,
                         "Lipid metabolism"=2,
                         "Lipopolysaccharide biosynthesis"=2,"Huntington's disease"=2,
                         "Glycan biosynthesis and metabolism"=2,
                         "MAPK signaling pathway - yeast"=2,
                         "Nitrotoluene degradation"=2,
                         "Pertussis"=2,"Apoptosis"=2,"Endocytosis"=2,
                         "Fc gamma R-mediated phagocytosis"=2,
                         "GnRH signaling"=2,"Secondary bile acid biosynthesis"=2,
                         "Protein digestion and absorption"=2,
                         "Bile secretion"=2,
                         "Various types of N-glycan biosynthesis"=2,
                         "Biosynthesis of type II polyketide products"=2,
                         "DDT degradation"=20,
                         "Gut"=10,"Nasal_cavity"=20))
                         




grid.col = c("Parkinson's disease"="grey","Cardiac muscle contraction"="grey",
             "Colorectal cancer"="grey","Influenza A"="grey","p53 signaling"="grey",
             "Small cell lung cancer"="grey","Toxoplasmosis"="grey",
             "Viral myocarditis"="grey","alpha-Linolenic acid metabolism"="grey",
             "Mineral absorption"="grey","RIG-I-like receptor signaling"="grey",
             "Membrane and intracellular structural molecules"="grey",
             "Bacterial motility proteins"="grey",
             "Lipopolysaccharide biosynthesis proteins"="grey","Lipid metabolism"="grey",
             "Lipopolysaccharide biosynthesis"="grey","Huntington's disease"="grey",
             "Glycan biosynthesis and metabolism"="grey",
             "MAPK signaling pathway - yeast"="grey",
             "Nitrotoluene degradation"="grey","Pertussis"="grey",
             "Apoptosis"="grey","Endocytosis"="grey",
             "Fc gamma R-mediated phagocytosis"="grey",
             "GnRH signaling"="grey",
             "Secondary bile acid biosynthesis"="grey",
             "Protein digestion and absorption"="grey", "Bile secretion"="grey",
             "Various types of N-glycan biosynthesis"="grey",
             "Biosynthesis of type II polyketide products"="grey",
             "DDT degradation"="grey")



#col_fun = function(x) ifelse(x > 0, "red", "blue")

#1                        
#chordDiagram(pathways_nares_gut, col = col_fun, grid.col = grid.col, 
            # directional = 1, annotationTrack = c("name", "grid"),
            # annotationTrackHeight = c(0.09, 0.04))

#2
chordDiagram(pathways_nares_gut, grid.col = grid.col, 
             annotationTrack = "grid",
             annotationTrackHeight = c(0.05, 0.04),preAllocateTracks=2.5)



circos.trackPlotRegion(track.index = 2, panel.fun = function(x, y) {
  xlim = get.cell.meta.data("xlim")
  ylim = get.cell.meta.data("ylim")
  sector.name = get.cell.meta.data("sector.index")
  circos.text(mean(xlim), ylim[1] + .1, sector.name, facing = "clockwise", niceFacing = TRUE, adj = c(0, 0.5), col = "black", cex = 0.8)
}, bg.border = NA)

circos.clear()
