

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
revigo.data <- rbind(c("GO:1902600","hydrogen ion transmembrane transport",3.156,2.7212,0.816,0.000,"hydrogen ion transmembrane transport"),
c("GO:0006858","extracellular transport",0.008,1.6556,0.952,0.235,"hydrogen ion transmembrane transport"),
c("GO:0034498","early endosome to Golgi transport",0.014,2.0506,0.930,0.280,"hydrogen ion transmembrane transport"),
c("GO:0006860","extracellular amino acid transport",0.002,2.3468,0.920,0.333,"hydrogen ion transmembrane transport"),
c("GO:1901030","positive regulation of mitochondrial outer membrane permeabilization involved in apoptotic signaling pathway",0.010,1.5129,0.778,0.397,"hydrogen ion transmembrane transport"),
c("GO:0006818","hydrogen transport",3.252,2.4202,0.910,0.502,"hydrogen ion transmembrane transport"),
c("GO:0006868","glutamine transport",0.015,2.0506,0.912,0.565,"hydrogen ion transmembrane transport"),
c("GO:0015804","neutral amino acid transport",0.080,1.3605,0.907,0.691,"hydrogen ion transmembrane transport"),
c("GO:0003419","growth plate cartilage chondrocyte proliferation",0.009,2.0506,0.845,0.015,"growth plate cartilage chondrocyte proliferation"),
c("GO:0040016","embryonic cleavage",0.022,1.5784,0.840,0.219,"growth plate cartilage chondrocyte proliferation"),
c("GO:0032289","central nervous system myelin formation",0.009,2.0506,0.764,0.284,"growth plate cartilage chondrocyte proliferation"),
c("GO:0002244","hematopoietic progenitor cell differentiation",0.320,1.7011,0.779,0.321,"growth plate cartilage chondrocyte proliferation"),
c("GO:0030282","bone mineralization",0.204,1.5498,0.855,0.404,"growth plate cartilage chondrocyte proliferation"),
c("GO:0031214","biomineral tissue development",0.252,1.4023,0.853,0.499,"growth plate cartilage chondrocyte proliferation"),
c("GO:0001701","in utero embryonic development",1.158,1.5452,0.857,0.550,"growth plate cartilage chondrocyte proliferation"),
c("GO:1901533","negative regulation of hematopoietic progenitor cell differentiation",0.015,1.5129,0.773,0.554,"growth plate cartilage chondrocyte proliferation"),
c("GO:0043249","erythrocyte maturation",0.021,1.4547,0.761,0.566,"growth plate cartilage chondrocyte proliferation"),
c("GO:0035082","axoneme assembly",0.033,1.8761,0.794,0.589,"growth plate cartilage chondrocyte proliferation"),
c("GO:0032291","axon ensheathment in central nervous system",0.040,1.5129,0.777,0.663,"growth plate cartilage chondrocyte proliferation"),
c("GO:0060218","hematopoietic stem cell differentiation",0.032,1.4547,0.797,0.679,"growth plate cartilage chondrocyte proliferation"),
c("GO:0090346","cellular organofluorine metabolic process",0.002,2.3468,0.902,0.030,"cellular organofluorine metabolism"),
c("GO:0071372","cellular response to follicle-stimulating hormone stimulus",0.031,1.5784,0.916,0.036,"cellular response to follicle-stimulating hormone stimulus"),
c("GO:0010726","positive regulation of hydrogen peroxide metabolic process",0.002,2.3468,0.786,0.047,"positive regulation of hydrogen peroxide metabolism"),
c("GO:0060192","negative regulation of lipase activity",0.027,1.4547,0.849,0.150,"positive regulation of hydrogen peroxide metabolism"),
c("GO:0090031","positive regulation of steroid hormone biosynthetic process",0.016,1.7520,0.681,0.291,"positive regulation of hydrogen peroxide metabolism"),
c("GO:0051340","regulation of ligase activity",0.133,1.3799,0.840,0.376,"positive regulation of hydrogen peroxide metabolism"),
c("GO:0010921","regulation of phosphatase activity",0.162,1.4134,0.745,0.462,"positive regulation of hydrogen peroxide metabolism"),
c("GO:0051346","negative regulation of hydrolase activity",0.734,1.3063,0.817,0.633,"positive regulation of hydrogen peroxide metabolism"),
c("GO:0090345","cellular organohalogen metabolic process",0.002,2.3468,0.902,0.047,"cellular organohalogen metabolism"),
c("GO:0009650","UV protection",0.023,1.4045,0.976,0.048,"UV protection"),
c("GO:0044314","protein K27-linked ubiquitination",0.006,1.7520,0.813,0.049,"protein K27-linked ubiquitination"),
c("GO:0070389","chaperone cofactor-dependent protein refolding",0.010,1.6556,0.833,0.187,"protein K27-linked ubiquitination"),
c("GO:0018095","protein polyglutamylation",0.031,1.6556,0.810,0.235,"protein K27-linked ubiquitination"),
c("GO:0018195","peptidyl-arginine modification",0.026,1.3197,0.812,0.443,"protein K27-linked ubiquitination"),
c("GO:0051443","positive regulation of ubiquitin-protein transferase activity",0.104,1.5100,0.680,0.513,"protein K27-linked ubiquitination"),
c("GO:0035519","protein K29-linked ubiquitination",0.006,1.7520,0.813,0.611,"protein K27-linked ubiquitination"),
c("GO:0085020","protein K6-linked ubiquitination",0.009,1.5129,0.809,0.626,"protein K27-linked ubiquitination"),
c("GO:0009812","flavonoid metabolic process",0.019,1.5129,0.907,0.053,"flavonoid metabolism"),
c("GO:0043602","nitrate catabolic process",0.005,2.3468,0.715,0.064,"nitrate catabolism"),
c("GO:2001057","reactive nitrogen species metabolic process",0.008,1.7520,0.885,0.100,"nitrate catabolism"),
c("GO:0022904","respiratory electron transport chain",4.683,2.1739,0.734,0.150,"nitrate catabolism"),
c("GO:0006957","complement activation, alternative pathway",0.016,1.6556,0.793,0.166,"nitrate catabolism"),
c("GO:0033683","nucleotide-excision repair, DNA incision",0.009,1.5784,0.801,0.255,"nitrate catabolism"),
c("GO:0046210","nitric oxide catabolic process",0.005,2.3468,0.771,0.296,"nitrate catabolism"),
c("GO:0019464","glycine decarboxylation via glycine cleavage system",0.006,2.3468,0.714,0.341,"nitrate catabolism"),
c("GO:0009437","carnitine metabolic process",0.032,1.3605,0.747,0.386,"nitrate catabolism"),
c("GO:0006200","ATP catabolic process",1.093,2.0088,0.569,0.419,"nitrate catabolism"),
c("GO:0031145","anaphase-promoting complex-dependent proteasomal ubiquitin-dependent protein catabolic process",0.103,1.5229,0.697,0.438,"nitrate catabolism"),
c("GO:0006308","DNA catabolic process",0.253,1.4365,0.662,0.616,"nitrate catabolism"),
c("GO:0044270","cellular nitrogen compound catabolic process",4.524,1.7399,0.645,0.657,"nitrate catabolism"),
c("GO:0009125","nucleoside monophosphate catabolic process",1.104,1.9508,0.586,0.694,"nitrate catabolism"),
c("GO:0010994","free ubiquitin chain polymerization",0.002,2.0506,0.823,0.082,"free ubiquitin chain polymerization"),
c("GO:0043985","histone H4-R3 methylation",0.015,1.7520,0.733,0.286,"free ubiquitin chain polymerization"),
c("GO:0010992","ubiquitin homeostasis",0.003,1.7520,0.861,0.385,"free ubiquitin chain polymerization"),
c("GO:0035246","peptidyl-arginine N-methylation",0.016,1.4547,0.775,0.614,"free ubiquitin chain polymerization"),
c("GO:0034969","histone arginine methylation",0.021,1.4547,0.729,0.658,"free ubiquitin chain polymerization"));

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
