

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
revigo.data <- rbind(c("GO:0006928","cellular component movement",3.830,4.9586,0.888,0.000,"cellular component movement"),
c("GO:0042113","B cell activation",0.487,3.0809,0.829,0.101,"cellular component movement"),
c("GO:0034330","cell junction organization",0.493,2.8508,0.876,0.101,"cellular component movement"),
c("GO:0045597","positive regulation of cell differentiation",1.436,4.1135,0.603,0.115,"cellular component movement"),
c("GO:0001775","cell activation",2.008,1.7875,0.895,0.121,"cellular component movement"),
c("GO:0016477","cell migration",2.372,3.0315,0.788,0.124,"cellular component movement"),
c("GO:0060396","growth hormone receptor signaling pathway",0.043,4.0269,0.791,0.147,"cellular component movement"),
c("GO:0007154","cell communication",17.535,2.9066,0.866,0.173,"cellular component movement"),
c("GO:0032486","Rap protein signal transduction",0.051,2.3261,0.814,0.200,"cellular component movement"),
c("GO:0042127","regulation of cell proliferation",3.148,2.3904,0.816,0.229,"cellular component movement"),
c("GO:0038007","netrin-activated signaling pathway",0.006,1.6588,0.847,0.251,"cellular component movement"),
c("GO:0016188","synaptic vesicle maturation",0.021,2.5544,0.737,0.279,"cellular component movement"),
c("GO:0001100","negative regulation of exit from mitosis",0.001,1.6588,0.853,0.281,"cellular component movement"),
c("GO:0048522","positive regulation of cellular process",8.548,2.1319,0.805,0.297,"cellular component movement"),
c("GO:0019341","dibenzo-p-dioxin catabolic process",0.005,1.6588,0.853,0.311,"cellular component movement"),
c("GO:1900245","positive regulation of MDA-5 signaling pathway",0.007,3.3188,0.616,0.325,"cellular component movement"),
c("GO:0051050","positive regulation of transport",1.381,2.5702,0.816,0.336,"cellular component movement"),
c("GO:0034329","cell junction assembly",0.424,2.2604,0.874,0.340,"cellular component movement"),
c("GO:0072006","nephron development",0.237,2.2277,0.719,0.345,"cellular component movement"),
c("GO:0030198","extracellular matrix organization",0.708,2.5560,0.862,0.357,"cellular component movement"),
c("GO:0051674","localization of cell",2.570,2.9872,0.939,0.365,"cellular component movement"),
c("GO:0043062","extracellular structure organization",0.709,2.5560,0.872,0.370,"cellular component movement"),
c("GO:0007259","JAK-STAT cascade",0.253,2.2823,0.795,0.372,"cellular component movement"),
c("GO:0021700","developmental maturation",0.540,1.6647,0.806,0.375,"cellular component movement"),
c("GO:0051241","negative regulation of multicellular organismal process",0.833,2.0670,0.674,0.381,"cellular component movement"),
c("GO:0023056","positive regulation of signaling",2.489,2.4101,0.809,0.383,"cellular component movement"),
c("GO:0022010","central nervous system myelination",0.040,3.4685,0.654,0.385,"cellular component movement"),
c("GO:0021740","principal sensory nucleus of trigeminal nerve development",0.001,1.6588,0.789,0.387,"cellular component movement"),
c("GO:0007167","enzyme linked receptor protein signaling pathway",2.356,1.8492,0.759,0.389,"cellular component movement"),
c("GO:0001942","hair follicle development",0.209,1.9718,0.707,0.395,"cellular component movement"),
c("GO:0032879","regulation of localization",4.330,2.9706,0.872,0.397,"cellular component movement"),
c("GO:0060668","regulation of branching involved in salivary gland morphogenesis by extracellular matrix-epithelial cell signaling",0.002,1.6588,0.688,0.420,"cellular component movement"),
c("GO:0032101","regulation of response to external stimulus",1.256,1.8674,0.868,0.425,"cellular component movement"),
c("GO:0061141","lung ciliated cell differentiation",0.003,1.6588,0.748,0.430,"cellular component movement"),
c("GO:0051615","histamine uptake",0.003,1.6588,0.844,0.433,"cellular component movement"),
c("GO:0002684","positive regulation of immune system process",20.525,2.0585,0.830,0.440,"cellular component movement"),
c("GO:0090269","fibroblast growth factor production",0.005,3.3188,0.825,0.441,"cellular component movement"),
c("GO:0045926","negative regulation of growth",0.466,1.9076,0.899,0.442,"cellular component movement"),
c("GO:0072358","cardiovascular system development",2.258,3.8539,0.645,0.442,"cellular component movement"),
c("GO:0010646","regulation of cell communication",6.570,2.7620,0.769,0.444,"cellular component movement"),
c("GO:0002683","negative regulation of immune system process",0.540,1.7156,0.872,0.448,"cellular component movement"),
c("GO:0033993","response to lipid",2.113,2.5421,0.918,0.452,"cellular component movement"),
c("GO:0090270","regulation of fibroblast growth factor production",0.005,3.3188,0.766,0.455,"cellular component movement"),
c("GO:1900134","negative regulation of renin secretion into blood stream",0.003,1.6588,0.688,0.455,"cellular component movement"),
c("GO:0003008","system process",4.235,1.6419,0.740,0.462,"cellular component movement"),
c("GO:0032227","negative regulation of synaptic transmission, dopaminergic",0.018,1.6588,0.802,0.475,"cellular component movement"),
c("GO:0050859","negative regulation of B cell receptor signaling pathway",0.007,1.6588,0.785,0.483,"cellular component movement"),
c("GO:0031547","brain-derived neurotrophic factor receptor signaling pathway",0.015,1.6588,0.836,0.491,"cellular component movement"),
c("GO:0014066","regulation of phosphatidylinositol 3-kinase signaling",0.129,1.8122,0.785,0.492,"cellular component movement"),
c("GO:0071397","cellular response to cholesterol",0.033,1.9101,0.887,0.494,"cellular component movement"),
c("GO:0019233","sensory perception of pain",0.210,2.0325,0.788,0.496,"cellular component movement"),
c("GO:0030194","positive regulation of blood coagulation",0.049,2.4989,0.672,0.502,"cellular component movement"),
c("GO:0070307","lens fiber cell development",0.038,1.8074,0.707,0.503,"cellular component movement"),
c("GO:0002831","regulation of response to biotic stimulus",0.177,1.7817,0.893,0.511,"cellular component movement"),
c("GO:0050793","regulation of developmental process",4.431,2.7878,0.723,0.513,"cellular component movement"),
c("GO:0032854","positive regulation of Rap GTPase activity",0.027,2.0287,0.754,0.519,"cellular component movement"),
c("GO:0044700","single organism signaling",17.329,3.3372,0.880,0.532,"cellular component movement"),
c("GO:0042493","response to drug",1.179,1.7418,0.926,0.538,"cellular component movement"),
c("GO:0060376","positive regulation of mast cell differentiation",0.005,1.6588,0.652,0.540,"cellular component movement"),
c("GO:0090336","positive regulation of brown fat cell differentiation",0.006,1.6588,0.729,0.548,"cellular component movement"),
c("GO:2000310","regulation of N-methyl-D-aspartate selective glutamate receptor activity",0.041,2.1688,0.746,0.549,"cellular component movement"),
c("GO:0072359","circulatory system development",2.260,3.8539,0.670,0.552,"cellular component movement"),
c("GO:0009888","tissue development",4.199,1.6887,0.769,0.563,"cellular component movement"),
c("GO:0010647","positive regulation of cell communication",2.500,2.3936,0.725,0.567,"cellular component movement"),
c("GO:0045921","positive regulation of exocytosis",0.074,1.6847,0.768,0.577,"cellular component movement"),
c("GO:0003158","endothelium development",0.229,1.5983,0.815,0.578,"cellular component movement"),
c("GO:0048584","positive regulation of response to stimulus",22.389,1.9884,0.823,0.578,"cellular component movement"),
c("GO:0044057","regulation of system process",1.035,1.5672,0.678,0.585,"cellular component movement"),
c("GO:0010464","regulation of mesenchymal cell proliferation",0.092,1.6017,0.859,0.588,"cellular component movement"),
c("GO:0030182","neuron differentiation",2.824,2.7799,0.593,0.594,"cellular component movement"),
c("GO:0050804","regulation of synaptic transmission",0.640,2.4737,0.777,0.600,"cellular component movement"),
c("GO:0006955","immune response",27.347,1.8153,0.912,0.601,"cellular component movement"),
c("GO:2000795","negative regulation of epithelial cell proliferation involved in lung morphogenesis",0.001,1.6588,0.688,0.602,"cellular component movement"),
c("GO:0048845","venous blood vessel morphogenesis",0.021,1.9101,0.739,0.603,"cellular component movement"),
c("GO:0060020","Bergmann glial cell differentiation",0.010,1.6588,0.727,0.606,"cellular component movement"),
c("GO:0045446","endothelial cell differentiation",0.201,1.7469,0.750,0.607,"cellular component movement"),
c("GO:0090257","regulation of muscle system process",0.464,1.7058,0.694,0.609,"cellular component movement"),
c("GO:0001946","lymphangiogenesis",0.024,1.7167,0.734,0.611,"cellular component movement"),
c("GO:0001817","regulation of cytokine production",1.106,2.7447,0.670,0.613,"cellular component movement"),
c("GO:0000904","cell morphogenesis involved in differentiation",1.833,2.4921,0.669,0.614,"cellular component movement"),
c("GO:0060416","response to growth hormone",0.079,3.4318,0.929,0.617,"cellular component movement"),
c("GO:0021730","trigeminal sensory nucleus development",0.001,1.6588,0.789,0.618,"cellular component movement"),
c("GO:0071396","cellular response to lipid",1.069,2.4123,0.860,0.625,"cellular component movement"),
c("GO:0051240","positive regulation of multicellular organismal process",1.418,1.8996,0.660,0.625,"cellular component movement"),
c("GO:0060841","venous blood vessel development",0.035,2.7033,0.738,0.631,"cellular component movement"),
c("GO:0007399","nervous system development",4.932,1.6390,0.643,0.636,"cellular component movement"),
c("GO:0044707","single-multicellular organism process",15.092,3.3872,0.709,0.638,"cellular component movement"),
c("GO:0048729","tissue morphogenesis",1.464,1.6205,0.751,0.643,"cellular component movement"),
c("GO:0001945","lymph vessel development",0.047,3.3665,0.734,0.647,"cellular component movement"),
c("GO:0023051","regulation of signaling",6.570,3.0132,0.842,0.648,"cellular component movement"),
c("GO:0061138","morphogenesis of a branching epithelium",0.608,1.5682,0.691,0.651,"cellular component movement"),
c("GO:0009653","anatomical structure morphogenesis",5.999,3.4202,0.760,0.656,"cellular component movement"),
c("GO:0003331","positive regulation of extracellular matrix constituent secretion",0.005,1.6588,0.778,0.658,"cellular component movement"),
c("GO:0070887","cellular response to chemical stimulus",5.433,2.9393,0.845,0.659,"cellular component movement"),
c("GO:0045577","regulation of B cell differentiation",0.054,2.4089,0.588,0.665,"cellular component movement"),
c("GO:1900046","regulation of hemostasis",0.185,1.7156,0.714,0.668,"cellular component movement"),
c("GO:0032870","cellular response to hormone stimulus",1.400,1.7836,0.854,0.669,"cellular component movement"),
c("GO:0050818","regulation of coagulation",0.206,1.5983,0.719,0.672,"cellular component movement"),
c("GO:0048869","cellular developmental process",8.570,2.5768,0.690,0.672,"cellular component movement"),
c("GO:0045665","negative regulation of neuron differentiation",0.168,1.6423,0.583,0.672,"cellular component movement"),
c("GO:0009967","positive regulation of signal transduction",2.348,1.7721,0.690,0.684,"cellular component movement"),
c("GO:0046427","positive regulation of JAK-STAT cascade",0.121,1.6847,0.748,0.688,"cellular component movement"),
c("GO:2000791","negative regulation of mesenchymal cell proliferation involved in lung development",0.002,1.6588,0.688,0.690,"cellular component movement"),
c("GO:0007166","cell surface receptor signaling pathway",8.919,2.8697,0.726,0.695,"cellular component movement"),
c("GO:0071636","positive regulation of transforming growth factor beta production",0.036,1.9101,0.719,0.695,"cellular component movement"),
c("GO:0061041","regulation of wound healing",0.231,1.8072,0.875,0.695,"cellular component movement"),
c("GO:0007155","cell adhesion",2.821,2.6253,0.984,0.000,"cell adhesion"),
c("GO:2000047","regulation of cell-cell adhesion mediated by cadherin",0.011,2.1688,0.883,0.548,"cell adhesion"),
c("GO:0044331","cell-cell adhesion mediated by cadherin",0.019,2.0287,0.966,0.572,"cell adhesion"),
c("GO:0033628","regulation of cell adhesion mediated by integrin",0.065,1.8236,0.874,0.635,"cell adhesion"),
c("GO:0009605","response to external stimulus",4.459,3.3010,0.960,0.000,"response to external stimulus"),
c("GO:0042221","response to chemical",8.684,4.6990,0.957,0.142,"response to external stimulus"),
c("GO:0048583","regulation of response to stimulus",26.518,2.9066,0.873,0.210,"response to external stimulus"),
c("GO:0051716","cellular response to stimulus",19.092,1.8219,0.904,0.265,"response to external stimulus"),
c("GO:0050789","regulation of biological process",49.744,2.1085,0.895,0.322,"response to external stimulus"),
c("GO:0048518","positive regulation of biological process",28.712,2.0721,0.896,0.335,"response to external stimulus"),
c("GO:0050794","regulation of cellular process",28.971,2.2104,0.866,0.337,"response to external stimulus"),
c("GO:0022610","biological adhesion",2.826,2.6144,0.994,0.000,"biological adhesion"),
c("GO:0023052","signaling",17.329,3.3372,0.995,0.000,"signaling"),
c("GO:0032501","multicellular organismal process",15.657,3.5376,0.995,0.000,"multicellular organismal process"),
c("GO:0032502","developmental process",13.055,2.3565,0.995,0.000,"developmental process"),
c("GO:0040011","locomotion",3.285,4.1308,0.994,0.000,"locomotion"),
c("GO:0050896","response to stimulus",47.248,2.6364,0.997,0.000,"response to stimulus"),
c("GO:0051179","localization",18.927,1.6983,0.995,0.000,"localization"),
c("GO:0051239","regulation of multicellular organismal process",5.506,5.0000,0.916,0.000,"regulation of multicellular organismal process"),
c("GO:0065008","regulation of biological quality",7.337,2.2924,0.918,0.118,"regulation of multicellular organismal process"),
c("GO:0065007","biological regulation",51.216,2.8210,0.997,0.000,"biological regulation"),
c("GO:0016265","death",4.501,1.9735,0.963,0.030,"death"),
c("GO:0008283","cell proliferation",4.075,1.9133,0.963,0.030,"cell proliferation"),
c("GO:0000255","allantoin metabolic process",0.011,2.8477,0.936,0.034,"allantoin metabolism"),
c("GO:0046449","creatinine metabolic process",0.009,2.5544,0.896,0.578,"allantoin metabolism"),
c("GO:0072338","cellular lactam metabolic process",0.010,2.5544,0.898,0.582,"allantoin metabolism"),
c("GO:0006085","acetyl-CoA biosynthetic process",0.039,2.4089,0.929,0.059,"acetyl-CoA biosynthesis"),
c("GO:0050760","negative regulation of thymidylate synthase biosynthetic process",0.001,1.6588,0.899,0.142,"acetyl-CoA biosynthesis"),
c("GO:0050757","thymidylate synthase biosynthetic process",0.001,1.6588,0.971,0.143,"acetyl-CoA biosynthesis"),
c("GO:0006116","NADH oxidation",0.007,1.6588,0.895,0.576,"acetyl-CoA biosynthesis"),
c("GO:0019530","taurine metabolic process",0.021,2.3382,0.934,0.595,"acetyl-CoA biosynthesis"),
c("GO:0035633","maintenance of blood-brain barrier",0.002,1.6588,0.935,0.062,"maintenance of blood-brain barrier"),
c("GO:0006971","hypotonic response",0.022,2.3382,0.942,0.068,"hypotonic response"),
c("GO:0006952","defense response",3.096,2.2933,0.927,0.386,"hypotonic response"),
c("GO:0006954","inflammatory response",1.375,2.1993,0.924,0.592,"hypotonic response"),
c("GO:0006953","acute-phase response",0.088,1.6423,0.937,0.595,"hypotonic response"),
c("GO:0009611","response to wounding",2.056,2.0521,0.930,0.624,"hypotonic response"),
c("GO:0031638","zymogen activation",0.198,1.9197,0.961,0.069,"zymogen activation"),
c("GO:0010950","positive regulation of endopeptidase activity",0.231,1.6668,0.879,0.239,"zymogen activation"),
c("GO:0032074","negative regulation of nuclease activity",0.002,1.6588,0.871,0.403,"zymogen activation"),
c("GO:0072593","reactive oxygen species metabolic process",0.387,1.7875,0.943,0.075,"reactive oxygen species metabolism"),
c("GO:0006107","oxaloacetate metabolic process",0.027,3.1024,0.882,0.076,"oxaloacetate metabolism"),
c("GO:0044236","multicellular organismal metabolic process",0.220,2.6498,0.781,0.136,"oxaloacetate metabolism"),
c("GO:0003017","lymph circulation",0.001,1.6588,0.844,0.183,"oxaloacetate metabolism"),
c("GO:0046951","ketone body biosynthetic process",0.009,2.1688,0.892,0.198,"oxaloacetate metabolism"),
c("GO:0046950","cellular ketone body metabolic process",0.016,2.0287,0.901,0.204,"oxaloacetate metabolism"),
c("GO:0001974","blood vessel remodeling",0.109,1.8236,0.809,0.248,"oxaloacetate metabolism"),
c("GO:0032963","collagen metabolic process",0.183,2.3420,0.752,0.259,"oxaloacetate metabolism"),
c("GO:0042698","ovulation cycle",0.270,1.9431,0.792,0.260,"oxaloacetate metabolism"),
c("GO:0048771","tissue remodeling",0.384,2.5045,0.790,0.275,"oxaloacetate metabolism"),
c("GO:0042303","molting cycle",0.235,1.8072,0.798,0.276,"oxaloacetate metabolism"),
c("GO:0090130","tissue migration",0.371,2.1487,0.791,0.288,"oxaloacetate metabolism"),
c("GO:0048021","regulation of melanin biosynthetic process",0.005,1.6588,0.845,0.300,"oxaloacetate metabolism"),
c("GO:0001816","cytokine production",1.263,2.2660,0.768,0.323,"oxaloacetate metabolism"),
c("GO:0006549","isoleucine metabolic process",0.011,2.5544,0.884,0.398,"oxaloacetate metabolism"),
c("GO:0006101","citrate metabolic process",0.014,2.1688,0.890,0.403,"oxaloacetate metabolism"),
c("GO:0009081","branched-chain amino acid metabolic process",0.043,2.1765,0.877,0.485,"oxaloacetate metabolism"),
c("GO:0043648","dicarboxylic acid metabolic process",0.213,1.9718,0.868,0.496,"oxaloacetate metabolism"),
c("GO:0060707","trophoblast giant cell differentiation",0.031,1.7167,0.718,0.501,"oxaloacetate metabolism"),
c("GO:0006542","glutamine biosynthetic process",0.008,1.6588,0.876,0.529,"oxaloacetate metabolism"),
c("GO:0006600","creatine metabolic process",0.016,1.8074,0.883,0.549,"oxaloacetate metabolism"),
c("GO:0007566","embryo implantation",0.140,1.6017,0.733,0.562,"oxaloacetate metabolism"),
c("GO:0046545","development of primary female sexual characteristics",0.285,1.6607,0.724,0.574,"oxaloacetate metabolism"),
c("GO:0006090","pyruvate metabolic process",0.378,1.6847,0.863,0.587,"oxaloacetate metabolism"),
c("GO:0072577","endothelial cell apoptotic process",0.047,2.9172,0.879,0.079,"endothelial cell apoptotic process"),
c("GO:2000668","regulation of dendritic cell apoptotic process",0.011,2.5544,0.841,0.530,"endothelial cell apoptotic process"),
c("GO:0010941","regulation of cell death",3.315,2.5719,0.768,0.535,"endothelial cell apoptotic process"),
c("GO:2000351","regulation of endothelial cell apoptotic process",0.043,2.1085,0.828,0.576,"endothelial cell apoptotic process"),
c("GO:0097048","dendritic cell apoptotic process",0.011,2.5544,0.887,0.664,"endothelial cell apoptotic process"));

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
