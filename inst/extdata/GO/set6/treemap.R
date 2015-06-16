

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
revigo.data <- rbind(c("GO:0006414","translational elongation",0.313,5.8239,0.830,0.000,"translational elongation"),
c("GO:0000184","nuclear-transcribed mRNA catabolic process, nonsense-mediated decay",0.142,4.3872,0.818,0.164,"translational elongation"),
c("GO:0000720","pyrimidine dimer repair by nucleotide-excision repair",0.008,1.7471,0.837,0.199,"translational elongation"),
c("GO:0045935","positive regulation of nucleobase-containing compound metabolic process",3.128,2.7399,0.666,0.214,"translational elongation"),
c("GO:0006695","cholesterol biosynthetic process",0.119,4.1739,0.795,0.219,"translational elongation"),
c("GO:0042982","amyloid precursor protein metabolic process",0.072,2.2933,0.914,0.226,"translational elongation"),
c("GO:0051726","regulation of cell cycle",1.952,1.6840,0.843,0.238,"translational elongation"),
c("GO:0006499","N-terminal protein myristoylation",0.023,1.6234,0.859,0.251,"translational elongation"),
c("GO:0042127","regulation of cell proliferation",3.148,2.4989,0.837,0.254,"translational elongation"),
c("GO:0019080","viral gene expression",0.186,5.7447,0.832,0.263,"translational elongation"),
c("GO:0045408","regulation of interleukin-6 biosynthetic process",0.054,1.3843,0.734,0.283,"translational elongation"),
c("GO:0048522","positive regulation of cellular process",8.548,1.4286,0.828,0.300,"translational elongation"),
c("GO:0016071","mRNA metabolic process",1.098,1.5223,0.819,0.323,"translational elongation"),
c("GO:0030574","collagen catabolic process",0.104,1.5268,0.812,0.349,"translational elongation"),
c("GO:1901165","positive regulation of trophoblast cell migration",0.002,1.9219,0.740,0.351,"translational elongation"),
c("GO:0043615","astrocyte cell migration",0.009,1.6234,0.828,0.365,"translational elongation"),
c("GO:0006412","translation",1.984,3.1871,0.800,0.367,"translational elongation"),
c("GO:0043950","positive regulation of cAMP-mediated signaling",0.021,1.5278,0.827,0.376,"translational elongation"),
c("GO:0007266","Rho protein signal transduction",0.738,1.3585,0.827,0.376,"translational elongation"),
c("GO:0010818","T cell chemotaxis",0.018,1.3275,0.830,0.408,"translational elongation"),
c("GO:0042986","positive regulation of amyloid precursor protein biosynthetic process",0.003,1.9219,0.782,0.411,"translational elongation"),
c("GO:0045600","positive regulation of fat cell differentiation",0.084,2.1209,0.789,0.427,"translational elongation"),
c("GO:0031327","negative regulation of cellular biosynthetic process",2.588,1.7891,0.685,0.438,"translational elongation"),
c("GO:0009893","positive regulation of metabolic process",5.415,3.3010,0.794,0.446,"translational elongation"),
c("GO:0060632","regulation of microtubule-based movement",0.022,1.4499,0.835,0.449,"translational elongation"),
c("GO:0006290","pyrimidine dimer repair",0.023,1.3843,0.826,0.472,"translational elongation"),
c("GO:1901362","organic cyclic compound biosynthetic process",13.849,3.5528,0.779,0.477,"translational elongation"),
c("GO:0044033","multi-organism metabolic process",0.213,5.6576,0.903,0.479,"translational elongation"),
c("GO:2000543","positive regulation of gastrulation",0.014,1.6234,0.852,0.481,"translational elongation"),
c("GO:0045899","positive regulation of RNA polymerase II transcriptional preinitiation complex assembly",0.007,1.9219,0.708,0.509,"translational elongation"),
c("GO:0044764","multi-organism cellular process",0.977,4.1308,0.896,0.553,"translational elongation"),
c("GO:0043065","positive regulation of apoptotic process",0.945,1.5351,0.790,0.554,"translational elongation"),
c("GO:0010991","negative regulation of SMAD protein complex assembly",0.013,1.9219,0.777,0.557,"translational elongation"),
c("GO:0007292","female gamete generation",0.246,1.4587,0.863,0.560,"translational elongation"),
c("GO:0008202","steroid metabolic process",0.613,1.6849,0.851,0.566,"translational elongation"),
c("GO:1902590","multi-organism organelle organization",0.007,1.9219,0.876,0.577,"translational elongation"),
c("GO:0032927","positive regulation of activin receptor signaling pathway",0.008,1.5278,0.830,0.579,"translational elongation"),
c("GO:0045721","negative regulation of gluconeogenesis",0.023,1.4499,0.764,0.589,"translational elongation"),
c("GO:0030888","regulation of B cell proliferation",0.108,2.0830,0.859,0.597,"translational elongation"),
c("GO:0006139","nucleobase-containing compound metabolic process",24.258,2.8239,0.777,0.602,"translational elongation"),
c("GO:0042415","norepinephrine metabolic process",0.033,1.6234,0.863,0.602,"translational elongation"),
c("GO:0032863","activation of Rac GTPase activity",0.018,1.3275,0.736,0.606,"translational elongation"),
c("GO:0045639","positive regulation of myeloid cell differentiation",0.142,1.4751,0.751,0.614,"translational elongation"),
c("GO:0008299","isoprenoid biosynthetic process",0.083,2.2933,0.813,0.614,"translational elongation"),
c("GO:0006415","translational termination",0.130,5.0555,0.762,0.619,"translational elongation"),
c("GO:0070897","DNA-templated transcriptional preinitiation complex assembly",0.016,1.3843,0.789,0.625,"translational elongation"),
c("GO:0090304","nucleic acid metabolic process",15.268,1.8576,0.774,0.636,"translational elongation"),
c("GO:0010872","regulation of cholesterol esterification",0.011,1.6234,0.788,0.640,"translational elongation"),
c("GO:0061450","trophoblast cell migration",0.006,1.6234,0.804,0.641,"translational elongation"),
c("GO:0019219","regulation of nucleobase-containing compound metabolic process",12.840,1.6525,0.670,0.642,"translational elongation"),
c("GO:0006401","RNA catabolic process",0.316,3.0362,0.810,0.643,"translational elongation"),
c("GO:0034433","steroid esterification",0.015,1.5278,0.848,0.651,"translational elongation"),
c("GO:0032774","RNA biosynthetic process",10.939,2.7959,0.715,0.652,"translational elongation"),
c("GO:0044419","interspecies interaction between organisms",1.105,3.9208,0.934,0.652,"translational elongation"),
c("GO:0030816","positive regulation of cAMP metabolic process",0.130,1.8318,0.698,0.657,"translational elongation"),
c("GO:0034655","nucleobase-containing compound catabolic process",4.390,1.9041,0.789,0.665,"translational elongation"),
c("GO:0009889","regulation of biosynthetic process",11.561,1.6041,0.735,0.675,"translational elongation"),
c("GO:0019438","aromatic compound biosynthetic process",13.512,2.5622,0.758,0.676,"translational elongation"),
c("GO:0045981","positive regulation of nucleotide metabolic process",0.171,1.6221,0.712,0.676,"translational elongation"),
c("GO:0006413","translational initiation",0.465,4.8239,0.823,0.690,"translational elongation"),
c("GO:0018130","heterocycle biosynthetic process",13.553,2.5482,0.759,0.691,"translational elongation"),
c("GO:0046755","viral budding",0.007,1.9219,0.815,0.692,"translational elongation"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",13.670,2.4377,0.754,0.693,"translational elongation"),
c("GO:0034641","cellular nitrogen compound metabolic process",25.263,2.2668,0.812,0.697,"translational elongation"),
c("GO:0072089","stem cell proliferation",0.477,1.8579,0.966,0.697,"translational elongation"),
c("GO:0006614","SRP-dependent cotranslational protein targeting to membrane",0.150,4.6778,0.800,0.000,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:1901998","toxin transport",0.016,1.6234,0.936,0.199,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0001560","regulation of cell growth by extracellular stimulus",0.005,1.9219,0.833,0.222,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:1902578","single-organism localization",14.013,3.2924,0.874,0.319,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0061045","negative regulation of wound healing",0.018,1.3843,0.898,0.319,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0022411","cellular component disassembly",0.713,3.1938,0.867,0.320,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0016080","synaptic vesicle targeting",0.009,1.6234,0.821,0.349,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0033700","phospholipid efflux",0.017,1.6234,0.893,0.357,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0071896","protein localization to adherens junction",0.008,1.7471,0.917,0.363,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0050765","negative regulation of phagocytosis",0.025,1.4499,0.768,0.376,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0034436","glycoprotein transport",0.003,1.7471,0.906,0.382,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:1902414","protein localization to cell junction",0.018,1.7471,0.913,0.383,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0032472","Golgi calcium ion transport",0.002,1.9219,0.909,0.418,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0050860","negative regulation of T cell receptor signaling pathway",0.036,1.3275,0.819,0.435,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0071822","protein complex subunit organization",3.467,2.9957,0.900,0.441,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0034374","low-density lipoprotein particle remodeling",0.019,1.4499,0.841,0.468,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0061024","membrane organization",1.629,2.6737,0.920,0.490,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:1902580","single-organism cellular localization",1.731,3.2924,0.865,0.495,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0044803","multi-organism membrane organization",0.007,1.5278,0.894,0.503,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0010887","negative regulation of cholesterol storage",0.016,1.6234,0.812,0.549,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0001778","plasma membrane repair",0.016,1.6234,0.900,0.554,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0033036","macromolecule localization",5.646,1.7983,0.901,0.558,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0071702","organic substance transport",5.810,1.5701,0.894,0.561,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0051641","cellular localization",6.184,1.8303,0.900,0.568,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0043933","macromolecular complex subunit organization",5.276,3.4089,0.911,0.581,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0043691","reverse cholesterol transport",0.032,1.3843,0.886,0.584,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0045184","establishment of protein localization",3.785,2.0128,0.863,0.592,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0030308","negative regulation of cell growth",0.265,1.5810,0.781,0.630,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0043254","regulation of protein complex assembly",0.549,1.7688,0.855,0.651,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:1902582","single-organism intracellular transport",2.514,2.7352,0.852,0.675,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0070972","protein localization to endoplasmic reticulum",0.196,4.3468,0.877,0.677,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0007015","actin filament organization",0.768,1.5693,0.847,0.677,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0044765","single-organism transport",13.545,1.9488,0.861,0.681,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0032844","regulation of homeostatic process",0.737,3.0969,0.888,0.000,"regulation of homeostatic process"),
c("GO:0048518","positive regulation of biological process",28.712,1.7673,0.915,0.114,"regulation of homeostatic process"),
c("GO:0019222","regulation of metabolic process",17.756,1.5574,0.883,0.236,"regulation of homeostatic process"),
c("GO:0035751","regulation of lysosomal lumen pH",0.006,1.6234,0.847,0.452,"regulation of homeostatic process"),
c("GO:0051901","positive regulation of mitochondrial depolarization",0.015,1.6234,0.849,0.484,"regulation of homeostatic process"),
c("GO:0042592","homeostatic process",3.235,1.8292,0.890,0.580,"regulation of homeostatic process"),
c("GO:0042632","cholesterol homeostasis",0.149,1.6857,0.895,0.582,"regulation of homeostatic process"),
c("GO:0055088","lipid homeostasis",0.211,1.3256,0.897,0.601,"regulation of homeostatic process"),
c("GO:0032846","positive regulation of homeostatic process",0.154,1.5635,0.874,0.637,"regulation of homeostatic process"),
c("GO:0051179","localization",18.927,1.5870,0.995,0.000,"localization"),
c("GO:0051704","multi-organism process",4.431,3.1612,0.994,0.000,"multi-organism process"),
c("GO:0071840","cellular component organization or biogenesis",12.603,2.0701,0.995,0.000,"cellular component organization or biogenesis"),
c("GO:0048539","bone marrow development",0.008,3.6778,0.900,0.012,"bone marrow development"),
c("GO:0008015","blood circulation",1.109,1.9893,0.897,0.230,"bone marrow development"),
c("GO:0045445","myoblast differentiation",0.113,1.6639,0.874,0.236,"bone marrow development"),
c("GO:0090399","replicative senescence",0.030,1.3275,0.894,0.238,"bone marrow development"),
c("GO:0040034","regulation of development, heterochronic",0.034,1.5278,0.897,0.240,"bone marrow development"),
c("GO:0048561","establishment of organ orientation",0.002,2.2218,0.902,0.240,"bone marrow development"),
c("GO:0060033","anatomical structure regression",0.032,1.3843,0.919,0.282,"bone marrow development"),
c("GO:0046849","bone remodeling",0.199,1.4751,0.917,0.300,"bone marrow development"),
c("GO:0048771","tissue remodeling",0.384,1.8038,0.913,0.319,"bone marrow development"),
c("GO:0010745","negative regulation of macrophage derived foam cell differentiation",0.019,1.3275,0.815,0.360,"bone marrow development"),
c("GO:0061180","mammary gland epithelium development",0.350,2.3215,0.875,0.402,"bone marrow development"),
c("GO:0007506","gonadal mesoderm development",0.009,2.2218,0.892,0.406,"bone marrow development"),
c("GO:0061304","retinal blood vessel morphogenesis",0.011,1.7471,0.891,0.412,"bone marrow development"),
c("GO:0009790","embryo development",2.628,1.7484,0.876,0.418,"bone marrow development"),
c("GO:0048732","gland development",1.335,1.4849,0.874,0.488,"bone marrow development"),
c("GO:0060346","bone trabecula formation",0.025,1.3275,0.894,0.492,"bone marrow development"),
c("GO:0009798","axis specification",0.219,1.3672,0.893,0.526,"bone marrow development"),
c("GO:0048597","post-embryonic camera-type eye morphogenesis",0.010,1.6234,0.885,0.529,"bone marrow development"),
c("GO:0001546","preantral ovarian follicle growth",0.003,2.2218,0.836,0.530,"bone marrow development"),
c("GO:0001880","Mullerian duct regression",0.011,1.6234,0.894,0.533,"bone marrow development"),
c("GO:0048643","positive regulation of skeletal muscle tissue development",0.028,1.6234,0.840,0.558,"bone marrow development"),
c("GO:0048560","establishment of anatomical structure orientation",0.003,1.9219,0.907,0.583,"bone marrow development"),
c("GO:0048625","myoblast fate commitment",0.016,1.6234,0.889,0.592,"bone marrow development"),
c("GO:0044332","Wnt signaling pathway involved in dorsal/ventral axis specification",0.007,1.5278,0.814,0.615,"bone marrow development"),
c("GO:0048513","organ development",7.380,1.4333,0.861,0.622,"bone marrow development"),
c("GO:0045908","negative regulation of vasodilation",0.008,1.9219,0.834,0.638,"bone marrow development"),
c("GO:0002035","brain renin-angiotensin system",0.015,1.9219,0.864,0.668,"bone marrow development"),
c("GO:0003013","circulatory system process",1.113,1.9813,0.901,0.673,"bone marrow development"),
c("GO:0008283","cell proliferation",4.075,2.8386,0.976,0.019,"cell proliferation"),
c("GO:0010659","cardiac muscle cell apoptotic process",0.072,2.5768,0.901,0.032,"cardiac muscle cell apoptotic process"),
c("GO:0010657","muscle cell apoptotic process",0.129,1.9473,0.907,0.639,"cardiac muscle cell apoptotic process"),
c("GO:0071322","cellular response to carbohydrate stimulus",0.246,2.3872,0.867,0.035,"cellular response to carbohydrate stimulus"),
c("GO:2000474","regulation of opioid receptor signaling pathway",0.006,2.2218,0.872,0.170,"cellular response to carbohydrate stimulus"),
c("GO:0009720","detection of hormone stimulus",0.001,2.2218,0.944,0.302,"cellular response to carbohydrate stimulus"),
c("GO:0055099","response to high density lipoprotein particle",0.003,1.9219,0.942,0.322,"cellular response to carbohydrate stimulus"),
c("GO:0038003","opioid receptor signaling pathway",0.036,1.6234,0.861,0.370,"cellular response to carbohydrate stimulus"),
c("GO:0055094","response to lipoprotein particle",0.036,1.3275,0.933,0.377,"cellular response to carbohydrate stimulus"),
c("GO:0043619","regulation of transcription from RNA polymerase II promoter in response to oxidative stress",0.025,1.5278,0.732,0.385,"cellular response to carbohydrate stimulus"),
c("GO:0071315","cellular response to morphine",0.011,2.2218,0.893,0.390,"cellular response to carbohydrate stimulus"),
c("GO:0009726","detection of endogenous stimulus",0.008,1.9219,0.968,0.419,"cellular response to carbohydrate stimulus"),
c("GO:1901700","response to oxygen-containing compound",3.064,1.3725,0.920,0.470,"cellular response to carbohydrate stimulus"),
c("GO:0071230","cellular response to amino acid stimulus",0.134,1.6639,0.871,0.617,"cellular response to carbohydrate stimulus"),
c("GO:1901701","cellular response to oxygen-containing compound",1.893,1.9059,0.856,0.677,"cellular response to carbohydrate stimulus"),
c("GO:0045471","response to ethanol",0.329,1.3123,0.920,0.698,"cellular response to carbohydrate stimulus"),
c("GO:0051343","positive regulation of cyclic-nucleotide phosphodiesterase activity",0.005,1.6234,0.889,0.047,"positive regulation of cyclic-nucleotide phosphodiesterase activity"),
c("GO:0010694","positive regulation of alkaline phosphatase activity",0.025,1.6234,0.813,0.404,"positive regulation of cyclic-nucleotide phosphodiesterase activity"),
c("GO:0051342","regulation of cyclic-nucleotide phosphodiesterase activity",0.023,1.3843,0.877,0.405,"positive regulation of cyclic-nucleotide phosphodiesterase activity"),
c("GO:0035970","peptidyl-threonine dephosphorylation",0.016,1.3275,0.876,0.500,"positive regulation of cyclic-nucleotide phosphodiesterase activity"),
c("GO:0035308","negative regulation of protein dephosphorylation",0.007,1.6234,0.783,0.688,"positive regulation of cyclic-nucleotide phosphodiesterase activity"),
c("GO:0030010","establishment of cell polarity",0.232,2.2588,0.916,0.065,"establishment of cell polarity"),
c("GO:0051302","regulation of cell division",0.595,1.9574,0.858,0.077,"regulation of cell division"),
c("GO:0045835","negative regulation of meiosis",0.032,1.6234,0.790,0.607,"regulation of cell division"),
c("GO:0007163","establishment or maintenance of cell polarity",0.358,1.7038,0.930,0.081,"establishment or maintenance of cell polarity"),
c("GO:0042221","response to chemical",8.684,2.2020,0.973,0.094,"response to chemical"),
c("GO:1901615","organic hydroxy compound metabolic process",1.118,1.4856,0.923,0.095,"organic hydroxy compound metabolism"),
c("GO:1901360","organic cyclic compound metabolic process",25.430,3.0655,0.883,0.165,"organic hydroxy compound metabolism"),
c("GO:0009058","biosynthetic process",19.017,3.0605,0.924,0.180,"organic hydroxy compound metabolism"),
c("GO:0006725","cellular aromatic compound metabolic process",24.907,2.6038,0.854,0.198,"organic hydroxy compound metabolism"),
c("GO:0006807","nitrogen compound metabolic process",26.566,1.7881,0.919,0.202,"organic hydroxy compound metabolism"),
c("GO:0010467","gene expression",15.379,1.5082,0.861,0.299,"organic hydroxy compound metabolism"),
c("GO:0046483","heterocycle metabolic process",24.799,2.5918,0.854,0.359,"organic hydroxy compound metabolism"));

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
