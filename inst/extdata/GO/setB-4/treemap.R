

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
revigo.data <- rbind(c("GO:0023052","signaling",17.329,1.6284,0.995,0.000,"signaling"),
c("GO:0032501","multicellular organismal process",15.657,4.8239,0.995,0.000,"multicellular organismal process"),
c("GO:0040011","locomotion",3.285,3.7447,0.995,0.000,"locomotion"),
c("GO:0044699","single-organism process",71.655,1.8251,0.998,0.000,"single-organism process"),
c("GO:0050896","response to stimulus",47.248,2.8894,0.997,0.000,"response to stimulus"),
c("GO:2001235","positive regulation of apoptotic signaling pathway",0.316,4.9586,0.725,0.000,"positive regulation of apoptotic signaling pathway"),
c("GO:0045927","positive regulation of growth",0.359,1.6556,0.903,0.156,"positive regulation of apoptotic signaling pathway"),
c("GO:0031959","mineralocorticoid receptor signaling pathway",0.003,1.9776,0.862,0.191,"positive regulation of apoptotic signaling pathway"),
c("GO:0007189","adenylate cyclase-activating G-protein coupled receptor signaling pathway",0.120,3.8239,0.808,0.246,"positive regulation of apoptotic signaling pathway"),
c("GO:0048584","positive regulation of response to stimulus",22.389,1.9983,0.830,0.269,"positive regulation of apoptotic signaling pathway"),
c("GO:0035860","glial cell-derived neurotrophic factor receptor signaling pathway",0.018,1.9776,0.841,0.287,"positive regulation of apoptotic signaling pathway"),
c("GO:0023014","signal transduction by phosphorylation",1.554,1.6625,0.757,0.310,"positive regulation of apoptotic signaling pathway"),
c("GO:0030264","nuclear fragmentation involved in apoptotic nuclear change",0.001,1.9776,0.897,0.359,"positive regulation of apoptotic signaling pathway"),
c("GO:0042102","positive regulation of T cell proliferation",0.161,2.9547,0.723,0.369,"positive regulation of apoptotic signaling pathway"),
c("GO:0045162","clustering of voltage-gated sodium channels",0.010,1.6788,0.849,0.411,"positive regulation of apoptotic signaling pathway"),
c("GO:2000672","negative regulation of motor neuron apoptotic process",0.005,2.2774,0.849,0.425,"positive regulation of apoptotic signaling pathway"),
c("GO:0007186","G-protein coupled receptor signaling pathway",3.393,1.6895,0.766,0.435,"positive regulation of apoptotic signaling pathway"),
c("GO:0070372","regulation of ERK1 and ERK2 cascade",0.352,2.9747,0.716,0.467,"positive regulation of apoptotic signaling pathway"),
c("GO:0010642","negative regulation of platelet-derived growth factor receptor signaling pathway",0.019,1.5830,0.809,0.474,"positive regulation of apoptotic signaling pathway"),
c("GO:0007212","dopamine receptor signaling pathway",0.100,2.4023,0.818,0.479,"positive regulation of apoptotic signaling pathway"),
c("GO:0014066","regulation of phosphatidylinositol 3-kinase signaling",0.129,1.6490,0.800,0.516,"positive regulation of apoptotic signaling pathway"),
c("GO:0045745","positive regulation of G-protein coupled receptor protein signaling pathway",0.025,2.8356,0.782,0.521,"positive regulation of apoptotic signaling pathway"),
c("GO:0007187","G-protein coupled receptor signaling pathway, coupled to cyclic nucleotide second messenger",0.311,2.3565,0.802,0.523,"positive regulation of apoptotic signaling pathway"),
c("GO:0070661","leukocyte proliferation",0.556,1.6655,0.931,0.528,"positive regulation of apoptotic signaling pathway"),
c("GO:0097049","motor neuron apoptotic process",0.011,1.8027,0.906,0.536,"positive regulation of apoptotic signaling pathway"),
c("GO:0023056","positive regulation of signaling",2.489,2.4306,0.820,0.545,"positive regulation of apoptotic signaling pathway"),
c("GO:0010647","positive regulation of cell communication",2.500,2.4225,0.742,0.545,"positive regulation of apoptotic signaling pathway"),
c("GO:0043366","beta selection",0.003,2.2774,0.824,0.551,"positive regulation of apoptotic signaling pathway"),
c("GO:0044700","single organism signaling",17.329,1.6284,0.887,0.564,"positive regulation of apoptotic signaling pathway"),
c("GO:0002275","myeloid cell activation involved in immune response",0.154,1.9944,0.834,0.632,"positive regulation of apoptotic signaling pathway"),
c("GO:0071763","nuclear membrane organization",0.006,1.6788,0.935,0.671,"positive regulation of apoptotic signaling pathway"),
c("GO:0002277","myeloid dendritic cell activation involved in immune response",0.005,1.9776,0.864,0.685,"positive regulation of apoptotic signaling pathway"),
c("GO:0070488","neutrophil aggregation",0.002,4.5686,0.965,0.011,"neutrophil aggregation"),
c("GO:0007159","leukocyte cell-cell adhesion",0.106,3.4318,0.959,0.566,"neutrophil aggregation"),
c("GO:0070486","leukocyte aggregation",0.011,3.2518,0.963,0.692,"neutrophil aggregation"),
c("GO:0032602","chemokine production",0.131,2.9547,0.880,0.015,"chemokine production"),
c("GO:0003008","system process",4.235,2.8182,0.877,0.328,"chemokine production"),
c("GO:0003014","renal system process",0.197,2.9245,0.887,0.342,"chemokine production"),
c("GO:0035637","multicellular organismal signaling",0.539,1.6655,0.850,0.383,"chemokine production"),
c("GO:0014846","esophagus smooth muscle contraction",0.011,2.2774,0.897,0.396,"chemokine production"),
c("GO:0070293","renal absorption",0.028,3.1249,0.892,0.421,"chemokine production"),
c("GO:0001816","cytokine production",1.263,2.1512,0.890,0.426,"chemokine production"),
c("GO:0051960","regulation of nervous system development",1.545,2.5969,0.802,0.438,"chemokine production"),
c("GO:0007588","excretion",0.129,1.9385,0.890,0.470,"chemokine production"),
c("GO:0045401","positive regulation of interleukin-3 biosynthetic process",0.003,2.2774,0.736,0.510,"chemokine production"),
c("GO:0019228","neuronal action potential",0.391,2.0675,0.735,0.514,"chemokine production"),
c("GO:0032632","interleukin-3 production",0.006,2.2774,0.900,0.526,"chemokine production"),
c("GO:0032688","negative regulation of interferon-beta production",0.011,1.6788,0.838,0.549,"chemokine production"),
c("GO:0032604","granulocyte macrophage colony-stimulating factor production",0.013,1.6788,0.896,0.553,"chemokine production"),
c("GO:0044707","single-multicellular organism process",15.092,4.6021,0.864,0.619,"chemokine production"),
c("GO:0044057","regulation of system process",1.035,2.4634,0.807,0.627,"chemokine production"),
c("GO:0097291","renal phosphate ion absorption",0.001,2.2774,0.908,0.636,"chemokine production"),
c("GO:0003012","muscle system process",0.830,1.7459,0.874,0.647,"chemokine production"),
c("GO:0045425","positive regulation of granulocyte macrophage colony-stimulating factor biosynthetic process",0.005,2.2774,0.733,0.649,"chemokine production"),
c("GO:0050715","positive regulation of cytokine secretion",0.137,1.8614,0.614,0.652,"chemokine production"),
c("GO:0006936","muscle contraction",0.724,1.9772,0.868,0.678,"chemokine production"),
c("GO:0003096","renal sodium ion transport",0.006,1.8027,0.803,0.693,"chemokine production"),
c("GO:0014831","gastro-intestinal system smooth muscle contraction",0.016,1.8027,0.895,0.695,"chemokine production"),
c("GO:0071895","odontoblast differentiation",0.005,1.8027,0.914,0.055,"odontoblast differentiation"),
c("GO:0008544","epidermis development",0.590,1.6386,0.881,0.468,"odontoblast differentiation"),
c("GO:0009620","response to fungus",0.062,4.0506,0.919,0.060,"response to fungus"),
c("GO:0032101","regulation of response to external stimulus",1.256,3.5376,0.846,0.505,"response to fungus"),
c("GO:0032102","negative regulation of response to external stimulus",0.435,1.7828,0.831,0.606,"response to fungus"),
c("GO:0042742","defense response to bacterium",0.394,3.5686,0.877,0.636,"response to fungus"),
c("GO:0016242","negative regulation of macroautophagy",0.040,1.5830,0.714,0.652,"response to fungus"),
c("GO:0006954","inflammatory response",1.375,2.3242,0.909,0.686,"response to fungus"),
c("GO:0052548","regulation of endopeptidase activity",0.736,4.0506,0.814,0.066,"regulation of endopeptidase activity"),
c("GO:1901615","organic hydroxy compound metabolic process",1.118,1.7007,0.958,0.103,"regulation of endopeptidase activity"),
c("GO:0042790","transcription of nuclear large rRNA transcript from RNA polymerase I promoter",0.011,1.6788,0.915,0.121,"regulation of endopeptidase activity"),
c("GO:0060267","positive regulation of respiratory burst",0.009,1.8027,0.861,0.200,"regulation of endopeptidase activity"),
c("GO:0031638","zymogen activation",0.198,1.9682,0.940,0.264,"regulation of endopeptidase activity"),
c("GO:0045762","positive regulation of adenylate cyclase activity",0.065,2.4522,0.686,0.455,"regulation of endopeptidase activity"),
c("GO:0031279","regulation of cyclase activity",0.121,2.0867,0.865,0.480,"regulation of endopeptidase activity"),
c("GO:0051339","regulation of lyase activity",0.126,2.0550,0.865,0.482,"regulation of endopeptidase activity"),
c("GO:0051091","positive regulation of sequence-specific DNA binding transcription factor activity",0.342,2.0521,0.784,0.492,"regulation of endopeptidase activity"),
c("GO:0045981","positive regulation of nucleotide metabolic process",0.171,1.7270,0.734,0.570,"regulation of endopeptidase activity"),
c("GO:0030808","regulation of nucleotide biosynthetic process",0.203,1.5953,0.755,0.601,"regulation of endopeptidase activity"),
c("GO:0034310","primary alcohol catabolic process",0.016,3.3979,0.879,0.071,"primary alcohol catabolism"),
c("GO:0006714","sesquiterpenoid metabolic process",0.003,1.8027,0.881,0.103,"primary alcohol catabolism"),
c("GO:1901568","fatty acid derivative metabolic process",0.179,2.5467,0.922,0.130,"primary alcohol catabolism"),
c("GO:0006081","cellular aldehyde metabolic process",0.106,2.0241,0.893,0.148,"primary alcohol catabolism"),
c("GO:0046456","icosanoid biosynthetic process",0.098,3.2518,0.824,0.221,"primary alcohol catabolism"),
c("GO:0006914","autophagy",0.414,1.6262,0.925,0.330,"primary alcohol catabolism"),
c("GO:0010872","regulation of cholesterol esterification",0.011,1.6788,0.813,0.386,"primary alcohol catabolism"),
c("GO:0008610","lipid biosynthetic process",1.351,1.6718,0.835,0.516,"primary alcohol catabolism"),
c("GO:0034433","steroid esterification",0.015,1.5830,0.873,0.597,"primary alcohol catabolism"),
c("GO:0034308","primary alcohol metabolic process",0.080,2.7595,0.879,0.614,"primary alcohol catabolism"),
c("GO:0060732","positive regulation of inositol phosphate biosynthetic process",0.018,1.6788,0.731,0.619,"primary alcohol catabolism"),
c("GO:0016115","terpenoid catabolic process",0.007,1.8027,0.867,0.646,"primary alcohol catabolism"),
c("GO:0008300","isoprenoid catabolic process",0.011,1.5830,0.867,0.648,"primary alcohol catabolism"),
c("GO:0044283","small molecule biosynthetic process",1.120,1.5877,0.855,0.659,"primary alcohol catabolism"),
c("GO:0006636","unsaturated fatty acid biosynthetic process",0.108,2.9872,0.809,0.696,"primary alcohol catabolism"),
c("GO:0050900","leukocyte migration",0.509,4.4437,0.789,0.078,"leukocyte migration"),
c("GO:0006928","cellular component movement",3.830,3.1549,0.903,0.101,"leukocyte migration"),
c("GO:0044763","single-organism cellular process",45.302,1.7886,0.927,0.103,"leukocyte migration"),
c("GO:0002586","regulation of antigen processing and presentation of peptide antigen via MHC class II",0.005,2.2774,0.903,0.113,"leukocyte migration"),
c("GO:0002577","regulation of antigen processing and presentation",0.047,1.6788,0.916,0.137,"leukocyte migration"),
c("GO:0007154","cell communication",17.535,1.8533,0.887,0.173,"leukocyte migration"),
c("GO:1901998","toxin transport",0.016,1.6788,0.908,0.192,"leukocyte migration"),
c("GO:0050764","regulation of phagocytosis",0.145,3.3872,0.723,0.228,"leukocyte migration"),
c("GO:0051238","sequestering of metal ion",0.226,3.6778,0.797,0.237,"leukocyte migration"),
c("GO:0007021","tubulin complex assembly",0.017,1.8027,0.966,0.241,"leukocyte migration"),
c("GO:1901571","fatty acid derivative transport",0.066,2.3116,0.860,0.249,"leukocyte migration"),
c("GO:0046717","acid secretion",0.178,2.8928,0.849,0.269,"leukocyte migration"),
c("GO:0051674","localization of cell",2.570,3.1308,0.876,0.302,"leukocyte migration"),
c("GO:0006814","sodium ion transport",0.536,3.0132,0.828,0.304,"leukocyte migration"),
c("GO:0010876","lipid localization",0.809,1.8395,0.872,0.318,"leukocyte migration"),
c("GO:0030033","microvillus assembly",0.021,1.6788,0.907,0.343,"leukocyte migration"),
c("GO:0015840","urea transport",0.042,2.2774,0.859,0.355,"leukocyte migration"),
c("GO:0019755","one-carbon compound transport",0.049,1.9776,0.863,0.359,"leukocyte migration"),
c("GO:0034436","glycoprotein transport",0.003,1.8027,0.878,0.359,"leukocyte migration"),
c("GO:0055081","anion homeostasis",0.072,2.3556,0.863,0.363,"leukocyte migration"),
c("GO:0051128","regulation of cellular component organization",3.835,2.4881,0.887,0.374,"leukocyte migration"),
c("GO:0046903","secretion",2.293,1.6343,0.838,0.384,"leukocyte migration"),
c("GO:0002175","protein localization to paranode region of axon",0.015,1.6788,0.895,0.398,"leukocyte migration"),
c("GO:0032528","microvillus organization",0.023,1.5830,0.908,0.414,"leukocyte migration"),
c("GO:0072668","tubulin complex biogenesis",0.022,1.6788,0.966,0.416,"leukocyte migration"),
c("GO:0050808","synapse organization",0.424,1.7605,0.893,0.420,"leukocyte migration"),
c("GO:0071205","protein localization to juxtaparanode region of axon",0.032,1.8027,0.890,0.422,"leukocyte migration"),
c("GO:0051235","maintenance of location",0.656,2.5317,0.793,0.435,"leukocyte migration"),
c("GO:0015849","organic acid transport",0.681,2.1524,0.835,0.435,"leukocyte migration"),
c("GO:0032413","negative regulation of ion transmembrane transporter activity",0.051,2.6882,0.714,0.470,"leukocyte migration"),
c("GO:0050807","regulation of synapse organization",0.157,1.8614,0.765,0.483,"leukocyte migration"),
c("GO:0030643","cellular phosphate ion homeostasis",0.007,1.8027,0.844,0.499,"leukocyte migration"),
c("GO:0006820","anion transport",1.726,2.7258,0.824,0.506,"leukocyte migration"),
c("GO:0050482","arachidonic acid secretion",0.031,2.8356,0.822,0.512,"leukocyte migration"),
c("GO:0044351","macropinocytosis",0.011,1.5830,0.898,0.536,"leukocyte migration"),
c("GO:0034635","glutathione transport",0.002,2.2774,0.860,0.537,"leukocyte migration"),
c("GO:0006811","ion transport",7.803,2.0969,0.818,0.546,"leukocyte migration"),
c("GO:0033700","phospholipid efflux",0.017,1.6788,0.845,0.583,"leukocyte migration"),
c("GO:0010766","negative regulation of sodium ion transport",0.013,1.6788,0.798,0.594,"leukocyte migration"),
c("GO:0048878","chemical homeostasis",2.056,1.9863,0.840,0.597,"leukocyte migration"),
c("GO:0030001","metal ion transport",2.230,2.1512,0.816,0.598,"leukocyte migration"),
c("GO:0043269","regulation of ion transport",1.244,2.4828,0.753,0.607,"leukocyte migration"),
c("GO:0030593","neutrophil chemotaxis",0.122,4.7696,0.715,0.609,"leukocyte migration"),
c("GO:0015711","organic anion transport",0.945,2.3788,0.809,0.626,"leukocyte migration"),
c("GO:0050803","regulation of synapse structure and activity",0.164,1.7913,0.818,0.631,"leukocyte migration"),
c("GO:0032846","positive regulation of homeostatic process",0.154,1.6678,0.836,0.641,"leukocyte migration"),
c("GO:0032119","sequestering of zinc ion",0.010,3.3979,0.787,0.654,"leukocyte migration"),
c("GO:0055069","zinc ion homeostasis",0.031,2.6882,0.865,0.658,"leukocyte migration"),
c("GO:0010887","negative regulation of cholesterol storage",0.016,1.6788,0.778,0.673,"leukocyte migration"),
c("GO:0002523","leukocyte migration involved in inflammatory response",0.016,3.5686,0.780,0.680,"leukocyte migration"),
c("GO:0009605","response to external stimulus",4.459,3.7696,0.955,0.089,"response to external stimulus"),
c("GO:0009611","response to wounding",2.056,3.5086,0.915,0.113,"response to external stimulus"),
c("GO:0002544","chronic inflammatory response",0.068,2.7595,0.924,0.411,"response to external stimulus"),
c("GO:0031098","stress-activated protein kinase signaling cascade",0.435,1.8236,0.769,0.493,"response to external stimulus"),
c("GO:0002554","serotonin secretion by platelet",0.008,2.2774,0.729,0.506,"response to external stimulus"),
c("GO:0042060","wound healing",1.314,2.1175,0.913,0.559,"response to external stimulus"),
c("GO:0048681","negative regulation of axon regeneration",0.014,1.8027,0.701,0.575,"response to external stimulus"),
c("GO:0080134","regulation of response to stress",1.961,2.3675,0.852,0.588,"response to external stimulus"),
c("GO:0043415","positive regulation of skeletal muscle tissue regeneration",0.008,1.6788,0.771,0.615,"response to external stimulus"),
c("GO:0080135","regulation of cellular response to stress",0.758,1.7823,0.786,0.628,"response to external stimulus"),
c("GO:0051239","regulation of multicellular organismal process",5.506,2.2933,0.917,0.090,"regulation of multicellular organismal process"),
c("GO:0065009","regulation of molecular function",6.209,1.7147,0.921,0.115,"regulation of multicellular organismal process"),
c("GO:0097305","response to alcohol",0.774,3.7447,0.923,0.099,"response to alcohol"),
c("GO:0009720","detection of hormone stimulus",0.001,2.2774,0.945,0.323,"response to alcohol"),
c("GO:0071389","cellular response to mineralocorticoid stimulus",0.001,2.2774,0.906,0.323,"response to alcohol"),
c("GO:0055099","response to high density lipoprotein particle",0.003,1.9776,0.944,0.346,"response to alcohol"),
c("GO:0010043","response to zinc ion",0.099,2.4522,0.935,0.379,"response to alcohol"),
c("GO:1990267","response to transition metal nanoparticle",0.273,1.6678,0.933,0.415,"response to alcohol"),
c("GO:0009726","detection of endogenous stimulus",0.008,1.9776,0.961,0.419,"response to alcohol"),
c("GO:0010035","response to inorganic substance",1.004,2.0531,0.926,0.472,"response to alcohol"),
c("GO:0033993","response to lipid",2.113,2.9830,0.918,0.602,"response to alcohol"),
c("GO:0032355","response to estradiol",0.289,2.5229,0.923,0.631,"response to alcohol"),
c("GO:0014070","response to organic cyclic compound",2.318,1.6949,0.917,0.688,"response to alcohol"));

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
