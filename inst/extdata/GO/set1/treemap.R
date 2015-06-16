

# A treemap R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM

# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary
# setwd("C:/Users/username/workingdir");

# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","freqInDbPercent","abslog10pvalue","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0006366","transcription from RNA polymerase II promoter",3.963,6.1024,0.764,0.000,"transcription from RNA polymerase II promoter"),
c("GO:0009058","biosynthetic process",19.017,2.2668,0.929,0.112,"transcription from RNA polymerase II promoter"),
c("GO:0042787","protein ubiquitination involved in ubiquitin-dependent protein catabolic process",0.129,3.2147,0.871,0.205,"transcription from RNA polymerase II promoter"),
c("GO:1901360","organic cyclic compound metabolic process",25.430,2.8665,0.892,0.211,"transcription from RNA polymerase II promoter"),
c("GO:0006760","folic acid-containing compound metabolic process",0.128,4.2366,0.852,0.212,"transcription from RNA polymerase II promoter"),
c("GO:0046483","heterocycle metabolic process",24.799,3.0223,0.848,0.217,"transcription from RNA polymerase II promoter"),
c("GO:0007220","Notch receptor processing",0.031,2.1439,0.899,0.241,"transcription from RNA polymerase II promoter"),
c("GO:0071704","organic substance metabolic process",42.826,2.4908,0.914,0.246,"transcription from RNA polymerase II promoter"),
c("GO:0006807","nitrogen compound metabolic process",26.566,2.4597,0.923,0.251,"transcription from RNA polymerase II promoter"),
c("GO:0006474","N-terminal protein amino acid acetylation",0.013,3.1675,0.903,0.268,"transcription from RNA polymerase II promoter"),
c("GO:0042558","pteridine-containing compound metabolic process",0.154,3.4437,0.888,0.286,"transcription from RNA polymerase II promoter"),
c("GO:0044238","primary metabolic process",41.881,2.1232,0.915,0.318,"transcription from RNA polymerase II promoter"),
c("GO:0044237","cellular metabolic process",42.121,2.3605,0.868,0.319,"transcription from RNA polymerase II promoter"),
c("GO:0010467","gene expression",15.379,3.9586,0.865,0.332,"transcription from RNA polymerase II promoter"),
c("GO:0035335","peptidyl-tyrosine dephosphorylation",0.501,2.8386,0.862,0.350,"transcription from RNA polymerase II promoter"),
c("GO:0006725","cellular aromatic compound metabolic process",24.907,3.0132,0.848,0.359,"transcription from RNA polymerase II promoter"),
c("GO:0043170","macromolecule metabolic process",29.866,2.3915,0.888,0.376,"transcription from RNA polymerase II promoter"),
c("GO:0016072","rRNA metabolic process",0.219,3.3979,0.842,0.383,"transcription from RNA polymerase II promoter"),
c("GO:0043412","macromolecule modification",10.189,2.5045,0.875,0.408,"transcription from RNA polymerase II promoter"),
c("GO:0034660","ncRNA metabolic process",0.917,2.8861,0.832,0.452,"transcription from RNA polymerase II promoter"),
c("GO:0002138","retinoic acid biosynthetic process",0.021,2.3468,0.852,0.454,"transcription from RNA polymerase II promoter"),
c("GO:0010628","positive regulation of gene expression",2.987,4.9586,0.724,0.470,"transcription from RNA polymerase II promoter"),
c("GO:0031065","positive regulation of histone deacetylation",0.050,3.1675,0.743,0.516,"transcription from RNA polymerase II promoter"),
c("GO:0044260","cellular macromolecule metabolic process",25.627,2.5157,0.799,0.524,"transcription from RNA polymerase II promoter"),
c("GO:0043633","polyadenylation-dependent RNA catabolic process",0.003,2.2336,0.884,0.529,"transcription from RNA polymerase II promoter"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",13.670,4.3010,0.770,0.530,"transcription from RNA polymerase II promoter"),
c("GO:0060298","positive regulation of sarcomere organization",0.008,2.2336,0.717,0.557,"transcription from RNA polymerase II promoter"),
c("GO:0071043","CUT metabolic process",0.003,2.2336,0.884,0.567,"transcription from RNA polymerase II promoter"),
c("GO:0006139","nucleobase-containing compound metabolic process",24.258,2.6990,0.787,0.604,"transcription from RNA polymerase II promoter"),
c("GO:0006357","regulation of transcription from RNA polymerase II promoter",3.684,5.0000,0.661,0.613,"transcription from RNA polymerase II promoter"),
c("GO:0090304","nucleic acid metabolic process",15.268,2.8633,0.785,0.636,"transcription from RNA polymerase II promoter"),
c("GO:0034661","ncRNA catabolic process",0.026,3.2291,0.859,0.647,"transcription from RNA polymerase II promoter"),
c("GO:1901362","organic cyclic compound biosynthetic process",13.849,3.6778,0.813,0.678,"transcription from RNA polymerase II promoter"),
c("GO:0009086","methionine biosynthetic process",0.044,2.1858,0.845,0.681,"transcription from RNA polymerase II promoter"),
c("GO:0019438","aromatic compound biosynthetic process",13.512,4.1549,0.776,0.693,"transcription from RNA polymerase II promoter"),
c("GO:0018130","heterocycle biosynthetic process",13.553,4.1427,0.776,0.693,"transcription from RNA polymerase II promoter"),
c("GO:0034641","cellular nitrogen compound metabolic process",25.263,2.7033,0.805,0.697,"transcription from RNA polymerase II promoter"),
c("GO:0009987","cellular process",59.614,2.3915,0.998,0.000,"cellular process"),
c("GO:0023052","signaling",17.329,3.6778,0.995,0.000,"signaling"),
c("GO:0030097","hemopoiesis",1.659,6.2596,0.720,0.000,"hemopoiesis"),
c("GO:0010573","vascular endothelial growth factor production",0.071,4.0088,0.869,0.283,"hemopoiesis"),
c("GO:0002682","regulation of immune system process",21.361,2.1599,0.861,0.307,"hemopoiesis"),
c("GO:0048771","tissue remodeling",0.384,2.2652,0.857,0.332,"hemopoiesis"),
c("GO:0030278","regulation of ossification",0.401,3.0132,0.793,0.334,"hemopoiesis"),
c("GO:0001503","ossification",0.817,4.0000,0.848,0.361,"hemopoiesis"),
c("GO:0035282","segmentation",0.244,3.1079,0.801,0.384,"hemopoiesis"),
c("GO:0048708","astrocyte differentiation",0.138,3.0506,0.751,0.391,"hemopoiesis"),
c("GO:0070307","lens fiber cell development",0.038,2.7620,0.764,0.403,"hemopoiesis"),
c("GO:0034105","positive regulation of tissue remodeling",0.058,2.4486,0.801,0.422,"hemopoiesis"),
c("GO:0061008","hepaticobiliary system development",0.344,2.4413,0.795,0.428,"hemopoiesis"),
c("GO:0060711","labyrinthine layer development",0.120,3.8239,0.782,0.446,"hemopoiesis"),
c("GO:0035914","skeletal muscle cell differentiation",0.138,3.3565,0.744,0.452,"hemopoiesis"),
c("GO:0060137","maternal process involved in parturition",0.018,2.2336,0.879,0.457,"hemopoiesis"),
c("GO:0061061","muscle structure development",1.451,2.6364,0.799,0.459,"hemopoiesis"),
c("GO:0014032","neural crest cell development",0.144,2.2684,0.745,0.463,"hemopoiesis"),
c("GO:0007492","endoderm development",0.161,2.2381,0.829,0.468,"hemopoiesis"),
c("GO:0045595","regulation of cell differentiation",3.246,4.5850,0.631,0.472,"hemopoiesis"),
c("GO:0048514","blood vessel morphogenesis",1.146,5.0044,0.750,0.488,"hemopoiesis"),
c("GO:0001889","liver development",0.340,2.1831,0.785,0.493,"hemopoiesis"),
c("GO:0009790","embryo development",2.628,2.5800,0.760,0.503,"hemopoiesis"),
c("GO:0002520","immune system development",1.845,5.1249,0.751,0.517,"hemopoiesis"),
c("GO:0001822","kidney development",0.661,2.1675,0.772,0.529,"hemopoiesis"),
c("GO:0072602","interleukin-4 secretion",0.015,2.2336,0.824,0.537,"hemopoiesis"),
c("GO:0072359","circulatory system development",2.260,4.5086,0.755,0.537,"hemopoiesis"),
c("GO:0050793","regulation of developmental process",4.431,3.8861,0.730,0.541,"hemopoiesis"),
c("GO:0072148","epithelial cell fate commitment",0.039,2.7620,0.791,0.544,"hemopoiesis"),
c("GO:0045165","cell fate commitment",0.620,2.4510,0.765,0.546,"hemopoiesis"),
c("GO:0007292","female gamete generation",0.246,2.4078,0.855,0.551,"hemopoiesis"),
c("GO:0061053","somite development",0.224,3.2147,0.784,0.552,"hemopoiesis"),
c("GO:0042063","gliogenesis",0.620,2.2204,0.726,0.558,"hemopoiesis"),
c("GO:0051240","positive regulation of multicellular organismal process",1.418,2.8041,0.741,0.561,"hemopoiesis"),
c("GO:0009888","tissue development",4.199,3.6383,0.786,0.563,"hemopoiesis"),
c("GO:0035284","brain segmentation",0.003,2.2336,0.828,0.570,"hemopoiesis"),
c("GO:0010575","positive regulation vascular endothelial growth factor production",0.047,4.1549,0.798,0.579,"hemopoiesis"),
c("GO:0035283","central nervous system segmentation",0.003,2.2336,0.835,0.584,"hemopoiesis"),
c("GO:0009912","auditory receptor cell fate commitment",0.016,2.2336,0.773,0.609,"hemopoiesis"),
c("GO:0010842","retina layer formation",0.039,2.3468,0.798,0.614,"hemopoiesis"),
c("GO:0051145","smooth muscle cell differentiation",0.128,2.6364,0.782,0.630,"hemopoiesis"),
c("GO:0003273","cell migration involved in endocardial cushion formation",0.008,2.2336,0.770,0.640,"hemopoiesis"),
c("GO:0048646","anatomical structure formation involved in morphogenesis",2.581,4.4202,0.787,0.651,"hemopoiesis"),
c("GO:0002320","lymphoid progenitor cell differentiation",0.032,4.4559,0.761,0.654,"hemopoiesis"),
c("GO:0048513","organ development",7.380,4.0000,0.721,0.662,"hemopoiesis"),
c("GO:0002009","morphogenesis of an epithelium",1.119,2.9469,0.778,0.668,"hemopoiesis"),
c("GO:0048711","positive regulation of astrocyte differentiation",0.018,2.7620,0.688,0.678,"hemopoiesis"),
c("GO:0002328","pro-B cell differentiation",0.016,3.6990,0.771,0.682,"hemopoiesis"),
c("GO:2000027","regulation of organ morphogenesis",0.521,2.6402,0.706,0.686,"hemopoiesis"),
c("GO:0044707","single-multicellular organism process",15.092,2.1986,0.798,0.695,"hemopoiesis"),
c("GO:0048729","tissue morphogenesis",1.464,3.1938,0.777,0.697,"hemopoiesis"),
c("GO:0032364","oxygen homeostasis",0.010,2.3468,0.950,0.000,"oxygen homeostasis"),
c("GO:0055072","iron ion homeostasis",0.273,2.3307,0.936,0.504,"oxygen homeostasis"),
c("GO:0032501","multicellular organismal process",15.657,2.4413,0.995,0.000,"multicellular organismal process"),
c("GO:0032502","developmental process",13.055,3.3010,0.995,0.000,"developmental process"),
c("GO:0034504","protein localization to nucleus",0.653,2.8539,0.949,0.000,"protein localization to nucleus"),
c("GO:0046822","regulation of nucleocytoplasmic transport",0.368,2.8447,0.810,0.491,"protein localization to nucleus"),
c("GO:0010632","regulation of epithelial cell migration",0.213,2.8416,0.722,0.511,"protein localization to nucleus"),
c("GO:0051169","nuclear transport",0.833,2.3915,0.950,0.620,"protein localization to nucleus"),
c("GO:0050896","response to stimulus",47.248,5.2007,0.997,0.000,"response to stimulus"),
c("GO:0065007","biological regulation",51.216,7.0132,0.997,0.000,"biological regulation"),
c("GO:0008283","cell proliferation",4.075,5.4437,0.973,0.026,"cell proliferation"),
c("GO:0016265","death",4.501,3.7696,0.972,0.030,"death"),
c("GO:0007219","Notch signaling pathway",0.340,5.3372,0.790,0.047,"Notch signaling pathway"),
c("GO:0007154","cell communication",17.535,3.3872,0.877,0.117,"Notch signaling pathway"),
c("GO:1901888","regulation of cell junction assembly",0.093,2.1198,0.857,0.139,"Notch signaling pathway"),
c("GO:0042981","regulation of apoptotic process",3.144,5.1739,0.772,0.192,"Notch signaling pathway"),
c("GO:0030155","regulation of cell adhesion",0.746,3.0969,0.840,0.211,"Notch signaling pathway"),
c("GO:0042127","regulation of cell proliferation",3.148,4.3665,0.801,0.254,"Notch signaling pathway"),
c("GO:0007259","JAK-STAT cascade",0.253,2.8013,0.791,0.263,"Notch signaling pathway"),
c("GO:0048522","positive regulation of cellular process",8.548,6.0000,0.785,0.297,"Notch signaling pathway"),
c("GO:0071310","cellular response to organic substance",4.572,4.9586,0.768,0.306,"Notch signaling pathway"),
c("GO:0023014","signal transduction by phosphorylation",1.554,2.3116,0.733,0.370,"Notch signaling pathway"),
c("GO:0009967","positive regulation of signal transduction",2.348,4.0809,0.674,0.392,"Notch signaling pathway"),
c("GO:0045931","positive regulation of mitotic cell cycle",0.088,2.3152,0.815,0.417,"Notch signaling pathway"),
c("GO:0009750","response to fructose",0.015,2.2336,0.905,0.441,"Notch signaling pathway"),
c("GO:0048584","positive regulation of response to stimulus",22.389,3.4202,0.798,0.450,"Notch signaling pathway"),
c("GO:0007167","enzyme linked receptor protein signaling pathway",2.356,4.2924,0.744,0.467,"Notch signaling pathway"),
c("GO:0001866","NK T cell proliferation",0.007,2.2336,0.904,0.471,"Notch signaling pathway"),
c("GO:0008593","regulation of Notch signaling pathway",0.123,2.7852,0.791,0.510,"Notch signaling pathway"),
c("GO:0032570","response to progesterone",0.089,2.3872,0.880,0.519,"Notch signaling pathway"),
c("GO:0021873","forebrain neuroblast division",0.031,2.5421,0.751,0.532,"Notch signaling pathway"),
c("GO:0007165","signal transduction",16.054,6.0655,0.679,0.545,"Notch signaling pathway"),
c("GO:0010038","response to metal ion",0.636,2.5607,0.886,0.548,"Notch signaling pathway"),
c("GO:0001101","response to acid chemical",0.711,2.1035,0.887,0.556,"Notch signaling pathway"),
c("GO:0007169","transmembrane receptor protein tyrosine kinase signaling pathway",1.599,3.7959,0.755,0.558,"Notch signaling pathway"),
c("GO:0031663","lipopolysaccharide-mediated signaling pathway",0.122,2.1746,0.733,0.562,"Notch signaling pathway"),
c("GO:0032526","response to retinoic acid",0.239,2.0862,0.878,0.593,"Notch signaling pathway"),
c("GO:0042493","response to drug",1.179,2.4921,0.881,0.593,"Notch signaling pathway"),
c("GO:0046683","response to organophosphorus",0.335,3.8239,0.885,0.597,"Notch signaling pathway"),
c("GO:0051385","response to mineralocorticoid",0.088,2.2464,0.882,0.608,"Notch signaling pathway"),
c("GO:0021761","limbic system development",0.198,2.1051,0.784,0.621,"Notch signaling pathway"),
c("GO:0010646","regulation of cell communication",6.570,4.5850,0.762,0.631,"Notch signaling pathway"),
c("GO:0023051","regulation of signaling",6.570,4.6383,0.841,0.637,"Notch signaling pathway"),
c("GO:0035556","intracellular signal transduction",6.704,2.7670,0.714,0.640,"Notch signaling pathway"),
c("GO:1901698","response to nitrogen compound",2.084,3.5686,0.874,0.642,"Notch signaling pathway"),
c("GO:0043408","regulation of MAPK cascade",1.237,2.2565,0.659,0.655,"Notch signaling pathway"),
c("GO:0010810","regulation of cell-substrate adhesion",0.392,2.1945,0.846,0.664,"Notch signaling pathway"),
c("GO:0050679","positive regulation of epithelial cell proliferation",0.313,2.0851,0.793,0.666,"Notch signaling pathway"),
c("GO:0023057","negative regulation of signaling",2.197,3.3468,0.798,0.672,"Notch signaling pathway"),
c("GO:0010648","negative regulation of cell communication",2.203,3.5686,0.736,0.672,"Notch signaling pathway"),
c("GO:1901700","response to oxygen-containing compound",3.064,3.8539,0.869,0.679,"Notch signaling pathway"),
c("GO:0007166","cell surface receptor signaling pathway",8.919,6.4437,0.702,0.683,"Notch signaling pathway"),
c("GO:0023056","positive regulation of signaling",2.489,4.2676,0.814,0.683,"Notch signaling pathway"),
c("GO:0010647","positive regulation of cell communication",2.500,4.0315,0.720,0.684,"Notch signaling pathway"),
c("GO:0046427","positive regulation of JAK-STAT cascade",0.121,2.8729,0.744,0.688,"Notch signaling pathway"),
c("GO:0009968","negative regulation of signal transduction",2.090,3.5528,0.696,0.700,"Notch signaling pathway"),
c("GO:0000320","re-entry into mitotic cell cycle",0.007,2.2336,0.940,0.057,"re-entry into mitotic cell cycle"),
c("GO:0017145","stem cell division",0.089,2.2284,0.920,0.068,"stem cell division"),
c("GO:0071496","cellular response to external stimulus",0.549,3.7212,0.947,0.073,"cellular response to external stimulus"),
c("GO:0009612","response to mechanical stimulus",0.422,3.1549,0.938,0.557,"cellular response to external stimulus"),
c("GO:0010165","response to X-ray",0.096,2.7471,0.951,0.596,"cellular response to external stimulus"),
c("GO:0071260","cellular response to mechanical stimulus",0.133,3.0809,0.878,0.612,"cellular response to external stimulus"),
c("GO:0071214","cellular response to abiotic stimulus",0.450,2.7959,0.871,0.681,"cellular response to external stimulus"),
c("GO:0048585","negative regulation of response to stimulus",2.501,3.5686,0.829,0.089,"negative regulation of response to stimulus"),
c("GO:0009628","response to abiotic stimulus",2.264,2.4342,0.951,0.106,"negative regulation of response to stimulus"),
c("GO:0009719","response to endogenous stimulus",3.718,3.0757,0.948,0.113,"negative regulation of response to stimulus"),
c("GO:0051716","cellular response to stimulus",19.092,5.0969,0.879,0.160,"negative regulation of response to stimulus"),
c("GO:0042221","response to chemical",8.684,4.1249,0.943,0.193,"negative regulation of response to stimulus"),
c("GO:0045892","negative regulation of transcription, DNA-templated",2.182,3.1805,0.649,0.597,"negative regulation of response to stimulus"),
c("GO:0051336","regulation of hydrolase activity",3.070,2.4461,0.808,0.098,"regulation of hydrolase activity"),
c("GO:0050789","regulation of biological process",49.744,7.1427,0.879,0.156,"regulation of hydrolase activity"),
c("GO:0051239","regulation of multicellular organismal process",5.506,3.5376,0.911,0.181,"regulation of hydrolase activity"),
c("GO:0065009","regulation of molecular function",6.209,2.8416,0.915,0.188,"regulation of hydrolase activity"),
c("GO:0048519","negative regulation of biological process",8.588,4.1675,0.905,0.207,"regulation of hydrolase activity"),
c("GO:0019222","regulation of metabolic process",17.756,4.3768,0.863,0.269,"regulation of hydrolase activity"),
c("GO:0048583","regulation of response to stimulus",26.518,3.2291,0.849,0.322,"regulation of hydrolase activity"),
c("GO:0048518","positive regulation of biological process",28.712,5.6576,0.884,0.335,"regulation of hydrolase activity"),
c("GO:0050794","regulation of cellular process",28.971,7.3279,0.848,0.337,"regulation of hydrolase activity"),
c("GO:0051171","regulation of nitrogen compound metabolic process",13.046,4.3279,0.740,0.515,"regulation of hydrolase activity"),
c("GO:0051353","positive regulation of oxidoreductase activity",0.071,2.2284,0.871,0.520,"regulation of hydrolase activity"),
c("GO:0009893","positive regulation of metabolic process",5.415,4.2218,0.774,0.574,"regulation of hydrolase activity"),
c("GO:0051090","regulation of sequence-specific DNA binding transcription factor activity",0.562,2.3757,0.725,0.602,"regulation of hydrolase activity"),
c("GO:0009889","regulation of biosynthetic process",11.561,3.9208,0.737,0.678,"regulation of hydrolase activity"),
c("GO:0006954","inflammatory response",1.375,3.3010,0.923,0.099,"inflammatory response"),
c("GO:0006979","response to oxidative stress",0.874,2.1273,0.935,0.509,"inflammatory response"),
c("GO:0006952","defense response",3.096,2.7100,0.927,0.592,"inflammatory response"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$abslog10pvalue <- as.numeric( as.character(stuff$abslog10pvalue) );
stuff$freqInDbPercent <- as.numeric( as.character(stuff$freqInDbPercent) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
tmPlot(
	stuff,
	index = c("representative","description"),
	vSize = "abslog10pvalue",
	type = "categorical",
	vColor = "representative",
	title = "REVIGO Gene Ontology treemap",
	inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
	lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
	bg.labels = "#CCCCCCAA",     # define background color of group labels
												       # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
	position.legend = "none"
)

dev.off()
