

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
revigo.data <- rbind(c("GO:0002376","immune system process",29.354,4.5229,0.996,0.000,"immune system process"),
c("GO:0006357","regulation of transcription from RNA polymerase II promoter",3.684,8.9586,0.689,0.000,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0009058","biosynthetic process",19.017,2.9245,0.943,0.110,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0050794","regulation of cellular process",28.971,9.4318,0.855,0.155,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0065009","regulation of molecular function",6.209,3.1871,0.913,0.162,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0051239","regulation of multicellular organismal process",5.506,4.8539,0.909,0.170,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0048519","negative regulation of biological process",8.588,7.0177,0.903,0.190,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0042787","protein ubiquitination involved in ubiquitin-dependent protein catabolic process",0.129,4.8861,0.892,0.203,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0044763","single-organism cellular process",45.302,2.7595,0.904,0.206,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0042107","cytokine metabolic process",0.255,3.4559,0.926,0.233,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0008285","negative regulation of cell proliferation",1.492,7.2366,0.751,0.234,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0019222","regulation of metabolic process",17.756,5.2676,0.875,0.237,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0051726","regulation of cell cycle",1.952,2.8928,0.820,0.243,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0018076","N-terminal peptidyl-lysine acetylation",0.005,2.5935,0.919,0.252,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0048583","regulation of response to stimulus",26.518,5.2291,0.839,0.274,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0048518","positive regulation of biological process",28.712,8.4815,0.881,0.282,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0043412","macromolecule modification",10.189,2.4868,0.896,0.304,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0048522","positive regulation of cellular process",8.548,8.6383,0.790,0.306,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0050789","regulation of biological process",49.744,7.8239,0.876,0.337,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0097150","neuronal stem cell maintenance",0.032,2.5017,0.679,0.382,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0070647","protein modification by small protein conjugation or removal",1.542,3.2076,0.867,0.387,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0048584","positive regulation of response to stimulus",22.389,4.7447,0.793,0.450,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0009893","positive regulation of metabolic process",5.415,6.7696,0.785,0.457,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0051090","regulation of sequence-specific DNA binding transcription factor activity",0.562,3.8539,0.751,0.484,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0010628","positive regulation of gene expression",2.987,8.3565,0.741,0.549,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0009889","regulation of biosynthetic process",11.561,6.6778,0.745,0.560,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0002684","positive regulation of immune system process",20.525,2.7696,0.811,0.578,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0045892","negative regulation of transcription, DNA-templated",2.182,7.0706,0.659,0.584,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0006366","transcription from RNA polymerase II promoter",3.963,7.8239,0.798,0.613,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0033002","muscle cell proliferation",0.345,3.2291,0.949,0.622,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0051055","negative regulation of lipid biosynthetic process",0.059,3.0915,0.792,0.631,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0009892","negative regulation of metabolic process",3.994,4.5086,0.755,0.637,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0045787","positive regulation of cell cycle",0.253,2.7545,0.811,0.640,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0048660","regulation of smooth muscle cell proliferation",0.201,3.6383,0.838,0.643,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0006464","cellular protein modification process",9.809,2.8539,0.829,0.645,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0048145","regulation of fibroblast proliferation",0.207,2.5952,0.842,0.645,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0018130","heterocycle biosynthetic process",13.553,5.6576,0.807,0.647,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0048585","negative regulation of response to stimulus",2.501,3.4318,0.803,0.650,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0032943","mononuclear cell proliferation",0.537,2.6271,0.945,0.651,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0070661","leukocyte proliferation",0.556,2.7190,0.947,0.653,"regulation of transcription from RNA polymerase II promoter"),
c("GO:1901362","organic cyclic compound biosynthetic process",13.849,5.4318,0.843,0.676,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0019438","aromatic compound biosynthetic process",13.512,5.5850,0.807,0.691,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",13.670,5.6198,0.803,0.693,"regulation of transcription from RNA polymerase II promoter"),
c("GO:0008283","cell proliferation",4.075,5.5376,0.971,0.000,"cell proliferation"),
c("GO:0009888","tissue development",4.199,7.2007,0.754,0.000,"tissue development"),
c("GO:0035282","segmentation",0.244,4.7696,0.766,0.385,"tissue development"),
c("GO:0035914","skeletal muscle cell differentiation",0.138,4.4202,0.717,0.392,"tissue development"),
c("GO:0048565","digestive tract development",0.310,2.9469,0.758,0.427,"tissue development"),
c("GO:0001889","liver development",0.340,3.3665,0.754,0.432,"tissue development"),
c("GO:0061008","hepaticobiliary system development",0.344,3.7959,0.765,0.432,"tissue development"),
c("GO:0055123","digestive system development",0.349,3.1549,0.765,0.433,"tissue development"),
c("GO:0007389","pattern specification process",1.143,3.6990,0.748,0.463,"tissue development"),
c("GO:0001655","urogenital system development",0.815,2.6635,0.746,0.479,"tissue development"),
c("GO:0061061","muscle structure development",1.451,4.8239,0.771,0.516,"tissue development"),
c("GO:0060298","positive regulation of sarcomere organization",0.008,3.1675,0.700,0.521,"tissue development"),
c("GO:0030097","hemopoiesis",1.659,6.5376,0.682,0.526,"tissue development"),
c("GO:0001822","kidney development",0.661,2.8153,0.735,0.529,"tissue development"),
c("GO:0043009","chordate embryonic development",1.774,5.8239,0.710,0.531,"tissue development"),
c("GO:0002520","immune system development",1.845,6.2840,0.716,0.534,"tissue development"),
c("GO:2000026","regulation of multicellular organismal development",3.472,5.1487,0.635,0.542,"tissue development"),
c("GO:0072358","cardiovascular system development",2.258,6.0555,0.701,0.549,"tissue development"),
c("GO:0072359","circulatory system development",2.260,6.0555,0.720,0.552,"tissue development"),
c("GO:0048646","anatomical structure formation involved in morphogenesis",2.581,5.4685,0.753,0.560,"tissue development"),
c("GO:0009790","embryo development",2.628,5.0315,0.724,0.561,"tissue development"),
c("GO:0050793","regulation of developmental process",4.431,5.1739,0.702,0.563,"tissue development"),
c("GO:0035284","brain segmentation",0.003,3.1675,0.807,0.570,"tissue development"),
c("GO:0042035","regulation of cytokine biosynthetic process",0.220,4.0605,0.630,0.578,"tissue development"),
c("GO:0035283","central nervous system segmentation",0.003,3.1675,0.815,0.584,"tissue development"),
c("GO:0003160","endocardium morphogenesis",0.019,2.5935,0.783,0.600,"tissue development"),
c("GO:0045665","negative regulation of neuron differentiation",0.168,2.6536,0.621,0.611,"tissue development"),
c("GO:0051145","smooth muscle cell differentiation",0.128,3.5376,0.762,0.630,"tissue development"),
c("GO:0010573","vascular endothelial growth factor production",0.071,3.6383,0.839,0.646,"tissue development"),
c("GO:0010575","positive regulation vascular endothelial growth factor production",0.047,3.3372,0.777,0.646,"tissue development"),
c("GO:0002009","morphogenesis of an epithelium",1.119,3.0915,0.747,0.649,"tissue development"),
c("GO:0007379","segment specification",0.027,3.8539,0.798,0.654,"tissue development"),
c("GO:0002320","lymphoid progenitor cell differentiation",0.032,5.4202,0.738,0.654,"tissue development"),
c("GO:0002042","cell migration involved in sprouting angiogenesis",0.056,3.9208,0.719,0.657,"tissue development"),
c("GO:0048513","organ development",7.380,6.8861,0.681,0.662,"tissue development"),
c("GO:0060716","labyrinthine layer blood vessel development",0.049,4.8861,0.746,0.678,"tissue development"),
c("GO:0032663","regulation of interleukin-2 production",0.095,2.5467,0.785,0.681,"tissue development"),
c("GO:0002328","pro-B cell differentiation",0.016,4.0223,0.748,0.682,"tissue development"),
c("GO:0045995","regulation of embryonic development",0.207,2.5346,0.698,0.694,"tissue development"),
c("GO:0014807","regulation of somitogenesis",0.011,3.1079,0.725,0.694,"tissue development"),
c("GO:0044707","single-multicellular organism process",15.092,4.5086,0.767,0.695,"tissue development"),
c("GO:0048729","tissue morphogenesis",1.464,3.0269,0.747,0.697,"tissue development"),
c("GO:0061053","somite development",0.224,5.2924,0.753,0.700,"tissue development"),
c("GO:0023052","signaling",17.329,5.0506,0.995,0.000,"signaling"),
c("GO:0032501","multicellular organismal process",15.657,5.0362,0.995,0.000,"multicellular organismal process"),
c("GO:0032502","developmental process",13.055,5.5376,0.995,0.000,"developmental process"),
c("GO:0034504","protein localization to nucleus",0.653,4.4437,0.925,0.000,"protein localization to nucleus"),
c("GO:0019915","lipid storage",0.141,2.7932,0.897,0.468,"protein localization to nucleus"),
c("GO:0051170","nuclear import",0.532,3.2757,0.923,0.509,"protein localization to nucleus"),
c("GO:0017038","protein import",0.591,3.0044,0.921,0.569,"protein localization to nucleus"),
c("GO:0033157","regulation of intracellular protein transport",0.447,3.1308,0.797,0.643,"protein localization to nucleus"),
c("GO:0030730","sequestering of triglyceride",0.017,2.5017,0.911,0.655,"protein localization to nucleus"),
c("GO:0044699","single-organism process",71.655,2.6216,0.998,0.000,"single-organism process"),
c("GO:0050896","response to stimulus",47.248,8.7447,0.997,0.000,"response to stimulus"),
c("GO:0065007","biological regulation",51.216,7.9208,0.997,0.000,"biological regulation"),
c("GO:0001503","ossification",0.817,4.7447,0.825,0.024,"ossification"),
c("GO:0031649","heat generation",0.036,2.6091,0.824,0.252,"ossification"),
c("GO:0043500","muscle adaptation",0.141,3.1938,0.820,0.282,"ossification"),
c("GO:0001816","cytokine production",1.263,3.0506,0.818,0.350,"ossification"),
c("GO:0016265","death",4.501,2.7328,0.970,0.030,"death"),
c("GO:0016568","chromatin modification",1.536,3.1367,0.942,0.056,"chromatin modification"),
c("GO:0045321","leukocyte activation",1.587,3.3010,0.861,0.056,"leukocyte activation"),
c("GO:0007154","cell communication",17.535,4.8861,0.889,0.147,"leukocyte activation"),
c("GO:0002682","regulation of immune system process",21.361,3.6021,0.852,0.305,"leukocyte activation"),
c("GO:0006955","immune response",27.347,3.4815,0.887,0.610,"leukocyte activation"),
c("GO:0071310","cellular response to organic substance",4.572,6.1192,0.786,0.065,"cellular response to organic substance"),
c("GO:0051707","response to other organism",1.534,3.8239,0.893,0.109,"cellular response to organic substance"),
c("GO:0009607","response to biotic stimulus",1.599,3.8539,0.951,0.110,"cellular response to organic substance"),
c("GO:0009628","response to abiotic stimulus",2.264,4.8239,0.949,0.115,"cellular response to organic substance"),
c("GO:0006952","defense response",3.096,5.0555,0.933,0.121,"cellular response to organic substance"),
c("GO:0009719","response to endogenous stimulus",3.718,4.7959,0.946,0.124,"cellular response to organic substance"),
c("GO:0009605","response to external stimulus",4.459,3.4685,0.945,0.128,"cellular response to organic substance"),
c("GO:0051716","cellular response to stimulus",19.092,8.0605,0.885,0.167,"cellular response to organic substance"),
c("GO:0006950","response to stress",8.191,3.0706,0.941,0.190,"cellular response to organic substance"),
c("GO:0042221","response to chemical",8.684,6.2924,0.940,0.193,"cellular response to organic substance"),
c("GO:0007219","Notch signaling pathway",0.340,5.2518,0.795,0.306,"cellular response to organic substance"),
c("GO:0023014","signal transduction by phosphorylation",1.554,2.6073,0.747,0.370,"cellular response to organic substance"),
c("GO:0009967","positive regulation of signal transduction",2.348,4.7447,0.686,0.392,"cellular response to organic substance"),
c("GO:0070371","ERK1 and ERK2 cascade",0.384,2.8416,0.768,0.422,"cellular response to organic substance"),
c("GO:0009750","response to fructose",0.015,3.1675,0.907,0.441,"cellular response to organic substance"),
c("GO:0042771","intrinsic apoptotic signaling pathway in response to DNA damage by p53 class mediator",0.099,2.6676,0.779,0.442,"cellular response to organic substance"),
c("GO:0060137","maternal process involved in parturition",0.018,3.1675,0.841,0.466,"cellular response to organic substance"),
c("GO:0007167","enzyme linked receptor protein signaling pathway",2.356,3.8861,0.750,0.467,"cellular response to organic substance"),
c("GO:0001890","placenta development",0.407,2.4855,0.741,0.497,"cellular response to organic substance"),
c("GO:0008593","regulation of Notch signaling pathway",0.123,4.4202,0.796,0.510,"cellular response to organic substance"),
c("GO:0034698","response to gonadotropin",0.082,2.8069,0.894,0.515,"cellular response to organic substance"),
c("GO:0071371","cellular response to gonadotropin stimulus",0.051,3.3372,0.852,0.517,"cellular response to organic substance"),
c("GO:0010942","positive regulation of cell death",1.003,4.5086,0.762,0.538,"cellular response to organic substance"),
c("GO:0007165","signal transduction",16.054,6.8239,0.684,0.545,"cellular response to organic substance"),
c("GO:0071260","cellular response to mechanical stimulus",0.133,3.2291,0.865,0.550,"cellular response to organic substance"),
c("GO:0001101","response to acid chemical",0.711,2.7620,0.891,0.556,"cellular response to organic substance"),
c("GO:0006979","response to oxidative stress",0.874,3.4815,0.941,0.559,"cellular response to organic substance"),
c("GO:0051591","response to cAMP",0.267,4.7696,0.874,0.582,"cellular response to organic substance"),
c("GO:0030111","regulation of Wnt signaling pathway",0.482,2.4547,0.770,0.587,"cellular response to organic substance"),
c("GO:0006954","inflammatory response",1.375,3.2924,0.936,0.592,"cellular response to organic substance"),
c("GO:0042493","response to drug",1.179,2.8794,0.885,0.593,"cellular response to organic substance"),
c("GO:0046683","response to organophosphorus",0.335,5.1079,0.889,0.597,"cellular response to organic substance"),
c("GO:0007567","parturition",0.036,2.7721,0.841,0.600,"cellular response to organic substance"),
c("GO:0009612","response to mechanical stimulus",0.422,3.4949,0.909,0.616,"cellular response to organic substance"),
c("GO:0042517","positive regulation of tyrosine phosphorylation of Stat3 protein",0.041,2.6126,0.709,0.624,"cellular response to organic substance"),
c("GO:0031665","negative regulation of lipopolysaccharide-mediated signaling pathway",0.013,3.1079,0.718,0.625,"cellular response to organic substance"),
c("GO:0010646","regulation of cell communication",6.570,6.2840,0.773,0.631,"cellular response to organic substance"),
c("GO:0071496","cellular response to external stimulus",0.549,3.3979,0.924,0.633,"cellular response to organic substance"),
c("GO:0023051","regulation of signaling",6.570,6.3188,0.847,0.637,"cellular response to organic substance"),
c("GO:0035556","intracellular signal transduction",6.704,4.5686,0.719,0.640,"cellular response to organic substance"),
c("GO:1901698","response to nitrogen compound",2.084,3.3468,0.878,0.642,"cellular response to organic substance"),
c("GO:0044706","multi-multicellular organism process",0.678,2.8069,0.813,0.649,"cellular response to organic substance"),
c("GO:0009411","response to UV",0.269,2.5045,0.939,0.650,"cellular response to organic substance"),
c("GO:0002526","acute inflammatory response",0.259,2.4711,0.945,0.657,"cellular response to organic substance"),
c("GO:0071495","cellular response to endogenous stimulus",2.579,3.9586,0.918,0.661,"cellular response to organic substance"),
c("GO:0023057","negative regulation of signaling",2.197,3.5528,0.780,0.672,"cellular response to organic substance"),
c("GO:0010648","negative regulation of cell communication",2.203,3.4815,0.727,0.672,"cellular response to organic substance"),
c("GO:1901700","response to oxygen-containing compound",3.064,5.5086,0.873,0.679,"cellular response to organic substance"),
c("GO:0071214","cellular response to abiotic stimulus",0.450,3.2218,0.873,0.681,"cellular response to organic substance"),
c("GO:0007166","cell surface receptor signaling pathway",8.919,7.2518,0.708,0.683,"cellular response to organic substance"),
c("GO:0023056","positive regulation of signaling",2.489,4.6198,0.819,0.683,"cellular response to organic substance"),
c("GO:0010647","positive regulation of cell communication",2.500,4.5686,0.735,0.684,"cellular response to organic substance"),
c("GO:0014074","response to purine-containing compound",0.402,3.9208,0.876,0.691,"cellular response to organic substance"),
c("GO:0009968","negative regulation of signal transduction",2.090,3.4815,0.682,0.700,"cellular response to organic substance"),
c("GO:0051101","regulation of DNA binding",0.265,2.4547,0.937,0.071,"regulation of DNA binding"));

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
