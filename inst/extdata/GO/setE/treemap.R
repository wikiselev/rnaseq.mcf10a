

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
revigo.data <- rbind(c("GO:0023052","signaling",17.329,5.7447,0.995,0.000,"signaling"),
c("GO:0032501","multicellular organismal process",15.657,4.5686,0.995,0.000,"multicellular organismal process"),
c("GO:0032502","developmental process",13.055,4.3188,0.995,0.000,"developmental process"),
c("GO:0040007","growth",2.160,1.9897,0.994,0.000,"growth"),
c("GO:0040011","locomotion",3.285,2.5575,0.994,0.000,"locomotion"),
c("GO:0050896","response to stimulus",47.248,5.0223,0.997,0.000,"response to stimulus"),
c("GO:0051056","regulation of small GTPase mediated signal transduction",1.620,5.3872,0.731,0.000,"regulation of small GTPase mediated signal transduction"),
c("GO:0030029","actin filament-based process",1.610,2.9172,0.908,0.105,"regulation of small GTPase mediated signal transduction"),
c("GO:0007154","cell communication",17.535,6.0605,0.878,0.148,"regulation of small GTPase mediated signal transduction"),
c("GO:0042981","regulation of apoptotic process",3.144,3.4559,0.760,0.232,"regulation of small GTPase mediated signal transduction"),
c("GO:0038166","angiotensin-activated signaling pathway",0.014,1.9602,0.844,0.236,"regulation of small GTPase mediated signal transduction"),
c("GO:0038034","signal transduction in absence of ligand",0.226,2.6108,0.813,0.301,"regulation of small GTPase mediated signal transduction"),
c("GO:0016055","Wnt signaling pathway",0.887,3.3468,0.782,0.347,"regulation of small GTPase mediated signal transduction"),
c("GO:0048584","positive regulation of response to stimulus",22.389,2.2255,0.840,0.347,"regulation of small GTPase mediated signal transduction"),
c("GO:0007267","cell-cell signaling",2.522,2.5072,0.847,0.371,"regulation of small GTPase mediated signal transduction"),
c("GO:0071526","semaphorin-plexin signaling pathway",0.098,2.5482,0.820,0.378,"regulation of small GTPase mediated signal transduction"),
c("GO:0038127","ERBB signaling pathway",0.360,2.0044,0.798,0.425,"regulation of small GTPase mediated signal transduction"),
c("GO:0048016","inositol phosphate-mediated signaling",0.049,2.1062,0.818,0.429,"regulation of small GTPase mediated signal transduction"),
c("GO:0010646","regulation of cell communication",6.570,6.3098,0.763,0.448,"regulation of small GTPase mediated signal transduction"),
c("GO:0023051","regulation of signaling",6.570,6.0000,0.830,0.453,"regulation of small GTPase mediated signal transduction"),
c("GO:0012502","induction of programmed cell death",0.007,1.9602,0.834,0.513,"regulation of small GTPase mediated signal transduction"),
c("GO:0090080","positive regulation of MAPKKK cascade by fibroblast growth factor receptor signaling pathway",0.013,1.9602,0.741,0.557,"regulation of small GTPase mediated signal transduction"),
c("GO:0030111","regulation of Wnt signaling pathway",0.482,3.0088,0.763,0.564,"regulation of small GTPase mediated signal transduction"),
c("GO:0044334","canonical Wnt signaling pathway involved in positive regulation of epithelial to mesenchymal transition",0.002,1.9602,0.630,0.585,"regulation of small GTPase mediated signal transduction"),
c("GO:0007165","signal transduction",16.054,5.2366,0.708,0.637,"regulation of small GTPase mediated signal transduction"),
c("GO:2001244","positive regulation of intrinsic apoptotic signaling pathway",0.088,2.0768,0.744,0.637,"regulation of small GTPase mediated signal transduction"),
c("GO:0035556","intracellular signal transduction",6.704,2.1198,0.737,0.640,"regulation of small GTPase mediated signal transduction"),
c("GO:0023057","negative regulation of signaling",2.197,4.1871,0.784,0.641,"regulation of small GTPase mediated signal transduction"),
c("GO:0010648","negative regulation of cell communication",2.203,4.1079,0.734,0.641,"regulation of small GTPase mediated signal transduction"),
c("GO:0046579","positive regulation of Ras protein signal transduction",0.098,2.0980,0.766,0.641,"regulation of small GTPase mediated signal transduction"),
c("GO:0070885","negative regulation of calcineurin-NFAT signaling cascade",0.011,1.9602,0.797,0.651,"regulation of small GTPase mediated signal transduction"),
c("GO:0007166","cell surface receptor signaling pathway",8.919,4.0362,0.727,0.683,"regulation of small GTPase mediated signal transduction"),
c("GO:0065007","biological regulation",51.216,5.4318,0.997,0.000,"biological regulation"),
c("GO:0015914","phospholipid transport",0.155,2.1891,0.944,0.018,"phospholipid transport"),
c("GO:0090088","regulation of oligopeptide transport",0.003,1.9602,0.900,0.320,"phospholipid transport"),
c("GO:0006868","glutamine transport",0.015,1.9602,0.943,0.604,"phospholipid transport"),
c("GO:0000101","sulfur amino acid transport",0.015,1.9602,0.948,0.625,"phospholipid transport"),
c("GO:0010463","mesenchymal cell proliferation",0.222,3.6021,0.941,0.018,"mesenchymal cell proliferation"),
c("GO:0072089","stem cell proliferation",0.477,3.0458,0.947,0.536,"mesenchymal cell proliferation"),
c("GO:0042127","regulation of cell proliferation",3.148,1.9931,0.802,0.697,"mesenchymal cell proliferation"),
c("GO:0009887","organ morphogenesis",2.260,5.3098,0.642,0.024,"organ morphogenesis"),
c("GO:0097242","beta-amyloid clearance",0.010,1.9602,0.854,0.247,"organ morphogenesis"),
c("GO:0002021","response to dietary excess",0.036,2.0092,0.820,0.274,"organ morphogenesis"),
c("GO:0032613","interleukin-10 production",0.093,2.5482,0.824,0.298,"organ morphogenesis"),
c("GO:0035265","organ growth",0.300,3.2291,0.809,0.334,"organ morphogenesis"),
c("GO:0061549","sympathetic ganglion development",0.021,2.3747,0.745,0.341,"organ morphogenesis"),
c("GO:0009954","proximal/distal pattern formation",0.088,3.2518,0.743,0.359,"organ morphogenesis"),
c("GO:0061548","ganglion development",0.023,2.3747,0.743,0.360,"organ morphogenesis"),
c("GO:0035166","post-embryonic hemopoiesis",0.010,2.9393,0.758,0.372,"organ morphogenesis"),
c("GO:0060658","nipple morphogenesis",0.007,1.9602,0.765,0.395,"organ morphogenesis"),
c("GO:0048619","embryonic hindgut morphogenesis",0.010,1.9602,0.754,0.408,"organ morphogenesis"),
c("GO:0035272","exocrine system development",0.178,2.2449,0.736,0.413,"organ morphogenesis"),
c("GO:0048569","post-embryonic organ development",0.038,2.2782,0.752,0.414,"organ morphogenesis"),
c("GO:0097491","sympathetic neuron projection guidance",0.017,2.3747,0.685,0.424,"organ morphogenesis"),
c("GO:0045596","negative regulation of cell differentiation",1.429,4.6021,0.565,0.442,"organ morphogenesis"),
c("GO:0055123","digestive system development",0.349,2.0106,0.721,0.443,"organ morphogenesis"),
c("GO:0001708","cell fate specification",0.197,2.2565,0.721,0.443,"organ morphogenesis"),
c("GO:0048709","oligodendrocyte differentiation",0.234,3.3010,0.669,0.450,"organ morphogenesis"),
c("GO:0035270","endocrine system development",0.434,2.4437,0.716,0.453,"organ morphogenesis"),
c("GO:0060219","camera-type eye photoreceptor cell differentiation",0.028,1.9602,0.683,0.458,"organ morphogenesis"),
c("GO:0003008","system process",4.235,3.0458,0.769,0.462,"organ morphogenesis"),
c("GO:0035909","aorta morphogenesis",0.050,1.9531,0.742,0.464,"organ morphogenesis"),
c("GO:0007389","pattern specification process",1.143,3.1871,0.706,0.470,"organ morphogenesis"),
c("GO:0061061","muscle structure development",1.451,2.7011,0.717,0.476,"organ morphogenesis"),
c("GO:0031016","pancreas development",0.197,2.1726,0.721,0.482,"organ morphogenesis"),
c("GO:0006949","syncytium formation",0.077,2.2343,0.723,0.483,"organ morphogenesis"),
c("GO:0060385","axonogenesis involved in innervation",0.017,2.0114,0.709,0.483,"organ morphogenesis"),
c("GO:0001655","urogenital system development",0.815,3.1487,0.701,0.486,"organ morphogenesis"),
c("GO:0060993","kidney morphogenesis",0.105,4.7959,0.669,0.497,"organ morphogenesis"),
c("GO:0042109","lymphotoxin A biosynthetic process",0.003,1.9602,0.823,0.500,"organ morphogenesis"),
c("GO:0048608","reproductive structure development",1.170,3.4815,0.682,0.508,"organ morphogenesis"),
c("GO:0061458","reproductive system development",1.184,3.4437,0.691,0.508,"organ morphogenesis"),
c("GO:0050793","regulation of developmental process",4.431,4.0458,0.655,0.513,"organ morphogenesis"),
c("GO:0022038","corpus callosum development",0.025,2.0092,0.748,0.518,"organ morphogenesis"),
c("GO:0097490","sympathetic neuron projection extension",0.017,2.3747,0.703,0.518,"organ morphogenesis"),
c("GO:0042692","muscle cell differentiation",0.964,3.3979,0.666,0.522,"organ morphogenesis"),
c("GO:0009790","embryo development",2.628,3.4685,0.679,0.524,"organ morphogenesis"),
c("GO:0002520","immune system development",1.845,2.0969,0.670,0.537,"organ morphogenesis"),
c("GO:0060618","nipple development",0.007,1.9602,0.776,0.540,"organ morphogenesis"),
c("GO:0060485","mesenchyme development",0.581,2.1537,0.679,0.540,"organ morphogenesis"),
c("GO:0051124","synaptic growth at neuromuscular junction",0.011,2.0114,0.736,0.542,"organ morphogenesis"),
c("GO:0002062","chondrocyte differentiation",0.244,2.0283,0.660,0.544,"organ morphogenesis"),
c("GO:0007498","mesoderm development",0.291,1.9547,0.738,0.553,"organ morphogenesis"),
c("GO:0009888","tissue development",4.199,3.4949,0.699,0.563,"organ morphogenesis"),
c("GO:0048585","negative regulation of response to stimulus",2.501,3.5850,0.838,0.565,"organ morphogenesis"),
c("GO:0035108","limb morphogenesis",0.455,2.1433,0.696,0.576,"organ morphogenesis"),
c("GO:0050702","interleukin-1 beta secretion",0.034,2.0092,0.782,0.577,"organ morphogenesis"),
c("GO:1902285","semaphorin-plexin signaling pathway involved in neuron projection guidance",0.019,2.3747,0.621,0.579,"organ morphogenesis"),
c("GO:0060715","syncytiotrophoblast cell differentiation involved in labyrinthine layer development",0.002,1.9602,0.748,0.579,"organ morphogenesis"),
c("GO:0042063","gliogenesis",0.620,2.4342,0.650,0.584,"organ morphogenesis"),
c("GO:0048568","embryonic organ development",1.162,3.1367,0.669,0.586,"organ morphogenesis"),
c("GO:0042475","odontogenesis of dentin-containing tooth",0.342,3.2366,0.683,0.591,"organ morphogenesis"),
c("GO:0043589","skin morphogenesis",0.108,2.0232,0.709,0.592,"organ morphogenesis"),
c("GO:0045074","regulation of interleukin-10 biosynthetic process",0.005,1.9602,0.728,0.593,"organ morphogenesis"),
c("GO:0048732","gland development",1.335,3.6383,0.674,0.596,"organ morphogenesis"),
c("GO:0032641","lymphotoxin A production",0.003,1.9602,0.855,0.608,"organ morphogenesis"),
c("GO:0007379","segment specification",0.027,2.4737,0.761,0.610,"organ morphogenesis"),
c("GO:0030097","hemopoiesis",1.659,2.4498,0.650,0.612,"organ morphogenesis"),
c("GO:0001764","neuron migration",0.400,2.0000,0.653,0.614,"organ morphogenesis"),
c("GO:0007399","nervous system development",4.932,2.4921,0.646,0.618,"organ morphogenesis"),
c("GO:0046620","regulation of organ growth",0.213,2.3288,0.763,0.627,"organ morphogenesis"),
c("GO:0072048","renal system pattern specification",0.016,2.0114,0.716,0.634,"organ morphogenesis"),
c("GO:0048468","cell development",4.830,2.7122,0.622,0.638,"organ morphogenesis"),
c("GO:0044707","single-multicellular organism process",15.092,5.2076,0.742,0.638,"organ morphogenesis"),
c("GO:0009653","anatomical structure morphogenesis",5.999,5.6021,0.687,0.656,"organ morphogenesis"),
c("GO:0048729","tissue morphogenesis",1.464,2.7696,0.674,0.660,"organ morphogenesis"),
c("GO:0072079","nephron tubule formation",0.027,5.0809,0.668,0.662,"organ morphogenesis"),
c("GO:0042476","odontogenesis",0.418,2.4202,0.678,0.664,"organ morphogenesis"),
c("GO:0072075","metanephric mesenchyme development",0.031,3.2757,0.690,0.667,"organ morphogenesis"),
c("GO:0035148","tube formation",0.328,2.1433,0.696,0.670,"organ morphogenesis"),
c("GO:0030224","monocyte differentiation",0.043,2.0980,0.700,0.671,"organ morphogenesis"),
c("GO:0072268","pattern specification involved in metanephros development",0.005,2.9393,0.719,0.672,"organ morphogenesis"),
c("GO:0072074","kidney mesenchyme development",0.040,2.6990,0.694,0.679,"organ morphogenesis"),
c("GO:0035162","embryonic hemopoiesis",0.060,2.2343,0.720,0.690,"organ morphogenesis"),
c("GO:0002009","morphogenesis of an epithelium",1.119,1.9582,0.669,0.697,"organ morphogenesis"),
c("GO:0042091","interleukin-10 biosynthetic process",0.005,1.9602,0.820,0.697,"organ morphogenesis"),
c("GO:0008283","cell proliferation",4.075,3.2441,0.965,0.027,"cell proliferation"),
c("GO:0016311","dephosphorylation",1.340,2.8861,0.905,0.050,"dephosphorylation"),
c("GO:0006470","protein dephosphorylation",0.717,3.0362,0.884,0.313,"dephosphorylation"),
c("GO:0031638","zymogen activation",0.198,2.0942,0.933,0.052,"zymogen activation"),
c("GO:0002541","activation of plasma proteins involved in acute inflammatory response",0.003,1.9602,0.915,0.590,"zymogen activation"),
c("GO:0051883","killing of cells in other organism involved in symbiotic interaction",0.025,2.9393,0.875,0.053,"killing of cells in other organism involved in symbiotic interaction"),
c("GO:0060370","susceptibility to T cell mediated cytotoxicity",0.002,1.9602,0.906,0.141,"killing of cells in other organism involved in symbiotic interaction"),
c("GO:0002860","positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target",0.007,2.9393,0.845,0.150,"killing of cells in other organism involved in symbiotic interaction"),
c("GO:0090031","positive regulation of steroid hormone biosynthetic process",0.016,2.3747,0.800,0.284,"killing of cells in other organism involved in symbiotic interaction"),
c("GO:0001678","cellular glucose homeostasis",0.235,1.9918,0.874,0.337,"killing of cells in other organism involved in symbiotic interaction"),
c("GO:0010909","positive regulation of heparan sulfate proteoglycan biosynthetic process",0.002,1.9602,0.814,0.338,"killing of cells in other organism involved in symbiotic interaction"),
c("GO:0033540","fatty acid beta-oxidation using acyl-CoA oxidase",0.013,2.2277,0.886,0.377,"killing of cells in other organism involved in symbiotic interaction"),
c("GO:0002543","activation of blood coagulation via clotting cascade",0.002,1.9602,0.770,0.380,"killing of cells in other organism involved in symbiotic interaction"),
c("GO:2000758","positive regulation of peptidyl-lysine acetylation",0.057,1.9531,0.801,0.410,"killing of cells in other organism involved in symbiotic interaction"),
c("GO:0002347","response to tumor cell",0.017,2.0114,0.947,0.446,"killing of cells in other organism involved in symbiotic interaction"),
c("GO:0016101","diterpenoid metabolic process",0.146,2.0985,0.894,0.482,"killing of cells in other organism involved in symbiotic interaction"),
c("GO:0046340","diacylglycerol catabolic process",0.006,1.9602,0.897,0.614,"killing of cells in other organism involved in symbiotic interaction"),
c("GO:0007010","cytoskeleton organization",2.674,3.3979,0.934,0.054,"cytoskeleton organization"),
c("GO:0032796","uropod organization",0.008,1.9602,0.926,0.280,"cytoskeleton organization"),
c("GO:0030382","sperm mitochondrion organization",0.006,1.9602,0.957,0.368,"cytoskeleton organization"),
c("GO:0030036","actin cytoskeleton organization",1.465,3.1487,0.896,0.629,"cytoskeleton organization"),
c("GO:0001768","establishment of T cell polarity",0.010,1.9602,0.921,0.065,"establishment of T cell polarity"),
c("GO:0051135","positive regulation of NK T cell activation",0.006,1.9602,0.848,0.486,"establishment of T cell polarity"),
c("GO:0051132","NK T cell activation",0.007,1.9602,0.921,0.614,"establishment of T cell polarity"),
c("GO:0006577","amino-acid betaine metabolic process",0.038,2.2782,0.931,0.082,"amino-acid betaine metabolism"),
c("GO:0009416","response to light stimulus",0.655,2.6615,0.953,0.086,"response to light stimulus"),
c("GO:0051599","response to hydrostatic pressure",0.017,2.4908,0.932,0.540,"response to light stimulus"),
c("GO:0006801","superoxide metabolic process",0.140,2.1891,0.937,0.092,"superoxide metabolism"),
c("GO:0051336","regulation of hydrolase activity",3.070,3.8861,0.819,0.092,"regulation of hydrolase activity"),
c("GO:0050794","regulation of cellular process",28.971,6.6778,0.869,0.149,"regulation of hydrolase activity"),
c("GO:0051239","regulation of multicellular organismal process",5.506,5.1739,0.913,0.170,"regulation of hydrolase activity"),
c("GO:0048519","negative regulation of biological process",8.588,3.2147,0.908,0.190,"regulation of hydrolase activity"),
c("GO:0019222","regulation of metabolic process",17.756,3.2076,0.891,0.237,"regulation of hydrolase activity"),
c("GO:0048583","regulation of response to stimulus",26.518,6.0757,0.874,0.274,"regulation of hydrolase activity"),
c("GO:0050789","regulation of biological process",49.744,5.7959,0.887,0.337,"regulation of hydrolase activity"),
c("GO:0006140","regulation of nucleotide metabolic process",2.113,2.9031,0.725,0.387,"regulation of hydrolase activity"),
c("GO:0009894","regulation of catabolic process",2.662,2.1791,0.822,0.400,"regulation of hydrolase activity"),
c("GO:0051174","regulation of phosphorus metabolic process",4.788,2.5214,0.757,0.452,"regulation of hydrolase activity"),
c("GO:0009118","regulation of nucleoside metabolic process",1.901,2.8125,0.744,0.545,"regulation of hydrolase activity"),
c("GO:0010950","positive regulation of endopeptidase activity",0.231,2.5436,0.826,0.584,"regulation of hydrolase activity"),
c("GO:1901068","guanosine-containing compound metabolic process",2.687,2.0017,0.829,0.597,"regulation of hydrolase activity"),
c("GO:0019219","regulation of nucleobase-containing compound metabolic process",12.840,3.6198,0.715,0.612,"regulation of hydrolase activity"),
c("GO:0010563","negative regulation of phosphorus metabolic process",0.841,2.1530,0.745,0.670,"regulation of hydrolase activity"),
c("GO:0045936","negative regulation of phosphate metabolic process",0.841,2.1530,0.745,0.671,"regulation of hydrolase activity"),
c("GO:0009889","regulation of biosynthetic process",11.561,2.0259,0.805,0.675,"regulation of hydrolase activity"),
c("GO:0010468","regulation of gene expression",11.954,2.0119,0.790,0.681,"regulation of hydrolase activity"),
c("GO:0051171","regulation of nitrogen compound metabolic process",13.046,3.2840,0.797,0.695,"regulation of hydrolase activity"),
c("GO:0051606","detection of stimulus",1.214,2.1096,0.962,0.093,"detection of stimulus"),
c("GO:0009628","response to abiotic stimulus",2.264,3.5086,0.960,0.100,"response to abiotic stimulus"),
c("GO:1901700","response to oxygen-containing compound",3.064,2.4089,0.934,0.109,"response to abiotic stimulus"),
c("GO:0051716","cellular response to stimulus",19.092,4.3665,0.906,0.154,"response to abiotic stimulus"),
c("GO:0042221","response to chemical",8.684,3.6990,0.954,0.193,"response to abiotic stimulus"),
c("GO:1902170","cellular response to reactive nitrogen species",0.030,1.9602,0.902,0.384,"response to abiotic stimulus"),
c("GO:1901701","cellular response to oxygen-containing compound",1.893,2.2055,0.859,0.599,"response to abiotic stimulus"),
c("GO:0071331","cellular response to hexose stimulus",0.222,2.4145,0.875,0.671,"response to abiotic stimulus"));

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
