

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
revigo.data <- rbind(c("GO:0002376","immune system process",29.354,3.1938,0.996,0.000,"immune system process"),
c("GO:0006935","chemotaxis",1.276,4.2441,0.902,0.000,"chemotaxis"),
c("GO:0009605","response to external stimulus",4.459,3.0000,0.967,0.106,"chemotaxis"),
c("GO:0042221","response to chemical",8.684,4.1938,0.965,0.142,"chemotaxis"),
c("GO:0051716","cellular response to stimulus",19.092,2.8962,0.908,0.193,"chemotaxis"),
c("GO:0034097","response to cytokine",1.500,2.5272,0.945,0.521,"chemotaxis"),
c("GO:0009612","response to mechanical stimulus",0.422,2.6421,0.953,0.605,"chemotaxis"),
c("GO:0071496","cellular response to external stimulus",0.549,2.3391,0.952,0.621,"chemotaxis"),
c("GO:0010033","response to organic substance",6.118,2.3507,0.938,0.638,"chemotaxis"),
c("GO:0009888","tissue development",4.199,4.6021,0.651,0.000,"tissue development"),
c("GO:0072033","renal vesicle formation",0.018,3.0223,0.639,0.324,"tissue development"),
c("GO:0036344","platelet morphogenesis",0.032,2.3686,0.674,0.341,"tissue development"),
c("GO:0030903","notochord development",0.039,2.0862,0.700,0.347,"tissue development"),
c("GO:0009948","anterior/posterior axis specification",0.122,3.3372,0.710,0.358,"tissue development"),
c("GO:0007398","ectoderm development",0.050,2.8447,0.727,0.375,"tissue development"),
c("GO:0045445","myoblast differentiation",0.113,2.8794,0.688,0.384,"tissue development"),
c("GO:0061028","establishment of endothelial barrier",0.034,2.9208,0.672,0.427,"tissue development"),
c("GO:0007389","pattern specification process",1.143,2.0376,0.658,0.463,"tissue development"),
c("GO:0001655","urogenital system development",0.815,2.9101,0.653,0.479,"tissue development"),
c("GO:0061458","reproductive system development",1.184,2.6091,0.641,0.502,"tissue development"),
c("GO:0048732","gland development",1.335,3.6021,0.624,0.510,"tissue development"),
c("GO:0061061","muscle structure development",1.451,2.5482,0.675,0.516,"tissue development"),
c("GO:0048729","tissue morphogenesis",1.464,5.0000,0.608,0.517,"tissue development"),
c("GO:0043588","skin development",0.701,2.5935,0.645,0.520,"tissue development"),
c("GO:0035295","tube development",1.620,2.9136,0.643,0.524,"tissue development"),
c("GO:0002520","immune system development",1.845,2.0092,0.613,0.534,"tissue development"),
c("GO:0042475","odontogenesis of dentin-containing tooth",0.342,4.0969,0.631,0.534,"tissue development"),
c("GO:0072358","cardiovascular system development",2.258,3.9586,0.590,0.549,"tissue development"),
c("GO:0072359","circulatory system development",2.260,3.9586,0.619,0.552,"tissue development"),
c("GO:0009790","embryo development",2.628,4.0000,0.625,0.561,"tissue development"),
c("GO:0050793","regulation of developmental process",4.431,1.9500,0.614,0.563,"tissue development"),
c("GO:0007492","endoderm development",0.161,2.0092,0.702,0.570,"tissue development"),
c("GO:0001763","morphogenesis of a branching structure",0.639,2.0531,0.643,0.570,"tissue development"),
c("GO:0048534","hematopoietic or lymphoid organ development",1.755,2.2118,0.598,0.578,"tissue development"),
c("GO:0003158","endothelium development",0.229,2.4045,0.684,0.590,"tissue development"),
c("GO:0035239","tube morphogenesis",0.904,2.5544,0.617,0.592,"tissue development"),
c("GO:0043589","skin morphogenesis",0.108,3.6576,0.657,0.592,"tissue development"),
c("GO:0007498","mesoderm development",0.291,1.9416,0.688,0.604,"tissue development"),
c("GO:0048468","cell development",4.830,4.3188,0.574,0.616,"tissue development"),
c("GO:0007399","nervous system development",4.932,3.7696,0.587,0.633,"tissue development"),
c("GO:0044707","single-multicellular organism process",15.092,3.2147,0.687,0.638,"tissue development"),
c("GO:0030850","prostate gland development",0.195,2.9245,0.643,0.643,"tissue development"),
c("GO:0030220","platelet formation",0.032,2.3686,0.631,0.648,"tissue development"),
c("GO:0060055","angiogenesis involved in wound healing",0.050,2.1694,0.646,0.651,"tissue development"),
c("GO:0061448","connective tissue development",0.687,2.5735,0.665,0.660,"tissue development"),
c("GO:0042476","odontogenesis",0.418,3.2518,0.625,0.664,"tissue development"),
c("GO:2000826","regulation of heart morphogenesis",0.066,3.0000,0.616,0.667,"tissue development"),
c("GO:0048646","anatomical structure formation involved in morphogenesis",2.581,4.9208,0.631,0.671,"tissue development"),
c("GO:0048598","embryonic morphogenesis",1.501,3.3979,0.597,0.673,"tissue development"),
c("GO:0061323","cell proliferation involved in heart morphogenesis",0.049,2.1694,0.621,0.684,"tissue development"),
c("GO:0022603","regulation of anatomical structure morphogenesis",1.794,3.0223,0.586,0.689,"tissue development"),
c("GO:2000027","regulation of organ morphogenesis",0.521,2.0521,0.570,0.690,"tissue development"),
c("GO:0000904","cell morphogenesis involved in differentiation",1.833,2.5045,0.553,0.691,"tissue development"),
c("GO:0002009","morphogenesis of an epithelium",1.119,3.5229,0.599,0.697,"tissue development"),
c("GO:2000136","regulation of cell proliferation involved in heart morphogenesis",0.048,2.2628,0.557,0.699,"tissue development"),
c("GO:0001704","formation of primary germ layer",0.267,3.0177,0.639,0.700,"tissue development"),
c("GO:0023052","signaling",17.329,3.3872,0.995,0.000,"signaling"),
c("GO:0032501","multicellular organismal process",15.657,2.8477,0.995,0.000,"multicellular organismal process"),
c("GO:0032502","developmental process",13.055,4.4559,0.995,0.000,"developmental process"),
c("GO:0034394","protein localization to cell surface",0.048,2.4750,0.969,0.000,"protein localization to cell surface"),
c("GO:0040011","locomotion",3.285,4.2007,0.994,0.000,"locomotion"),
c("GO:0042981","regulation of apoptotic process",3.144,4.5229,0.773,0.000,"regulation of apoptotic process"),
c("GO:0009891","positive regulation of biosynthetic process",3.388,3.6198,0.808,0.103,"regulation of apoptotic process"),
c("GO:0042110","T cell activation",0.956,3.3468,0.850,0.107,"regulation of apoptotic process"),
c("GO:0030029","actin filament-based process",1.610,3.3098,0.904,0.114,"regulation of apoptotic process"),
c("GO:0001775","cell activation",2.008,2.7033,0.901,0.118,"regulation of apoptotic process"),
c("GO:0006928","cellular component movement",3.830,4.4949,0.894,0.129,"regulation of apoptotic process"),
c("GO:0002446","neutrophil mediated immunity",0.040,1.9416,0.979,0.139,"regulation of apoptotic process"),
c("GO:0050794","regulation of cellular process",28.971,6.1549,0.864,0.152,"regulation of apoptotic process"),
c("GO:0051239","regulation of multicellular organismal process",5.506,2.3188,0.918,0.170,"regulation of apoptotic process"),
c("GO:2000243","positive regulation of reproductive process",0.097,2.9208,0.913,0.172,"regulation of apoptotic process"),
c("GO:0007154","cell communication",17.535,3.4949,0.871,0.173,"regulation of apoptotic process"),
c("GO:0045787","positive regulation of cell cycle",0.253,2.2628,0.823,0.190,"regulation of apoptotic process"),
c("GO:0048519","negative regulation of biological process",8.588,3.8239,0.912,0.190,"regulation of apoptotic process"),
c("GO:0019222","regulation of metabolic process",17.756,3.0809,0.897,0.237,"regulation of apoptotic process"),
c("GO:0009968","negative regulation of signal transduction",2.090,3.7696,0.735,0.240,"regulation of apoptotic process"),
c("GO:0048016","inositol phosphate-mediated signaling",0.049,1.9416,0.843,0.267,"regulation of apoptotic process"),
c("GO:0048583","regulation of response to stimulus",26.518,3.8239,0.878,0.274,"regulation of apoptotic process"),
c("GO:0002682","regulation of immune system process",21.361,2.5391,0.877,0.280,"regulation of apoptotic process"),
c("GO:0048518","positive regulation of biological process",28.712,5.8861,0.893,0.282,"regulation of apoptotic process"),
c("GO:0048522","positive regulation of cellular process",8.548,5.1135,0.805,0.304,"regulation of apoptotic process"),
c("GO:0050789","regulation of biological process",49.744,5.3372,0.889,0.337,"regulation of apoptotic process"),
c("GO:0002757","immune response-activating signal transduction",0.934,1.9918,0.778,0.360,"regulation of apoptotic process"),
c("GO:0007167","enzyme linked receptor protein signaling pathway",2.356,2.2534,0.776,0.403,"regulation of apoptotic process"),
c("GO:0050710","negative regulation of cytokine secretion",0.048,3.0862,0.669,0.407,"regulation of apoptotic process"),
c("GO:0032331","negative regulation of chondrocyte differentiation",0.049,3.2840,0.575,0.408,"regulation of apoptotic process"),
c("GO:0048008","platelet-derived growth factor receptor signaling pathway",0.111,2.1175,0.832,0.417,"regulation of apoptotic process"),
c("GO:0042659","regulation of cell fate specification",0.039,2.1694,0.665,0.429,"regulation of apoptotic process"),
c("GO:0010803","regulation of tumor necrosis factor-mediated signaling pathway",0.022,2.2628,0.823,0.433,"regulation of apoptotic process"),
c("GO:0051090","regulation of sequence-specific DNA binding transcription factor activity",0.562,3.0088,0.801,0.445,"regulation of apoptotic process"),
c("GO:0048584","positive regulation of response to stimulus",22.389,3.0555,0.839,0.450,"regulation of apoptotic process"),
c("GO:0043433","negative regulation of sequence-specific DNA binding transcription factor activity",0.210,2.3696,0.816,0.459,"regulation of apoptotic process"),
c("GO:0045685","regulation of glial cell differentiation",0.144,3.2218,0.577,0.468,"regulation of apoptotic process"),
c("GO:0014068","positive regulation of phosphatidylinositol 3-kinase signaling",0.092,3.2757,0.792,0.491,"regulation of apoptotic process"),
c("GO:0007166","cell surface receptor signaling pathway",8.919,4.2596,0.740,0.498,"regulation of apoptotic process"),
c("GO:0051270","regulation of cellular component movement",1.289,1.9582,0.799,0.501,"regulation of apoptotic process"),
c("GO:0051240","positive regulation of multicellular organismal process",1.418,2.2233,0.672,0.507,"regulation of apoptotic process"),
c("GO:0060688","regulation of morphogenesis of a branching structure",0.153,2.1175,0.635,0.510,"regulation of apoptotic process"),
c("GO:0009889","regulation of biosynthetic process",11.561,3.1938,0.823,0.513,"regulation of apoptotic process"),
c("GO:0052548","regulation of endopeptidase activity",0.736,2.3507,0.851,0.516,"regulation of apoptotic process"),
c("GO:0045055","regulated secretory pathway",0.134,2.2815,0.900,0.538,"regulation of apoptotic process"),
c("GO:2000008","regulation of protein localization to cell surface",0.026,2.0106,0.871,0.548,"regulation of apoptotic process"),
c("GO:0010646","regulation of cell communication",6.570,4.1549,0.773,0.559,"regulation of apoptotic process"),
c("GO:0009893","positive regulation of metabolic process",5.415,2.7545,0.833,0.560,"regulation of apoptotic process"),
c("GO:0023051","regulation of signaling",6.570,4.1675,0.852,0.564,"regulation of apoptotic process"),
c("GO:0006357","regulation of transcription from RNA polymerase II promoter",3.684,3.4559,0.757,0.571,"regulation of apoptotic process"),
c("GO:0032611","interleukin-1 beta production",0.095,2.4750,0.787,0.591,"regulation of apoptotic process"),
c("GO:0048585","negative regulation of response to stimulus",2.501,3.4318,0.859,0.594,"regulation of apoptotic process"),
c("GO:0035556","intracellular signal transduction",6.704,2.2976,0.750,0.600,"regulation of apoptotic process"),
c("GO:0051241","negative regulation of multicellular organismal process",0.833,2.1798,0.676,0.606,"regulation of apoptotic process"),
c("GO:0006366","transcription from RNA polymerase II promoter",3.963,3.6021,0.858,0.613,"regulation of apoptotic process"),
c("GO:0032612","interleukin-1 production",0.103,2.2815,0.789,0.624,"regulation of apoptotic process"),
c("GO:0007178","transmembrane receptor protein serine/threonine kinase signaling pathway",0.794,1.9842,0.800,0.629,"regulation of apoptotic process"),
c("GO:1902533","positive regulation of intracellular signal transduction",1.490,2.6289,0.738,0.660,"regulation of apoptotic process"),
c("GO:0023057","negative regulation of signaling",2.197,4.0862,0.815,0.662,"regulation of apoptotic process"),
c("GO:0010648","negative regulation of cell communication",2.203,4.0555,0.755,0.662,"regulation of apoptotic process"),
c("GO:0051272","positive regulation of cellular component movement",0.616,1.9492,0.779,0.665,"regulation of apoptotic process"),
c("GO:0023056","positive regulation of signaling",2.489,2.0429,0.833,0.677,"regulation of apoptotic process"),
c("GO:0010647","positive regulation of cell communication",2.500,2.0315,0.751,0.678,"regulation of apoptotic process"),
c("GO:0007165","signal transduction",16.054,3.7447,0.720,0.683,"regulation of apoptotic process"),
c("GO:0010556","regulation of macromolecule biosynthetic process",11.160,3.3010,0.801,0.695,"regulation of apoptotic process"),
c("GO:0060255","regulation of macromolecule metabolic process",14.730,2.9830,0.814,0.698,"regulation of apoptotic process"),
c("GO:0048610","cellular process involved in reproduction",0.381,2.8097,0.994,0.000,"cellular process involved in reproduction"),
c("GO:0050896","response to stimulus",47.248,3.2757,0.997,0.000,"response to stimulus"),
c("GO:0065007","biological regulation",51.216,4.4089,0.997,0.000,"biological regulation"),
c("GO:0042303","molting cycle",0.235,2.7986,0.788,0.020,"molting cycle"),
c("GO:0003094","glomerular filtration",0.052,1.9416,0.807,0.236,"molting cycle"),
c("GO:0001894","tissue homeostasis",0.393,1.9996,0.740,0.277,"molting cycle"),
c("GO:0072089","stem cell proliferation",0.477,4.0362,0.904,0.021,"stem cell proliferation"),
c("GO:0010463","mesenchymal cell proliferation",0.222,3.1675,0.902,0.536,"stem cell proliferation"),
c("GO:0042127","regulation of cell proliferation",3.148,4.0132,0.769,0.697,"stem cell proliferation"),
c("GO:0008283","cell proliferation",4.075,4.1427,0.962,0.028,"cell proliferation"),
c("GO:0016265","death",4.501,3.2291,0.962,0.030,"death"),
c("GO:0051084","'de novo' posttranslational protein folding",0.097,2.7959,0.920,0.040,"primede novoprime posttranslational protein folding"),
c("GO:0016567","protein ubiquitination",1.323,2.7959,0.897,0.315,"primede novoprime posttranslational protein folding"),
c("GO:0006470","protein dephosphorylation",0.717,2.4283,0.905,0.452,"primede novoprime posttranslational protein folding"),
c("GO:0070647","protein modification by small protein conjugation or removal",1.542,2.5200,0.898,0.493,"primede novoprime posttranslational protein folding"),
c("GO:0006968","cellular defense response",0.070,2.7077,0.965,0.068,"cellular defense response"),
c("GO:0009611","response to wounding",2.056,2.7033,0.955,0.412,"cellular defense response"),
c("GO:0042542","response to hydrogen peroxide",0.276,2.6615,0.937,0.470,"cellular defense response"),
c("GO:0042060","wound healing",1.314,2.4365,0.955,0.559,"cellular defense response"),
c("GO:0016311","dephosphorylation",1.340,1.9918,0.931,0.089,"dephosphorylation"),
c("GO:0031032","actomyosin structure organization",0.206,3.8539,0.877,0.090,"actomyosin structure organization"),
c("GO:0034332","adherens junction organization",0.198,2.7986,0.885,0.295,"actomyosin structure organization"),
c("GO:0030198","extracellular matrix organization",0.708,2.4089,0.879,0.329,"actomyosin structure organization"),
c("GO:0034330","cell junction organization",0.493,2.1993,0.883,0.357,"actomyosin structure organization"),
c("GO:0043062","extracellular structure organization",0.709,2.4089,0.879,0.370,"actomyosin structure organization"),
c("GO:0051259","protein oligomerization",0.921,2.3401,0.941,0.380,"actomyosin structure organization"),
c("GO:0030030","cell projection organization",2.744,2.0721,0.861,0.442,"actomyosin structure organization"),
c("GO:0007016","cytoskeletal anchoring at plasma membrane",0.021,2.1694,0.862,0.480,"actomyosin structure organization"));

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
