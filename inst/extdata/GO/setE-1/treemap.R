

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
revigo.data <- rbind(c("GO:0007156","homophilic cell adhesion via plasma membrane adhesion molecules",0.489,1.5962,0.985,0.000,"homophilic cell adhesion via plasma membrane adhesion molecules"),
c("GO:0007618","mating",0.139,1.8108,0.961,0.000,"mating"),
c("GO:0043012","regulation of fusion of sperm to egg plasma membrane",0.001,1.5488,0.748,0.447,"mating"),
c("GO:0007290","spermatid nucleus elongation",0.014,1.5488,0.711,0.518,"mating"),
c("GO:0007620","copulation",0.077,1.7011,0.962,0.584,"mating"),
c("GO:0048515","spermatid differentiation",0.276,1.3101,0.704,0.676,"mating"),
c("GO:0022610","biological adhesion",2.826,1.3223,0.992,0.000,"biological adhesion"),
c("GO:0023052","signaling",17.329,1.3199,0.993,0.000,"signaling"),
c("GO:0032501","multicellular organismal process",15.657,1.9048,0.993,0.000,"multicellular organismal process"),
c("GO:0040011","locomotion",3.285,1.8225,0.992,0.000,"locomotion"),
c("GO:0050896","response to stimulus",47.248,1.3529,0.996,0.000,"response to stimulus"),
c("GO:0071526","semaphorin-plexin signaling pathway",0.098,3.1739,0.837,0.000,"semaphorin-plexin signaling pathway"),
c("GO:0046826","negative regulation of protein export from nucleus",0.009,2.1238,0.817,0.108,"semaphorin-plexin signaling pathway"),
c("GO:0006298","mismatch repair",0.164,2.1029,0.813,0.201,"semaphorin-plexin signaling pathway"),
c("GO:0051674","localization of cell",2.570,1.3062,0.949,0.208,"semaphorin-plexin signaling pathway"),
c("GO:0019935","cyclic-nucleotide-mediated signaling",0.089,1.4448,0.834,0.220,"semaphorin-plexin signaling pathway"),
c("GO:0015670","carbon dioxide transport",0.007,1.5488,0.929,0.284,"semaphorin-plexin signaling pathway"),
c("GO:0048311","mitochondrion distribution",0.025,1.9559,0.833,0.297,"semaphorin-plexin signaling pathway"),
c("GO:0033344","cholesterol efflux",0.087,1.7491,0.901,0.332,"semaphorin-plexin signaling pathway"),
c("GO:0015755","fructose transport",0.011,1.5488,0.927,0.332,"semaphorin-plexin signaling pathway"),
c("GO:0035524","proline transmembrane transport",0.015,1.5488,0.865,0.338,"semaphorin-plexin signaling pathway"),
c("GO:0051570","regulation of histone H3-K9 methylation",0.048,1.8179,0.748,0.351,"semaphorin-plexin signaling pathway"),
c("GO:0034367","macromolecular complex remodeling",0.040,1.3609,0.919,0.360,"semaphorin-plexin signaling pathway"),
c("GO:2000761","positive regulation of N-terminal peptidyl-lysine acetylation",0.001,1.5488,0.850,0.366,"semaphorin-plexin signaling pathway"),
c("GO:0050728","negative regulation of inflammatory response",0.236,1.9574,0.827,0.369,"semaphorin-plexin signaling pathway"),
c("GO:0042953","lipoprotein transport",0.042,1.8179,0.921,0.375,"semaphorin-plexin signaling pathway"),
c("GO:0016055","Wnt signaling pathway",0.887,2.0137,0.809,0.378,"semaphorin-plexin signaling pathway"),
c("GO:0043524","negative regulation of neuron apoptotic process",0.357,1.4832,0.804,0.384,"semaphorin-plexin signaling pathway"),
c("GO:0097195","pilomotor reflex",0.009,1.5488,0.956,0.387,"semaphorin-plexin signaling pathway"),
c("GO:0071725","response to triacyl bacterial lipopeptide",0.016,1.5488,0.915,0.402,"semaphorin-plexin signaling pathway"),
c("GO:0051389","inactivation of MAPKK activity",0.001,1.5488,0.771,0.413,"semaphorin-plexin signaling pathway"),
c("GO:0030103","vasopressin secretion",0.005,1.5488,0.845,0.414,"semaphorin-plexin signaling pathway"),
c("GO:0030111","regulation of Wnt signaling pathway",0.482,1.9610,0.791,0.438,"semaphorin-plexin signaling pathway"),
c("GO:0001766","membrane raft polarization",0.006,1.5488,0.879,0.441,"semaphorin-plexin signaling pathway"),
c("GO:0044700","single organism signaling",17.329,1.3199,0.912,0.447,"semaphorin-plexin signaling pathway"),
c("GO:0015787","UDP-glucuronic acid transport",0.001,1.5488,0.923,0.492,"semaphorin-plexin signaling pathway"),
c("GO:2000249","regulation of actin cytoskeleton reorganization",0.035,1.4322,0.815,0.506,"semaphorin-plexin signaling pathway"),
c("GO:0000710","meiotic mismatch repair",0.006,1.5488,0.785,0.519,"semaphorin-plexin signaling pathway"),
c("GO:0015910","peroxisomal long-chain fatty acid import",0.001,1.5488,0.914,0.530,"semaphorin-plexin signaling pathway"),
c("GO:0006308","DNA catabolic process",0.253,1.3689,0.859,0.540,"semaphorin-plexin signaling pathway"),
c("GO:0034589","hydroxyproline transport",0.001,1.5488,0.921,0.546,"semaphorin-plexin signaling pathway"),
c("GO:0042771","intrinsic apoptotic signaling pathway in response to DNA damage by p53 class mediator",0.099,1.8283,0.807,0.578,"semaphorin-plexin signaling pathway"),
c("GO:0043409","negative regulation of MAPK cascade",0.300,1.8196,0.705,0.606,"semaphorin-plexin signaling pathway"),
c("GO:0046578","regulation of Ras protein signal transduction",1.383,1.3576,0.781,0.629,"semaphorin-plexin signaling pathway"),
c("GO:0060993","kidney morphogenesis",0.105,2.9281,0.753,0.014,"kidney morphogenesis"),
c("GO:0043017","positive regulation of lymphotoxin A biosynthetic process",0.001,1.5488,0.746,0.176,"kidney morphogenesis"),
c("GO:0048148","behavioral response to cocaine",0.033,1.8179,0.812,0.216,"kidney morphogenesis"),
c("GO:0032849","positive regulation of cellular pH reduction",0.010,1.5488,0.855,0.219,"kidney morphogenesis"),
c("GO:0003058","hormonal regulation of the force of heart contraction",0.001,1.5488,0.822,0.241,"kidney morphogenesis"),
c("GO:0072347","response to anesthetic",0.005,1.5488,0.955,0.248,"kidney morphogenesis"),
c("GO:0072702","response to methyl methanesulfonate",0.001,1.5488,0.955,0.270,"kidney morphogenesis"),
c("GO:0072703","cellular response to methyl methanesulfonate",0.001,1.5488,0.915,0.270,"kidney morphogenesis"),
c("GO:0048485","sympathetic nervous system development",0.043,1.4322,0.771,0.286,"kidney morphogenesis"),
c("GO:0006805","xenobiotic metabolic process",0.218,1.6200,0.866,0.316,"kidney morphogenesis"),
c("GO:0035162","embryonic hemopoiesis",0.060,1.9465,0.765,0.338,"kidney morphogenesis"),
c("GO:0045595","regulation of cell differentiation",3.246,2.5100,0.625,0.345,"kidney morphogenesis"),
c("GO:2000721","positive regulation of transcription from RNA polymerase II promoter involved in smooth muscle cell differentiation",0.005,1.5488,0.724,0.346,"kidney morphogenesis"),
c("GO:0003357","noradrenergic neuron differentiation",0.009,1.5488,0.748,0.365,"kidney morphogenesis"),
c("GO:0009410","response to xenobiotic stimulus",0.239,1.5498,0.945,0.367,"kidney morphogenesis"),
c("GO:0048844","artery morphogenesis",0.129,1.8283,0.761,0.391,"kidney morphogenesis"),
c("GO:0014076","response to fluoxetine",0.005,1.5488,0.951,0.408,"kidney morphogenesis"),
c("GO:0001655","urogenital system development",0.815,2.2495,0.747,0.431,"kidney morphogenesis"),
c("GO:0002668","negative regulation of T cell anergy",0.002,1.5488,0.727,0.433,"kidney morphogenesis"),
c("GO:0060560","developmental growth involved in morphogenesis",0.399,1.6398,0.769,0.434,"kidney morphogenesis"),
c("GO:0014043","negative regulation of neuron maturation",0.003,1.5488,0.686,0.434,"kidney morphogenesis"),
c("GO:0021522","spinal cord motor neuron differentiation",0.090,1.8108,0.699,0.445,"kidney morphogenesis"),
c("GO:0044707","single-multicellular organism process",15.092,1.8976,0.767,0.467,"kidney morphogenesis"),
c("GO:0001710","mesodermal cell fate commitment",0.046,1.4322,0.739,0.469,"kidney morphogenesis"),
c("GO:0014807","regulation of somitogenesis",0.011,1.9559,0.744,0.476,"kidney morphogenesis"),
c("GO:0071320","cellular response to cAMP",0.124,1.3621,0.888,0.525,"kidney morphogenesis"),
c("GO:2000173","negative regulation of branching morphogenesis of a nerve",0.037,1.5488,0.677,0.526,"kidney morphogenesis"),
c("GO:2000725","regulation of cardiac muscle cell differentiation",0.040,1.7011,0.673,0.529,"kidney morphogenesis"),
c("GO:0001764","neuron migration",0.400,1.7199,0.650,0.534,"kidney morphogenesis"),
c("GO:0061001","regulation of dendritic spine morphogenesis",0.050,2.0218,0.608,0.540,"kidney morphogenesis"),
c("GO:0050793","regulation of developmental process",4.431,1.5830,0.743,0.541,"kidney morphogenesis"),
c("GO:0043589","skin morphogenesis",0.108,1.5357,0.764,0.541,"kidney morphogenesis"),
c("GO:0046530","photoreceptor cell differentiation",0.119,1.6364,0.705,0.546,"kidney morphogenesis"),
c("GO:0048714","positive regulation of oligodendrocyte differentiation",0.039,1.9559,0.650,0.546,"kidney morphogenesis"),
c("GO:0014740","negative regulation of muscle hyperplasia",0.011,1.5488,0.748,0.559,"kidney morphogenesis"),
c("GO:0009887","organ morphogenesis",2.260,1.4230,0.706,0.568,"kidney morphogenesis"),
c("GO:0009954","proximal/distal pattern formation",0.088,1.7491,0.792,0.577,"kidney morphogenesis"),
c("GO:0042384","cilium assembly",0.352,1.6442,0.665,0.590,"kidney morphogenesis"),
c("GO:0035564","regulation of kidney size",0.007,1.5488,0.763,0.606,"kidney morphogenesis"),
c("GO:0002244","hematopoietic progenitor cell differentiation",0.320,1.3101,0.697,0.613,"kidney morphogenesis"),
c("GO:0022029","telencephalon cell migration",0.190,1.3621,0.678,0.620,"kidney morphogenesis"),
c("GO:0061387","regulation of extent of cell growth",0.139,1.4885,0.781,0.620,"kidney morphogenesis"),
c("GO:0044782","cilium organization",0.384,1.4200,0.820,0.624,"kidney morphogenesis"),
c("GO:0060840","artery development",0.146,1.6269,0.769,0.645,"kidney morphogenesis"),
c("GO:0008343","adult feeding behavior",0.021,1.5488,0.840,0.686,"kidney morphogenesis"),
c("GO:0031345","negative regulation of cell projection organization",0.244,1.5962,0.735,0.689,"kidney morphogenesis"),
c("GO:2000691","negative regulation of cardiac muscle cell myoblast differentiation",0.001,1.5488,0.696,0.693,"kidney morphogenesis"),
c("GO:0033540","fatty acid beta-oxidation using acyl-CoA oxidase",0.013,2.9508,0.796,0.054,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:0032801","receptor catabolic process",0.036,2.2865,0.885,0.296,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:0042402","cellular biogenic amine catabolic process",0.046,1.6000,0.872,0.310,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:0045540","regulation of cholesterol biosynthetic process",0.036,2.3915,0.813,0.396,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:0046355","mannan catabolic process",0.007,1.5488,0.892,0.423,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:0009072","aromatic amino acid family metabolic process",0.140,1.5112,0.829,0.443,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:0046293","formaldehyde biosynthetic process",0.001,1.5488,0.881,0.460,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:0042159","lipoprotein catabolic process",0.031,1.9559,0.907,0.463,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:0016042","lipid catabolic process",0.537,2.0747,0.829,0.509,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:0009437","carnitine metabolic process",0.032,1.5112,0.836,0.557,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:0001523","retinoid metabolic process",0.126,1.4885,0.828,0.562,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:0032805","positive regulation of low-density lipoprotein particle receptor catabolic process",0.001,1.5488,0.823,0.604,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:0006636","unsaturated fatty acid biosynthetic process",0.108,1.6643,0.783,0.619,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:0030258","lipid modification",0.468,1.5981,0.816,0.632,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:1901307","positive regulation of spermidine biosynthetic process",0.001,1.5488,0.838,0.637,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:0006720","isoprenoid metabolic process",0.232,1.3689,0.824,0.655,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:0034440","lipid oxidation",0.158,1.5996,0.824,0.692,"fatty acid beta-oxidation using acyl-CoA oxidase"),
c("GO:0009416","response to light stimulus",0.655,2.1349,0.934,0.066,"response to light stimulus"),
c("GO:0007231","osmosensory signaling pathway",0.002,1.5488,0.839,0.471,"response to light stimulus"),
c("GO:0009268","response to pH",0.065,1.5112,0.946,0.599,"response to light stimulus"),
c("GO:0050808","synapse organization",0.424,2.0405,0.852,0.070,"synapse organization"),
c("GO:1901631","positive regulation of presynaptic membrane organization",0.002,1.5488,0.837,0.227,"synapse organization"),
c("GO:0034374","low-density lipoprotein particle remodeling",0.019,1.9559,0.780,0.261,"synapse organization"),
c("GO:0097061","dendritic spine organization",0.075,1.4891,0.846,0.289,"synapse organization"),
c("GO:0043622","cortical microtubule organization",0.002,1.5488,0.877,0.290,"synapse organization"),
c("GO:0051239","regulation of multicellular organismal process",5.506,2.0343,0.936,0.071,"regulation of multicellular organismal process"),
c("GO:0042116","macrophage activation",0.146,1.4891,0.892,0.072,"macrophage activation"),
c("GO:0045622","regulation of T-helper cell differentiation",0.057,1.4322,0.656,0.582,"macrophage activation"),
c("GO:0016311","dephosphorylation",1.340,1.7975,0.903,0.075,"dephosphorylation"),
c("GO:2001295","malonyl-CoA biosynthetic process",0.002,1.5488,0.860,0.193,"dephosphorylation"),
c("GO:0046092","deoxycytidine metabolic process",0.002,1.5488,0.883,0.212,"dephosphorylation"),
c("GO:0010692","regulation of alkaline phosphatase activity",0.040,1.8179,0.839,0.238,"dephosphorylation"),
c("GO:0032850","positive regulation of ARF GTPase activity",0.010,1.5488,0.757,0.397,"dephosphorylation"),
c("GO:0052652","cyclic purine nucleotide metabolic process",0.268,1.3661,0.810,0.477,"dephosphorylation"),
c("GO:0006470","protein dephosphorylation",0.717,1.7530,0.871,0.667,"dephosphorylation"),
c("GO:0032514","positive regulation of protein phosphatase type 2B activity",0.001,1.5488,0.866,0.668,"dephosphorylation"),
c("GO:0006577","amino-acid betaine metabolic process",0.038,1.3609,0.927,0.082,"amino-acid betaine metabolism"),
c("GO:0051606","detection of stimulus",1.214,1.7940,0.965,0.084,"detection of stimulus"),
c("GO:0006801","superoxide metabolic process",0.140,1.3621,0.933,0.092,"superoxide metabolism"));

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
