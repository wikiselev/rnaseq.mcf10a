

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
revigo.data <- rbind(c("GO:0032008","positive regulation of TOR signaling",0.027,2.7696,0.771,0.000,"positive regulation of TOR signaling"),
c("GO:0032916","positive regulation of transforming growth factor beta3 production",0.008,2.3468,0.834,0.101,"positive regulation of TOR signaling"),
c("GO:1901699","cellular response to nitrogen compound",1.214,1.7986,0.766,0.212,"positive regulation of TOR signaling"),
c("GO:0038092","nodal signaling pathway",0.028,1.5784,0.814,0.213,"positive regulation of TOR signaling"),
c("GO:0050668","positive regulation of homocysteine metabolic process",0.005,2.3468,0.675,0.247,"positive regulation of TOR signaling"),
c("GO:0023019","signal transduction involved in regulation of gene expression",0.169,1.3605,0.753,0.248,"positive regulation of TOR signaling"),
c("GO:1901313","positive regulation of gene expression involved in extracellular matrix organization",0.007,1.8761,0.761,0.282,"positive regulation of TOR signaling"),
c("GO:0001938","positive regulation of endothelial cell proliferation",0.107,1.7167,0.790,0.299,"positive regulation of TOR signaling"),
c("GO:0097296","activation of cysteine-type endopeptidase activity involved in apoptotic signaling pathway",0.015,1.8761,0.709,0.313,"positive regulation of TOR signaling"),
c("GO:0031929","TOR signaling",0.133,1.7520,0.804,0.340,"positive regulation of TOR signaling"),
c("GO:0043162","ubiquitin-dependent protein catabolic process via the multivesicular body sorting pathway",0.032,1.3605,0.838,0.345,"positive regulation of TOR signaling"),
c("GO:0045945","positive regulation of transcription from RNA polymerase III promoter",0.014,1.5784,0.767,0.368,"positive regulation of TOR signaling"),
c("GO:0097284","hepatocyte apoptotic process",0.043,1.5129,0.907,0.371,"positive regulation of TOR signaling"),
c("GO:0050921","positive regulation of chemotaxis",0.168,1.6364,0.745,0.413,"positive regulation of TOR signaling"),
c("GO:0010694","positive regulation of alkaline phosphatase activity",0.025,1.7520,0.787,0.432,"positive regulation of TOR signaling"),
c("GO:0033689","negative regulation of osteoblast proliferation",0.021,1.6556,0.841,0.437,"positive regulation of TOR signaling"),
c("GO:0032069","regulation of nuclease activity",0.083,1.4724,0.771,0.439,"positive regulation of TOR signaling"),
c("GO:0001932","regulation of protein phosphorylation",2.262,1.6440,0.689,0.480,"positive regulation of TOR signaling"),
c("GO:1901148","gene expression involved in extracellular matrix organization",0.008,1.8761,0.846,0.517,"positive regulation of TOR signaling"),
c("GO:0031053","primary miRNA processing",0.007,1.5784,0.714,0.541,"positive regulation of TOR signaling"),
c("GO:0042762","regulation of sulfur metabolic process",0.036,1.8761,0.794,0.543,"positive regulation of TOR signaling"),
c("GO:0006600","creatine metabolic process",0.016,1.4045,0.823,0.546,"positive regulation of TOR signaling"),
c("GO:0019082","viral protein processing",0.014,1.3605,0.799,0.549,"positive regulation of TOR signaling"),
c("GO:0002052","positive regulation of neuroblast proliferation",0.047,1.3605,0.749,0.556,"positive regulation of TOR signaling"),
c("GO:0061045","negative regulation of wound healing",0.018,1.5129,0.839,0.576,"positive regulation of TOR signaling"),
c("GO:0007183","SMAD protein complex assembly",0.028,1.4045,0.768,0.588,"positive regulation of TOR signaling"),
c("GO:0006987","activation of signaling protein activity involved in unfolded protein response",0.074,1.5638,0.582,0.634,"positive regulation of TOR signaling"),
c("GO:0032870","cellular response to hormone stimulus",1.400,1.3429,0.769,0.635,"positive regulation of TOR signaling"),
c("GO:0019068","virion assembly",0.024,1.3197,0.829,0.638,"positive regulation of TOR signaling"),
c("GO:2001267","regulation of cysteine-type endopeptidase activity involved in apoptotic signaling pathway",0.022,1.5784,0.716,0.650,"positive regulation of TOR signaling"),
c("GO:0048870","cell motility",2.570,1.5186,0.847,0.657,"positive regulation of TOR signaling"),
c("GO:0045963","negative regulation of dopamine metabolic process",0.009,2.0506,0.685,0.685,"positive regulation of TOR signaling"),
c("GO:0032259","methylation",1.044,1.6925,0.944,0.000,"methylation"),
c("GO:0051674","localization of cell",2.570,1.5186,0.952,0.000,"localization of cell"),
c("GO:0019049","evasion or tolerance of host defenses by virus",0.003,1.8761,0.804,0.043,"evasion or tolerance of host defenses by virus"),
c("GO:0052173","response to defenses of other organism involved in symbiotic interaction",0.043,1.5129,0.868,0.494,"evasion or tolerance of host defenses by virus"),
c("GO:0006669","sphinganine-1-phosphate biosynthetic process",0.001,2.3468,0.837,0.044,"sphinganine-1-phosphate biosynthesis"),
c("GO:0051568","histone H3-K4 methylation",0.085,2.1079,0.763,0.106,"sphinganine-1-phosphate biosynthesis"),
c("GO:0009404","toxin metabolic process",0.038,1.5784,0.885,0.131,"sphinganine-1-phosphate biosynthesis"),
c("GO:0030388","fructose 1,6-bisphosphate metabolic process",0.009,2.0506,0.896,0.197,"sphinganine-1-phosphate biosynthesis"),
c("GO:0043000","Golgi to plasma membrane CFTR protein transport",0.002,2.0506,0.883,0.206,"sphinganine-1-phosphate biosynthesis"),
c("GO:0036289","peptidyl-serine autophosphorylation",0.006,1.8761,0.852,0.249,"sphinganine-1-phosphate biosynthesis"),
c("GO:0010388","cullin deneddylation",0.010,1.6556,0.854,0.258,"sphinganine-1-phosphate biosynthesis"),
c("GO:0006491","N-glycan processing",0.023,1.5784,0.826,0.271,"sphinganine-1-phosphate biosynthesis"),
c("GO:0015804","neutral amino acid transport",0.080,1.3605,0.939,0.301,"sphinganine-1-phosphate biosynthesis"),
c("GO:0048308","organelle inheritance",0.009,1.6556,0.894,0.302,"sphinganine-1-phosphate biosynthesis"),
c("GO:2000641","regulation of early endosome to late endosome transport",0.014,1.6556,0.849,0.367,"sphinganine-1-phosphate biosynthesis"),
c("GO:0090170","regulation of Golgi inheritance",0.005,1.8761,0.818,0.472,"sphinganine-1-phosphate biosynthesis"),
c("GO:0006000","fructose metabolic process",0.039,1.5784,0.898,0.474,"sphinganine-1-phosphate biosynthesis"),
c("GO:0006668","sphinganine-1-phosphate metabolic process",0.002,2.0506,0.836,0.521,"sphinganine-1-phosphate biosynthesis"),
c("GO:0071816","tail-anchored membrane protein insertion into ER membrane",0.011,1.8761,0.846,0.531,"sphinganine-1-phosphate biosynthesis"),
c("GO:0033523","histone H2B ubiquitination",0.010,1.4547,0.789,0.533,"sphinganine-1-phosphate biosynthesis"),
c("GO:0035413","positive regulation of catenin import into nucleus",0.014,1.5129,0.810,0.539,"sphinganine-1-phosphate biosynthesis"),
c("GO:0006646","phosphatidylethanolamine biosynthetic process",0.021,1.3197,0.851,0.541,"sphinganine-1-phosphate biosynthesis"),
c("GO:0006670","sphingosine metabolic process",0.017,1.3605,0.785,0.594,"sphinganine-1-phosphate biosynthesis"),
c("GO:0019336","phenol-containing compound catabolic process",0.023,1.8761,0.815,0.051,"phenol-containing compound catabolism"),
c("GO:0042135","neurotransmitter catabolic process",0.021,1.5129,0.843,0.296,"phenol-containing compound catabolism"),
c("GO:0030011","maintenance of cell polarity",0.014,1.7520,0.927,0.051,"maintenance of cell polarity"),
c("GO:0060290","transdifferentiation",0.014,2.0506,0.899,0.051,"transdifferentiation"),
c("GO:0048617","embryonic foregut morphogenesis",0.048,1.5129,0.905,0.215,"transdifferentiation"),
c("GO:0048265","response to pain",0.089,1.3605,0.880,0.219,"transdifferentiation"),
c("GO:0048340","paraxial mesoderm morphogenesis",0.039,1.4547,0.912,0.341,"transdifferentiation"),
c("GO:0001889","liver development",0.340,1.3915,0.900,0.357,"transdifferentiation"),
c("GO:0021895","cerebral cortex neuron differentiation",0.049,1.3605,0.864,0.363,"transdifferentiation"),
c("GO:0061008","hepaticobiliary system development",0.344,1.3799,0.907,0.368,"transdifferentiation"),
c("GO:0030878","thyroid gland development",0.051,1.3605,0.909,0.642,"transdifferentiation"));

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
