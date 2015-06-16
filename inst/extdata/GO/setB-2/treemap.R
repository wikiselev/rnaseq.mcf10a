

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
revigo.data <- rbind(c("GO:0007155","cell adhesion",2.821,7.5086,0.962,0.000,"cell adhesion"),
c("GO:0046588","negative regulation of calcium-dependent cell-cell adhesion",0.001,1.6906,0.877,0.464,"cell adhesion"),
c("GO:0090138","regulation of actin cytoskeleton organization by cell-cell adhesion",0.001,1.6906,0.860,0.464,"cell adhesion"),
c("GO:0046586","regulation of calcium-dependent cell-cell adhesion",0.003,1.3940,0.899,0.691,"cell adhesion"),
c("GO:0019885","antigen processing and presentation of endogenous peptide antigen via MHC class I",0.018,3.3665,0.965,0.000,"antigen processing and presentation of endogenous peptide antigen via MHC class I"),
c("GO:0019883","antigen processing and presentation of endogenous antigen",0.022,3.1938,0.980,0.123,"antigen processing and presentation of endogenous peptide antigen via MHC class I"),
c("GO:0002480","antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent",0.085,3.3665,0.973,0.171,"antigen processing and presentation of endogenous peptide antigen via MHC class I"),
c("GO:0002474","antigen processing and presentation of peptide antigen via MHC class I",19.037,1.6714,0.967,0.306,"antigen processing and presentation of endogenous peptide antigen via MHC class I"),
c("GO:0022610","biological adhesion",2.826,7.4949,0.994,0.000,"biological adhesion"),
c("GO:0030198","extracellular matrix organization",0.708,13.1487,0.865,0.000,"extracellular matrix organization"),
c("GO:0006928","cellular component movement",3.830,2.7423,0.916,0.105,"extracellular matrix organization"),
c("GO:0031581","hemidesmosome assembly",0.025,4.1367,0.894,0.276,"extracellular matrix organization"),
c("GO:0030866","cortical actin cytoskeleton organization",0.057,1.4379,0.894,0.295,"extracellular matrix organization"),
c("GO:0070208","protein heterotrimerization",0.024,3.3665,0.938,0.354,"extracellular matrix organization"),
c("GO:0034330","cell junction organization",0.493,1.6117,0.882,0.357,"extracellular matrix organization"),
c("GO:0043062","extracellular structure organization",0.709,13.1487,0.879,0.370,"extracellular matrix organization"),
c("GO:0022411","cellular component disassembly",0.713,2.1993,0.879,0.370,"extracellular matrix organization"),
c("GO:0030865","cortical cytoskeleton organization",0.060,1.3371,0.917,0.474,"extracellular matrix organization"),
c("GO:0070206","protein trimerization",0.056,1.8601,0.935,0.587,"extracellular matrix organization"),
c("GO:0010716","negative regulation of extracellular matrix disassembly",0.005,1.3940,0.836,0.658,"extracellular matrix organization"),
c("GO:0032501","multicellular organismal process",15.657,4.9208,0.995,0.000,"multicellular organismal process"),
c("GO:0032502","developmental process",13.055,3.3010,0.995,0.000,"developmental process"),
c("GO:0040011","locomotion",3.285,2.5229,0.994,0.000,"locomotion"),
c("GO:0044699","single-organism process",71.655,2.3990,0.998,0.000,"single-organism process"),
c("GO:0051384","response to glucocorticoid",0.384,3.9586,0.858,0.000,"response to glucocorticoid"),
c("GO:0035723","interleukin-15-mediated signaling pathway",0.001,1.6906,0.837,0.310,"response to glucocorticoid"),
c("GO:1990267","response to transition metal nanoparticle",0.273,1.9539,0.886,0.389,"response to glucocorticoid"),
c("GO:0035583","sequestering of TGFbeta in extracellular matrix",0.003,2.9136,0.690,0.400,"response to glucocorticoid"),
c("GO:0048009","insulin-like growth factor receptor signaling pathway",0.067,1.9606,0.844,0.416,"response to glucocorticoid"),
c("GO:0010038","response to metal ion",0.636,1.7359,0.871,0.420,"response to glucocorticoid"),
c("GO:0035722","interleukin-12-mediated signaling pathway",0.003,1.3940,0.825,0.425,"response to glucocorticoid"),
c("GO:0071874","cellular response to norepinephrine stimulus",0.001,1.6906,0.872,0.434,"response to glucocorticoid"),
c("GO:0055096","low-density lipoprotein particle mediated signaling",0.017,1.3940,0.806,0.445,"response to glucocorticoid"),
c("GO:0010035","response to inorganic substance",1.004,1.5680,0.873,0.462,"response to glucocorticoid"),
c("GO:0097067","cellular response to thyroid hormone stimulus",0.016,1.8681,0.857,0.514,"response to glucocorticoid"),
c("GO:0097066","response to thyroid hormone",0.030,1.5555,0.885,0.538,"response to glucocorticoid"),
c("GO:0051281","positive regulation of release of sequestered calcium ion into cytosol",0.039,2.7959,0.688,0.551,"response to glucocorticoid"),
c("GO:0097184","response to azide",0.001,1.6906,0.913,0.554,"response to glucocorticoid"),
c("GO:0097185","cellular response to azide",0.001,1.6906,0.882,0.554,"response to glucocorticoid"),
c("GO:0014070","response to organic cyclic compound",2.318,2.3716,0.852,0.562,"response to glucocorticoid"),
c("GO:0006878","cellular copper ion homeostasis",0.028,1.8681,0.827,0.573,"response to glucocorticoid"),
c("GO:0051563","smooth endoplasmic reticulum calcium ion homeostasis",0.010,1.3940,0.839,0.575,"response to glucocorticoid"),
c("GO:0007178","transmembrane receptor protein serine/threonine kinase signaling pathway",0.794,1.4026,0.815,0.603,"response to glucocorticoid"),
c("GO:0097305","response to alcohol",0.774,1.7799,0.863,0.608,"response to glucocorticoid"),
c("GO:0071280","cellular response to copper ion",0.006,1.3940,0.872,0.614,"response to glucocorticoid"),
c("GO:0033212","iron assimilation",0.001,1.3940,0.853,0.617,"response to glucocorticoid"),
c("GO:0033214","iron assimilation by chelation and transport",0.001,1.3940,0.853,0.617,"response to glucocorticoid"),
c("GO:0043270","positive regulation of ion transport",0.304,1.6291,0.796,0.635,"response to glucocorticoid"),
c("GO:0045471","response to ethanol",0.329,1.4955,0.872,0.639,"response to glucocorticoid"),
c("GO:0034284","response to monosaccharide",0.410,1.4729,0.870,0.652,"response to glucocorticoid"),
c("GO:0006880","intracellular sequestering of iron ion",0.002,1.3940,0.802,0.656,"response to glucocorticoid"),
c("GO:0097577","sequestering of iron ion",0.002,1.3940,0.812,0.656,"response to glucocorticoid"),
c("GO:0060315","negative regulation of ryanodine-sensitive calcium-release channel activity",0.016,1.8681,0.758,0.661,"response to glucocorticoid"),
c("GO:0051284","positive regulation of sequestering of calcium ion",0.002,1.3940,0.779,0.664,"response to glucocorticoid"),
c("GO:0060401","cytosolic calcium ion transport",0.258,1.5193,0.856,0.664,"response to glucocorticoid"),
c("GO:0009743","response to carbohydrate",0.496,1.7305,0.868,0.665,"response to glucocorticoid"),
c("GO:0010033","response to organic substance",6.118,1.8324,0.850,0.680,"response to glucocorticoid"),
c("GO:0017015","regulation of transforming growth factor beta receptor signaling pathway",0.198,2.4377,0.742,0.684,"response to glucocorticoid"),
c("GO:0071692","protein localization to extracellular region",0.006,2.6162,0.919,0.000,"protein localization to extracellular region"),
c("GO:0044795","trans-Golgi network to recycling endosome transport",0.001,1.6906,0.898,0.128,"protein localization to extracellular region"),
c("GO:0035696","monocyte extravasation",0.003,1.6906,0.858,0.135,"protein localization to extracellular region"),
c("GO:0051674","localization of cell",2.570,1.6440,0.901,0.201,"protein localization to extracellular region"),
c("GO:0006824","cobalt ion transport",0.013,1.3940,0.880,0.213,"protein localization to extracellular region"),
c("GO:0015891","siderophore transport",0.003,1.3940,0.896,0.255,"protein localization to extracellular region"),
c("GO:0032369","negative regulation of lipid transport",0.041,2.4989,0.792,0.309,"protein localization to extracellular region"),
c("GO:0015889","cobalamin transport",0.009,1.3940,0.902,0.313,"protein localization to extracellular region"),
c("GO:0052066","entry of symbiont into host cell by promotion of host phagocytosis",0.001,1.6906,0.732,0.346,"protein localization to extracellular region"),
c("GO:0032596","protein transport into membrane raft",0.011,1.6906,0.849,0.351,"protein localization to extracellular region"),
c("GO:0019896","axon transport of mitochondrion",0.009,1.3940,0.852,0.391,"protein localization to extracellular region"),
c("GO:0006897","endocytosis",1.430,1.4946,0.878,0.423,"protein localization to extracellular region"),
c("GO:0032594","protein transport within lipid bilayer",0.023,1.3940,0.844,0.484,"protein localization to extracellular region"),
c("GO:0035932","aldosterone secretion",0.006,1.3940,0.747,0.556,"protein localization to extracellular region"),
c("GO:2000370","positive regulation of clathrin-mediated endocytosis",0.003,1.3940,0.794,0.577,"protein localization to extracellular region"),
c("GO:0002576","platelet degranulation",0.105,1.4724,0.827,0.596,"protein localization to extracellular region"),
c("GO:0032456","endocytic recycling",0.038,1.5555,0.866,0.596,"protein localization to extracellular region"),
c("GO:0052231","modulation of phagocytosis in other organism involved in symbiotic interaction",0.001,1.6906,0.765,0.608,"protein localization to extracellular region"),
c("GO:2000643","positive regulation of early endosome to late endosome transport",0.006,1.3940,0.797,0.650,"protein localization to extracellular region"),
c("GO:0035635","entry of bacterium into host cell",0.001,1.3940,0.921,0.665,"protein localization to extracellular region"),
c("GO:2000536","negative regulation of entry of bacterium into host cell",0.001,1.6906,0.857,0.665,"protein localization to extracellular region"),
c("GO:1900139","negative regulation of arachidonic acid secretion",0.001,1.6906,0.816,0.666,"protein localization to extracellular region"),
c("GO:0032368","regulation of lipid transport",0.166,1.7902,0.810,0.688,"protein localization to extracellular region"),
c("GO:0006909","phagocytosis",0.545,1.4908,0.862,0.699,"protein localization to extracellular region"),
c("GO:0030574","collagen catabolic process",0.104,4.5086,0.848,0.016,"collagen catabolism"),
c("GO:0006601","creatine biosynthetic process",0.002,3.3872,0.872,0.111,"collagen catabolism"),
c("GO:0018208","peptidyl-proline modification",0.207,1.9090,0.927,0.130,"collagen catabolism"),
c("GO:1901142","insulin metabolic process",0.014,1.3940,0.963,0.195,"collagen catabolism"),
c("GO:0010459","negative regulation of heart rate",0.016,3.3872,0.797,0.206,"collagen catabolism"),
c("GO:0019674","NAD metabolic process",0.099,2.2652,0.849,0.214,"collagen catabolism"),
c("GO:0001519","peptide amidation",0.009,1.6906,0.926,0.232,"collagen catabolism"),
c("GO:0045715","negative regulation of low-density lipoprotein particle receptor biosynthetic process",0.003,1.3940,0.865,0.236,"collagen catabolism"),
c("GO:0006958","complement activation, classical pathway",0.215,1.5555,0.852,0.239,"collagen catabolism"),
c("GO:0060244","negative regulation of cell proliferation involved in contact inhibition",0.005,1.3940,0.883,0.239,"collagen catabolism"),
c("GO:0044236","multicellular organismal metabolic process",0.220,2.8297,0.871,0.247,"collagen catabolism"),
c("GO:0044029","hypomethylation of CpG island",0.006,1.6906,0.886,0.257,"collagen catabolism"),
c("GO:0018032","protein amidation",0.008,1.6906,0.942,0.268,"collagen catabolism"),
c("GO:0001525","angiogenesis",0.910,2.4802,0.842,0.297,"collagen catabolism"),
c("GO:0090130","tissue migration",0.371,1.8047,0.894,0.312,"collagen catabolism"),
c("GO:0045663","positive regulation of myoblast differentiation",0.019,1.9714,0.804,0.317,"collagen catabolism"),
c("GO:0030421","defecation",0.003,1.6906,0.913,0.318,"collagen catabolism"),
c("GO:0050817","coagulation",0.929,1.6247,0.886,0.342,"collagen catabolism"),
c("GO:0030325","adrenal gland development",0.070,1.4943,0.882,0.349,"collagen catabolism"),
c("GO:0043651","linoleic acid metabolic process",0.014,1.7770,0.881,0.352,"collagen catabolism"),
c("GO:0006596","polyamine biosynthetic process",0.034,1.8681,0.891,0.367,"collagen catabolism"),
c("GO:0021695","cerebellar cortex development",0.132,1.7258,0.872,0.369,"collagen catabolism"),
c("GO:0050878","regulation of body fluid levels",1.269,1.6394,0.785,0.369,"collagen catabolism"),
c("GO:0060008","Sertoli cell differentiation",0.047,1.7770,0.828,0.375,"collagen catabolism"),
c("GO:1901162","primary amino compound biosynthetic process",0.008,1.6906,0.931,0.393,"collagen catabolism"),
c("GO:0046164","alcohol catabolic process",0.103,1.5364,0.913,0.397,"collagen catabolism"),
c("GO:0060466","activation of meiosis involved in egg activation",0.007,1.6906,0.813,0.407,"collagen catabolism"),
c("GO:0010873","positive regulation of cholesterol esterification",0.008,1.3940,0.855,0.408,"collagen catabolism"),
c("GO:0006422","aspartyl-tRNA aminoacylation",0.011,1.6906,0.870,0.413,"collagen catabolism"),
c("GO:1901621","negative regulation of smoothened signaling pathway involved in dorsal/ventral neural tube patterning",0.009,1.3940,0.757,0.417,"collagen catabolism"),
c("GO:0010743","regulation of macrophage derived foam cell differentiation",0.071,1.3856,0.849,0.420,"collagen catabolism"),
c("GO:0017186","peptidyl-pyroglutamic acid biosynthetic process, using glutaminyl-peptide cyclotransferase",0.002,1.3940,0.942,0.429,"collagen catabolism"),
c("GO:0035407","histone H3-T11 phosphorylation",0.009,1.3940,0.865,0.467,"collagen catabolism"),
c("GO:0072359","circulatory system development",2.260,1.8811,0.845,0.493,"collagen catabolism"),
c("GO:0007566","embryo implantation",0.140,1.6849,0.834,0.493,"collagen catabolism"),
c("GO:0046360","2-oxobutyrate biosynthetic process",0.002,1.6906,0.875,0.500,"collagen catabolism"),
c("GO:0010916","negative regulation of very-low-density lipoprotein particle clearance",0.005,1.6906,0.845,0.507,"collagen catabolism"),
c("GO:0051235","maintenance of location",0.656,1.4257,0.832,0.515,"collagen catabolism"),
c("GO:0006600","creatine metabolic process",0.016,1.8681,0.876,0.526,"collagen catabolism"),
c("GO:0060346","bone trabecula formation",0.025,1.9714,0.882,0.549,"collagen catabolism"),
c("GO:0000413","protein peptidyl-prolyl isomerization",0.163,1.4379,0.928,0.574,"collagen catabolism"),
c("GO:0032480","negative regulation of type I interferon production",0.055,1.6849,0.834,0.584,"collagen catabolism"),
c("GO:0072330","monocarboxylic acid biosynthetic process",0.430,1.7711,0.846,0.594,"collagen catabolism"),
c("GO:0030070","insulin processing",0.009,1.6906,0.834,0.606,"collagen catabolism"),
c("GO:0031179","peptide modification",0.009,1.6906,0.926,0.606,"collagen catabolism"),
c("GO:0019262","N-acetylneuraminate catabolic process",0.005,1.3940,0.886,0.608,"collagen catabolism"),
c("GO:0000904","cell morphogenesis involved in differentiation",1.833,1.6096,0.802,0.608,"collagen catabolism"),
c("GO:0007399","nervous system development",4.932,1.6977,0.832,0.615,"collagen catabolism"),
c("GO:0097368","establishment of Sertoli cell barrier",0.002,1.6906,0.853,0.621,"collagen catabolism"),
c("GO:0046459","short-chain fatty acid metabolic process",0.027,1.6955,0.877,0.625,"collagen catabolism"),
c("GO:2000344","positive regulation of acrosome reaction",0.006,1.3940,0.759,0.625,"collagen catabolism"),
c("GO:0080154","regulation of fertilization",0.009,1.3940,0.907,0.628,"collagen catabolism"),
c("GO:0044707","single-multicellular organism process",15.092,4.6990,0.854,0.638,"collagen catabolism"),
c("GO:0044703","multi-organism reproductive process",2.167,1.4895,0.933,0.647,"collagen catabolism"),
c("GO:1901616","organic hydroxy compound catabolic process",0.134,1.3506,0.955,0.659,"collagen catabolism"),
c("GO:0045822","negative regulation of heart contraction",0.039,1.8681,0.826,0.664,"collagen catabolism"),
c("GO:0086064","cell communication by electrical coupling involved in cardiac conduction",0.022,1.6955,0.835,0.676,"collagen catabolism"),
c("GO:0061564","axon development",1.212,1.5461,0.762,0.686,"collagen catabolism"),
c("GO:0051004","regulation of lipoprotein lipase activity",0.055,2.1325,0.911,0.038,"regulation of lipoprotein lipase activity"),
c("GO:2000653","regulation of genetic imprinting",0.007,1.6906,0.894,0.166,"regulation of lipoprotein lipase activity"),
c("GO:0000117","regulation of transcription involved in G2/M transition of mitotic cell cycle",0.001,1.6906,0.882,0.171,"regulation of lipoprotein lipase activity"),
c("GO:2000560","positive regulation of CD24 biosynthetic process",0.001,1.6906,0.878,0.174,"regulation of lipoprotein lipase activity"),
c("GO:2000568","positive regulation of memory T cell activation",0.002,1.3940,0.887,0.204,"regulation of lipoprotein lipase activity"),
c("GO:0080163","regulation of protein serine/threonine phosphatase activity",0.001,1.6906,0.891,0.357,"regulation of lipoprotein lipase activity"),
c("GO:0035724","CD24 biosynthetic process",0.001,1.6906,0.936,0.420,"regulation of lipoprotein lipase activity"),
c("GO:0035709","memory T cell activation",0.002,1.3940,0.933,0.431,"regulation of lipoprotein lipase activity"),
c("GO:0051346","negative regulation of hydrolase activity",0.734,1.4374,0.898,0.543,"regulation of lipoprotein lipase activity"),
c("GO:0060191","regulation of lipase activity",0.193,1.3229,0.913,0.605,"regulation of lipoprotein lipase activity"),
c("GO:1900138","negative regulation of phospholipase A2 activity",0.002,1.3940,0.921,0.686,"regulation of lipoprotein lipase activity"),
c("GO:0000086","G2/M transition of mitotic cell cycle",0.231,1.3029,0.927,0.693,"regulation of lipoprotein lipase activity"),
c("GO:1900115","extracellular regulation of signal transduction",0.017,2.0904,0.854,0.064,"extracellular regulation of signal transduction"),
c("GO:0010644","cell communication by electrical coupling",0.036,1.4379,0.919,0.173,"extracellular regulation of signal transduction"),
c("GO:0044763","single-organism cellular process",45.302,1.6959,0.934,0.073,"single-organism cellular process"),
c("GO:0008037","cell recognition",0.236,1.6465,0.932,0.079,"cell recognition"),
c("GO:0009605","response to external stimulus",4.459,3.3979,0.947,0.091,"response to external stimulus"),
c("GO:0031667","response to nutrient levels",1.049,2.7932,0.913,0.103,"response to external stimulus"),
c("GO:0007610","behavior",1.517,1.4856,0.952,0.108,"response to external stimulus"),
c("GO:0009611","response to wounding",2.056,2.4711,0.933,0.113,"response to external stimulus"),
c("GO:0009719","response to endogenous stimulus",3.718,2.6925,0.948,0.124,"response to external stimulus"),
c("GO:0042221","response to chemical",8.684,2.4078,0.943,0.142,"response to external stimulus"),
c("GO:0006950","response to stress",8.191,2.3726,0.944,0.160,"response to external stimulus"),
c("GO:0048583","regulation of response to stimulus",26.518,2.1624,0.894,0.210,"response to external stimulus"),
c("GO:0048584","positive regulation of response to stimulus",22.389,1.9488,0.863,0.280,"response to external stimulus"),
c("GO:0090403","oxidative stress-induced premature senescence",0.010,1.3940,0.809,0.352,"response to external stimulus"),
c("GO:0016198","axon choice point recognition",0.011,2.4012,0.711,0.436,"response to external stimulus"),
c("GO:0016045","detection of bacterium",0.050,1.9714,0.892,0.489,"response to external stimulus"),
c("GO:0016477","cell migration",2.372,1.9017,0.806,0.515,"response to external stimulus"),
c("GO:0048668","collateral sprouting",0.038,1.5555,0.808,0.522,"response to external stimulus"),
c("GO:0035874","cellular response to copper ion starvation",0.001,1.6906,0.875,0.558,"response to external stimulus"),
c("GO:0042060","wound healing",1.314,2.4535,0.932,0.559,"response to external stimulus"),
c("GO:0009595","detection of biotic stimulus",0.058,1.6221,0.953,0.579,"response to external stimulus"),
c("GO:0080134","regulation of response to stress",1.961,2.1765,0.886,0.588,"response to external stimulus"),
c("GO:0040008","regulation of growth",1.265,1.3499,0.945,0.612,"response to external stimulus"),
c("GO:0001916","positive regulation of T cell mediated cytotoxicity",18.940,1.4379,0.834,0.617,"response to external stimulus"),
c("GO:0009991","response to extracellular stimulus",1.114,2.5361,0.919,0.656,"response to external stimulus"),
c("GO:1900407","regulation of cellular response to oxidative stress",0.079,1.3856,0.805,0.667,"response to external stimulus"),
c("GO:0032101","regulation of response to external stimulus",1.256,1.4336,0.873,0.670,"response to external stimulus"),
c("GO:0007626","locomotory behavior",0.515,2.4949,0.927,0.094,"locomotory behavior"),
c("GO:0007614","short-term memory",0.027,1.3940,0.855,0.612,"locomotory behavior"),
c("GO:0001967","suckling behavior",0.044,2.0904,0.903,0.635,"locomotory behavior"),
c("GO:0019098","reproductive behavior",0.099,1.3856,0.916,0.677,"locomotory behavior"));

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
