

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
revigo.data <- rbind(c("GO:0044699","single-organism process",71.655,1.3311,0.997,0.000,"single-organism process"),
c("GO:0072376","protein activation cascade",0.335,3.1135,0.859,0.000,"protein activation cascade"),
c("GO:0032897","negative regulation of viral transcription",0.010,2.7055,0.752,0.114,"protein activation cascade"),
c("GO:0097359","UDP-glucosylation",0.015,1.8207,0.847,0.135,"protein activation cascade"),
c("GO:0097502","mannosylation",0.040,1.7997,0.911,0.144,"protein activation cascade"),
c("GO:0032431","activation of phospholipase A2 activity",0.005,1.5230,0.915,0.148,"protein activation cascade"),
c("GO:0034975","protein folding in endoplasmic reticulum",0.002,1.5230,0.919,0.179,"protein activation cascade"),
c("GO:0001921","positive regulation of receptor recycling",0.024,2.1180,0.805,0.186,"protein activation cascade"),
c("GO:0008610","lipid biosynthetic process",1.351,2.3979,0.834,0.203,"protein activation cascade"),
c("GO:0006956","complement activation",0.276,2.4962,0.790,0.254,"protein activation cascade"),
c("GO:0052646","alditol phosphate metabolic process",0.079,1.3665,0.900,0.255,"protein activation cascade"),
c("GO:0048584","positive regulation of response to stimulus",22.389,1.7739,0.864,0.264,"protein activation cascade"),
c("GO:1902044","regulation of Fas signaling pathway",0.002,1.8207,0.844,0.267,"protein activation cascade"),
c("GO:0018193","peptidyl-amino acid modification",2.453,1.6596,0.880,0.313,"protein activation cascade"),
c("GO:0045666","positive regulation of neuron differentiation",0.248,1.6535,0.788,0.314,"protein activation cascade"),
c("GO:0045429","positive regulation of nitric oxide biosynthetic process",0.065,1.3665,0.812,0.361,"protein activation cascade"),
c("GO:0060128","corticotropin hormone secreting cell differentiation",0.007,1.3501,0.888,0.367,"protein activation cascade"),
c("GO:0010637","negative regulation of mitochondrial fusion",0.006,1.3501,0.783,0.378,"protein activation cascade"),
c("GO:0060804","positive regulation of Wnt signaling pathway by BMP signaling pathway",0.005,1.8207,0.773,0.393,"protein activation cascade"),
c("GO:0032226","positive regulation of synaptic transmission, dopaminergic",0.007,1.5230,0.836,0.402,"protein activation cascade"),
c("GO:2001046","positive regulation of integrin-mediated signaling pathway",0.017,1.3501,0.808,0.423,"protein activation cascade"),
c("GO:1900046","regulation of hemostasis",0.185,1.4712,0.834,0.446,"protein activation cascade"),
c("GO:0010430","fatty acid omega-oxidation",0.002,1.8207,0.829,0.446,"protein activation cascade"),
c("GO:0006651","diacylglycerol biosynthetic process",0.005,1.5230,0.845,0.468,"protein activation cascade"),
c("GO:0052192","movement in environment of other organism involved in symbiotic interaction",0.051,1.3665,0.880,0.532,"protein activation cascade"),
c("GO:0001505","regulation of neurotransmitter levels",0.382,1.3119,0.797,0.536,"protein activation cascade"),
c("GO:0006700","C21-steroid hormone biosynthetic process",0.038,1.9427,0.757,0.549,"protein activation cascade"),
c("GO:0003130","BMP signaling pathway involved in heart induction",0.003,1.5230,0.744,0.558,"protein activation cascade"),
c("GO:0034959","endothelin maturation",0.001,1.8207,0.769,0.559,"protein activation cascade"),
c("GO:0006658","phosphatidylserine metabolic process",0.048,1.5284,0.773,0.560,"protein activation cascade"),
c("GO:1902533","positive regulation of intracellular signal transduction",1.490,1.6211,0.745,0.574,"protein activation cascade"),
c("GO:0032872","regulation of stress-activated MAPK cascade",0.328,1.3644,0.691,0.640,"protein activation cascade"),
c("GO:0003100","regulation of systemic arterial blood pressure by endothelin",0.006,1.3501,0.876,0.678,"protein activation cascade"),
c("GO:0050853","B cell receptor signaling pathway",0.077,1.4844,0.805,0.692,"protein activation cascade"),
c("GO:0035630","bone mineralization involved in bone maturation",0.013,1.8207,0.922,0.013,"bone mineralization involved in bone maturation"),
c("GO:0035054","embryonic heart tube anterior/posterior pattern specification",0.013,1.8207,0.914,0.338,"bone mineralization involved in bone maturation"),
c("GO:0072138","mesenchymal cell proliferation involved in ureteric bud development",0.011,1.5230,0.921,0.449,"bone mineralization involved in bone maturation"),
c("GO:2000726","negative regulation of cardiac muscle cell differentiation",0.003,1.3501,0.821,0.449,"bone mineralization involved in bone maturation"),
c("GO:0008154","actin polymerization or depolymerization",0.451,2.2351,0.795,0.017,"actin polymerization or depolymerization"),
c("GO:0022411","cellular component disassembly",0.713,1.6114,0.855,0.354,"actin polymerization or depolymerization"),
c("GO:0035986","senescence-associated heterochromatin focus assembly",0.003,1.5230,0.829,0.355,"actin polymerization or depolymerization"),
c("GO:0030198","extracellular matrix organization",0.708,1.5005,0.855,0.370,"actin polymerization or depolymerization"),
c("GO:0043062","extracellular structure organization",0.709,1.5005,0.855,0.370,"actin polymerization or depolymerization"),
c("GO:0090240","positive regulation of histone H4 acetylation",0.028,1.3501,0.728,0.446,"actin polymerization or depolymerization"),
c("GO:0051258","protein polymerization",0.564,1.3768,0.874,0.614,"actin polymerization or depolymerization"),
c("GO:0090527","actin filament reorganization",0.005,1.5230,0.844,0.628,"actin polymerization or depolymerization"),
c("GO:0031532","actin cytoskeleton reorganization",0.144,1.5977,0.829,0.697,"actin polymerization or depolymerization"),
c("GO:0051040","regulation of calcium-independent cell-cell adhesion",0.002,1.8207,0.897,0.026,"regulation of calcium-independent cell-cell adhesion"),
c("GO:1901731","positive regulation of platelet aggregation",0.002,1.8207,0.713,0.600,"regulation of calcium-independent cell-cell adhesion"),
c("GO:2000048","negative regulation of cell-cell adhesion mediated by cadherin",0.005,1.5230,0.871,0.620,"regulation of calcium-independent cell-cell adhesion"),
c("GO:0033214","iron assimilation by chelation and transport",0.001,1.5230,0.876,0.052,"iron assimilation by chelation and transport"),
c("GO:0033212","iron assimilation",0.001,1.5230,0.876,0.552,"iron assimilation by chelation and transport"),
c("GO:0003133","endodermal-mesodermal cell signaling",0.003,1.5230,0.898,0.055,"endodermal-mesodermal cell signaling"),
c("GO:0010818","T cell chemotaxis",0.018,2.2233,0.733,0.062,"T cell chemotaxis"),
c("GO:0035585","calcium-mediated signaling using extracellular calcium source",0.003,1.8207,0.856,0.142,"T cell chemotaxis"),
c("GO:0036337","Fas signaling pathway",0.003,1.8207,0.857,0.149,"T cell chemotaxis"),
c("GO:0015804","neutral amino acid transport",0.080,2.0255,0.899,0.171,"T cell chemotaxis"),
c("GO:0035590","purinergic nucleotide receptor signaling pathway",0.091,1.3501,0.829,0.255,"T cell chemotaxis"),
c("GO:0035456","response to interferon-beta",0.027,2.0255,0.907,0.265,"T cell chemotaxis"),
c("GO:0006887","exocytosis",0.769,1.8807,0.851,0.288,"T cell chemotaxis"),
c("GO:0034516","response to vitamin B6",0.001,1.8207,0.906,0.297,"T cell chemotaxis"),
c("GO:0006829","zinc ion transport",0.050,1.7371,0.914,0.319,"T cell chemotaxis"),
c("GO:0006836","neurotransmitter transport",0.450,1.3716,0.918,0.337,"T cell chemotaxis"),
c("GO:0071277","cellular response to calcium ion",0.075,1.3312,0.868,0.349,"T cell chemotaxis"),
c("GO:0015891","siderophore transport",0.003,1.5230,0.922,0.364,"T cell chemotaxis"),
c("GO:0000296","spermine transport",0.001,1.8207,0.920,0.420,"T cell chemotaxis"),
c("GO:0034097","response to cytokine",1.500,1.5680,0.897,0.423,"T cell chemotaxis"),
c("GO:2000680","regulation of rubidium ion transport",0.008,1.5230,0.893,0.437,"T cell chemotaxis"),
c("GO:0035826","rubidium ion transport",0.009,1.5230,0.920,0.440,"T cell chemotaxis"),
c("GO:0015846","polyamine transport",0.005,1.8207,0.919,0.454,"T cell chemotaxis"),
c("GO:0010761","fibroblast migration",0.073,1.5284,0.830,0.461,"T cell chemotaxis"),
c("GO:0051707","response to other organism",1.534,1.5388,0.827,0.465,"T cell chemotaxis"),
c("GO:0070560","protein secretion by platelet",0.003,1.8207,0.883,0.506,"T cell chemotaxis"),
c("GO:0035455","response to interferon-alpha",0.030,1.7997,0.906,0.507,"T cell chemotaxis"),
c("GO:0033603","positive regulation of dopamine secretion",0.008,1.8207,0.807,0.536,"T cell chemotaxis"),
c("GO:0070555","response to interleukin-1",0.154,1.3813,0.897,0.567,"T cell chemotaxis"),
c("GO:0072672","neutrophil extravasation",0.008,1.5230,0.825,0.582,"T cell chemotaxis"),
c("GO:0010524","positive regulation of calcium ion transport into cytosol",0.062,1.4429,0.747,0.687,"T cell chemotaxis"),
c("GO:0043171","peptide catabolic process",0.011,2.1180,0.856,0.066,"peptide catabolism"),
c("GO:0006210","thymine catabolic process",0.003,1.8207,0.802,0.309,"peptide catabolism"),
c("GO:0019442","tryptophan catabolic process to acetyl-CoA",0.007,1.8207,0.792,0.321,"peptide catabolism"),
c("GO:0030393","fructoselysine metabolic process",0.001,1.8207,0.837,0.389,"peptide catabolism"),
c("GO:0019483","beta-alanine biosynthetic process",0.002,1.8207,0.823,0.403,"peptide catabolism"),
c("GO:0019482","beta-alanine metabolic process",0.003,1.8207,0.838,0.411,"peptide catabolism"),
c("GO:0019805","quinolinate biosynthetic process",0.016,1.5230,0.806,0.493,"peptide catabolism"),
c("GO:0006478","peptidyl-tyrosine sulfation",0.017,1.5230,0.900,0.533,"peptide catabolism"),
c("GO:0010814","substance P catabolic process",0.001,1.8207,0.863,0.551,"peptide catabolism"),
c("GO:0019800","peptide cross-linking via chondroitin 4-sulfate glycosaminoglycan",0.024,1.3501,0.804,0.572,"peptide catabolism"),
c("GO:0030389","fructosamine metabolic process",0.001,1.8207,0.936,0.600,"peptide catabolism"),
c("GO:0006214","thymidine catabolic process",0.001,1.8207,0.801,0.680,"peptide catabolism"),
c("GO:0036152","phosphatidylethanolamine acyl-chain remodeling",0.026,1.7997,0.790,0.681,"peptide catabolism"),
c("GO:0043420","anthranilate metabolic process",0.009,1.8207,0.819,0.695,"peptide catabolism"),
c("GO:0006952","defense response",3.096,2.1308,0.873,0.086,"defense response"),
c("GO:0009607","response to biotic stimulus",1.599,1.4207,0.946,0.104,"defense response"),
c("GO:0006950","response to stress",8.191,1.8044,0.939,0.132,"defense response"),
c("GO:0090402","oncogene-induced cell senescence",0.002,1.5230,0.836,0.324,"defense response"),
c("GO:0006978","DNA damage response, signal transduction by p53 class mediator resulting in transcription of p21 class mediator",0.025,1.7997,0.799,0.390,"defense response"),
c("GO:0034605","cellular response to heat",0.052,1.4036,0.850,0.417,"defense response"),
c("GO:0071493","cellular response to UV-B",0.007,1.3501,0.908,0.432,"defense response"),
c("GO:0042246","tissue regeneration",0.101,1.3665,0.845,0.443,"defense response"),
c("GO:0045087","innate immune response",1.572,1.5151,0.849,0.602,"defense response"),
c("GO:0034341","response to interferon-gamma",0.263,1.6523,0.829,0.667,"defense response"),
c("GO:0060337","type I interferon signaling pathway",0.179,1.4030,0.726,0.675,"defense response"),
c("GO:0034340","response to type I interferon",0.180,1.4030,0.833,0.675,"defense response"),
c("GO:0002426","immunoglobulin production in mucosal tissue",0.010,1.5230,0.923,0.097,"immunoglobulin production in mucosal tissue"),
c("GO:0006959","humoral immune response",0.457,1.4252,0.929,0.129,"immunoglobulin production in mucosal tissue"),
c("GO:0002636","positive regulation of germinal center formation",0.009,1.3501,0.904,0.142,"immunoglobulin production in mucosal tissue"),
c("GO:0002252","immune effector process",20.305,1.3848,0.947,0.248,"immunoglobulin production in mucosal tissue"),
c("GO:0048298","positive regulation of isotype switching to IgA isotypes",0.006,1.5230,0.742,0.684,"immunoglobulin production in mucosal tissue"));

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
