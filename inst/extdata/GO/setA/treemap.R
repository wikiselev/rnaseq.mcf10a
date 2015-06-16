

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
revigo.data <- rbind(c("GO:0002376","immune system process",29.354,3.4815,0.996,0.000,"immune system process"),
c("GO:0006928","cellular component movement",3.830,8.6021,0.906,0.000,"cellular component movement"),
c("GO:0044763","single-organism cellular process",45.302,3.2676,0.917,0.103,"cellular component movement"),
c("GO:0030198","extracellular matrix organization",0.708,6.7696,0.899,0.105,"cellular component movement"),
c("GO:0001775","cell activation",2.008,5.7696,0.912,0.121,"cellular component movement"),
c("GO:0016477","cell migration",2.372,7.6383,0.746,0.124,"cellular component movement"),
c("GO:0007154","cell communication",17.535,3.7959,0.886,0.173,"cellular component movement"),
c("GO:0002576","platelet degranulation",0.105,2.5346,0.870,0.255,"cellular component movement"),
c("GO:0010876","lipid localization",0.809,3.7212,0.912,0.315,"cellular component movement"),
c("GO:0006820","anion transport",1.726,3.6576,0.878,0.346,"cellular component movement"),
c("GO:0045216","cell-cell junction organization",0.424,2.7258,0.900,0.352,"cellular component movement"),
c("GO:0034330","cell junction organization",0.493,3.5686,0.902,0.357,"cellular component movement"),
c("GO:0051050","positive regulation of transport",1.381,3.4815,0.790,0.363,"cellular component movement"),
c("GO:0051674","localization of cell",2.570,6.9208,0.907,0.365,"cellular component movement"),
c("GO:0043062","extracellular structure organization",0.709,6.7696,0.899,0.370,"cellular component movement"),
c("GO:0015849","organic acid transport",0.681,3.3565,0.886,0.382,"cellular component movement"),
c("GO:0032879","regulation of localization",4.330,4.0410,0.841,0.397,"cellular component movement"),
c("GO:0046903","secretion",2.293,2.7447,0.879,0.441,"cellular component movement"),
c("GO:0015909","long-chain fatty acid transport",0.084,3.9586,0.891,0.456,"cellular component movement"),
c("GO:0006811","ion transport",7.803,4.2757,0.861,0.546,"cellular component movement"),
c("GO:0006898","receptor-mediated endocytosis",0.534,2.3809,0.908,0.547,"cellular component movement"),
c("GO:1900182","positive regulation of protein localization to nucleus",0.171,2.4377,0.774,0.564,"cellular component movement"),
c("GO:0043271","negative regulation of ion transport",0.145,2.5143,0.802,0.613,"cellular component movement"),
c("GO:0055085","transmembrane transport",7.528,2.4737,0.814,0.673,"cellular component movement"),
c("GO:0015711","organic anion transport",0.945,3.2840,0.876,0.680,"cellular component movement"),
c("GO:0002687","positive regulation of leukocyte migration",0.130,4.5686,0.691,0.687,"cellular component movement"),
c("GO:0048259","regulation of receptor-mediated endocytosis",0.099,2.4365,0.788,0.689,"cellular component movement"),
c("GO:2001286","regulation of caveolin-mediated endocytosis",0.010,2.4377,0.818,0.697,"cellular component movement"),
c("GO:0007155","cell adhesion",2.821,6.6778,0.950,0.000,"cell adhesion"),
c("GO:2000097","regulation of smooth muscle cell-matrix adhesion",0.003,2.4377,0.886,0.500,"cell adhesion"),
c("GO:0022408","negative regulation of cell-cell adhesion",0.062,2.5045,0.829,0.632,"cell adhesion"),
c("GO:0009605","response to external stimulus",4.459,7.6576,0.945,0.000,"response to external stimulus"),
c("GO:0042493","response to drug",1.179,5.8861,0.898,0.105,"response to external stimulus"),
c("GO:0032101","regulation of response to external stimulus",1.256,3.4318,0.818,0.106,"response to external stimulus"),
c("GO:0009607","response to biotic stimulus",1.599,3.0223,0.951,0.109,"response to external stimulus"),
c("GO:0009611","response to wounding",2.056,7.5229,0.909,0.113,"response to external stimulus"),
c("GO:0009628","response to abiotic stimulus",2.264,2.3439,0.949,0.115,"response to external stimulus"),
c("GO:0042221","response to chemical",8.684,7.1249,0.941,0.142,"response to external stimulus"),
c("GO:0006950","response to stress",8.191,2.4377,0.941,0.160,"response to external stimulus"),
c("GO:0048520","positive regulation of behavior",0.205,3.3565,0.859,0.185,"response to external stimulus"),
c("GO:0048583","regulation of response to stimulus",26.518,3.6383,0.862,0.210,"response to external stimulus"),
c("GO:0051716","cellular response to stimulus",19.092,2.4449,0.896,0.265,"response to external stimulus"),
c("GO:0048518","positive regulation of biological process",28.712,3.5086,0.896,0.273,"response to external stimulus"),
c("GO:0006971","hypotonic response",0.022,2.6990,0.924,0.373,"response to external stimulus"),
c("GO:0034698","response to gonadotropin",0.082,2.9281,0.911,0.387,"response to external stimulus"),
c("GO:0070542","response to fatty acid",0.114,3.1192,0.907,0.398,"response to external stimulus"),
c("GO:0039533","regulation of MDA-5 signaling pathway",0.008,3.6576,0.631,0.430,"response to external stimulus"),
c("GO:0090269","fibroblast growth factor production",0.005,2.4377,0.844,0.444,"response to external stimulus"),
c("GO:0043482","cellular pigment accumulation",0.013,2.4168,0.850,0.445,"response to external stimulus"),
c("GO:0090270","regulation of fibroblast growth factor production",0.005,2.4377,0.794,0.458,"response to external stimulus"),
c("GO:0060416","response to growth hormone",0.079,2.8601,0.909,0.516,"response to external stimulus"),
c("GO:0033993","response to lipid",2.113,3.5686,0.886,0.538,"response to external stimulus"),
c("GO:0042060","wound healing",1.314,5.7696,0.899,0.559,"response to external stimulus"),
c("GO:0006954","inflammatory response",1.375,4.2366,0.909,0.562,"response to external stimulus"),
c("GO:0080134","regulation of response to stress",1.961,2.7471,0.848,0.588,"response to external stimulus"),
c("GO:0032103","positive regulation of response to external stimulus",0.398,3.6778,0.801,0.600,"response to external stimulus"),
c("GO:0009612","response to mechanical stimulus",0.422,2.7696,0.867,0.604,"response to external stimulus"),
c("GO:1901700","response to oxygen-containing compound",3.064,2.3116,0.887,0.608,"response to external stimulus"),
c("GO:0051917","regulation of fibrinolysis",0.017,3.3979,0.651,0.609,"response to external stimulus"),
c("GO:0071260","cellular response to mechanical stimulus",0.133,2.7595,0.836,0.612,"response to external stimulus"),
c("GO:0060396","growth hormone receptor signaling pathway",0.043,2.8125,0.798,0.617,"response to external stimulus"),
c("GO:0019221","cytokine-mediated signaling pathway",0.956,2.3391,0.749,0.617,"response to external stimulus"),
c("GO:0006952","defense response",3.096,4.1938,0.905,0.624,"response to external stimulus"),
c("GO:0006970","response to osmotic stress",0.203,2.4921,0.911,0.635,"response to external stimulus"),
c("GO:0071396","cellular response to lipid",1.069,2.5607,0.838,0.667,"response to external stimulus"),
c("GO:0043476","pigment accumulation",0.013,2.4168,0.893,0.678,"response to external stimulus"),
c("GO:0051707","response to other organism",1.534,3.3979,0.851,0.695,"response to external stimulus"),
c("GO:0070887","cellular response to chemical stimulus",5.433,4.5376,0.820,0.698,"response to external stimulus"),
c("GO:0010757","negative regulation of plasminogen activation",0.010,4.8861,0.881,0.000,"negative regulation of plasminogen activation"),
c("GO:0030167","proteoglycan catabolic process",0.003,2.4377,0.947,0.151,"negative regulation of plasminogen activation"),
c("GO:0018149","peptide cross-linking",0.099,2.3429,0.939,0.183,"negative regulation of plasminogen activation"),
c("GO:0050427","3'-phosphoadenosine 5'-phosphosulfate metabolic process",0.023,2.3536,0.911,0.215,"negative regulation of plasminogen activation"),
c("GO:0018153","isopeptide cross-linking via N6-(L-isoglutamyl)-L-lysine",0.008,2.4377,0.945,0.256,"negative regulation of plasminogen activation"),
c("GO:0048585","negative regulation of response to stimulus",2.501,3.3768,0.839,0.349,"negative regulation of plasminogen activation"),
c("GO:0001516","prostaglandin biosynthetic process",0.051,2.3429,0.908,0.423,"negative regulation of plasminogen activation"),
c("GO:0052548","regulation of endopeptidase activity",0.736,3.6198,0.882,0.423,"negative regulation of plasminogen activation"),
c("GO:0031952","regulation of protein autophosphorylation",0.049,2.4547,0.857,0.476,"negative regulation of plasminogen activation"),
c("GO:0031638","zymogen activation",0.198,2.6861,0.956,0.632,"negative regulation of plasminogen activation"),
c("GO:0051346","negative regulation of hydrolase activity",0.734,2.3840,0.902,0.687,"negative regulation of plasminogen activation"),
c("GO:0022610","biological adhesion",2.826,6.6383,0.994,0.000,"biological adhesion"),
c("GO:0023052","signaling",17.329,4.2076,0.995,0.000,"signaling"),
c("GO:0032501","multicellular organismal process",15.657,9.5086,0.995,0.000,"multicellular organismal process"),
c("GO:0032502","developmental process",13.055,5.4089,0.995,0.000,"developmental process"),
c("GO:0040011","locomotion",3.285,7.3098,0.994,0.000,"locomotion"),
c("GO:0044699","single-organism process",71.655,4.4685,0.998,0.000,"single-organism process"),
c("GO:0050896","response to stimulus",47.248,4.4437,0.997,0.000,"response to stimulus"),
c("GO:0051179","localization",18.927,3.3010,0.995,0.000,"localization"),
c("GO:0065007","biological regulation",51.216,2.3595,0.997,0.000,"biological regulation"),
c("GO:0001944","vasculature development",1.399,6.8239,0.684,0.025,"vasculature development"),
c("GO:0001974","blood vessel remodeling",0.109,2.6021,0.817,0.290,"vasculature development"),
c("GO:0044236","multicellular organismal metabolic process",0.220,2.3990,0.796,0.309,"vasculature development"),
c("GO:0090130","tissue migration",0.371,5.6778,0.798,0.326,"vasculature development"),
c("GO:0048771","tissue remodeling",0.384,2.6402,0.798,0.327,"vasculature development"),
c("GO:0044706","multi-multicellular organism process",0.678,4.1549,0.784,0.338,"vasculature development"),
c("GO:0070365","hepatocyte differentiation",0.042,3.1192,0.737,0.347,"vasculature development"),
c("GO:0001503","ossification",0.817,2.7496,0.784,0.354,"vasculature development"),
c("GO:0060713","labyrinthine layer morphogenesis",0.055,3.0000,0.752,0.355,"vasculature development"),
c("GO:0050817","coagulation",0.929,5.7959,0.782,0.359,"vasculature development"),
c("GO:0008015","blood circulation",1.109,5.0410,0.754,0.366,"vasculature development"),
c("GO:0050878","regulation of body fluid levels",1.269,5.3468,0.723,0.372,"vasculature development"),
c("GO:0072006","nephron development",0.237,3.5686,0.734,0.406,"vasculature development"),
c("GO:0045597","positive regulation of cell differentiation",1.436,5.1308,0.653,0.417,"vasculature development"),
c("GO:0003008","system process",4.235,5.4318,0.747,0.432,"vasculature development"),
c("GO:0051240","positive regulation of multicellular organismal process",1.418,3.9208,0.675,0.433,"vasculature development"),
c("GO:0043588","skin development",0.701,4.3188,0.719,0.453,"vasculature development"),
c("GO:0032965","regulation of collagen biosynthetic process",0.052,3.3279,0.721,0.464,"vasculature development"),
c("GO:0035150","regulation of tube size",0.408,3.1079,0.899,0.491,"vasculature development"),
c("GO:0043065","positive regulation of apoptotic process",0.945,4.9586,0.787,0.505,"vasculature development"),
c("GO:0009888","tissue development",4.199,6.3010,0.808,0.514,"vasculature development"),
c("GO:0002521","leukocyte differentiation",1.015,5.1024,0.653,0.526,"vasculature development"),
c("GO:0002520","immune system development",1.845,2.4815,0.681,0.534,"vasculature development"),
c("GO:0090066","regulation of anatomical structure size",0.957,2.8297,0.895,0.537,"vasculature development"),
c("GO:0072359","circulatory system development",2.260,6.0000,0.692,0.549,"vasculature development"),
c("GO:0048646","anatomical structure formation involved in morphogenesis",2.581,5.2441,0.799,0.560,"vasculature development"),
c("GO:0060429","epithelium development",2.640,4.1487,0.806,0.562,"vasculature development"),
c("GO:0050793","regulation of developmental process",4.431,3.9586,0.754,0.563,"vasculature development"),
c("GO:0010647","positive regulation of cell communication",2.500,3.4685,0.758,0.567,"vasculature development"),
c("GO:0007565","female pregnancy",0.542,3.1805,0.784,0.583,"vasculature development"),
c("GO:0030728","ovulation",0.055,2.3536,0.809,0.589,"vasculature development"),
c("GO:0036303","lymph vessel morphogenesis",0.025,2.5086,0.757,0.590,"vasculature development"),
c("GO:0060841","venous blood vessel development",0.035,2.3536,0.760,0.606,"vasculature development"),
c("GO:0001763","morphogenesis of a branching structure",0.639,2.3439,0.719,0.607,"vasculature development"),
c("GO:0044707","single-multicellular organism process",15.092,9.1427,0.714,0.619,"vasculature development"),
c("GO:0001945","lymph vessel development",0.047,3.4815,0.756,0.621,"vasculature development"),
c("GO:0043408","regulation of MAPK cascade",1.237,2.6556,0.733,0.630,"vasculature development"),
c("GO:0048468","cell development",4.830,2.3152,0.728,0.638,"vasculature development"),
c("GO:0006936","muscle contraction",0.724,3.9208,0.761,0.642,"vasculature development"),
c("GO:0007409","axonogenesis",1.136,3.4949,0.638,0.650,"vasculature development"),
c("GO:0003012","muscle system process",0.830,3.6990,0.766,0.652,"vasculature development"),
c("GO:0044057","regulation of system process",1.035,4.8539,0.690,0.667,"vasculature development"),
c("GO:0002040","sprouting angiogenesis",0.117,3.9208,0.729,0.673,"vasculature development"),
c("GO:0003013","circulatory system process",1.113,5.4437,0.759,0.673,"vasculature development"),
c("GO:0010001","glial cell differentiation",0.562,2.7033,0.684,0.674,"vasculature development"),
c("GO:0010648","negative regulation of cell communication",2.203,3.3979,0.769,0.678,"vasculature development"),
c("GO:0042063","gliogenesis",0.620,2.4202,0.682,0.681,"vasculature development"),
c("GO:0051216","cartilage development",0.566,2.4202,0.714,0.690,"vasculature development"),
c("GO:0008544","epidermis development",0.590,4.3565,0.712,0.693,"vasculature development"),
c("GO:0061138","morphogenesis of a branching epithelium",0.608,2.5768,0.708,0.695,"vasculature development"),
c("GO:0048513","organ development",7.380,6.0555,0.649,0.695,"vasculature development"),
c("GO:0016525","negative regulation of angiogenesis",0.139,3.2147,0.645,0.699,"vasculature development"),
c("GO:0008283","cell proliferation",4.075,4.8861,0.965,0.029,"cell proliferation"),
c("GO:0042127","regulation of cell proliferation",3.148,4.9208,0.821,0.062,"regulation of cell proliferation"),
c("GO:0051239","regulation of multicellular organismal process",5.506,8.5686,0.917,0.110,"regulation of cell proliferation"),
c("GO:0065008","regulation of biological quality",7.337,5.6778,0.919,0.118,"regulation of cell proliferation"),
c("GO:0048519","negative regulation of biological process",8.588,2.4597,0.912,0.131,"regulation of cell proliferation"),
c("GO:0050865","regulation of cell activation",0.901,3.3188,0.805,0.215,"regulation of cell proliferation"),
c("GO:0048661","positive regulation of smooth muscle cell proliferation",0.107,4.4685,0.826,0.596,"regulation of cell proliferation"),
c("GO:0033002","muscle cell proliferation",0.345,3.3665,0.948,0.673,"regulation of cell proliferation"),
c("GO:0072577","endothelial cell apoptotic process",0.047,3.6576,0.919,0.079,"endothelial cell apoptotic process"),
c("GO:2000351","regulation of endothelial cell apoptotic process",0.043,3.1871,0.867,0.576,"endothelial cell apoptotic process"),
c("GO:0023056","positive regulation of signaling",2.489,3.5086,0.829,0.098,"positive regulation of signaling"),
c("GO:0014065","phosphatidylinositol 3-kinase signaling",0.157,2.5901,0.822,0.286,"positive regulation of signaling"),
c("GO:0002684","positive regulation of immune system process",20.525,4.1871,0.829,0.337,"positive regulation of signaling"),
c("GO:0023014","signal transduction by phosphorylation",1.554,2.3799,0.773,0.369,"positive regulation of signaling"),
c("GO:0007167","enzyme linked receptor protein signaling pathway",2.356,3.4089,0.777,0.389,"positive regulation of signaling"),
c("GO:0007200","phospholipase C-activating G-protein coupled receptor signaling pathway",0.131,3.3979,0.829,0.424,"positive regulation of signaling"),
c("GO:0090036","regulation of protein kinase C signaling",0.031,2.6840,0.825,0.432,"positive regulation of signaling"),
c("GO:0048522","positive regulation of cellular process",8.548,2.5654,0.818,0.440,"positive regulation of signaling"),
c("GO:0051482","positive regulation of cytosolic calcium ion concentration involved in phospholipase C-activating G-protein coupled signaling pathway",0.032,3.3979,0.816,0.445,"positive regulation of signaling"),
c("GO:0007166","cell surface receptor signaling pathway",8.919,5.3872,0.743,0.498,"positive regulation of signaling"),
c("GO:0006883","cellular sodium ion homeostasis",0.018,2.4377,0.891,0.551,"positive regulation of signaling"),
c("GO:0007169","transmembrane receptor protein tyrosine kinase signaling pathway",1.599,2.7011,0.785,0.558,"positive regulation of signaling"),
c("GO:0010646","regulation of cell communication",6.570,3.4559,0.794,0.559,"positive regulation of signaling"),
c("GO:0023051","regulation of signaling",6.570,3.6383,0.856,0.564,"positive regulation of signaling"),
c("GO:0006468","protein phosphorylation",5.136,2.6615,0.904,0.576,"positive regulation of signaling"),
c("GO:0048584","positive regulation of response to stimulus",22.389,3.8239,0.811,0.578,"positive regulation of signaling"),
c("GO:0006955","immune response",27.347,3.7447,0.890,0.601,"positive regulation of signaling"),
c("GO:0002682","regulation of immune system process",21.361,3.1871,0.868,0.610,"positive regulation of signaling"),
c("GO:0023057","negative regulation of signaling",2.197,3.2147,0.819,0.677,"positive regulation of signaling"),
c("GO:0044700","single organism signaling",17.329,4.2076,0.897,0.695,"positive regulation of signaling"));

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
