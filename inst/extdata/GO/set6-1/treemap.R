

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
revigo.data <- rbind(c("GO:0048539","bone marrow development",0.008,4.6576,0.793,0.000,"bone marrow development"),
c("GO:0046849","bone remodeling",0.199,2.4067,0.822,0.205,"bone marrow development"),
c("GO:0045600","positive regulation of fat cell differentiation",0.084,3.0809,0.722,0.215,"bone marrow development"),
c("GO:0090399","replicative senescence",0.030,1.8060,0.815,0.234,"bone marrow development"),
c("GO:0048561","establishment of organ orientation",0.002,2.7055,0.802,0.240,"bone marrow development"),
c("GO:0060033","anatomical structure regression",0.032,1.8636,0.825,0.282,"bone marrow development"),
c("GO:0043615","astrocyte cell migration",0.009,2.1057,0.752,0.283,"bone marrow development"),
c("GO:0001503","ossification",0.817,2.1965,0.828,0.291,"bone marrow development"),
c("GO:0007568","aging",0.730,2.4881,0.810,0.296,"bone marrow development"),
c("GO:0010666","positive regulation of cardiac muscle cell apoptotic process",0.038,2.0088,0.807,0.301,"bone marrow development"),
c("GO:0048771","tissue remodeling",0.384,1.8969,0.838,0.310,"bone marrow development"),
c("GO:0061430","bone trabecula morphogenesis",0.036,1.7100,0.815,0.331,"bone marrow development"),
c("GO:0001702","gastrulation with mouth forming second",0.108,1.4130,0.779,0.359,"bone marrow development"),
c("GO:0045444","fat cell differentiation",0.409,1.6840,0.768,0.369,"bone marrow development"),
c("GO:0008284","positive regulation of cell proliferation",1.657,2.0004,0.824,0.402,"bone marrow development"),
c("GO:0061180","mammary gland epithelium development",0.350,3.7447,0.734,0.402,"bone marrow development"),
c("GO:0007506","gonadal mesoderm development",0.009,2.7055,0.793,0.406,"bone marrow development"),
c("GO:0060561","apoptotic process involved in morphogenesis",0.076,1.4349,0.741,0.408,"bone marrow development"),
c("GO:0061304","retinal blood vessel morphogenesis",0.011,2.2299,0.777,0.412,"bone marrow development"),
c("GO:0001501","skeletal system development",1.209,1.8066,0.754,0.415,"bone marrow development"),
c("GO:1902742","apoptotic process involved in development",0.092,1.3723,0.764,0.434,"bone marrow development"),
c("GO:0060612","adipose tissue development",0.075,1.3723,0.777,0.473,"bone marrow development"),
c("GO:0048732","gland development",1.335,2.1669,0.738,0.484,"bone marrow development"),
c("GO:0007530","sex determination",0.126,1.6315,0.835,0.501,"bone marrow development"),
c("GO:0048643","positive regulation of skeletal muscle tissue development",0.028,2.1057,0.732,0.504,"bone marrow development"),
c("GO:0045667","regulation of osteoblast differentiation",0.251,2.0301,0.682,0.508,"bone marrow development"),
c("GO:0009888","tissue development",4.199,1.4489,0.786,0.510,"bone marrow development"),
c("GO:0071425","hematopoietic stem cell proliferation",0.036,1.7552,0.773,0.511,"bone marrow development"),
c("GO:0009798","axis specification",0.219,2.2916,0.782,0.526,"bone marrow development"),
c("GO:0001546","preantral ovarian follicle growth",0.003,2.7055,0.773,0.530,"bone marrow development"),
c("GO:0001880","Mullerian duct regression",0.011,2.1057,0.802,0.533,"bone marrow development"),
c("GO:0009790","embryo development",2.628,1.4102,0.745,0.561,"bone marrow development"),
c("GO:0045672","positive regulation of osteoclast differentiation",0.046,1.6315,0.684,0.566,"bone marrow development"),
c("GO:0048560","establishment of anatomical structure orientation",0.003,2.4056,0.813,0.583,"bone marrow development"),
c("GO:0008347","glial cell migration",0.034,1.7100,0.732,0.585,"bone marrow development"),
c("GO:0060348","bone development",0.513,1.9158,0.750,0.593,"bone marrow development"),
c("GO:0051094","positive regulation of developmental process",1.985,1.7875,0.740,0.601,"bone marrow development"),
c("GO:0031076","embryonic camera-type eye development",0.120,1.3180,0.761,0.612,"bone marrow development"),
c("GO:0044332","Wnt signaling pathway involved in dorsal/ventral axis specification",0.007,2.0088,0.729,0.615,"bone marrow development"),
c("GO:0060059","embryonic retina morphogenesis in camera-type eye",0.023,1.9303,0.763,0.646,"bone marrow development"),
c("GO:0072089","stem cell proliferation",0.477,1.9355,0.944,0.650,"bone marrow development"),
c("GO:0022605","oogenesis stage",0.010,2.2299,0.779,0.656,"bone marrow development"),
c("GO:0048513","organ development",7.380,1.9796,0.711,0.662,"bone marrow development"),
c("GO:0048534","hematopoietic or lymphoid organ development",1.755,1.3478,0.724,0.668,"bone marrow development"),
c("GO:0008299","isoprenoid biosynthetic process",0.083,3.2596,0.854,0.011,"isoprenoid biosynthesis"),
c("GO:1901360","organic cyclic compound metabolic process",25.430,1.6893,0.942,0.115,"isoprenoid biosynthesis"),
c("GO:0006743","ubiquinone metabolic process",0.034,1.6690,0.886,0.130,"isoprenoid biosynthesis"),
c("GO:0009058","biosynthetic process",19.017,1.5267,0.960,0.180,"isoprenoid biosynthesis"),
c("GO:0006725","cellular aromatic compound metabolic process",24.907,1.3504,0.903,0.198,"isoprenoid biosynthesis"),
c("GO:1901362","organic cyclic compound biosynthetic process",13.849,1.7104,0.906,0.301,"isoprenoid biosynthesis"),
c("GO:0006390","transcription from mitochondrial promoter",0.011,1.7552,0.865,0.358,"isoprenoid biosynthesis"),
c("GO:0046483","heterocycle metabolic process",24.799,1.3461,0.903,0.359,"isoprenoid biosynthesis"),
c("GO:0015986","ATP synthesis coupled proton transport",1.236,1.4579,0.747,0.504,"isoprenoid biosynthesis"),
c("GO:1902476","chloride transmembrane transport",0.222,1.3354,0.855,0.541,"isoprenoid biosynthesis"),
c("GO:0006720","isoprenoid metabolic process",0.232,2.1118,0.864,0.569,"isoprenoid biosynthesis"),
c("GO:0008202","steroid metabolic process",0.613,1.3411,0.893,0.600,"isoprenoid biosynthesis"),
c("GO:0006139","nucleobase-containing compound metabolic process",24.258,1.4366,0.874,0.602,"isoprenoid biosynthesis"),
c("GO:0006695","cholesterol biosynthetic process",0.119,2.6308,0.866,0.614,"isoprenoid biosynthesis"),
c("GO:0015988","energy coupled proton transmembrane transport, against electrochemical gradient",0.152,1.3354,0.857,0.615,"isoprenoid biosynthesis"),
c("GO:0015991","ATP hydrolysis coupled proton transport",0.152,1.3354,0.857,0.615,"isoprenoid biosynthesis"),
c("GO:0015936","coenzyme A metabolic process",0.049,1.5358,0.868,0.644,"isoprenoid biosynthesis"),
c("GO:1901661","quinone metabolic process",0.055,1.3535,0.882,0.696,"isoprenoid biosynthesis"),
c("GO:0008283","cell proliferation",4.075,2.4828,0.963,0.018,"cell proliferation"),
c("GO:0035089","establishment of apical/basal cell polarity",0.011,2.0088,0.908,0.054,"establishment of apical/basal cell polarity"),
c("GO:0061339","establishment or maintenance of monopolar cell polarity",0.015,1.9303,0.912,0.627,"establishment of apical/basal cell polarity"),
c("GO:0061245","establishment or maintenance of bipolar cell polarity",0.042,1.5358,0.907,0.677,"establishment of apical/basal cell polarity"),
c("GO:0061178","regulation of insulin secretion involved in cellular response to glucose stimulus",0.095,3.1249,0.582,0.062,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0010694","positive regulation of alkaline phosphatase activity",0.025,2.1057,0.853,0.115,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0007346","regulation of mitotic cell cycle",0.775,2.7852,0.819,0.149,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0001560","regulation of cell growth by extracellular stimulus",0.005,2.4056,0.853,0.169,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:1902414","protein localization to cell junction",0.018,2.2299,0.938,0.173,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0031268","pseudopodium organization",0.025,1.7552,0.919,0.200,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0009893","positive regulation of metabolic process",5.415,1.6167,0.869,0.254,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0007267","cell-cell signaling",2.522,1.4907,0.860,0.272,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0045908","negative regulation of vasodilation",0.008,2.4056,0.761,0.295,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:2000474","regulation of opioid receptor signaling pathway",0.006,2.7055,0.846,0.304,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0032472","Golgi calcium ion transport",0.002,2.4056,0.904,0.313,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0061045","negative regulation of wound healing",0.018,1.8636,0.914,0.319,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0071896","protein localization to adherens junction",0.008,2.2299,0.941,0.321,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0045408","regulation of interleukin-6 biosynthetic process",0.054,1.8636,0.733,0.323,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0001919","regulation of receptor recycling",0.041,1.6315,0.824,0.345,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0008105","asymmetric protein localization",0.038,1.5358,0.936,0.351,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0071315","cellular response to morphine",0.011,2.7055,0.869,0.367,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0038003","opioid receptor signaling pathway",0.036,2.1057,0.846,0.370,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0008542","visual learning",0.105,1.3535,0.834,0.372,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:2000273","positive regulation of receptor activity",0.049,1.4349,0.806,0.394,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0051783","regulation of nuclear division",0.406,1.8874,0.835,0.405,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:1901700","response to oxygen-containing compound",3.064,1.8128,0.895,0.427,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0032863","activation of Rac GTPase activity",0.018,1.8060,0.775,0.437,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0071901","negative regulation of protein serine/threonine kinase activity",0.261,1.8511,0.803,0.442,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0035751","regulation of lysosomal lumen pH",0.006,2.1057,0.818,0.513,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0045471","response to ethanol",0.329,2.2321,0.888,0.533,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0032844","regulation of homeostatic process",0.737,2.2725,0.827,0.559,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0016080","synaptic vesicle targeting",0.009,2.1057,0.777,0.578,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0042592","homeostatic process",3.235,1.8514,0.830,0.580,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0032856","activation of Ras GTPase activity",0.080,1.4349,0.756,0.585,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0050790","regulation of catalytic activity",5.262,1.5981,0.860,0.586,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0009743","response to carbohydrate",0.496,1.7670,0.884,0.613,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0014070","response to organic cyclic compound",2.318,1.3530,0.886,0.616,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0033500","carbohydrate homeostasis",0.473,1.7994,0.828,0.647,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0045930","negative regulation of mitotic cell cycle",0.059,1.3922,0.827,0.649,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0042886","amide transport",0.679,1.5010,0.847,0.651,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0010389","regulation of G2/M transition of mitotic cell cycle",0.065,1.4130,0.842,0.654,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0023061","signal release",0.874,2.0975,0.778,0.655,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0010458","exit from mitosis",0.033,1.5082,0.870,0.658,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0032855","positive regulation of Rac GTPase activity",0.083,1.4130,0.754,0.661,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0014072","response to isoquinoline alkaloid",0.084,1.4579,0.897,0.666,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0060249","anatomical structure homeostasis",0.656,1.4116,0.831,0.668,"regulation of insulin secretion involved in cellular response to glucose stimulus"),
c("GO:0000959","mitochondrial RNA metabolic process",0.027,1.4579,0.923,0.066,"mitochondrial RNA metabolism"),
c("GO:0006370","7-methylguanosine mRNA capping",0.043,1.4130,0.912,0.224,"mitochondrial RNA metabolism"),
c("GO:0036260","RNA capping",0.052,1.3723,0.915,0.529,"mitochondrial RNA metabolism"),
c("GO:0065009","regulation of molecular function",6.209,1.7282,0.934,0.067,"regulation of molecular function"),
c("GO:0042221","response to chemical",8.684,1.4857,0.965,0.084,"response to chemical"));

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
