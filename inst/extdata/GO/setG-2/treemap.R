

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
revigo.data <- rbind(c("GO:0033578","protein glycosylation in Golgi",0.011,3.2007,0.795,0.000,"protein glycosylation in Golgi"),
c("GO:0006635","fatty acid beta-oxidation",0.108,2.6925,0.731,0.123,"protein glycosylation in Golgi"),
c("GO:0010833","telomere maintenance via telomere lengthening",0.056,2.5391,0.684,0.136,"protein glycosylation in Golgi"),
c("GO:0048026","positive regulation of mRNA splicing, via spliceosome",0.007,1.7781,0.821,0.186,"protein glycosylation in Golgi"),
c("GO:0097056","selenocysteinyl-tRNA(Sec) biosynthetic process",0.008,1.7781,0.861,0.188,"protein glycosylation in Golgi"),
c("GO:0001514","selenocysteine incorporation",0.008,1.5720,0.805,0.197,"protein glycosylation in Golgi"),
c("GO:0042157","lipoprotein metabolic process",0.387,1.9727,0.870,0.201,"protein glycosylation in Golgi"),
c("GO:0009186","deoxyribonucleoside diphosphate metabolic process",0.023,1.4118,0.841,0.227,"protein glycosylation in Golgi"),
c("GO:0006497","protein lipidation",0.210,2.6757,0.800,0.275,"protein glycosylation in Golgi"),
c("GO:0090042","tubulin deacetylation",0.023,2.0630,0.858,0.288,"protein glycosylation in Golgi"),
c("GO:0018410","C-terminal protein amino acid modification",0.043,1.4037,0.848,0.301,"protein glycosylation in Golgi"),
c("GO:0006513","protein monoubiquitination",0.067,1.6560,0.843,0.311,"protein glycosylation in Golgi"),
c("GO:0032438","melanosome organization",0.039,1.4224,0.834,0.322,"protein glycosylation in Golgi"),
c("GO:0010847","regulation of chromatin assembly",0.002,2.5243,0.745,0.404,"protein glycosylation in Golgi"),
c("GO:0070647","protein modification by small protein conjugation or removal",1.542,1.4302,0.815,0.405,"protein glycosylation in Golgi"),
c("GO:0048285","organelle fission",1.175,1.6878,0.828,0.414,"protein glycosylation in Golgi"),
c("GO:0031650","regulation of heat generation",0.026,2.1290,0.755,0.422,"protein glycosylation in Golgi"),
c("GO:0007031","peroxisome organization",0.092,1.6702,0.856,0.432,"protein glycosylation in Golgi"),
c("GO:0032042","mitochondrial DNA metabolic process",0.044,1.4224,0.777,0.440,"protein glycosylation in Golgi"),
c("GO:0044282","small molecule catabolic process",0.575,2.0630,0.841,0.455,"protein glycosylation in Golgi"),
c("GO:0032462","regulation of protein homooligomerization",0.021,1.4224,0.872,0.471,"protein glycosylation in Golgi"),
c("GO:0009081","branched-chain amino acid metabolic process",0.043,1.8324,0.815,0.472,"protein glycosylation in Golgi"),
c("GO:0006278","RNA-dependent DNA replication",0.132,1.9226,0.799,0.474,"protein glycosylation in Golgi"),
c("GO:0032048","cardiolipin metabolic process",0.016,1.8336,0.811,0.480,"protein glycosylation in Golgi"),
c("GO:0007126","meiotic nuclear division",0.461,1.8639,0.788,0.502,"protein glycosylation in Golgi"),
c("GO:0090285","negative regulation of protein glycosylation in Golgi",0.002,2.5243,0.747,0.503,"protein glycosylation in Golgi"),
c("GO:0000019","regulation of mitotic recombination",0.011,2.0630,0.809,0.516,"protein glycosylation in Golgi"),
c("GO:0070213","protein auto-ADP-ribosylation",0.005,2.0630,0.802,0.521,"protein glycosylation in Golgi"),
c("GO:0048871","multicellular organismal homeostasis",0.562,1.4095,0.761,0.524,"protein glycosylation in Golgi"),
c("GO:0006071","glycerol metabolic process",0.052,1.7131,0.817,0.525,"protein glycosylation in Golgi"),
c("GO:0070536","protein K63-linked deubiquitination",0.024,1.4224,0.852,0.525,"protein glycosylation in Golgi"),
c("GO:0006768","biotin metabolic process",0.014,1.9706,0.819,0.542,"protein glycosylation in Golgi"),
c("GO:0000289","nuclear-transcribed mRNA poly(A) tail shortening",0.049,1.6560,0.828,0.554,"protein glycosylation in Golgi"),
c("GO:0016042","lipid catabolic process",0.537,1.6432,0.792,0.555,"protein glycosylation in Golgi"),
c("GO:0032876","negative regulation of DNA endoreduplication",0.006,1.7781,0.727,0.566,"protein glycosylation in Golgi"),
c("GO:0033044","regulation of chromosome organization",0.410,1.6347,0.764,0.566,"protein glycosylation in Golgi"),
c("GO:0001672","regulation of chromatin assembly or disassembly",0.007,1.7781,0.804,0.591,"protein glycosylation in Golgi"),
c("GO:2000188","regulation of cholesterol homeostasis",0.032,1.5720,0.902,0.598,"protein glycosylation in Golgi"),
c("GO:0051276","chromosome organization",2.327,1.6735,0.819,0.602,"protein glycosylation in Golgi"),
c("GO:0006451","translational readthrough",0.008,1.5720,0.805,0.609,"protein glycosylation in Golgi"),
c("GO:0032200","telomere organization",0.157,1.3785,0.826,0.615,"protein glycosylation in Golgi"),
c("GO:0006312","mitotic recombination",0.049,1.5287,0.838,0.624,"protein glycosylation in Golgi"),
c("GO:0030258","lipid modification",0.468,1.6306,0.786,0.632,"protein glycosylation in Golgi"),
c("GO:0001659","temperature homeostasis",0.074,1.5287,0.785,0.667,"protein glycosylation in Golgi"),
c("GO:0051321","meiotic cell cycle",0.540,1.9739,0.888,0.684,"protein glycosylation in Golgi"),
c("GO:0030328","prenylcysteine catabolic process",0.014,2.5243,0.796,0.684,"protein glycosylation in Golgi"),
c("GO:2001252","positive regulation of chromosome organization",0.175,1.6870,0.756,0.687,"protein glycosylation in Golgi"),
c("GO:0060613","fat pad development",0.017,2.8239,0.798,0.011,"fat pad development"),
c("GO:0032648","regulation of interferon-beta production",0.063,2.4547,0.727,0.200,"fat pad development"),
c("GO:0060023","soft palate development",0.010,2.5243,0.892,0.214,"fat pad development"),
c("GO:0060972","left/right pattern formation",0.040,2.3696,0.788,0.235,"fat pad development"),
c("GO:0007389","pattern specification process",1.143,1.4900,0.776,0.316,"fat pad development"),
c("GO:0044252","negative regulation of multicellular organismal metabolic process",0.007,1.5720,0.736,0.323,"fat pad development"),
c("GO:0060743","epithelial cell maturation involved in prostate gland development",0.008,2.0630,0.753,0.335,"fat pad development"),
c("GO:0060664","epithelial cell proliferation involved in salivary gland morphogenesis",0.028,1.5720,0.799,0.484,"fat pad development"),
c("GO:0045073","regulation of chemokine biosynthetic process",0.031,2.1290,0.617,0.576,"fat pad development"),
c("GO:0072015","glomerular visceral epithelial cell development",0.018,1.4118,0.745,0.587,"fat pad development"),
c("GO:0001947","heart looping",0.113,1.7786,0.705,0.605,"fat pad development"),
c("GO:0060716","labyrinthine layer blood vessel development",0.049,1.3430,0.777,0.611,"fat pad development"),
c("GO:0061046","regulation of branching involved in lung morphogenesis",0.021,1.7781,0.731,0.618,"fat pad development"),
c("GO:0060612","adipose tissue development",0.075,2.2336,0.780,0.623,"fat pad development"),
c("GO:0032606","type I interferon production",0.178,1.4022,0.769,0.630,"fat pad development"),
c("GO:0035050","embryonic heart tube development",0.168,1.5016,0.746,0.668,"fat pad development"),
c("GO:0009953","dorsal/ventral pattern formation",0.244,1.6801,0.763,0.691,"fat pad development"),
c("GO:0071499","cellular response to laminar fluid shear stress",0.008,2.8239,0.909,0.023,"cellular response to laminar fluid shear stress"),
c("GO:0035359","negative regulation of peroxisome proliferator activated receptor signaling pathway",0.003,2.5243,0.853,0.136,"cellular response to laminar fluid shear stress"),
c("GO:0070102","interleukin-6-mediated signaling pathway",0.022,1.8336,0.845,0.164,"cellular response to laminar fluid shear stress"),
c("GO:0097527","necroptotic signaling pathway",0.009,1.5720,0.870,0.173,"cellular response to laminar fluid shear stress"),
c("GO:0045599","negative regulation of fat cell differentiation",0.089,2.1543,0.749,0.271,"cellular response to laminar fluid shear stress"),
c("GO:0009409","response to cold",0.093,1.4037,0.960,0.280,"cellular response to laminar fluid shear stress"),
c("GO:0072539","T-helper 17 cell differentiation",0.022,2.0630,0.759,0.300,"cellular response to laminar fluid shear stress"),
c("GO:0007224","smoothened signaling pathway",0.316,1.3437,0.846,0.310,"cellular response to laminar fluid shear stress"),
c("GO:0071360","cellular response to exogenous dsRNA",0.011,1.4118,0.921,0.336,"cellular response to laminar fluid shear stress"),
c("GO:0070244","negative regulation of thymocyte apoptotic process",0.017,1.5720,0.855,0.341,"cellular response to laminar fluid shear stress"),
c("GO:0060271","cilium morphogenesis",0.426,2.0496,0.718,0.360,"cellular response to laminar fluid shear stress"),
c("GO:0050687","negative regulation of defense response to virus",0.022,1.8336,0.891,0.384,"cellular response to laminar fluid shear stress"),
c("GO:0008635","activation of cysteine-type endopeptidase activity involved in apoptotic process by cytochrome c",0.021,1.4118,0.800,0.390,"cellular response to laminar fluid shear stress"),
c("GO:0045444","fat cell differentiation",0.409,1.3246,0.803,0.410,"cellular response to laminar fluid shear stress"),
c("GO:0030500","regulation of bone mineralization",0.121,1.5909,0.726,0.433,"cellular response to laminar fluid shear stress"),
c("GO:1901031","regulation of response to reactive oxygen species",0.050,1.5720,0.912,0.481,"cellular response to laminar fluid shear stress"),
c("GO:0035458","cellular response to interferon-beta",0.021,1.4118,0.911,0.513,"cellular response to laminar fluid shear stress"),
c("GO:0033211","adiponectin-activated signaling pathway",0.013,1.5720,0.854,0.529,"cellular response to laminar fluid shear stress"),
c("GO:0042832","defense response to protozoan",0.042,1.4118,0.957,0.595,"cellular response to laminar fluid shear stress"),
c("GO:0044782","cilium organization",0.384,1.6655,0.808,0.635,"cellular response to laminar fluid shear stress"),
c("GO:0019221","cytokine-mediated signaling pathway",0.956,1.4476,0.812,0.664,"cellular response to laminar fluid shear stress"),
c("GO:0033157","regulation of intracellular protein transport",0.447,1.7156,0.869,0.029,"regulation of intracellular protein transport"),
c("GO:0010888","negative regulation of lipid storage",0.031,1.6059,0.883,0.445,"regulation of intracellular protein transport"),
c("GO:0072538","T-helper 17 type immune response",0.025,1.5720,0.972,0.045,"T-helper 17 type immune response"),
c("GO:0002446","neutrophil mediated immunity",0.040,1.5095,0.981,0.107,"T-helper 17 type immune response"));

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
