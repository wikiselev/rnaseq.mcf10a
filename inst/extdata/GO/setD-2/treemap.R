

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
revigo.data <- rbind(c("GO:0000278","mitotic cell cycle",1.725,4.1367,0.755,0.000,"mitotic cell cycle"),
c("GO:0051301","cell division",1.708,2.1068,0.892,0.107,"mitotic cell cycle"),
c("GO:0007017","microtubule-based process",1.838,3.2007,0.891,0.108,"mitotic cell cycle"),
c("GO:0022904","respiratory electron transport chain",4.683,2.7471,0.802,0.123,"mitotic cell cycle"),
c("GO:0044710","single-organism metabolic process",26.477,2.2604,0.928,0.124,"mitotic cell cycle"),
c("GO:0007049","cell cycle",3.703,2.7375,0.884,0.136,"mitotic cell cycle"),
c("GO:0043455","regulation of secondary metabolic process",0.006,1.5319,0.891,0.152,"mitotic cell cycle"),
c("GO:1901128","gentamycin metabolic process",0.006,1.8297,0.869,0.152,"mitotic cell cycle"),
c("GO:0016098","monoterpenoid metabolic process",0.007,1.8297,0.879,0.154,"mitotic cell cycle"),
c("GO:0006091","generation of precursor metabolites and energy",6.571,1.4302,0.894,0.173,"mitotic cell cycle"),
c("GO:0009110","vitamin biosynthetic process",0.052,1.5452,0.827,0.200,"mitotic cell cycle"),
c("GO:0070988","demethylation",0.408,1.7675,0.908,0.228,"mitotic cell cycle"),
c("GO:0055114","oxidation-reduction process",10.933,2.0975,0.877,0.370,"mitotic cell cycle"),
c("GO:0044281","small molecule metabolic process",13.539,1.5286,0.875,0.464,"mitotic cell cycle"),
c("GO:0044283","small molecule biosynthetic process",1.120,1.3267,0.863,0.481,"mitotic cell cycle"),
c("GO:0040038","polar body extrusion after meiotic divisions",0.013,1.3590,0.694,0.487,"mitotic cell cycle"),
c("GO:0019336","phenol-containing compound catabolic process",0.023,1.3590,0.853,0.489,"mitotic cell cycle"),
c("GO:0044107","cellular alcohol metabolic process",0.008,1.5319,0.839,0.507,"mitotic cell cycle"),
c("GO:1902652","secondary alcohol metabolic process",0.008,1.5319,0.873,0.516,"mitotic cell cycle"),
c("GO:0009449","gamma-aminobutyric acid biosynthetic process",0.010,1.5319,0.822,0.531,"mitotic cell cycle"),
c("GO:0007077","mitotic nuclear envelope disassembly",0.042,2.1918,0.646,0.537,"mitotic cell cycle"),
c("GO:0051122","hepoxilin biosynthetic process",0.006,1.3590,0.836,0.572,"mitotic cell cycle"),
c("GO:0031577","spindle checkpoint",0.105,2.8210,0.785,0.581,"mitotic cell cycle"),
c("GO:0045787","positive regulation of cell cycle",0.253,1.9927,0.730,0.632,"mitotic cell cycle"),
c("GO:0051121","hepoxilin metabolic process",0.006,1.3590,0.847,0.641,"mitotic cell cycle"),
c("GO:0030397","membrane disassembly",0.054,2.1007,0.755,0.641,"mitotic cell cycle"),
c("GO:0000075","cell cycle checkpoint",0.476,1.3630,0.771,0.675,"mitotic cell cycle"),
c("GO:0051321","meiotic cell cycle",0.540,1.3393,0.776,0.684,"mitotic cell cycle"),
c("GO:0090068","positive regulation of cell cycle process",0.509,1.6353,0.700,0.686,"mitotic cell cycle"),
c("GO:0034502","protein localization to chromosome",0.044,2.9872,0.950,0.000,"protein localization to chromosome"),
c("GO:0015855","pyrimidine nucleobase transport",0.002,1.8297,0.933,0.147,"protein localization to chromosome"),
c("GO:0015793","glycerol transport",0.009,1.8297,0.933,0.268,"protein localization to chromosome"),
c("GO:0006403","RNA localization",0.263,1.5280,0.949,0.397,"protein localization to chromosome"),
c("GO:0050658","RNA transport",0.247,1.6142,0.922,0.466,"protein localization to chromosome"),
c("GO:0071459","protein localization to chromosome, centromeric region",0.005,1.8297,0.953,0.486,"protein localization to chromosome"),
c("GO:0072531","pyrimidine-containing compound transmembrane transport",0.015,1.3590,0.873,0.525,"protein localization to chromosome"),
c("GO:0015791","polyol transport",0.013,1.3590,0.932,0.589,"protein localization to chromosome"),
c("GO:0015931","nucleobase-containing compound transport",0.319,1.3367,0.934,0.662,"protein localization to chromosome"),
c("GO:0044699","single-organism process",71.655,2.1911,0.998,0.000,"single-organism process"),
c("GO:0046689","response to mercury ion",0.019,2.8928,0.971,0.000,"response to mercury ion"),
c("GO:0072734","cellular response to staurosporine",0.006,1.8297,0.933,0.244,"response to mercury ion"),
c("GO:0042493","response to drug",1.179,1.5561,0.970,0.344,"response to mercury ion"),
c("GO:0033574","response to testosterone",0.075,1.5452,0.970,0.434,"response to mercury ion"),
c("GO:0071374","cellular response to parathyroid hormone stimulus",0.013,1.3590,0.932,0.455,"response to mercury ion"),
c("GO:0035864","response to potassium ion",0.013,1.3590,0.971,0.573,"response to mercury ion"),
c("GO:0010288","response to lead ion",0.043,2.3615,0.970,0.617,"response to mercury ion"),
c("GO:0072733","response to staurosporine",0.006,1.8297,0.972,0.642,"response to mercury ion"),
c("GO:0071840","cellular component organization or biogenesis",12.603,1.4836,0.994,0.000,"cellular component organization or biogenesis"),
c("GO:0043588","skin development",0.701,2.1612,0.893,0.021,"skin development"),
c("GO:0044338","canonical Wnt signaling pathway involved in mesenchymal stem cell differentiation",0.002,1.5319,0.861,0.227,"skin development"),
c("GO:0010725","regulation of primitive erythrocyte differentiation",0.001,1.8297,0.813,0.295,"skin development"),
c("GO:0001552","ovarian follicle atresia",0.003,1.8297,0.921,0.317,"skin development"),
c("GO:0060074","synapse maturation",0.047,2.0429,0.744,0.331,"skin development"),
c("GO:0097187","dentinogenesis",0.007,1.5319,0.918,0.332,"skin development"),
c("GO:0097156","fasciculation of motor neuron axon",0.009,1.8297,0.758,0.337,"skin development"),
c("GO:0010994","free ubiquitin chain polymerization",0.002,1.5319,0.737,0.442,"skin development"),
c("GO:0009913","epidermal cell differentiation",0.313,2.2790,0.828,0.450,"skin development"),
c("GO:0003408","optic cup formation involved in camera-type eye development",0.010,1.5319,0.910,0.473,"skin development"),
c("GO:0044339","canonical Wnt signaling pathway involved in osteoblast differentiation",0.002,1.5319,0.844,0.500,"skin development"),
c("GO:0042637","catagen",0.005,1.3590,0.911,0.647,"skin development"),
c("GO:0019046","release from viral latency",0.003,1.5319,0.959,0.029,"release from viral latency"),
c("GO:0051488","activation of anaphase-promoting complex activity",0.011,3.9586,0.810,0.032,"activation of anaphase-promoting complex activity"),
c("GO:0032814","regulation of natural killer cell activation",0.049,1.6423,0.853,0.105,"activation of anaphase-promoting complex activity"),
c("GO:0042982","amyloid precursor protein metabolic process",0.072,1.5452,0.930,0.180,"activation of anaphase-promoting complex activity"),
c("GO:0001867","complement activation, lectin pathway",0.015,1.3590,0.869,0.183,"activation of anaphase-promoting complex activity"),
c("GO:0034248","regulation of cellular amide metabolic process",0.058,1.3590,0.844,0.189,"activation of anaphase-promoting complex activity"),
c("GO:0040029","regulation of gene expression, epigenetic",0.334,1.5141,0.884,0.221,"activation of anaphase-promoting complex activity"),
c("GO:0031145","anaphase-promoting complex-dependent proteasomal ubiquitin-dependent protein catabolic process",0.103,2.6946,0.856,0.223,"activation of anaphase-promoting complex activity"),
c("GO:0070084","protein initiator methionine removal",0.008,1.8297,0.903,0.226,"activation of anaphase-promoting complex activity"),
c("GO:0018149","peptide cross-linking",0.099,2.5867,0.887,0.262,"activation of anaphase-promoting complex activity"),
c("GO:0034767","positive regulation of ion transmembrane transport",0.056,1.9602,0.802,0.271,"activation of anaphase-promoting complex activity"),
c("GO:2001106","regulation of Rho guanyl-nucleotide exchange factor activity",0.005,1.5319,0.946,0.273,"activation of anaphase-promoting complex activity"),
c("GO:0009822","alkaloid catabolic process",0.003,1.5319,0.880,0.291,"activation of anaphase-promoting complex activity"),
c("GO:0050668","positive regulation of homocysteine metabolic process",0.005,1.8297,0.768,0.297,"activation of anaphase-promoting complex activity"),
c("GO:1901684","arsenate ion transmembrane transport",0.006,1.8297,0.877,0.304,"activation of anaphase-promoting complex activity"),
c("GO:2001108","positive regulation of Rho guanyl-nucleotide exchange factor activity",0.001,1.8297,0.947,0.306,"activation of anaphase-promoting complex activity"),
c("GO:2000179","positive regulation of neural precursor cell proliferation",0.095,1.5452,0.869,0.311,"activation of anaphase-promoting complex activity"),
c("GO:0042738","exogenous drug catabolic process",0.015,1.5319,0.886,0.318,"activation of anaphase-promoting complex activity"),
c("GO:0032091","negative regulation of protein binding",0.081,1.9024,0.935,0.322,"activation of anaphase-promoting complex activity"),
c("GO:0008214","protein dealkylation",0.365,1.4594,0.877,0.334,"activation of anaphase-promoting complex activity"),
c("GO:0032314","regulation of Rac GTPase activity",0.039,1.3828,0.750,0.348,"activation of anaphase-promoting complex activity"),
c("GO:0015722","canalicular bile acid transport",0.006,1.8297,0.920,0.408,"activation of anaphase-promoting complex activity"),
c("GO:0044341","sodium-dependent phosphate transport",0.024,1.5319,0.910,0.441,"activation of anaphase-promoting complex activity"),
c("GO:0010800","positive regulation of peptidyl-threonine phosphorylation",0.022,1.8167,0.800,0.453,"activation of anaphase-promoting complex activity"),
c("GO:0000961","negative regulation of mitochondrial RNA catabolic process",0.003,1.8297,0.793,0.461,"activation of anaphase-promoting complex activity"),
c("GO:0010792","DNA double-strand break processing involved in repair via single-strand annealing",0.003,1.8297,0.839,0.461,"activation of anaphase-promoting complex activity"),
c("GO:1902600","hydrogen ion transmembrane transport",3.156,1.3025,0.830,0.480,"activation of anaphase-promoting complex activity"),
c("GO:0033133","positive regulation of glucokinase activity",0.011,1.3590,0.820,0.492,"activation of anaphase-promoting complex activity"),
c("GO:0070779","D-aspartate import",0.003,1.5319,0.915,0.495,"activation of anaphase-promoting complex activity"),
c("GO:0019752","carboxylic acid metabolic process",2.886,1.5578,0.782,0.498,"activation of anaphase-promoting complex activity"),
c("GO:0032803","regulation of low-density lipoprotein particle receptor catabolic process",0.006,1.3590,0.819,0.523,"activation of anaphase-promoting complex activity"),
c("GO:0070257","positive regulation of mucus secretion",0.018,1.3590,0.817,0.525,"activation of anaphase-promoting complex activity"),
c("GO:0006026","aminoglycan catabolic process",0.114,1.5682,0.860,0.542,"activation of anaphase-promoting complex activity"),
c("GO:0042762","regulation of sulfur metabolic process",0.036,1.3590,0.849,0.543,"activation of anaphase-promoting complex activity"),
c("GO:0010923","negative regulation of phosphatase activity",0.088,1.4940,0.828,0.548,"activation of anaphase-promoting complex activity"),
c("GO:0042940","D-amino acid transport",0.009,1.3590,0.913,0.563,"activation of anaphase-promoting complex activity"),
c("GO:0034764","positive regulation of transmembrane transport",0.062,1.8167,0.808,0.653,"activation of anaphase-promoting complex activity"),
c("GO:0045963","negative regulation of dopamine metabolic process",0.009,1.5319,0.757,0.685,"activation of anaphase-promoting complex activity"),
c("GO:0042445","hormone metabolic process",0.448,2.3382,0.886,0.045,"hormone metabolism"),
c("GO:0003084","positive regulation of systemic arterial blood pressure",0.027,2.2411,0.863,0.356,"hormone metabolism"),
c("GO:0060457","negative regulation of digestive system process",0.024,1.5319,0.833,0.366,"hormone metabolism"),
c("GO:0030104","water homeostasis",0.084,1.3828,0.916,0.388,"hormone metabolism"),
c("GO:0031647","regulation of protein stability",0.216,1.9927,0.848,0.419,"hormone metabolism"),
c("GO:0090383","phagosome acidification",0.006,1.3590,0.752,0.452,"hormone metabolism"),
c("GO:0001895","retina homeostasis",0.095,1.3138,0.866,0.473,"hormone metabolism"),
c("GO:0007600","sensory perception",1.733,1.8289,0.882,0.494,"hormone metabolism"),
c("GO:1901898","negative regulation of relaxation of cardiac muscle",0.002,1.5319,0.854,0.499,"hormone metabolism"),
c("GO:0010989","negative regulation of low-density lipoprotein particle clearance",0.013,1.5319,0.847,0.548,"hormone metabolism"),
c("GO:0008217","regulation of blood pressure",0.397,1.4470,0.841,0.648,"hormone metabolism"),
c("GO:0031648","protein destabilization",0.034,1.6423,0.864,0.672,"hormone metabolism"),
c("GO:0008210","estrogen metabolic process",0.049,1.8851,0.813,0.695,"hormone metabolism"),
c("GO:0007605","sensory perception of sound",0.268,1.6229,0.896,0.696,"hormone metabolism"),
c("GO:0031223","auditory behavior",0.014,1.3590,0.969,0.045,"auditory behavior"),
c("GO:0032259","methylation",1.044,1.3485,0.962,0.055,"methylation"),
c("GO:0035425","autocrine signaling",0.002,1.5319,0.925,0.059,"autocrine signaling"),
c("GO:0060160","negative regulation of dopamine receptor signaling pathway",0.006,1.5319,0.844,0.142,"autocrine signaling"),
c("GO:0031915","positive regulation of synaptic plasticity",0.013,1.3590,0.849,0.365,"autocrine signaling"),
c("GO:0072524","pyridine-containing compound metabolic process",0.204,2.4034,0.870,0.066,"pyridine-containing compound metabolism"),
c("GO:0042431","indole metabolic process",0.006,1.8297,0.895,0.236,"pyridine-containing compound metabolism"),
c("GO:0046496","nicotinamide nucleotide metabolic process",0.179,1.7364,0.782,0.300,"pyridine-containing compound metabolism"),
c("GO:0044763","single-organism cellular process",45.302,2.7122,0.910,0.086,"single-organism cellular process"),
c("GO:0000226","microtubule cytoskeleton organization",0.999,3.9586,0.665,0.100,"microtubule cytoskeleton organization"),
c("GO:0045218","zonula adherens maintenance",0.003,1.3590,0.825,0.246,"microtubule cytoskeleton organization"),
c("GO:0097031","mitochondrial respiratory chain complex I biogenesis",0.018,1.8851,0.838,0.274,"microtubule cytoskeleton organization"),
c("GO:0042766","nucleosome mobilization",0.001,1.8297,0.779,0.309,"microtubule cytoskeleton organization"),
c("GO:0022411","cellular component disassembly",0.713,2.0757,0.753,0.383,"microtubule cytoskeleton organization"),
c("GO:0090382","phagosome maturation",0.065,1.9772,0.776,0.413,"microtubule cytoskeleton organization"),
c("GO:0034720","histone H3-K4 demethylation",0.019,2.8928,0.678,0.425,"microtubule cytoskeleton organization"),
c("GO:0030046","parallel actin filament bundle assembly",0.002,1.8297,0.765,0.461,"microtubule cytoskeleton organization"),
c("GO:0043988","histone H3-S28 phosphorylation",0.011,1.3590,0.680,0.491,"microtubule cytoskeleton organization"),
c("GO:0010639","negative regulation of organelle organization",0.481,2.5272,0.631,0.496,"microtubule cytoskeleton organization"),
c("GO:0006996","organelle organization",7.033,2.7986,0.727,0.504,"microtubule cytoskeleton organization"),
c("GO:0031536","positive regulation of exit from mitosis",0.009,1.3590,0.633,0.539,"microtubule cytoskeleton organization"),
c("GO:0043623","cellular protein complex assembly",1.060,1.8533,0.743,0.541,"microtubule cytoskeleton organization"),
c("GO:0050773","regulation of dendrite development",0.193,1.9523,0.642,0.541,"microtubule cytoskeleton organization"),
c("GO:0048285","organelle fission",1.175,3.1024,0.723,0.545,"microtubule cytoskeleton organization"),
c("GO:0046847","filopodium assembly",0.140,1.6211,0.762,0.545,"microtubule cytoskeleton organization"),
c("GO:0090224","regulation of spindle organization",0.018,3.6021,0.615,0.594,"microtubule cytoskeleton organization"),
c("GO:0007010","cytoskeleton organization",2.674,2.6055,0.703,0.612,"microtubule cytoskeleton organization"),
c("GO:0010257","NADH dehydrogenase complex assembly",0.018,1.8851,0.804,0.613,"microtubule cytoskeleton organization"),
c("GO:0032981","mitochondrial respiratory chain complex I assembly",0.018,1.8851,0.763,0.613,"microtubule cytoskeleton organization"),
c("GO:0016568","chromatin modification",1.536,1.6874,0.669,0.639,"microtubule cytoskeleton organization"),
c("GO:0033108","mitochondrial respiratory chain complex assembly",0.040,1.5452,0.752,0.652,"microtubule cytoskeleton organization"),
c("GO:0048681","negative regulation of axon regeneration",0.014,1.3590,0.662,0.655,"microtubule cytoskeleton organization"),
c("GO:0001578","microtubule bundle formation",0.071,2.4001,0.714,0.662,"microtubule cytoskeleton organization"),
c("GO:0051276","chromosome organization",2.327,1.5289,0.707,0.669,"microtubule cytoskeleton organization"),
c("GO:0033043","regulation of organelle organization",1.797,1.5498,0.644,0.670,"microtubule cytoskeleton organization"),
c("GO:0007019","microtubule depolymerization",0.087,3.5686,0.664,0.673,"microtubule cytoskeleton organization"),
c("GO:0014013","regulation of gliogenesis",0.187,1.6486,0.785,0.673,"microtubule cytoskeleton organization"),
c("GO:0051569","regulation of histone H3-K4 methylation",0.056,1.6962,0.599,0.680,"microtubule cytoskeleton organization"),
c("GO:0034453","microtubule anchoring",0.133,1.3828,0.630,0.699,"microtubule cytoskeleton organization"),
c("GO:0000212","meiotic spindle organization",0.016,1.3590,0.661,0.699,"microtubule cytoskeleton organization"));

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
