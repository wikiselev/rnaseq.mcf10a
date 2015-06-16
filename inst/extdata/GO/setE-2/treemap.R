

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
revigo.data <- rbind(c("GO:0001906","cell killing",19.062,1.4504,0.993,0.000,"cell killing"),
c("GO:0002860","positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target",0.007,4.7696,0.716,0.000,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0010954","positive regulation of protein processing",0.181,2.5560,0.789,0.112,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0044349","DNA excision",0.024,2.2041,0.916,0.116,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0060370","susceptibility to T cell mediated cytotoxicity",0.002,3.1739,0.871,0.133,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0018364","peptidyl-glutamine methylation",0.002,1.5854,0.925,0.173,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0042026","protein refolding",0.038,1.3623,0.917,0.207,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0031343","positive regulation of cell killing",18.979,2.6478,0.805,0.239,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0031329","regulation of cellular catabolic process",2.423,2.3242,0.741,0.283,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0035966","response to topologically incorrect protein",0.209,3.4559,0.872,0.291,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0051599","response to hydrostatic pressure",0.017,1.8877,0.880,0.309,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0043602","nitrate catabolic process",0.005,1.5854,0.884,0.364,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0046210","nitric oxide catabolic process",0.005,1.5854,0.911,0.364,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0002353","plasma kallikrein-kinin cascade",0.015,1.5854,0.827,0.366,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0006351","transcription, DNA-templated",10.635,1.3779,0.857,0.370,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0051345","positive regulation of hydrolase activity",2.284,2.3134,0.795,0.379,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0071371","cellular response to gonadotropin stimulus",0.051,1.3623,0.870,0.382,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0051919","positive regulation of fibrinolysis",0.005,1.5854,0.716,0.394,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0000718","nucleotide-excision repair, DNA damage removal",0.024,2.2041,0.767,0.414,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0006986","response to unfolded protein",0.189,2.4989,0.850,0.422,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:2000272","negative regulation of receptor activity",0.022,1.5791,0.772,0.427,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0009650","UV protection",0.023,1.6686,0.945,0.434,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0003106","negative regulation of glomerular filtration by angiotensin",0.001,1.5854,0.819,0.444,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0002347","response to tumor cell",0.017,3.7696,0.912,0.446,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0042520","positive regulation of tyrosine phosphorylation of Stat4 protein",0.005,1.5854,0.729,0.457,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0061117","negative regulation of heart growth",0.006,1.5854,0.806,0.480,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0071247","cellular response to chromate",0.003,1.5854,0.884,0.481,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0002228","natural killer cell mediated immunity",0.067,1.5378,0.834,0.484,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:1990258","histone glutamine methylation",0.001,1.5854,0.860,0.488,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0071260","cellular response to mechanical stimulus",0.133,1.4795,0.871,0.493,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0031323","regulation of cellular metabolic process",15.735,2.0250,0.738,0.510,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0002711","positive regulation of T cell mediated immunity",18.972,1.5829,0.732,0.535,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0002831","regulation of response to biotic stimulus",0.177,1.5020,0.835,0.542,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0045887","positive regulation of synaptic growth at neuromuscular junction",0.001,1.5854,0.725,0.545,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0045596","negative regulation of cell differentiation",1.429,1.3751,0.706,0.569,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0046687","response to chromate",0.003,1.5854,0.931,0.572,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0009415","response to water",0.034,1.5791,0.917,0.590,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0009894","regulation of catabolic process",2.662,1.8125,0.806,0.638,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0002254","kinin cascade",0.015,1.5854,0.829,0.674,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0042504","tyrosine phosphorylation of Stat4 protein",0.005,1.5854,0.813,0.681,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0045089","positive regulation of innate immune response",0.476,2.2652,0.730,0.688,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0033683","nucleotide-excision repair, DNA incision",0.009,2.0264,0.807,0.699,"positive regulation of natural killer cell mediated cytotoxicity directed against tumor cell target"),
c("GO:0050665","hydrogen peroxide biosynthetic process",0.030,2.0264,0.921,0.000,"hydrogen peroxide biosynthesis"),
c("GO:0016260","selenocysteine biosynthetic process",0.002,1.5854,0.896,0.147,"hydrogen peroxide biosynthesis"),
c("GO:0065007","biological regulation",51.216,1.6101,0.996,0.000,"biological regulation"),
c("GO:0015914","phospholipid transport",0.155,2.2541,0.882,0.012,"phospholipid transport"),
c("GO:0006858","extracellular transport",0.008,2.1952,0.949,0.190,"phospholipid transport"),
c("GO:0051654","establishment of mitochondrion localization",0.025,1.7703,0.931,0.203,"phospholipid transport"),
c("GO:0060096","serotonin secretion, neurotransmission",0.001,1.5854,0.810,0.300,"phospholipid transport"),
c("GO:0071169","establishment of protein localization to chromatin",0.007,1.5854,0.932,0.338,"phospholipid transport"),
c("GO:0046325","negative regulation of glucose import",0.023,1.6686,0.830,0.361,"phospholipid transport"),
c("GO:0015748","organophosphate ester transport",0.202,1.5405,0.905,0.423,"phospholipid transport"),
c("GO:0006820","anion transport",1.726,1.8834,0.898,0.447,"phospholipid transport"),
c("GO:0006811","ion transport",7.803,2.0448,0.895,0.523,"phospholipid transport"),
c("GO:0006860","extracellular amino acid transport",0.002,1.5854,0.908,0.538,"phospholipid transport"),
c("GO:1902389","ceramide 1-phosphate transport",0.001,1.5854,0.908,0.694,"phospholipid transport"),
c("GO:0019048","modulation by virus of host morphology or physiology",0.033,1.9087,0.857,0.037,"modulation by virus of host morphology or physiology"),
c("GO:0030322","stabilization of membrane potential",0.001,1.5854,0.909,0.250,"modulation by virus of host morphology or physiology"),
c("GO:0032469","endoplasmic reticulum calcium ion homeostasis",0.058,1.3623,0.862,0.313,"modulation by virus of host morphology or physiology"),
c("GO:0075521","microtubule-dependent intracellular transport of viral material towards nucleus",0.001,1.5854,0.893,0.475,"modulation by virus of host morphology or physiology"),
c("GO:0046814","coreceptor-mediated virion attachment to host cell",0.002,1.5854,0.942,0.498,"modulation by virus of host morphology or physiology"),
c("GO:0002262","myeloid cell homeostasis",0.334,1.3057,0.838,0.505,"modulation by virus of host morphology or physiology"),
c("GO:0051701","interaction with host",0.166,1.5262,0.962,0.618,"modulation by virus of host morphology or physiology"),
c("GO:0075519","microtubule-dependent intracellular transport of viral material",0.001,1.5854,0.893,0.693,"modulation by virus of host morphology or physiology"),
c("GO:0075606","transport of viral material towards nucleus",0.001,1.5854,0.893,0.693,"modulation by virus of host morphology or physiology"),
c("GO:0090345","cellular organohalogen metabolic process",0.002,1.5854,0.952,0.053,"cellular organohalogen metabolism"),
c("GO:0090346","cellular organofluorine metabolic process",0.002,1.5854,0.952,0.053,"cellular organofluorine metabolism"),
c("GO:0097191","extrinsic apoptotic signaling pathway",0.531,3.9208,0.744,0.053,"extrinsic apoptotic signaling pathway"),
c("GO:0038034","signal transduction in absence of ligand",0.226,3.5850,0.808,0.271,"extrinsic apoptotic signaling pathway"),
c("GO:0042700","luteinizing hormone signaling pathway",0.010,1.5854,0.837,0.305,"extrinsic apoptotic signaling pathway"),
c("GO:0051056","regulation of small GTPase mediated signal transduction",1.620,2.3206,0.708,0.328,"extrinsic apoptotic signaling pathway"),
c("GO:0070105","positive regulation of interleukin-6-mediated signaling pathway",0.001,1.5854,0.790,0.344,"extrinsic apoptotic signaling pathway"),
c("GO:0038127","ERBB signaling pathway",0.360,1.6486,0.784,0.405,"extrinsic apoptotic signaling pathway"),
c("GO:0010646","regulation of cell communication",6.570,2.3179,0.773,0.419,"extrinsic apoptotic signaling pathway"),
c("GO:0023051","regulation of signaling",6.570,2.1367,0.818,0.423,"extrinsic apoptotic signaling pathway"),
c("GO:0050856","regulation of T cell receptor signaling pathway",0.075,1.3623,0.747,0.471,"extrinsic apoptotic signaling pathway"),
c("GO:0097284","hepatocyte apoptotic process",0.043,3.2518,0.895,0.474,"extrinsic apoptotic signaling pathway"),
c("GO:0097190","apoptotic signaling pathway",1.253,2.6253,0.743,0.639,"extrinsic apoptotic signaling pathway"),
c("GO:0023057","negative regulation of signaling",2.197,1.3340,0.753,0.641,"extrinsic apoptotic signaling pathway"),
c("GO:0010648","negative regulation of cell communication",2.203,1.3143,0.720,0.641,"extrinsic apoptotic signaling pathway"),
c("GO:0042058","regulation of epidermal growth factor receptor signaling pathway",0.131,1.7994,0.750,0.664,"extrinsic apoptotic signaling pathway"),
c("GO:0009968","negative regulation of signal transduction",2.090,1.4433,0.674,0.667,"extrinsic apoptotic signaling pathway"),
c("GO:0000920","cytokinetic cell separation",0.008,1.5854,0.933,0.059,"cytokinetic cell separation"),
c("GO:1900477","negative regulation of G1/S transition of mitotic cell cycle by negative regulation of transcription from RNA polymerase II promoter",0.001,1.5854,0.817,0.342,"cytokinetic cell separation"),
c("GO:0046339","diacylglycerol metabolic process",0.027,1.7703,0.906,0.064,"diacylglycerol metabolism"),
c("GO:0060706","cell differentiation involved in embryonic placenta development",0.058,2.8962,0.840,0.068,"cell differentiation involved in embryonic placenta development"),
c("GO:0014896","muscle hypertrophy",0.091,1.6799,0.904,0.222,"cell differentiation involved in embryonic placenta development"),
c("GO:0006949","syncytium formation",0.077,2.0458,0.868,0.262,"cell differentiation involved in embryonic placenta development"),
c("GO:0048749","compound eye development",0.002,1.5854,0.898,0.266,"cell differentiation involved in embryonic placenta development"),
c("GO:0060689","cell differentiation involved in salivary gland development",0.002,2.7033,0.868,0.266,"cell differentiation involved in embryonic placenta development"),
c("GO:0051962","positive regulation of nervous system development",0.057,1.3623,0.803,0.280,"cell differentiation involved in embryonic placenta development"),
c("GO:0048820","hair follicle maturation",0.017,1.3027,0.879,0.299,"cell differentiation involved in embryonic placenta development"),
c("GO:0002076","osteoblast development",0.051,1.4275,0.852,0.309,"cell differentiation involved in embryonic placenta development"),
c("GO:0048569","post-embryonic organ development",0.038,1.4275,0.884,0.315,"cell differentiation involved in embryonic placenta development"),
c("GO:0031016","pancreas development",0.197,2.1844,0.872,0.353,"cell differentiation involved in embryonic placenta development"),
c("GO:0031018","endocrine pancreas development",0.111,2.1986,0.864,0.370,"cell differentiation involved in embryonic placenta development"),
c("GO:0048160","primary follicle stage",0.001,1.5854,0.860,0.425,"cell differentiation involved in embryonic placenta development"),
c("GO:0048058","compound eye corneal lens development",0.001,1.5854,0.902,0.429,"cell differentiation involved in embryonic placenta development"),
c("GO:0030099","myeloid cell differentiation",0.703,2.1759,0.769,0.432,"cell differentiation involved in embryonic placenta development"),
c("GO:0002520","immune system development",1.845,1.4388,0.815,0.467,"cell differentiation involved in embryonic placenta development"),
c("GO:0007520","myoblast fusion",0.047,1.3623,0.852,0.480,"cell differentiation involved in embryonic placenta development"),
c("GO:0014895","smooth muscle hypertrophy",0.001,1.5854,0.896,0.517,"cell differentiation involved in embryonic placenta development"),
c("GO:0014853","regulation of excitatory postsynaptic membrane potential involved in skeletal muscle contraction",0.002,1.5854,0.795,0.537,"cell differentiation involved in embryonic placenta development"),
c("GO:0060691","epithelial cell maturation involved in salivary gland development",0.001,1.5854,0.859,0.595,"cell differentiation involved in embryonic placenta development"),
c("GO:0001541","ovarian follicle development",0.166,1.3062,0.867,0.635,"cell differentiation involved in embryonic placenta development"),
c("GO:0060715","syncytiotrophoblast cell differentiation involved in labyrinthine layer development",0.002,3.1739,0.865,0.662,"cell differentiation involved in embryonic placenta development"),
c("GO:0014852","regulation of skeletal muscle contraction by neural stimulation via neuromuscular junction",0.002,1.5854,0.871,0.678,"cell differentiation involved in embryonic placenta development"),
c("GO:0007006","mitochondrial membrane organization",0.164,3.5850,0.833,0.074,"mitochondrial membrane organization"),
c("GO:0043163","cell envelope organization",0.002,1.5854,0.927,0.214,"mitochondrial membrane organization"),
c("GO:0045229","external encapsulating structure organization",0.002,1.5854,0.927,0.214,"mitochondrial membrane organization"),
c("GO:0090084","negative regulation of inclusion body assembly",0.013,2.4089,0.836,0.238,"mitochondrial membrane organization"),
c("GO:0010677","negative regulation of cellular carbohydrate metabolic process",0.062,1.9087,0.773,0.274,"mitochondrial membrane organization"),
c("GO:0034552","respiratory chain complex II assembly",0.001,1.5854,0.939,0.289,"mitochondrial membrane organization"),
c("GO:0097032","mitochondrial respiratory chain complex II biogenesis",0.001,1.5854,0.941,0.313,"mitochondrial membrane organization"),
c("GO:0007576","nucleolar fragmentation",0.026,1.5854,0.836,0.336,"mitochondrial membrane organization"),
c("GO:0045081","negative regulation of interleukin-10 biosynthetic process",0.001,1.5854,0.779,0.339,"mitochondrial membrane organization"),
c("GO:0070841","inclusion body assembly",0.044,1.3623,0.930,0.353,"mitochondrial membrane organization"),
c("GO:0051130","positive regulation of cellular component organization",1.698,1.3583,0.811,0.480,"mitochondrial membrane organization"),
c("GO:0044089","positive regulation of cellular component biogenesis",0.062,1.3027,0.852,0.551,"mitochondrial membrane organization"),
c("GO:0034553","mitochondrial respiratory chain complex II assembly",0.001,1.5854,0.887,0.562,"mitochondrial membrane organization"),
c("GO:0009103","lipopolysaccharide biosynthetic process",0.030,1.8877,0.855,0.617,"mitochondrial membrane organization"),
c("GO:0009628","response to abiotic stimulus",2.264,1.4293,0.938,0.088,"response to abiotic stimulus"),
c("GO:0048583","regulation of response to stimulus",26.518,1.8979,0.851,0.155,"response to abiotic stimulus"),
c("GO:0019222","regulation of metabolic process",17.756,1.5733,0.873,0.230,"response to abiotic stimulus"),
c("GO:0050789","regulation of biological process",49.744,1.3072,0.870,0.322,"response to abiotic stimulus"));

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
