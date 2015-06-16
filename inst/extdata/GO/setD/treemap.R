

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
revigo.data <- rbind(c("GO:0009607","response to biotic stimulus",1.599,1.5345,0.972,0.000,"response to biotic stimulus"),
c("GO:0044699","single-organism process",71.655,2.9469,0.998,0.000,"single-organism process"),
c("GO:0051488","activation of anaphase-promoting complex activity",0.011,4.5850,0.800,0.000,"activation of anaphase-promoting complex activity"),
c("GO:0048710","regulation of astrocyte differentiation",0.057,1.9543,0.817,0.106,"activation of anaphase-promoting complex activity"),
c("GO:0072376","protein activation cascade",0.335,2.8894,0.852,0.199,"activation of anaphase-promoting complex activity"),
c("GO:0070084","protein initiator methionine removal",0.008,1.5242,0.893,0.226,"activation of anaphase-promoting complex activity"),
c("GO:0031145","anaphase-promoting complex-dependent proteasomal ubiquitin-dependent protein catabolic process",0.103,2.0218,0.845,0.234,"activation of anaphase-promoting complex activity"),
c("GO:0001552","ovarian follicle atresia",0.003,1.5242,0.935,0.236,"activation of anaphase-promoting complex activity"),
c("GO:0006956","complement activation",0.276,2.5850,0.809,0.254,"activation of anaphase-promoting complex activity"),
c("GO:0018149","peptide cross-linking",0.099,2.6716,0.876,0.262,"activation of anaphase-promoting complex activity"),
c("GO:0019800","peptide cross-linking via chondroitin 4-sulfate glycosaminoglycan",0.024,2.5817,0.744,0.275,"activation of anaphase-promoting complex activity"),
c("GO:0048146","positive regulation of fibroblast proliferation",0.122,1.3407,0.860,0.285,"activation of anaphase-promoting complex activity"),
c("GO:0006210","thymine catabolic process",0.003,1.5242,0.817,0.291,"activation of anaphase-promoting complex activity"),
c("GO:0006082","organic acid metabolic process",3.105,1.3670,0.783,0.293,"activation of anaphase-promoting complex activity"),
c("GO:0022904","respiratory electron transport chain",4.683,1.3396,0.810,0.299,"activation of anaphase-promoting complex activity"),
c("GO:2001108","positive regulation of Rho guanyl-nucleotide exchange factor activity",0.001,1.5242,0.949,0.306,"activation of anaphase-promoting complex activity"),
c("GO:0043171","peptide catabolic process",0.011,1.5539,0.855,0.313,"activation of anaphase-promoting complex activity"),
c("GO:0001921","positive regulation of receptor recycling",0.024,1.5539,0.811,0.329,"activation of anaphase-promoting complex activity"),
c("GO:0030216","keratinocyte differentiation",0.196,1.5869,0.854,0.339,"activation of anaphase-promoting complex activity"),
c("GO:0030393","fructoselysine metabolic process",0.001,1.5242,0.814,0.342,"activation of anaphase-promoting complex activity"),
c("GO:0045815","positive regulation of gene expression, epigenetic",0.025,1.3161,0.879,0.345,"activation of anaphase-promoting complex activity"),
c("GO:0043393","regulation of protein binding",0.239,1.3396,0.938,0.345,"activation of anaphase-promoting complex activity"),
c("GO:0010725","regulation of primitive erythrocyte differentiation",0.001,1.5242,0.832,0.352,"activation of anaphase-promoting complex activity"),
c("GO:0019482","beta-alanine metabolic process",0.003,1.5242,0.811,0.377,"activation of anaphase-promoting complex activity"),
c("GO:0019483","beta-alanine biosynthetic process",0.002,1.5242,0.798,0.389,"activation of anaphase-promoting complex activity"),
c("GO:0060804","positive regulation of Wnt signaling pathway by BMP signaling pathway",0.005,1.5242,0.790,0.393,"activation of anaphase-promoting complex activity"),
c("GO:0018193","peptidyl-amino acid modification",2.453,2.0227,0.842,0.394,"activation of anaphase-promoting complex activity"),
c("GO:0097156","fasciculation of motor neuron axon",0.009,1.5242,0.797,0.399,"activation of anaphase-promoting complex activity"),
c("GO:0035630","bone mineralization involved in bone maturation",0.013,1.5242,0.925,0.399,"activation of anaphase-promoting complex activity"),
c("GO:0046847","filopodium assembly",0.140,1.4435,0.795,0.441,"activation of anaphase-promoting complex activity"),
c("GO:0010799","regulation of peptidyl-threonine phosphorylation",0.043,1.6838,0.812,0.450,"activation of anaphase-promoting complex activity"),
c("GO:0000961","negative regulation of mitochondrial RNA catabolic process",0.003,1.5242,0.803,0.461,"activation of anaphase-promoting complex activity"),
c("GO:0010792","DNA double-strand break processing involved in repair via single-strand annealing",0.003,1.5242,0.816,0.461,"activation of anaphase-promoting complex activity"),
c("GO:0042246","tissue regeneration",0.101,1.5722,0.898,0.463,"activation of anaphase-promoting complex activity"),
c("GO:0035054","embryonic heart tube anterior/posterior pattern specification",0.013,1.5242,0.925,0.465,"activation of anaphase-promoting complex activity"),
c("GO:0051154","negative regulation of striated muscle cell differentiation",0.137,1.3869,0.801,0.472,"activation of anaphase-promoting complex activity"),
c("GO:0010951","negative regulation of endopeptidase activity",0.499,1.5017,0.835,0.478,"activation of anaphase-promoting complex activity"),
c("GO:1901731","positive regulation of platelet aggregation",0.002,1.5242,0.768,0.486,"activation of anaphase-promoting complex activity"),
c("GO:0019442","tryptophan catabolic process to acetyl-CoA",0.007,1.5242,0.761,0.543,"activation of anaphase-promoting complex activity"),
c("GO:0010814","substance P catabolic process",0.001,1.5242,0.868,0.551,"activation of anaphase-promoting complex activity"),
c("GO:0010770","positive regulation of cell morphogenesis involved in differentiation",0.113,1.6225,0.693,0.560,"activation of anaphase-promoting complex activity"),
c("GO:0019752","carboxylic acid metabolic process",2.886,1.7739,0.735,0.568,"activation of anaphase-promoting complex activity"),
c("GO:0000052","citrulline metabolic process",0.025,1.6544,0.793,0.570,"activation of anaphase-promoting complex activity"),
c("GO:0050668","positive regulation of homocysteine metabolic process",0.005,1.5242,0.733,0.578,"activation of anaphase-promoting complex activity"),
c("GO:0034446","substrate adhesion-dependent cell spreading",0.125,1.4435,0.766,0.583,"activation of anaphase-promoting complex activity"),
c("GO:0043650","dicarboxylic acid biosynthetic process",0.033,1.5539,0.786,0.584,"activation of anaphase-promoting complex activity"),
c("GO:0030389","fructosamine metabolic process",0.001,1.5242,0.934,0.600,"activation of anaphase-promoting complex activity"),
c("GO:0051040","regulation of calcium-independent cell-cell adhesion",0.002,1.5242,0.894,0.600,"activation of anaphase-promoting complex activity"),
c("GO:0060074","synapse maturation",0.047,1.4655,0.783,0.624,"activation of anaphase-promoting complex activity"),
c("GO:0061041","regulation of wound healing",0.231,1.3041,0.909,0.660,"activation of anaphase-promoting complex activity"),
c("GO:0006214","thymidine catabolic process",0.001,1.5242,0.821,0.680,"activation of anaphase-promoting complex activity"),
c("GO:0043420","anthranilate metabolic process",0.009,1.5242,0.795,0.695,"activation of anaphase-promoting complex activity"),
c("GO:0006464","cellular protein modification process",9.809,1.3603,0.820,0.695,"activation of anaphase-promoting complex activity"),
c("GO:0022411","cellular component disassembly",0.713,3.1675,0.784,0.030,"cellular component disassembly"),
c("GO:0097031","mitochondrial respiratory chain complex I biogenesis",0.018,1.3161,0.865,0.267,"cellular component disassembly"),
c("GO:0051261","protein depolymerization",0.205,2.9747,0.724,0.329,"cellular component disassembly"),
c("GO:0034720","histone H3-K4 demethylation",0.019,2.2890,0.713,0.378,"cellular component disassembly"),
c("GO:0030046","parallel actin filament bundle assembly",0.002,1.5242,0.790,0.385,"cellular component disassembly"),
c("GO:0042766","nucleosome mobilization",0.001,1.5242,0.822,0.413,"cellular component disassembly"),
c("GO:0007010","cytoskeleton organization",2.674,2.3420,0.756,0.427,"cellular component disassembly"),
c("GO:0090224","regulation of spindle organization",0.018,2.7100,0.683,0.439,"cellular component disassembly"),
c("GO:0090382","phagosome maturation",0.065,1.8841,0.815,0.450,"cellular component disassembly"),
c("GO:0031532","actin cytoskeleton reorganization",0.144,2.0996,0.757,0.485,"cellular component disassembly"),
c("GO:0010639","negative regulation of organelle organization",0.481,2.4271,0.689,0.566,"cellular component disassembly"),
c("GO:0007067","mitotic nuclear division",0.693,2.1624,0.696,0.574,"cellular component disassembly"),
c("GO:0001578","microtubule bundle formation",0.071,2.4260,0.753,0.575,"cellular component disassembly"),
c("GO:0006996","organelle organization",7.033,1.4278,0.769,0.583,"cellular component disassembly"),
c("GO:0031577","spindle checkpoint",0.105,1.7459,0.844,0.602,"cellular component disassembly"),
c("GO:0043623","cellular protein complex assembly",1.060,2.3497,0.783,0.605,"cellular component disassembly"),
c("GO:0010257","NADH dehydrogenase complex assembly",0.018,1.3161,0.834,0.613,"cellular component disassembly"),
c("GO:0032981","mitochondrial respiratory chain complex I assembly",0.018,1.3161,0.796,0.613,"cellular component disassembly"),
c("GO:0000226","microtubule cytoskeleton organization",0.999,2.1662,0.711,0.662,"cellular component disassembly"),
c("GO:0033043","regulation of organelle organization",1.797,1.9582,0.695,0.670,"cellular component disassembly"),
c("GO:0000075","cell cycle checkpoint",0.476,1.4578,0.841,0.691,"cellular component disassembly"),
c("GO:0090068","positive regulation of cell cycle process",0.509,1.4595,0.754,0.695,"cellular component disassembly"),
c("GO:0043146","spindle stabilization",0.005,2.5817,0.663,0.698,"cellular component disassembly"),
c("GO:0042445","hormone metabolic process",0.448,2.9393,0.877,0.045,"hormone metabolism"),
c("GO:0003084","positive regulation of systemic arterial blood pressure",0.027,1.6544,0.884,0.356,"hormone metabolism"),
c("GO:0031648","protein destabilization",0.034,1.9543,0.861,0.362,"hormone metabolism"),
c("GO:0001504","neurotransmitter uptake",0.060,1.3161,0.836,0.378,"hormone metabolism"),
c("GO:0007600","sensory perception",1.733,1.5397,0.921,0.494,"hormone metabolism"),
c("GO:0055119","relaxation of cardiac muscle",0.030,1.4655,0.938,0.497,"hormone metabolism"),
c("GO:0034959","endothelin maturation",0.001,1.5242,0.779,0.626,"hormone metabolism"),
c("GO:0008217","regulation of blood pressure",0.397,1.4022,0.869,0.648,"hormone metabolism"),
c("GO:0010818","T cell chemotaxis",0.018,2.8761,0.817,0.064,"T cell chemotaxis"),
c("GO:0035585","calcium-mediated signaling using extracellular calcium source",0.003,1.5242,0.874,0.142,"T cell chemotaxis"),
c("GO:1901684","arsenate ion transmembrane transport",0.006,1.5242,0.882,0.147,"T cell chemotaxis"),
c("GO:0036337","Fas signaling pathway",0.003,1.5242,0.875,0.149,"T cell chemotaxis"),
c("GO:0034502","protein localization to chromosome",0.044,2.1221,0.949,0.165,"T cell chemotaxis"),
c("GO:1902044","regulation of Fas signaling pathway",0.002,1.5242,0.870,0.210,"T cell chemotaxis"),
c("GO:0000296","spermine transport",0.001,1.5242,0.931,0.222,"T cell chemotaxis"),
c("GO:0015793","glycerol transport",0.009,1.5242,0.932,0.259,"T cell chemotaxis"),
c("GO:0046689","response to mercury ion",0.019,2.2890,0.953,0.260,"T cell chemotaxis"),
c("GO:0032487","regulation of Rap protein signal transduction",0.043,1.4655,0.847,0.289,"T cell chemotaxis"),
c("GO:0072734","cellular response to staurosporine",0.006,1.5242,0.912,0.300,"T cell chemotaxis"),
c("GO:0043270","positive regulation of ion transport",0.304,1.4912,0.864,0.302,"T cell chemotaxis"),
c("GO:0009636","response to toxic substance",0.330,1.6515,0.950,0.313,"T cell chemotaxis"),
c("GO:0035456","response to interferon-beta",0.027,1.4655,0.954,0.321,"T cell chemotaxis"),
c("GO:0070560","protein secretion by platelet",0.003,1.5242,0.889,0.321,"T cell chemotaxis"),
c("GO:0010996","response to auditory stimulus",0.026,2.0757,0.945,0.353,"T cell chemotaxis"),
c("GO:0015855","pyrimidine nucleobase transport",0.002,1.5242,0.935,0.353,"T cell chemotaxis"),
c("GO:0034516","response to vitamin B6",0.001,1.5242,0.940,0.365,"T cell chemotaxis"),
c("GO:0015846","polyamine transport",0.005,1.5242,0.933,0.376,"T cell chemotaxis"),
c("GO:1902166","negative regulation of intrinsic apoptotic signaling pathway in response to DNA damage by p53 class mediator",0.016,1.4655,0.808,0.385,"T cell chemotaxis"),
c("GO:0046597","negative regulation of viral entry into host cell",0.021,2.0757,0.824,0.386,"T cell chemotaxis"),
c("GO:0015722","canalicular bile acid transport",0.006,1.5242,0.923,0.408,"T cell chemotaxis"),
c("GO:0051707","response to other organism",1.534,1.7073,0.897,0.478,"T cell chemotaxis"),
c("GO:0071459","protein localization to chromosome, centromeric region",0.005,1.5242,0.954,0.486,"T cell chemotaxis"),
c("GO:0019042","viral latency",0.014,1.5539,0.920,0.530,"T cell chemotaxis"),
c("GO:0015804","neutral amino acid transport",0.080,1.4655,0.908,0.587,"T cell chemotaxis"),
c("GO:0010288","response to lead ion",0.043,1.7708,0.952,0.617,"T cell chemotaxis"),
c("GO:0072733","response to staurosporine",0.006,1.5242,0.953,0.642,"T cell chemotaxis"),
c("GO:0072676","lymphocyte migration",0.082,1.3407,0.862,0.669,"T cell chemotaxis"),
c("GO:0051928","positive regulation of calcium ion transport",0.122,1.5844,0.862,0.693,"T cell chemotaxis"),
c("GO:0072524","pyridine-containing compound metabolic process",0.204,2.7352,0.854,0.066,"pyridine-containing compound metabolism"),
c("GO:0042816","vitamin B6 metabolic process",0.008,2.2890,0.824,0.241,"pyridine-containing compound metabolism"),
c("GO:0042430","indole-containing compound metabolic process",0.075,1.7708,0.863,0.281,"pyridine-containing compound metabolism"),
c("GO:0043456","regulation of pentose-phosphate shunt",0.001,1.5242,0.773,0.594,"pyridine-containing compound metabolism"),
c("GO:0097502","mannosylation",0.040,2.2175,0.897,0.069,"mannosylation"),
c("GO:0030647","aminoglycoside antibiotic metabolic process",0.015,1.6544,0.890,0.117,"mannosylation"),
c("GO:0008610","lipid biosynthetic process",1.351,2.1824,0.831,0.161,"mannosylation"),
c("GO:0097359","UDP-glucosylation",0.015,1.5242,0.832,0.228,"mannosylation"),
c("GO:0016310","phosphorylation",10.160,1.4951,0.874,0.261,"mannosylation"),
c("GO:0010430","fatty acid omega-oxidation",0.002,1.5242,0.812,0.446,"mannosylation"),
c("GO:0016098","monoterpenoid metabolic process",0.007,1.5242,0.865,0.482,"mannosylation"),
c("GO:0044283","small molecule biosynthetic process",1.120,1.8173,0.827,0.659,"mannosylation"),
c("GO:0006694","steroid biosynthetic process",0.329,2.0232,0.836,0.668,"mannosylation"),
c("GO:0006493","protein O-linked glycosylation",0.131,1.6236,0.790,0.675,"mannosylation"),
c("GO:0044763","single-organism cellular process",45.302,3.0506,0.913,0.073,"single-organism cellular process"),
c("GO:0044710","single-organism metabolic process",26.477,2.7670,0.923,0.089,"single-organism metabolism"),
c("GO:0007017","microtubule-based process",1.838,1.4936,0.893,0.097,"microtubule-based process"));

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
