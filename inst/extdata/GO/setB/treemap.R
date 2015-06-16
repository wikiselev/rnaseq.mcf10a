

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
revigo.data <- rbind(c("GO:0007155","cell adhesion",2.821,7.5850,0.969,0.000,"cell adhesion"),
c("GO:0070488","neutrophil aggregation",0.002,2.9355,0.958,0.486,"cell adhesion"),
c("GO:0007157","heterophilic cell-cell adhesion via plasma membrane cell adhesion molecules",0.084,1.7989,0.973,0.651,"cell adhesion"),
c("GO:0070486","leukocyte aggregation",0.011,1.6615,0.955,0.692,"cell adhesion"),
c("GO:0009605","response to external stimulus",4.459,6.5686,0.950,0.000,"response to external stimulus"),
c("GO:0051606","detection of stimulus",1.214,1.7760,0.956,0.105,"response to external stimulus"),
c("GO:0080134","regulation of response to stress",1.961,3.9586,0.873,0.112,"response to external stimulus"),
c("GO:0009719","response to endogenous stimulus",3.718,2.7122,0.951,0.124,"response to external stimulus"),
c("GO:0042221","response to chemical",8.684,3.6021,0.946,0.142,"response to external stimulus"),
c("GO:0006950","response to stress",8.191,2.3862,0.947,0.160,"response to external stimulus"),
c("GO:0006956","complement activation",0.276,2.3768,0.807,0.199,"response to external stimulus"),
c("GO:0006629","lipid metabolic process",3.159,2.3019,0.882,0.209,"response to external stimulus"),
c("GO:0048583","regulation of response to stimulus",26.518,3.1487,0.892,0.210,"response to external stimulus"),
c("GO:0018208","peptidyl-proline modification",0.207,2.0825,0.926,0.244,"response to external stimulus"),
c("GO:0072376","protein activation cascade",0.335,1.8444,0.871,0.254,"response to external stimulus"),
c("GO:0002250","adaptive immune response",19.622,1.8499,0.922,0.268,"response to external stimulus"),
c("GO:0044281","small molecule metabolic process",13.539,1.8336,0.866,0.358,"response to external stimulus"),
c("GO:0048584","positive regulation of response to stimulus",22.389,3.0757,0.861,0.359,"response to external stimulus"),
c("GO:0002526","acute inflammatory response",0.259,2.8477,0.920,0.465,"response to external stimulus"),
c("GO:0042060","wound healing",1.314,2.6882,0.913,0.556,"response to external stimulus"),
c("GO:0000413","protein peptidyl-prolyl isomerization",0.163,1.8781,0.927,0.574,"response to external stimulus"),
c("GO:0009611","response to wounding",2.056,3.8861,0.915,0.588,"response to external stimulus"),
c("GO:0006953","acute-phase response",0.088,1.8444,0.925,0.651,"response to external stimulus"),
c("GO:0006954","inflammatory response",1.375,2.4841,0.911,0.657,"response to external stimulus"),
c("GO:0022610","biological adhesion",2.826,7.5686,0.994,0.000,"biological adhesion"),
c("GO:0030198","extracellular matrix organization",0.708,10.3565,0.875,0.000,"extracellular matrix organization"),
c("GO:0006928","cellular component movement",3.830,4.0269,0.906,0.105,"extracellular matrix organization"),
c("GO:0034375","high-density lipoprotein particle remodeling",0.022,1.6615,0.856,0.273,"extracellular matrix organization"),
c("GO:0031581","hemidesmosome assembly",0.025,4.5376,0.901,0.276,"extracellular matrix organization"),
c("GO:0060074","synapse maturation",0.047,2.4023,0.802,0.290,"extracellular matrix organization"),
c("GO:0050764","regulation of phagocytosis",0.145,3.5229,0.752,0.319,"extracellular matrix organization"),
c("GO:0030033","microvillus assembly",0.021,2.1759,0.895,0.351,"extracellular matrix organization"),
c("GO:0050808","synapse organization",0.424,1.5902,0.885,0.352,"extracellular matrix organization"),
c("GO:0070208","protein heterotrimerization",0.024,2.7100,0.951,0.354,"extracellular matrix organization"),
c("GO:0043062","extracellular structure organization",0.709,10.3565,0.880,0.370,"extracellular matrix organization"),
c("GO:0008038","neuron recognition",0.071,2.3768,0.813,0.383,"extracellular matrix organization"),
c("GO:0032528","microvillus organization",0.023,1.9642,0.898,0.414,"extracellular matrix organization"),
c("GO:0051128","regulation of cellular component organization",3.835,2.6144,0.890,0.446,"extracellular matrix organization"),
c("GO:0032413","negative regulation of ion transmembrane transporter activity",0.051,3.1249,0.760,0.470,"extracellular matrix organization"),
c("GO:0050715","positive regulation of cytokine secretion",0.137,2.2557,0.673,0.505,"extracellular matrix organization"),
c("GO:0000904","cell morphogenesis involved in differentiation",1.833,1.5812,0.790,0.513,"extracellular matrix organization"),
c("GO:2000678","negative regulation of transcription regulatory region DNA binding",0.136,1.5465,0.934,0.547,"extracellular matrix organization"),
c("GO:0002576","platelet degranulation",0.105,1.7924,0.826,0.570,"extracellular matrix organization"),
c("GO:0051050","positive regulation of transport",1.381,2.1726,0.790,0.613,"extracellular matrix organization"),
c("GO:0006897","endocytosis",1.430,1.5616,0.874,0.613,"extracellular matrix organization"),
c("GO:0032480","negative regulation of type I interferon production",0.055,1.7913,0.826,0.632,"extracellular matrix organization"),
c("GO:0043270","positive regulation of ion transport",0.304,2.2358,0.780,0.682,"extracellular matrix organization"),
c("GO:0090129","positive regulation of synapse maturation",0.027,1.9642,0.705,0.685,"extracellular matrix organization"),
c("GO:0032501","multicellular organismal process",15.657,9.0269,0.995,0.000,"multicellular organismal process"),
c("GO:0032502","developmental process",13.055,4.5229,0.995,0.000,"developmental process"),
c("GO:0032846","positive regulation of homeostatic process",0.154,4.0605,0.841,0.000,"positive regulation of homeostatic process"),
c("GO:0010459","negative regulation of heart rate",0.016,2.9355,0.790,0.318,"positive regulation of homeostatic process"),
c("GO:0051238","sequestering of metal ion",0.226,4.0000,0.805,0.385,"positive regulation of homeostatic process"),
c("GO:0050803","regulation of synapse structure and activity",0.164,2.0964,0.833,0.387,"positive regulation of homeostatic process"),
c("GO:0051235","maintenance of location",0.656,2.7328,0.814,0.435,"positive regulation of homeostatic process"),
c("GO:0006936","muscle contraction",0.724,2.4168,0.851,0.443,"positive regulation of homeostatic process"),
c("GO:0070293","renal absorption",0.028,1.5465,0.886,0.463,"positive regulation of homeostatic process"),
c("GO:0050878","regulation of body fluid levels",1.269,1.5586,0.770,0.515,"positive regulation of homeostatic process"),
c("GO:0007588","excretion",0.129,1.6923,0.874,0.523,"positive regulation of homeostatic process"),
c("GO:0035583","sequestering of TGFbeta in extracellular matrix",0.003,2.4672,0.722,0.610,"positive regulation of homeostatic process"),
c("GO:0050801","ion homeostasis",1.419,1.9492,0.831,0.619,"positive regulation of homeostatic process"),
c("GO:0003012","muscle system process",0.830,2.6440,0.854,0.623,"positive regulation of homeostatic process"),
c("GO:0044057","regulation of system process",1.035,1.8069,0.807,0.647,"positive regulation of homeostatic process"),
c("GO:0032119","sequestering of zinc ion",0.010,1.7978,0.786,0.654,"positive regulation of homeostatic process"),
c("GO:0055081","anion homeostasis",0.072,1.5936,0.859,0.662,"positive regulation of homeostatic process"),
c("GO:0045780","positive regulation of bone resorption",0.030,2.4023,0.767,0.668,"positive regulation of homeostatic process"),
c("GO:0040007","growth",2.160,2.1811,0.994,0.000,"growth"),
c("GO:0040011","locomotion",3.285,3.8539,0.994,0.000,"locomotion"),
c("GO:0044699","single-organism process",71.655,4.1675,0.998,0.000,"single-organism process"),
c("GO:0050896","response to stimulus",47.248,2.6253,0.997,0.000,"response to stimulus"),
c("GO:0030574","collagen catabolic process",0.104,3.9208,0.816,0.016,"collagen catabolism"),
c("GO:0010872","regulation of cholesterol esterification",0.011,2.1759,0.840,0.123,"collagen catabolism"),
c("GO:0006071","glycerol metabolic process",0.052,3.4437,0.842,0.135,"collagen catabolism"),
c("GO:1901568","fatty acid derivative metabolic process",0.179,2.0061,0.908,0.148,"collagen catabolism"),
c("GO:0006081","cellular aldehyde metabolic process",0.106,1.8444,0.883,0.148,"collagen catabolism"),
c("GO:0032515","negative regulation of phosphoprotein phosphatase activity",0.010,1.7978,0.864,0.171,"collagen catabolism"),
c("GO:0006601","creatine biosynthetic process",0.002,2.9355,0.838,0.190,"collagen catabolism"),
c("GO:0044241","lipid digestion",0.028,2.1759,0.897,0.214,"collagen catabolism"),
c("GO:0060343","trabecula formation",0.062,2.4622,0.852,0.225,"collagen catabolism"),
c("GO:0010743","regulation of macrophage derived foam cell differentiation",0.071,1.7989,0.828,0.243,"collagen catabolism"),
c("GO:1901566","organonitrogen compound biosynthetic process",2.941,2.5361,0.889,0.265,"collagen catabolism"),
c("GO:0060430","lung saccule development",0.030,1.7978,0.870,0.311,"collagen catabolism"),
c("GO:0003008","system process",4.235,3.8861,0.849,0.320,"collagen catabolism"),
c("GO:0090077","foam cell differentiation",0.076,1.6574,0.872,0.322,"collagen catabolism"),
c("GO:0030325","adrenal gland development",0.070,1.9642,0.862,0.329,"collagen catabolism"),
c("GO:0044236","multicellular organismal metabolic process",0.220,2.1403,0.825,0.346,"collagen catabolism"),
c("GO:0061383","trabecula morphogenesis",0.095,1.8444,0.905,0.368,"collagen catabolism"),
c("GO:1900544","positive regulation of purine nucleotide metabolic process",0.171,1.9539,0.763,0.380,"collagen catabolism"),
c("GO:0044283","small molecule biosynthetic process",1.120,2.1891,0.821,0.382,"collagen catabolism"),
c("GO:0006576","cellular biogenic amine metabolic process",0.227,1.8589,0.901,0.391,"collagen catabolism"),
c("GO:0044711","single-organism biosynthetic process",4.776,2.0511,0.861,0.409,"collagen catabolism"),
c("GO:0050817","coagulation",0.929,1.5748,0.869,0.410,"collagen catabolism"),
c("GO:0009308","amine metabolic process",0.369,1.6465,0.922,0.412,"collagen catabolism"),
c("GO:0045663","positive regulation of myoblast differentiation",0.019,1.5465,0.780,0.420,"collagen catabolism"),
c("GO:0001816","cytokine production",1.263,1.7908,0.865,0.426,"collagen catabolism"),
c("GO:0043097","pyrimidine nucleoside salvage",0.013,1.6615,0.827,0.430,"collagen catabolism"),
c("GO:0044282","small molecule catabolic process",0.575,2.0991,0.863,0.454,"collagen catabolism"),
c("GO:0072358","cardiovascular system development",2.258,2.6536,0.804,0.462,"collagen catabolism"),
c("GO:0046328","regulation of JNK cascade",0.288,1.9412,0.735,0.474,"collagen catabolism"),
c("GO:0050793","regulation of developmental process",4.431,1.6726,0.856,0.513,"collagen catabolism"),
c("GO:0051960","regulation of nervous system development",1.545,1.9702,0.769,0.525,"collagen catabolism"),
c("GO:0006636","unsaturated fatty acid biosynthetic process",0.108,2.7799,0.790,0.546,"collagen catabolism"),
c("GO:0072359","circulatory system development",2.260,2.6536,0.818,0.552,"collagen catabolism"),
c("GO:0045980","negative regulation of nucleotide metabolic process",0.067,1.6574,0.782,0.552,"collagen catabolism"),
c("GO:0061156","pulmonary artery morphogenesis",0.011,1.9642,0.866,0.576,"collagen catabolism"),
c("GO:0034433","steroid esterification",0.015,1.9642,0.875,0.597,"collagen catabolism"),
c("GO:0030814","regulation of cAMP metabolic process",0.197,1.6340,0.776,0.600,"collagen catabolism"),
c("GO:0003184","pulmonary valve morphogenesis",0.019,1.7978,0.859,0.600,"collagen catabolism"),
c("GO:0006006","glucose metabolic process",0.520,1.6724,0.890,0.600,"collagen catabolism"),
c("GO:0045981","positive regulation of nucleotide metabolic process",0.171,1.9539,0.774,0.613,"collagen catabolism"),
c("GO:0032787","monocarboxylic acid metabolic process",1.329,1.6209,0.801,0.618,"collagen catabolism"),
c("GO:0044707","single-multicellular organism process",15.092,8.6198,0.830,0.619,"collagen catabolism"),
c("GO:0003214","cardiac left ventricle morphogenesis",0.031,1.9642,0.856,0.624,"collagen catabolism"),
c("GO:0044255","cellular lipid metabolic process",2.183,1.5916,0.828,0.628,"collagen catabolism"),
c("GO:0046459","short-chain fatty acid metabolic process",0.027,2.2749,0.836,0.652,"collagen catabolism"),
c("GO:0009152","purine ribonucleotide biosynthetic process",1.740,2.1530,0.743,0.678,"collagen catabolism"),
c("GO:0048679","regulation of axon regeneration",0.031,1.6615,0.681,0.695,"collagen catabolism"),
c("GO:0046456","icosanoid biosynthetic process",0.098,2.4330,0.798,0.696,"collagen catabolism"),
c("GO:0006072","glycerol-3-phosphate metabolic process",0.030,2.4672,0.907,0.065,"glycerol-3-phosphate metabolism"),
c("GO:0016137","glycoside metabolic process",0.030,1.8781,0.905,0.247,"glycerol-3-phosphate metabolism"),
c("GO:0044598","doxorubicin metabolic process",0.009,1.6615,0.851,0.259,"glycerol-3-phosphate metabolism"),
c("GO:0006733","oxidoreduction coenzyme metabolic process",0.213,1.5991,0.930,0.620,"glycerol-3-phosphate metabolism"),
c("GO:0040008","regulation of growth",1.265,2.9431,0.939,0.065,"regulation of growth"),
c("GO:0010644","cell communication by electrical coupling",0.036,1.8781,0.920,0.067,"cell communication by electrical coupling"),
c("GO:0006801","superoxide metabolic process",0.140,1.8444,0.942,0.068,"superoxide metabolism"),
c("GO:0044763","single-organism cellular process",45.302,3.1871,0.926,0.073,"single-organism cellular process"),
c("GO:0008037","cell recognition",0.236,2.0453,0.926,0.079,"cell recognition"),
c("GO:0030593","neutrophil chemotaxis",0.122,5.2840,0.734,0.081,"neutrophil chemotaxis"),
c("GO:0019885","antigen processing and presentation of endogenous peptide antigen via MHC class I",0.018,2.7100,0.966,0.113,"neutrophil chemotaxis"),
c("GO:0046629","gamma-delta T cell activation",0.048,1.6615,0.923,0.121,"neutrophil chemotaxis"),
c("GO:0019883","antigen processing and presentation of endogenous antigen",0.022,2.5467,0.980,0.123,"neutrophil chemotaxis"),
c("GO:0071692","protein localization to extracellular region",0.006,2.1759,0.915,0.164,"neutrophil chemotaxis"),
c("GO:0002480","antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent",0.085,2.7100,0.978,0.171,"neutrophil chemotaxis"),
c("GO:2001235","positive regulation of apoptotic signaling pathway",0.316,2.7696,0.815,0.215,"neutrophil chemotaxis"),
c("GO:0007191","adenylate cyclase-activating dopamine receptor signaling pathway",0.032,2.1759,0.869,0.222,"neutrophil chemotaxis"),
c("GO:0051674","localization of cell",2.570,2.6946,0.889,0.260,"neutrophil chemotaxis"),
c("GO:0019932","second-messenger-mediated signaling",0.427,1.6580,0.841,0.274,"neutrophil chemotaxis"),
c("GO:0060401","cytosolic calcium ion transport",0.258,2.4660,0.835,0.280,"neutrophil chemotaxis"),
c("GO:0048009","insulin-like growth factor receptor signaling pathway",0.067,2.1500,0.862,0.287,"neutrophil chemotaxis"),
c("GO:0050482","arachidonic acid secretion",0.031,2.2749,0.852,0.335,"neutrophil chemotaxis"),
c("GO:0010649","regulation of cell communication by electrical coupling",0.015,1.6615,0.891,0.349,"neutrophil chemotaxis"),
c("GO:0051384","response to glucocorticoid",0.384,5.2366,0.891,0.364,"neutrophil chemotaxis"),
c("GO:1900115","extracellular regulation of signal transduction",0.017,1.6615,0.865,0.369,"neutrophil chemotaxis"),
c("GO:1990267","response to transition metal nanoparticle",0.273,2.4976,0.908,0.389,"neutrophil chemotaxis"),
c("GO:0010038","response to metal ion",0.636,2.4168,0.899,0.420,"neutrophil chemotaxis"),
c("GO:0010876","lipid localization",0.809,1.7062,0.883,0.420,"neutrophil chemotaxis"),
c("GO:0009620","response to fungus",0.062,1.7256,0.925,0.421,"neutrophil chemotaxis"),
c("GO:0006811","ion transport",7.803,2.0809,0.835,0.434,"neutrophil chemotaxis"),
c("GO:0019722","calcium-mediated signaling",0.299,1.6360,0.840,0.447,"neutrophil chemotaxis"),
c("GO:0010035","response to inorganic substance",1.004,2.0400,0.897,0.462,"neutrophil chemotaxis"),
c("GO:0001101","response to acid chemical",0.711,1.9477,0.900,0.467,"neutrophil chemotaxis"),
c("GO:0055094","response to lipoprotein particle",0.036,1.5465,0.913,0.470,"neutrophil chemotaxis"),
c("GO:0015985","energy coupled proton transport, down electrochemical gradient",1.236,1.6574,0.801,0.502,"neutrophil chemotaxis"),
c("GO:0045745","positive regulation of G-protein coupled receptor protein signaling pathway",0.025,2.2749,0.844,0.521,"neutrophil chemotaxis"),
c("GO:0050832","defense response to fungus",0.038,1.6615,0.899,0.538,"neutrophil chemotaxis"),
c("GO:0016045","detection of bacterium",0.050,1.5465,0.926,0.549,"neutrophil chemotaxis"),
c("GO:0014070","response to organic cyclic compound",2.318,4.1871,0.882,0.562,"neutrophil chemotaxis"),
c("GO:0033700","phospholipid efflux",0.017,2.1759,0.867,0.583,"neutrophil chemotaxis"),
c("GO:0042330","taxis",1.276,3.8539,0.882,0.597,"neutrophil chemotaxis"),
c("GO:0097305","response to alcohol",0.774,3.4318,0.892,0.608,"neutrophil chemotaxis"),
c("GO:1901700","response to oxygen-containing compound",3.064,2.1945,0.885,0.616,"neutrophil chemotaxis"),
c("GO:0006812","cation transport",6.257,2.0560,0.821,0.656,"neutrophil chemotaxis"),
c("GO:0009743","response to carbohydrate",0.496,1.6124,0.896,0.665,"neutrophil chemotaxis"),
c("GO:0031667","response to nutrient levels",1.049,3.3468,0.906,0.666,"neutrophil chemotaxis"),
c("GO:0009991","response to extracellular stimulus",1.114,2.9830,0.910,0.671,"neutrophil chemotaxis"),
c("GO:0032368","regulation of lipid transport",0.166,2.2557,0.802,0.674,"neutrophil chemotaxis"),
c("GO:0002523","leukocyte migration involved in inflammatory response",0.016,3.4202,0.800,0.680,"neutrophil chemotaxis"),
c("GO:0032101","regulation of response to external stimulus",1.256,3.8239,0.864,0.680,"neutrophil chemotaxis"),
c("GO:0050900","leukocyte migration",0.509,3.4437,0.811,0.685,"neutrophil chemotaxis"),
c("GO:0032369","negative regulation of lipid transport",0.041,1.8781,0.806,0.688,"neutrophil chemotaxis"),
c("GO:0033993","response to lipid",2.113,4.0315,0.883,0.688,"neutrophil chemotaxis"),
c("GO:1901615","organic hydroxy compound metabolic process",1.118,1.8652,0.950,0.085,"organic hydroxy compound metabolism"),
c("GO:0007631","feeding behavior",0.230,1.7913,0.951,0.086,"feeding behavior"),
c("GO:0001967","suckling behavior",0.044,1.6615,0.951,0.598,"feeding behavior"),
c("GO:0051239","regulation of multicellular organismal process",5.506,2.2612,0.941,0.097,"regulation of multicellular organismal process"));

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
