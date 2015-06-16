

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
revigo.data <- rbind(c("GO:0002376","immune system process",29.354,2.3706,0.996,0.000,"immune system process"),
c("GO:0023052","signaling",17.329,3.9586,0.995,0.000,"signaling"),
c("GO:0030099","myeloid cell differentiation",0.703,4.9586,0.657,0.000,"myeloid cell differentiation"),
c("GO:0002682","regulation of immune system process",21.361,2.7799,0.834,0.266,"myeloid cell differentiation"),
c("GO:0036342","post-anal tail morphogenesis",0.032,4.6021,0.822,0.294,"myeloid cell differentiation"),
c("GO:0048320","axial mesoderm formation",0.006,2.7670,0.807,0.297,"myeloid cell differentiation"),
c("GO:0030238","male sex determination",0.097,2.8928,0.789,0.326,"myeloid cell differentiation"),
c("GO:0060480","lung goblet cell differentiation",0.017,2.3019,0.746,0.354,"myeloid cell differentiation"),
c("GO:0031017","exocrine pancreas development",0.028,2.0132,0.799,0.368,"myeloid cell differentiation"),
c("GO:0021772","olfactory bulb development",0.082,1.9318,0.777,0.400,"myeloid cell differentiation"),
c("GO:0048469","cell maturation",0.359,2.8297,0.733,0.439,"myeloid cell differentiation"),
c("GO:0055007","cardiac muscle cell differentiation",0.236,4.6778,0.683,0.439,"myeloid cell differentiation"),
c("GO:0045444","fat cell differentiation",0.409,2.1261,0.739,0.444,"myeloid cell differentiation"),
c("GO:0001649","osteoblast differentiation",0.430,1.9674,0.725,0.446,"myeloid cell differentiation"),
c("GO:0060612","adipose tissue development",0.075,1.9318,0.773,0.459,"myeloid cell differentiation"),
c("GO:0045165","cell fate commitment",0.620,2.5850,0.730,0.462,"myeloid cell differentiation"),
c("GO:2000026","regulation of multicellular organismal development",3.472,4.5528,0.641,0.467,"myeloid cell differentiation"),
c("GO:0061061","muscle structure development",1.451,2.3675,0.765,0.468,"myeloid cell differentiation"),
c("GO:0061458","reproductive system development",1.184,2.0079,0.745,0.498,"myeloid cell differentiation"),
c("GO:0001501","skeletal system development",1.209,2.0061,0.745,0.499,"myeloid cell differentiation"),
c("GO:0048732","gland development",1.335,4.0362,0.726,0.521,"myeloid cell differentiation"),
c("GO:0060644","mammary gland epithelial cell differentiation",0.047,1.9311,0.732,0.524,"myeloid cell differentiation"),
c("GO:0002520","immune system development",1.845,4.2147,0.724,0.528,"myeloid cell differentiation"),
c("GO:0060841","venous blood vessel development",0.035,1.9311,0.792,0.529,"myeloid cell differentiation"),
c("GO:0001945","lymph vessel development",0.047,2.3487,0.788,0.540,"myeloid cell differentiation"),
c("GO:0072359","circulatory system development",2.260,2.5735,0.729,0.543,"myeloid cell differentiation"),
c("GO:0050793","regulation of developmental process",4.431,4.6021,0.684,0.547,"myeloid cell differentiation"),
c("GO:0048568","embryonic organ development",1.162,2.6253,0.721,0.550,"myeloid cell differentiation"),
c("GO:0007417","central nervous system development",2.238,2.4828,0.725,0.551,"myeloid cell differentiation"),
c("GO:0009790","embryo development",2.628,2.5686,0.734,0.555,"myeloid cell differentiation"),
c("GO:0060971","embryonic heart tube left/right pattern formation",0.008,2.0132,0.777,0.559,"myeloid cell differentiation"),
c("GO:0009888","tissue development",4.199,2.8210,0.752,0.563,"myeloid cell differentiation"),
c("GO:0021587","cerebellum morphogenesis",0.100,1.8630,0.771,0.565,"myeloid cell differentiation"),
c("GO:0060537","muscle tissue development",0.965,3.6990,0.768,0.568,"myeloid cell differentiation"),
c("GO:0001893","maternal placenta development",0.083,2.8570,0.746,0.570,"myeloid cell differentiation"),
c("GO:0045599","negative regulation of fat cell differentiation",0.089,4.4559,0.638,0.574,"myeloid cell differentiation"),
c("GO:0007498","mesoderm development",0.291,2.6882,0.791,0.580,"myeloid cell differentiation"),
c("GO:0007530","sex determination",0.126,2.9586,0.814,0.588,"myeloid cell differentiation"),
c("GO:0060215","primitive hemopoiesis",0.016,3.1805,0.767,0.588,"myeloid cell differentiation"),
c("GO:0009887","organ morphogenesis",2.260,3.3665,0.708,0.596,"myeloid cell differentiation"),
c("GO:0001818","negative regulation of cytokine production",0.301,2.3363,0.720,0.598,"myeloid cell differentiation"),
c("GO:0048705","skeletal system morphogenesis",0.638,2.2013,0.734,0.598,"myeloid cell differentiation"),
c("GO:0003006","developmental process involved in reproduction",1.709,1.8935,0.773,0.626,"myeloid cell differentiation"),
c("GO:0030851","granulocyte differentiation",0.051,2.6819,0.710,0.643,"myeloid cell differentiation"),
c("GO:0030856","regulation of epithelial cell differentiation",0.278,2.5058,0.622,0.644,"myeloid cell differentiation"),
c("GO:0035162","embryonic hemopoiesis",0.060,3.3098,0.747,0.652,"myeloid cell differentiation"),
c("GO:0030850","prostate gland development",0.195,2.4214,0.752,0.659,"myeloid cell differentiation"),
c("GO:0048513","organ development",7.380,4.6021,0.692,0.662,"myeloid cell differentiation"),
c("GO:0003281","ventricular septum development",0.099,2.0227,0.760,0.667,"myeloid cell differentiation"),
c("GO:0051241","negative regulation of multicellular organismal process",0.833,2.3893,0.694,0.672,"myeloid cell differentiation"),
c("GO:0060742","epithelial cell differentiation involved in prostate gland development",0.038,2.0429,0.725,0.675,"myeloid cell differentiation"),
c("GO:0030858","positive regulation of epithelial cell differentiation",0.129,1.9318,0.610,0.682,"myeloid cell differentiation"),
c("GO:0003166","bundle of His development",0.007,2.3019,0.788,0.692,"myeloid cell differentiation"),
c("GO:0030154","cell differentiation",8.015,3.6021,0.652,0.693,"myeloid cell differentiation"),
c("GO:0044707","single-multicellular organism process",15.092,2.8125,0.787,0.695,"myeloid cell differentiation"),
c("GO:0032501","multicellular organismal process",15.657,2.6234,0.995,0.000,"multicellular organismal process"),
c("GO:0032502","developmental process",13.055,2.4921,0.995,0.000,"developmental process"),
c("GO:0040007","growth",2.160,3.1739,0.994,0.000,"growth"),
c("GO:0043627","response to estrogen",0.539,4.5850,0.912,0.000,"response to estrogen"),
c("GO:0071353","cellular response to interleukin-4",0.075,2.1649,0.866,0.423,"response to estrogen"),
c("GO:0070670","response to interleukin-4",0.091,1.8630,0.927,0.583,"response to estrogen"),
c("GO:0071310","cellular response to organic substance",4.572,2.3439,0.807,0.631,"response to estrogen"),
c("GO:0097305","response to alcohol",0.774,2.1858,0.911,0.660,"response to estrogen"),
c("GO:0048872","homeostasis of number of cells",0.558,5.5528,0.866,0.000,"homeostasis of number of cells"),
c("GO:0046902","regulation of mitochondrial membrane permeability",0.125,3.1487,0.814,0.408,"homeostasis of number of cells"),
c("GO:0050878","regulation of body fluid levels",1.269,1.8668,0.739,0.507,"homeostasis of number of cells"),
c("GO:0032844","regulation of homeostatic process",0.737,2.3747,0.858,0.658,"homeostasis of number of cells"),
c("GO:0048871","multicellular organismal homeostasis",0.562,2.3307,0.749,0.658,"homeostasis of number of cells"),
c("GO:0010823","negative regulation of mitochondrion organization",0.043,2.1649,0.768,0.694,"homeostasis of number of cells"),
c("GO:0050896","response to stimulus",47.248,4.1938,0.997,0.000,"response to stimulus"),
c("GO:0065007","biological regulation",51.216,3.3665,0.997,0.000,"biological regulation"),
c("GO:0090136","epithelial cell-cell adhesion",0.050,3.5086,0.977,0.015,"epithelial cell-cell adhesion"),
c("GO:0006695","cholesterol biosynthetic process",0.119,3.9586,0.873,0.016,"cholesterol biosynthesis"),
c("GO:0043412","macromolecule modification",10.189,1.8642,0.906,0.107,"cholesterol biosynthesis"),
c("GO:0008202","steroid metabolic process",0.613,2.2226,0.895,0.566,"cholesterol biosynthesis"),
c("GO:0019216","regulation of lipid metabolic process",0.558,1.8765,0.791,0.651,"cholesterol biosynthesis"),
c("GO:0008283","cell proliferation",4.075,4.3010,0.968,0.023,"cell proliferation"),
c("GO:0016265","death",4.501,3.8239,0.967,0.030,"death"),
c("GO:0070358","actin polymerization-dependent cell motility",0.008,2.7670,0.927,0.060,"actin polymerization-dependent cell motility"),
c("GO:0032879","regulation of localization",4.330,2.7235,0.888,0.215,"actin polymerization-dependent cell motility"),
c("GO:0043542","endothelial cell migration",0.259,2.2700,0.800,0.463,"actin polymerization-dependent cell motility"),
c("GO:0030334","regulation of cell migration",1.088,1.9539,0.789,0.697,"actin polymerization-dependent cell motility"),
c("GO:0051338","regulation of transferase activity",1.829,5.0757,0.778,0.071,"regulation of transferase activity"),
c("GO:0010735","positive regulation of transcription via serum response element binding",0.006,2.7670,0.779,0.206,"regulation of transferase activity"),
c("GO:0060260","regulation of transcription initiation from RNA polymerase II promoter",0.027,2.1675,0.758,0.354,"regulation of transferase activity"),
c("GO:0042325","regulation of phosphorylation",2.769,5.0362,0.678,0.375,"regulation of transferase activity"),
c("GO:0000389","mRNA 3'-splice site recognition",0.006,2.0132,0.885,0.379,"regulation of transferase activity"),
c("GO:2000113","negative regulation of cellular macromolecule biosynthetic process",2.396,4.5376,0.628,0.426,"regulation of transferase activity"),
c("GO:0046777","protein autophosphorylation",0.414,2.0711,0.850,0.453,"regulation of transferase activity"),
c("GO:0051174","regulation of phosphorus metabolic process",4.788,3.1024,0.691,0.470,"regulation of transferase activity"),
c("GO:0032268","regulation of cellular protein metabolic process",3.398,2.5817,0.679,0.485,"regulation of transferase activity"),
c("GO:0051246","regulation of protein metabolic process",4.423,2.5935,0.758,0.502,"regulation of transferase activity"),
c("GO:0023014","signal transduction by phosphorylation",1.554,2.1062,0.700,0.530,"regulation of transferase activity"),
c("GO:0016310","phosphorylation",10.160,3.6990,0.848,0.541,"regulation of transferase activity"),
c("GO:0010557","positive regulation of macromolecule biosynthetic process",3.143,2.9914,0.711,0.542,"regulation of transferase activity"),
c("GO:0007257","activation of JUN kinase activity",0.058,2.2757,0.646,0.550,"regulation of transferase activity"),
c("GO:0006357","regulation of transcription from RNA polymerase II promoter",3.684,2.5560,0.667,0.576,"regulation of transferase activity"),
c("GO:0031323","regulation of cellular metabolic process",15.735,3.2147,0.653,0.582,"regulation of transferase activity"),
c("GO:0009893","positive regulation of metabolic process",5.415,2.9245,0.762,0.597,"regulation of transferase activity"),
c("GO:0006366","transcription from RNA polymerase II promoter",3.963,2.1343,0.812,0.613,"regulation of transferase activity"),
c("GO:0006468","protein phosphorylation",5.136,3.7696,0.811,0.627,"regulation of transferase activity"),
c("GO:0009892","negative regulation of metabolic process",3.994,3.6021,0.708,0.646,"regulation of transferase activity"),
c("GO:0048585","negative regulation of response to stimulus",2.501,2.6737,0.782,0.650,"regulation of transferase activity"),
c("GO:2000142","regulation of DNA-templated transcription, initiation",0.031,1.9311,0.762,0.673,"regulation of transferase activity"),
c("GO:0071496","cellular response to external stimulus",0.549,2.5361,0.951,0.076,"cellular response to external stimulus"),
c("GO:0009649","entrainment of circadian clock",0.052,2.4711,0.909,0.466,"cellular response to external stimulus"),
c("GO:0031669","cellular response to nutrient levels",0.363,2.5258,0.839,0.549,"cellular response to external stimulus"),
c("GO:0040008","regulation of growth",1.265,3.6990,0.897,0.084,"regulation of growth"),
c("GO:0009719","response to endogenous stimulus",3.718,1.9788,0.956,0.093,"response to endogenous stimulus"),
c("GO:0051716","cellular response to stimulus",19.092,4.8539,0.893,0.160,"response to endogenous stimulus"),
c("GO:0006950","response to stress",8.191,2.7825,0.952,0.190,"response to endogenous stimulus"),
c("GO:0042221","response to chemical",8.684,2.3565,0.951,0.193,"response to endogenous stimulus"),
c("GO:0042127","regulation of cell proliferation",3.148,5.0000,0.764,0.094,"regulation of cell proliferation"),
c("GO:0051128","regulation of cellular component organization",3.835,2.5452,0.861,0.104,"regulation of cell proliferation"),
c("GO:0048519","negative regulation of biological process",8.588,6.4089,0.884,0.123,"regulation of cell proliferation"),
c("GO:0065009","regulation of molecular function",6.209,2.4855,0.895,0.125,"regulation of cell proliferation"),
c("GO:0051239","regulation of multicellular organismal process",5.506,5.1805,0.891,0.131,"regulation of cell proliferation"),
c("GO:0050864","regulation of B cell activation",0.201,3.0269,0.787,0.182,"regulation of cell proliferation"),
c("GO:0048518","positive regulation of biological process",28.712,5.2441,0.859,0.190,"regulation of cell proliferation"),
c("GO:0019222","regulation of metabolic process",17.756,3.2596,0.863,0.236,"regulation of cell proliferation"),
c("GO:0051726","regulation of cell cycle",1.952,2.3161,0.783,0.238,"regulation of cell proliferation"),
c("GO:0007167","enzyme linked receptor protein signaling pathway",2.356,4.0362,0.718,0.244,"regulation of cell proliferation"),
c("GO:0042981","regulation of apoptotic process",3.144,4.8861,0.706,0.254,"regulation of cell proliferation"),
c("GO:0035357","peroxisome proliferator activated receptor signaling pathway",0.025,2.0429,0.815,0.255,"regulation of cell proliferation"),
c("GO:0048583","regulation of response to stimulus",26.518,4.0757,0.836,0.273,"regulation of cell proliferation"),
c("GO:0048522","positive regulation of cellular process",8.548,4.0362,0.757,0.297,"regulation of cell proliferation"),
c("GO:0006984","ER-nucleus signaling pathway",0.141,2.5129,0.788,0.298,"regulation of cell proliferation"),
c("GO:0048015","phosphatidylinositol-mediated signaling",0.367,2.8665,0.751,0.328,"regulation of cell proliferation"),
c("GO:0050789","regulation of biological process",49.744,3.8861,0.854,0.335,"regulation of cell proliferation"),
c("GO:0050794","regulation of cellular process",28.971,4.1612,0.838,0.337,"regulation of cell proliferation"),
c("GO:0030522","intracellular receptor signaling pathway",0.684,1.9473,0.756,0.352,"regulation of cell proliferation"),
c("GO:0033554","cellular response to stress",3.483,3.2518,0.848,0.377,"regulation of cell proliferation"),
c("GO:0010647","positive regulation of cell communication",2.500,3.2218,0.691,0.386,"regulation of cell proliferation"),
c("GO:0023056","positive regulation of signaling",2.489,3.2518,0.792,0.389,"regulation of cell proliferation"),
c("GO:0045216","cell-cell junction organization",0.424,2.2782,0.882,0.420,"regulation of cell proliferation"),
c("GO:0034330","cell junction organization",0.493,1.9212,0.883,0.427,"regulation of cell proliferation"),
c("GO:0048017","inositol lipid-mediated signaling",0.367,2.8665,0.758,0.450,"regulation of cell proliferation"),
c("GO:0030968","endoplasmic reticulum unfolded protein response",0.124,2.3605,0.748,0.457,"regulation of cell proliferation"),
c("GO:0044087","regulation of cellular component biogenesis",1.045,2.5406,0.875,0.463,"regulation of cell proliferation"),
c("GO:0035966","response to topologically incorrect protein",0.209,1.8897,0.918,0.482,"regulation of cell proliferation"),
c("GO:0060154","cellular process regulating host cell cycle in response to virus",0.013,2.3019,0.827,0.491,"regulation of cell proliferation"),
c("GO:0019050","suppression by virus of host apoptotic process",0.005,2.7670,0.734,0.497,"regulation of cell proliferation"),
c("GO:0016055","Wnt signaling pathway",0.887,1.8824,0.746,0.520,"regulation of cell proliferation"),
c("GO:0007165","signal transduction",16.054,5.0044,0.651,0.525,"regulation of cell proliferation"),
c("GO:0043276","anoikis",0.033,2.1649,0.874,0.536,"regulation of cell proliferation"),
c("GO:0043616","keratinocyte proliferation",0.052,3.5686,0.953,0.558,"regulation of cell proliferation"),
c("GO:0007169","transmembrane receptor protein tyrosine kinase signaling pathway",1.599,3.6021,0.723,0.558,"regulation of cell proliferation"),
c("GO:1902589","single-organism organelle organization",5.234,2.0996,0.847,0.589,"regulation of cell proliferation"),
c("GO:0010646","regulation of cell communication",6.570,3.2366,0.720,0.631,"regulation of cell proliferation"),
c("GO:0023051","regulation of signaling",6.570,3.4559,0.812,0.637,"regulation of cell proliferation"),
c("GO:0035556","intracellular signal transduction",6.704,2.2741,0.686,0.640,"regulation of cell proliferation"),
c("GO:2000107","negative regulation of leukocyte apoptotic process",0.107,1.8630,0.736,0.649,"regulation of cell proliferation"),
c("GO:0048008","platelet-derived growth factor receptor signaling pathway",0.111,2.0227,0.782,0.669,"regulation of cell proliferation"),
c("GO:0045218","zonula adherens maintenance",0.003,2.3019,0.915,0.671,"regulation of cell proliferation"),
c("GO:0009968","negative regulation of signal transduction",2.090,2.8069,0.641,0.673,"regulation of cell proliferation"),
c("GO:0023057","negative regulation of signaling",2.197,2.8508,0.731,0.677,"regulation of cell proliferation"),
c("GO:0010648","negative regulation of cell communication",2.203,2.8097,0.666,0.678,"regulation of cell proliferation"),
c("GO:0007166","cell surface receptor signaling pathway",8.919,4.6778,0.675,0.683,"regulation of cell proliferation"),
c("GO:0044531","modulation of programmed cell death in other organism",0.008,2.3019,0.777,0.695,"regulation of cell proliferation"),
c("GO:0009967","positive regulation of signal transduction",2.348,2.8041,0.657,0.700,"regulation of cell proliferation"),
c("GO:0001775","cell activation",2.008,1.9292,0.897,0.098,"cell activation"),
c("GO:0007154","cell communication",17.535,4.7212,0.866,0.153,"cell activation"));

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
