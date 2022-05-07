library(bibliometrix)
library(openxlsx)

M1 = convert2df("savedrecs.bib", dbsource = "wos", format = "bibtex")
M2 = convert2df("scopus.bib", dbsource = "scopus", format = "bibtex")

M = bibliometrix::mergeDbSources(M1, M2, remove.duplicated = TRUE)
write.xlsx(M, "selectedPapers.xlsx")
biblioshiny()

61 + 44 -39
