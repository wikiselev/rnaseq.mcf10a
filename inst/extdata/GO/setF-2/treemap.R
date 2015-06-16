

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
revigo.data <- rbind(c("GO:0007416","synapse assembly",0.210,5.6383,0.722,0.000,"synapse assembly"),
c("GO:0032899","regulation of neurotrophin production",0.003,1.4411,0.822,0.195,"synapse assembly"),
c("GO:0010848","regulation of chromatin disassembly",0.001,1.4411,0.855,0.209,"synapse assembly"),
c("GO:0048789","cytoskeletal matrix organization at active zone",0.001,1.4411,0.925,0.217,"synapse assembly"),
c("GO:0060073","micturition",0.018,1.4411,0.835,0.217,"synapse assembly"),
c("GO:0097091","synaptic vesicle clustering",0.010,2.8827,0.806,0.238,"synapse assembly"),
c("GO:0061017","hepatoblast differentiation",0.005,1.4411,0.800,0.259,"synapse assembly"),
c("GO:0033555","multicellular organismal response to stress",0.203,2.7520,0.798,0.260,"synapse assembly"),
c("GO:0060157","urinary bladder development",0.006,2.4168,0.831,0.262,"synapse assembly"),
c("GO:0090009","primitive streak formation",0.019,1.9147,0.817,0.264,"synapse assembly"),
c("GO:0044706","multi-multicellular organism process",0.678,2.2013,0.788,0.280,"synapse assembly"),
c("GO:0050718","positive regulation of interleukin-1 beta secretion",0.025,2.6383,0.606,0.299,"synapse assembly"),
c("GO:0050808","synapse organization",0.424,4.0362,0.868,0.315,"synapse assembly"),
c("GO:0090493","catecholamine uptake",0.021,1.9147,0.822,0.319,"synapse assembly"),
c("GO:0046545","development of primary female sexual characteristics",0.285,1.7908,0.763,0.323,"synapse assembly"),
c("GO:0050955","thermoception",0.006,1.4411,0.854,0.329,"synapse assembly"),
c("GO:0031016","pancreas development",0.197,1.6087,0.794,0.337,"synapse assembly"),
c("GO:0031104","dendrite regeneration",0.002,1.4411,0.739,0.339,"synapse assembly"),
c("GO:0070593","dendrite self-avoidance",0.002,1.4411,0.795,0.346,"synapse assembly"),
c("GO:0002437","inflammatory response to antigenic stimulus",0.114,1.5274,0.928,0.354,"synapse assembly"),
c("GO:0090222","centrosome-templated microtubule nucleation",0.003,1.4411,0.894,0.358,"synapse assembly"),
c("GO:0032498","detection of muramyl dipeptide",0.001,1.4411,0.874,0.364,"synapse assembly"),
c("GO:0014042","positive regulation of neuron maturation",0.010,1.4411,0.705,0.373,"synapse assembly"),
c("GO:0061445","endocardial cushion cell fate commitment",0.001,1.4411,0.812,0.400,"synapse assembly"),
c("GO:0090210","regulation of establishment of blood-brain barrier",0.002,1.4411,0.802,0.402,"synapse assembly"),
c("GO:0048853","forebrain morphogenesis",0.042,2.4737,0.786,0.411,"synapse assembly"),
c("GO:1990046","stress-induced mitochondrial fusion",0.001,1.4411,0.854,0.411,"synapse assembly"),
c("GO:0060478","acrosomal vesicle exocytosis",0.005,1.4411,0.766,0.424,"synapse assembly"),
c("GO:0032244","positive regulation of nucleoside transport",0.001,1.4411,0.798,0.429,"synapse assembly"),
c("GO:0051491","positive regulation of filopodium assembly",0.055,1.6582,0.781,0.431,"synapse assembly"),
c("GO:0090297","positive regulation of mitochondrial DNA replication",0.001,1.4411,0.834,0.440,"synapse assembly"),
c("GO:0070254","mucus secretion",0.025,1.7491,0.710,0.445,"synapse assembly"),
c("GO:0009611","response to wounding",2.056,1.6724,0.934,0.456,"synapse assembly"),
c("GO:0007399","nervous system development",4.932,3.4685,0.738,0.456,"synapse assembly"),
c("GO:0002227","innate immune response in mucosa",0.042,1.4411,0.933,0.463,"synapse assembly"),
c("GO:0001763","morphogenesis of a branching structure",0.639,1.5127,0.774,0.474,"synapse assembly"),
c("GO:0051270","regulation of cellular component movement",1.289,2.3851,0.695,0.475,"synapse assembly"),
c("GO:0097090","presynaptic membrane organization",0.022,1.9147,0.910,0.479,"synapse assembly"),
c("GO:0060041","retina development in camera-type eye",0.348,1.7802,0.782,0.482,"synapse assembly"),
c("GO:1901342","regulation of vasculature development",0.395,1.4638,0.725,0.490,"synapse assembly"),
c("GO:0051953","negative regulation of amine transport",0.040,2.2034,0.721,0.493,"synapse assembly"),
c("GO:0035803","egg coat formation",0.003,1.4411,0.759,0.495,"synapse assembly"),
c("GO:0060067","cervix development",0.003,1.4411,0.817,0.495,"synapse assembly"),
c("GO:0021512","spinal cord anterior/posterior patterning",0.001,1.4411,0.831,0.503,"synapse assembly"),
c("GO:0030324","lung development",0.575,2.3316,0.766,0.512,"synapse assembly"),
c("GO:0090071","negative regulation of ribosome biogenesis",0.005,1.4411,0.838,0.516,"synapse assembly"),
c("GO:0071709","membrane assembly",0.036,1.6135,0.902,0.517,"synapse assembly"),
c("GO:0060541","respiratory system development",0.648,1.8965,0.780,0.520,"synapse assembly"),
c("GO:0090360","platelet-derived growth factor production",0.025,2.4168,0.837,0.521,"synapse assembly"),
c("GO:0060599","lateral sprouting involved in mammary gland duct morphogenesis",0.003,1.4411,0.818,0.525,"synapse assembly"),
c("GO:0021853","cerebral cortex GABAergic interneuron migration",0.011,1.4411,0.694,0.527,"synapse assembly"),
c("GO:0048854","brain morphogenesis",0.089,1.5274,0.778,0.535,"synapse assembly"),
c("GO:0090361","regulation of platelet-derived growth factor production",0.025,2.4168,0.791,0.537,"synapse assembly"),
c("GO:0007618","mating",0.139,1.5274,0.911,0.541,"synapse assembly"),
c("GO:0035295","tube development",1.620,1.9512,0.771,0.544,"synapse assembly"),
c("GO:0061011","hepatic duct development",0.002,1.4411,0.837,0.547,"synapse assembly"),
c("GO:0090192","regulation of glomerulus development",0.027,1.6135,0.762,0.550,"synapse assembly"),
c("GO:0090308","regulation of methylation-dependent chromatin silencing",0.005,1.4411,0.797,0.560,"synapse assembly"),
c("GO:0048667","cell morphogenesis involved in neuron differentiation",1.346,2.3036,0.657,0.572,"synapse assembly"),
c("GO:0002438","acute inflammatory response to antigenic stimulus",0.033,1.6135,0.931,0.572,"synapse assembly"),
c("GO:0034633","retinol transport",0.005,1.4411,0.846,0.582,"synapse assembly"),
c("GO:0032409","regulation of transporter activity",0.312,1.6747,0.764,0.594,"synapse assembly"),
c("GO:0043270","positive regulation of ion transport",0.304,2.0867,0.724,0.600,"synapse assembly"),
c("GO:0030100","regulation of endocytosis",0.359,2.1637,0.677,0.602,"synapse assembly"),
c("GO:0002732","positive regulation of dendritic cell cytokine production",0.017,1.4411,0.728,0.603,"synapse assembly"),
c("GO:0007494","midgut development",0.032,1.7491,0.812,0.614,"synapse assembly"),
c("GO:0007497","posterior midgut development",0.002,1.4411,0.838,0.615,"synapse assembly"),
c("GO:0048468","cell development",4.830,1.4778,0.756,0.633,"synapse assembly"),
c("GO:2000310","regulation of N-methyl-D-aspartate selective glutamate receptor activity",0.041,1.7491,0.679,0.637,"synapse assembly"),
c("GO:0060627","regulation of vesicle-mediated transport",0.665,2.0560,0.722,0.642,"synapse assembly"),
c("GO:0090212","negative regulation of establishment of blood-brain barrier",0.001,1.4411,0.776,0.647,"synapse assembly"),
c("GO:0021536","diencephalon development",0.350,1.7314,0.761,0.661,"synapse assembly"),
c("GO:2000686","regulation of rubidium ion transmembrane transporter activity",0.007,1.4411,0.744,0.669,"synapse assembly"),
c("GO:0051928","positive regulation of calcium ion transport",0.122,1.9435,0.726,0.693,"synapse assembly"),
c("GO:0001809","positive regulation of type IV hypersensitivity",0.001,1.4411,0.854,0.698,"synapse assembly"),
c("GO:0016339","calcium-dependent cell-cell adhesion via plasma membrane cell adhesion molecules",0.056,5.5686,0.981,0.000,"calcium-dependent cell-cell adhesion via plasma membrane cell adhesion molecules"),
c("GO:0016337","single organismal cell-cell adhesion",0.678,2.8570,0.957,0.555,"calcium-dependent cell-cell adhesion via plasma membrane cell adhesion molecules"),
c("GO:0022610","biological adhesion",2.826,1.5491,0.994,0.000,"biological adhesion"),
c("GO:0032501","multicellular organismal process",15.657,2.2097,0.995,0.000,"multicellular organismal process"),
c("GO:0040011","locomotion",3.285,1.9027,0.994,0.000,"locomotion"),
c("GO:0048521","negative regulation of behavior",0.063,4.4089,0.799,0.000,"negative regulation of behavior"),
c("GO:0002922","positive regulation of humoral immune response",0.052,2.1261,0.853,0.131,"negative regulation of behavior"),
c("GO:0006959","humoral immune response",0.457,1.5032,0.950,0.146,"negative regulation of behavior"),
c("GO:0002606","positive regulation of dendritic cell antigen processing and presentation",0.034,1.4411,0.923,0.162,"negative regulation of behavior"),
c("GO:0010529","negative regulation of transposition",0.008,2.1261,0.854,0.267,"negative regulation of behavior"),
c("GO:0045736","negative regulation of cyclin-dependent protein serine/threonine kinase activity",0.040,1.6582,0.820,0.295,"negative regulation of behavior"),
c("GO:2000363","positive regulation of prostaglandin-E synthase activity",0.017,1.4411,0.923,0.338,"negative regulation of behavior"),
c("GO:0070495","negative regulation of thrombin receptor signaling pathway",0.001,1.4411,0.811,0.383,"negative regulation of behavior"),
c("GO:0060134","prepulse inhibition",0.041,2.1261,0.698,0.474,"negative regulation of behavior"),
c("GO:0051898","negative regulation of protein kinase B signaling",0.062,2.2069,0.774,0.487,"negative regulation of behavior"),
c("GO:0001960","negative regulation of cytokine-mediated signaling pathway",0.063,2.0615,0.741,0.513,"negative regulation of behavior"),
c("GO:0007638","mechanosensory behavior",0.026,1.7491,0.848,0.528,"negative regulation of behavior"),
c("GO:0071350","cellular response to interleukin-15",0.015,1.6135,0.898,0.537,"negative regulation of behavior"),
c("GO:0050906","detection of stimulus involved in sensory perception",0.908,1.5274,0.771,0.556,"negative regulation of behavior"),
c("GO:0001666","response to hypoxia",0.632,1.4773,0.936,0.556,"negative regulation of behavior"),
c("GO:0048148","behavioral response to cocaine",0.033,1.6135,0.754,0.564,"negative regulation of behavior"),
c("GO:0050795","regulation of behavior",0.338,3.0605,0.840,0.632,"negative regulation of behavior"),
c("GO:0033057","multicellular organismal reproductive behavior",0.065,2.3298,0.731,0.633,"negative regulation of behavior"),
c("GO:0048512","circadian behavior",0.079,2.8962,0.870,0.643,"negative regulation of behavior"),
c("GO:0031658","negative regulation of cyclin-dependent protein serine/threonine kinase activity involved in G1/S transition of mitotic cell cycle",0.001,1.4411,0.850,0.644,"negative regulation of behavior"),
c("GO:0032102","negative regulation of response to external stimulus",0.435,1.5025,0.782,0.653,"negative regulation of behavior"),
c("GO:0019098","reproductive behavior",0.099,1.7310,0.863,0.655,"negative regulation of behavior"),
c("GO:0050951","sensory perception of temperature stimulus",0.058,1.4989,0.833,0.656,"negative regulation of behavior"),
c("GO:0007622","rhythmic behavior",0.084,2.7747,0.879,0.688,"negative regulation of behavior"),
c("GO:0006584","catecholamine metabolic process",0.123,2.2865,0.917,0.032,"catecholamine metabolism"),
c("GO:0060082","eye blink reflex",0.007,1.4411,0.921,0.047,"eye blink reflex"),
c("GO:0071294","cellular response to zinc ion",0.028,1.9147,0.891,0.051,"cellular response to zinc ion"),
c("GO:0071413","cellular response to hydroxyisoflavone",0.001,1.4411,0.905,0.282,"cellular response to zinc ion"),
c("GO:2001040","positive regulation of cellular response to drug",0.001,1.4411,0.847,0.282,"cellular response to zinc ion"),
c("GO:0042178","xenobiotic catabolic process",0.021,1.4989,0.885,0.331,"cellular response to zinc ion"),
c("GO:0010035","response to inorganic substance",1.004,1.5103,0.913,0.350,"cellular response to zinc ion"),
c("GO:0010124","phenylacetate catabolic process",0.001,1.4411,0.866,0.616,"cellular response to zinc ion"),
c("GO:0010038","response to metal ion",0.636,1.4605,0.910,0.689,"cellular response to zinc ion"),
c("GO:0045199","maintenance of epithelial cell apical/basal polarity",0.002,1.4411,0.944,0.051,"maintenance of epithelial cell apical/basal polarity"),
c("GO:0032196","transposition",0.019,1.7491,0.937,0.059,"transposition"),
c("GO:0040012","regulation of locomotion",1.268,3.2218,0.871,0.060,"regulation of locomotion"),
c("GO:1901163","regulation of trophoblast cell migration",0.006,2.1261,0.603,0.467,"regulation of locomotion"),
c("GO:0050919","negative chemotaxis",0.035,1.4989,0.856,0.536,"regulation of locomotion"),
c("GO:0072676","lymphocyte migration",0.082,1.8136,0.799,0.576,"regulation of locomotion"),
c("GO:0061450","trophoblast cell migration",0.006,2.1261,0.697,0.671,"regulation of locomotion"),
c("GO:0001774","microglial cell activation",0.046,1.9147,0.921,0.062,"microglial cell activation"),
c("GO:0009109","coenzyme catabolic process",0.018,1.7491,0.949,0.065,"coenzyme catabolism"),
c("GO:0046226","coumarin catabolic process",0.002,1.4411,0.926,0.259,"coenzyme catabolism"),
c("GO:0006546","glycine catabolic process",0.042,1.6135,0.890,0.305,"coenzyme catabolism"),
c("GO:0036414","histone citrullination",0.003,1.4411,0.851,0.542,"coenzyme catabolism"),
c("GO:0046177","D-gluconate catabolic process",0.001,1.4411,0.915,0.562,"coenzyme catabolism"),
c("GO:0046947","hydroxylysine biosynthetic process",0.001,1.4411,0.901,0.597,"coenzyme catabolism"),
c("GO:0046946","hydroxylysine metabolic process",0.001,1.4411,0.914,0.602,"coenzyme catabolism"),
c("GO:0051966","regulation of synaptic transmission, glutamatergic",0.128,4.7212,0.772,0.068,"regulation of synaptic transmission, glutamatergic"),
c("GO:0033032","regulation of myeloid cell apoptotic process",0.073,3.0315,0.871,0.127,"regulation of synaptic transmission, glutamatergic"),
c("GO:0007267","cell-cell signaling",2.522,4.0177,0.868,0.280,"regulation of synaptic transmission, glutamatergic"),
c("GO:0007188","adenylate cyclase-modulating G-protein coupled receptor signaling pathway",0.271,2.0061,0.818,0.302,"regulation of synaptic transmission, glutamatergic"),
c("GO:0002155","regulation of thyroid hormone mediated signaling pathway",0.021,1.4411,0.795,0.336,"regulation of synaptic transmission, glutamatergic"),
c("GO:0032925","regulation of activin receptor signaling pathway",0.031,1.8948,0.818,0.345,"regulation of synaptic transmission, glutamatergic"),
c("GO:0007186","G-protein coupled receptor signaling pathway",3.393,1.6070,0.786,0.474,"regulation of synaptic transmission, glutamatergic"),
c("GO:0007187","G-protein coupled receptor signaling pathway, coupled to cyclic nucleotide second messenger",0.311,1.5854,0.819,0.560,"regulation of synaptic transmission, glutamatergic"),
c("GO:1900273","positive regulation of long-term synaptic potentiation",0.005,1.4411,0.775,0.602,"regulation of synaptic transmission, glutamatergic"),
c("GO:0033028","myeloid cell apoptotic process",0.084,2.5575,0.922,0.620,"regulation of synaptic transmission, glutamatergic"),
c("GO:0007268","synaptic transmission",1.611,3.9208,0.815,0.665,"regulation of synaptic transmission, glutamatergic"),
c("GO:0060079","regulation of excitatory postsynaptic membrane potential",0.156,3.8861,0.783,0.677,"regulation of synaptic transmission, glutamatergic"),
c("GO:0007610","behavior",1.517,2.8210,0.961,0.068,"behavior"),
c("GO:0042391","regulation of membrane potential",1.008,2.2774,0.873,0.073,"regulation of membrane potential"),
c("GO:0060087","relaxation of vascular smooth muscle",0.019,1.7491,0.715,0.368,"regulation of membrane potential"),
c("GO:0007588","excretion",0.129,1.6089,0.826,0.398,"regulation of membrane potential"),
c("GO:0045838","positive regulation of membrane potential",0.075,1.8948,0.887,0.411,"regulation of membrane potential"),
c("GO:0055067","monovalent inorganic cation homeostasis",0.235,2.2248,0.874,0.455,"regulation of membrane potential"),
c("GO:0086052","membrane repolarization during SA node cell action potential",0.001,1.4411,0.684,0.490,"regulation of membrane potential"),
c("GO:0002087","regulation of respiratory gaseous exchange by neurological system process",0.025,1.4989,0.789,0.537,"regulation of membrane potential"),
c("GO:0032701","negative regulation of interleukin-18 production",0.017,1.4411,0.756,0.551,"regulation of membrane potential"),
c("GO:0048871","multicellular organismal homeostasis",0.562,1.9404,0.740,0.591,"regulation of membrane potential"),
c("GO:0001894","tissue homeostasis",0.393,1.4808,0.745,0.619,"regulation of membrane potential"),
c("GO:0055078","sodium ion homeostasis",0.081,2.0899,0.878,0.652,"regulation of membrane potential"),
c("GO:0034637","cellular carbohydrate biosynthetic process",0.207,1.8153,0.895,0.078,"cellular carbohydrate biosynthesis"),
c("GO:0043048","dolichyl monophosphate biosynthetic process",0.002,1.4411,0.918,0.343,"cellular carbohydrate biosynthesis"),
c("GO:0010513","positive regulation of phosphatidylinositol biosynthetic process",0.005,1.4411,0.851,0.520,"cellular carbohydrate biosynthesis"),
c("GO:1900210","positive regulation of cardiolipin metabolic process",0.001,1.4411,0.867,0.573,"cellular carbohydrate biosynthesis"),
c("GO:0044262","cellular carbohydrate metabolic process",0.802,1.5482,0.943,0.615,"cellular carbohydrate biosynthesis"),
c("GO:0006928","cellular component movement",3.830,2.2321,0.909,0.092,"cellular component movement"),
c("GO:0071805","potassium ion transmembrane transport",0.456,1.9311,0.786,0.100,"cellular component movement"),
c("GO:0046909","intermembrane transport",0.001,1.4411,0.896,0.206,"cellular component movement"),
c("GO:0042908","xenobiotic transport",0.019,1.4411,0.879,0.248,"cellular component movement"),
c("GO:0032879","regulation of localization",4.330,1.6533,0.830,0.316,"cellular component movement"),
c("GO:0015909","long-chain fatty acid transport",0.084,1.5191,0.832,0.377,"cellular component movement"),
c("GO:0006851","mitochondrial calcium ion transport",0.014,1.6135,0.842,0.520,"cellular component movement"),
c("GO:0072511","divalent inorganic cation transport",1.032,1.4940,0.821,0.521,"cellular component movement"));

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
