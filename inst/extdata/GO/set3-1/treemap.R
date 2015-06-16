

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
revigo.data <- rbind(c("GO:0006695","cholesterol biosynthetic process",0.119,5.8861,0.854,0.000,"cholesterol biosynthesis"),
c("GO:0034477","U6 snRNA 3'-end processing",0.009,1.6486,0.904,0.127,"cholesterol biosynthesis"),
c("GO:0046108","uridine metabolic process",0.006,1.6486,0.889,0.209,"cholesterol biosynthesis"),
c("GO:0050993","dimethylallyl diphosphate metabolic process",0.002,1.6486,0.865,0.384,"cholesterol biosynthesis"),
c("GO:0050992","dimethylallyl diphosphate biosynthetic process",0.002,1.6486,0.849,0.487,"cholesterol biosynthesis"),
c("GO:0044283","small molecule biosynthetic process",1.120,2.6536,0.876,0.516,"cholesterol biosynthesis"),
c("GO:0045717","negative regulation of fatty acid biosynthetic process",0.018,1.8908,0.750,0.579,"cholesterol biosynthesis"),
c("GO:0042369","vitamin D catabolic process",0.006,1.6486,0.858,0.613,"cholesterol biosynthesis"),
c("GO:0008299","isoprenoid biosynthetic process",0.083,2.1481,0.836,0.614,"cholesterol biosynthesis"),
c("GO:0008610","lipid biosynthetic process",1.351,2.2457,0.856,0.659,"cholesterol biosynthesis"),
c("GO:0040007","growth",2.160,3.3768,0.994,0.000,"growth"),
c("GO:0036342","post-anal tail morphogenesis",0.032,4.3279,0.845,0.013,"post-anal tail morphogenesis"),
c("GO:0045599","negative regulation of fat cell differentiation",0.089,4.1739,0.688,0.236,"post-anal tail morphogenesis"),
c("GO:0072365","regulation of cellular ketone metabolic process by negative regulation of transcription from RNA polymerase II promoter",0.001,1.6486,0.800,0.255,"post-anal tail morphogenesis"),
c("GO:0048320","axial mesoderm formation",0.006,3.3010,0.824,0.297,"post-anal tail morphogenesis"),
c("GO:0042795","snRNA transcription from RNA polymerase II promoter",0.008,1.6486,0.890,0.298,"post-anal tail morphogenesis"),
c("GO:0002520","immune system development",1.845,3.4815,0.758,0.322,"post-anal tail morphogenesis"),
c("GO:0090130","tissue migration",0.371,1.5996,0.859,0.335,"post-anal tail morphogenesis"),
c("GO:0060035","notochord cell development",0.003,1.6486,0.793,0.353,"post-anal tail morphogenesis"),
c("GO:0021983","pituitary gland development",0.223,1.7967,0.789,0.414,"post-anal tail morphogenesis"),
c("GO:0055007","cardiac muscle cell differentiation",0.236,3.1739,0.712,0.416,"post-anal tail morphogenesis"),
c("GO:0061140","lung secretory cell differentiation",0.033,1.6486,0.766,0.432,"post-anal tail morphogenesis"),
c("GO:0061061","muscle structure development",1.451,1.5009,0.800,0.465,"post-anal tail morphogenesis"),
c("GO:0030099","myeloid cell differentiation",0.703,3.7212,0.674,0.467,"post-anal tail morphogenesis"),
c("GO:0048523","negative regulation of cellular process",7.863,2.4461,0.758,0.469,"post-anal tail morphogenesis"),
c("GO:0060010","Sertoli cell fate commitment",0.005,1.6486,0.790,0.475,"post-anal tail morphogenesis"),
c("GO:0048705","skeletal system morphogenesis",0.638,2.1101,0.766,0.482,"post-anal tail morphogenesis"),
c("GO:0021589","cerebellum structural organization",0.003,1.6486,0.834,0.483,"post-anal tail morphogenesis"),
c("GO:0001501","skeletal system development",1.209,2.0535,0.779,0.497,"post-anal tail morphogenesis"),
c("GO:0050793","regulation of developmental process",4.431,2.3468,0.739,0.498,"post-anal tail morphogenesis"),
c("GO:0021881","Wnt-activated signaling pathway involved in forebrain neuron fate commitment",0.001,1.6486,0.740,0.508,"post-anal tail morphogenesis"),
c("GO:0007498","mesoderm development",0.291,1.7172,0.823,0.511,"post-anal tail morphogenesis"),
c("GO:0048568","embryonic organ development",1.162,2.2652,0.753,0.513,"post-anal tail morphogenesis"),
c("GO:0009790","embryo development",2.628,1.5519,0.773,0.524,"post-anal tail morphogenesis"),
c("GO:0060707","trophoblast giant cell differentiation",0.031,1.6977,0.765,0.565,"post-anal tail morphogenesis"),
c("GO:0002040","sprouting angiogenesis",0.117,1.8831,0.792,0.579,"post-anal tail morphogenesis"),
c("GO:0014835","myoblast differentiation involved in skeletal muscle regeneration",0.006,1.6486,0.746,0.581,"post-anal tail morphogenesis"),
c("GO:0045650","negative regulation of macrophage differentiation",0.016,2.1487,0.658,0.588,"post-anal tail morphogenesis"),
c("GO:0060215","primitive hemopoiesis",0.016,2.3188,0.773,0.588,"post-anal tail morphogenesis"),
c("GO:0030222","eosinophil differentiation",0.007,1.6486,0.747,0.605,"post-anal tail morphogenesis"),
c("GO:0060976","coronary vasculature development",0.038,2.1487,0.798,0.621,"post-anal tail morphogenesis"),
c("GO:0030154","cell differentiation",8.015,2.3893,0.693,0.628,"post-anal tail morphogenesis"),
c("GO:0048318","axial mesoderm development",0.017,2.1487,0.851,0.631,"post-anal tail morphogenesis"),
c("GO:0060055","angiogenesis involved in wound healing",0.050,1.6977,0.750,0.649,"post-anal tail morphogenesis"),
c("GO:0035162","embryonic hemopoiesis",0.060,2.2204,0.753,0.652,"post-anal tail morphogenesis"),
c("GO:0002042","cell migration involved in sprouting angiogenesis",0.056,1.7967,0.732,0.654,"post-anal tail morphogenesis"),
c("GO:0016447","somatic recombination of immunoglobulin gene segments",0.131,1.6580,0.685,0.676,"post-anal tail morphogenesis"),
c("GO:0021577","hindbrain structural organization",0.003,1.6486,0.834,0.679,"post-anal tail morphogenesis"),
c("GO:0090136","epithelial cell-cell adhesion",0.050,1.7881,0.974,0.013,"epithelial cell-cell adhesion"),
c("GO:0046902","regulation of mitochondrial membrane permeability",0.125,4.0555,0.727,0.014,"regulation of mitochondrial membrane permeability"),
c("GO:0033037","polysaccharide localization",0.002,1.6486,0.962,0.155,"regulation of mitochondrial membrane permeability"),
c("GO:1902598","creatine transmembrane transport",0.008,1.6486,0.894,0.214,"regulation of mitochondrial membrane permeability"),
c("GO:0002934","desmosome organization",0.021,1.8908,0.876,0.241,"regulation of mitochondrial membrane permeability"),
c("GO:0032879","regulation of localization",4.330,1.5902,0.870,0.275,"regulation of mitochondrial membrane permeability"),
c("GO:0019050","suppression by virus of host apoptotic process",0.005,3.3010,0.754,0.290,"regulation of mitochondrial membrane permeability"),
c("GO:0030038","contractile actin filament bundle assembly",0.001,1.6486,0.878,0.310,"regulation of mitochondrial membrane permeability"),
c("GO:0070079","histone H4-R3 demethylation",0.001,1.6486,0.828,0.310,"regulation of mitochondrial membrane permeability"),
c("GO:0060154","cellular process regulating host cell cycle in response to virus",0.013,2.8297,0.823,0.314,"regulation of mitochondrial membrane permeability"),
c("GO:0070314","G1 to G0 transition",0.022,2.3188,0.924,0.364,"regulation of mitochondrial membrane permeability"),
c("GO:0051128","regulation of cellular component organization",3.835,3.3188,0.839,0.368,"regulation of mitochondrial membrane permeability"),
c("GO:0097037","heme export",0.002,1.6486,0.945,0.387,"regulation of mitochondrial membrane permeability"),
c("GO:0048872","homeostasis of number of cells",0.558,2.2147,0.871,0.408,"regulation of mitochondrial membrane permeability"),
c("GO:0071496","cellular response to external stimulus",0.549,2.4522,0.936,0.419,"regulation of mitochondrial membrane permeability"),
c("GO:0007589","body fluid secretion",0.269,1.5385,0.757,0.436,"regulation of mitochondrial membrane permeability"),
c("GO:0007005","mitochondrion organization",0.649,2.8539,0.865,0.441,"regulation of mitochondrial membrane permeability"),
c("GO:0042149","cellular response to glucose starvation",0.036,2.3809,0.817,0.453,"regulation of mitochondrial membrane permeability"),
c("GO:0044087","regulation of cellular component biogenesis",1.045,1.5964,0.850,0.463,"regulation of mitochondrial membrane permeability"),
c("GO:0006915","apoptotic process",4.058,2.7570,0.810,0.464,"regulation of mitochondrial membrane permeability"),
c("GO:0070077","histone arginine demethylation",0.001,1.6486,0.831,0.492,"regulation of mitochondrial membrane permeability"),
c("GO:0032456","endocytic recycling",0.038,1.4778,0.916,0.493,"regulation of mitochondrial membrane permeability"),
c("GO:0051130","positive regulation of cellular component organization",1.698,1.9190,0.800,0.499,"regulation of mitochondrial membrane permeability"),
c("GO:0060260","regulation of transcription initiation from RNA polymerase II promoter",0.027,1.6977,0.741,0.511,"regulation of mitochondrial membrane permeability"),
c("GO:0090110","cargo loading into COPII-coated vesicle",0.009,1.6486,0.820,0.529,"regulation of mitochondrial membrane permeability"),
c("GO:0070130","negative regulation of mitochondrial translation",0.001,1.6486,0.706,0.554,"regulation of mitochondrial membrane permeability"),
c("GO:0006839","mitochondrial transport",0.326,1.9759,0.904,0.579,"regulation of mitochondrial membrane permeability"),
c("GO:0051205","protein insertion into membrane",0.066,1.5369,0.862,0.603,"regulation of mitochondrial membrane permeability"),
c("GO:0006913","nucleocytoplasmic transport",0.827,1.5164,0.918,0.613,"regulation of mitochondrial membrane permeability"),
c("GO:1902589","single-organism organelle organization",5.234,2.2027,0.798,0.618,"regulation of mitochondrial membrane permeability"),
c("GO:0001894","tissue homeostasis",0.393,1.5485,0.766,0.619,"regulation of mitochondrial membrane permeability"),
c("GO:0006390","transcription from mitochondrial promoter",0.011,1.7881,0.773,0.635,"regulation of mitochondrial membrane permeability"),
c("GO:0033273","response to vitamin",0.267,1.5119,0.905,0.651,"regulation of mitochondrial membrane permeability"),
c("GO:0051894","positive regulation of focal adhesion assembly",0.038,1.4778,0.744,0.664,"regulation of mitochondrial membrane permeability"),
c("GO:0051169","nuclear transport",0.833,1.4868,0.922,0.673,"regulation of mitochondrial membrane permeability"),
c("GO:2000142","regulation of DNA-templated transcription, initiation",0.031,1.5441,0.742,0.673,"regulation of mitochondrial membrane permeability"),
c("GO:0034224","cellular response to zinc ion starvation",0.008,1.6486,0.833,0.674,"regulation of mitochondrial membrane permeability"),
c("GO:0010823","negative regulation of mitochondrion organization",0.043,3.1308,0.743,0.694,"regulation of mitochondrial membrane permeability"),
c("GO:0044531","modulation of programmed cell death in other organism",0.008,2.8297,0.780,0.695,"regulation of mitochondrial membrane permeability"),
c("GO:0016265","death",4.501,2.4522,0.968,0.019,"death"),
c("GO:0008283","cell proliferation",4.075,1.9851,0.968,0.030,"cell proliferation"),
c("GO:0071353","cellular response to interleukin-4",0.075,3.1308,0.868,0.030,"cellular response to interleukin-4"),
c("GO:0048012","hepatocyte growth factor receptor signaling pathway",0.021,2.3188,0.818,0.171,"cellular response to interleukin-4"),
c("GO:0038189","neuropilin signaling pathway",0.010,1.6486,0.830,0.249,"cellular response to interleukin-4"),
c("GO:0033554","cellular response to stress",3.483,2.3233,0.826,0.254,"cellular response to interleukin-4"),
c("GO:0042891","antibiotic transport",0.008,1.6486,0.901,0.268,"cellular response to interleukin-4"),
c("GO:0006984","ER-nucleus signaling pathway",0.141,1.8735,0.800,0.270,"cellular response to interleukin-4"),
c("GO:0002575","basophil chemotaxis",0.001,1.6486,0.835,0.297,"cellular response to interleukin-4"),
c("GO:0071247","cellular response to chromate",0.003,1.6486,0.888,0.315,"cellular response to interleukin-4"),
c("GO:1901421","positive regulation of response to alcohol",0.003,1.6486,0.879,0.329,"cellular response to interleukin-4"),
c("GO:0032933","SREBP signaling pathway",0.013,2.0092,0.706,0.372,"cellular response to interleukin-4"),
c("GO:0006991","response to sterol depletion",0.018,1.8908,0.933,0.384,"cellular response to interleukin-4"),
c("GO:0043627","response to estrogen",0.539,2.9469,0.924,0.423,"cellular response to interleukin-4"),
c("GO:0046690","response to tellurium ion",0.003,1.6486,0.946,0.443,"cellular response to interleukin-4"),
c("GO:0038190","VEGF-activated neuropilin signaling pathway",0.010,1.6486,0.803,0.460,"cellular response to interleukin-4"),
c("GO:0007165","signal transduction",16.054,2.0434,0.693,0.517,"cellular response to interleukin-4"),
c("GO:0031098","stress-activated protein kinase signaling cascade",0.435,2.1175,0.738,0.522,"cellular response to interleukin-4"),
c("GO:0048008","platelet-derived growth factor receptor signaling pathway",0.111,2.2652,0.797,0.532,"cellular response to interleukin-4"),
c("GO:1902680","positive regulation of RNA biosynthetic process",2.779,1.8041,0.658,0.552,"cellular response to interleukin-4"),
c("GO:0046687","response to chromate",0.003,1.6486,0.943,0.572,"cellular response to interleukin-4"),
c("GO:0070670","response to interleukin-4",0.091,2.8041,0.933,0.583,"cellular response to interleukin-4"),
c("GO:0014070","response to organic cyclic compound",2.318,1.9630,0.917,0.584,"cellular response to interleukin-4"),
c("GO:0097305","response to alcohol",0.774,1.5569,0.921,0.608,"cellular response to interleukin-4"),
c("GO:0080135","regulation of cellular response to stress",0.758,1.5771,0.751,0.628,"cellular response to interleukin-4"),
c("GO:0080134","regulation of response to stress",1.961,1.7153,0.840,0.630,"cellular response to interleukin-4"),
c("GO:0007166","cell surface receptor signaling pathway",8.919,1.6282,0.709,0.683,"cellular response to interleukin-4"),
c("GO:1900221","regulation of beta-amyloid clearance",0.007,1.6486,0.837,0.040,"regulation of beta-amyloid clearance"),
c("GO:0009645","response to low light intensity stimulus",0.003,1.6486,0.968,0.045,"response to low light intensity stimulus"),
c("GO:0018395","peptidyl-lysine hydroxylation to 5-hydroxy-L-lysine",0.001,1.6486,0.909,0.056,"peptidyl-lysine hydroxylation to 5-hydroxy-L-lysine"),
c("GO:0017185","peptidyl-lysine hydroxylation",0.001,1.6486,0.909,0.673,"peptidyl-lysine hydroxylation to 5-hydroxy-L-lysine"),
c("GO:0040008","regulation of growth",1.265,3.5086,0.887,0.059,"regulation of growth"),
c("GO:0051885","positive regulation of anagen",0.002,1.6486,0.753,0.498,"regulation of growth"),
c("GO:0045887","positive regulation of synaptic growth at neuromuscular junction",0.001,1.6486,0.649,0.611,"regulation of growth"),
c("GO:0048639","positive regulation of developmental growth",0.117,1.9201,0.730,0.675,"regulation of growth"),
c("GO:0042116","macrophage activation",0.146,2.6655,0.852,0.066,"macrophage activation"),
c("GO:0002828","regulation of type 2 immune response",0.070,2.4698,0.870,0.125,"macrophage activation"),
c("GO:0042092","type 2 immune response",0.083,2.2204,0.934,0.131,"macrophage activation"),
c("GO:0002825","regulation of T-helper 1 type immune response",0.039,1.8908,0.887,0.166,"macrophage activation"),
c("GO:0001770","establishment of natural killer cell polarity",0.001,1.6486,0.888,0.455,"macrophage activation"),
c("GO:0050864","regulation of B cell activation",0.201,2.2933,0.773,0.640,"macrophage activation"),
c("GO:0001775","cell activation",2.008,1.6914,0.895,0.083,"cell activation"),
c("GO:0007154","cell communication",17.535,1.6923,0.869,0.153,"cell activation"),
c("GO:0042325","regulation of phosphorylation",2.769,3.3372,0.703,0.088,"regulation of phosphorylation"),
c("GO:0048519","negative regulation of biological process",8.588,2.5143,0.902,0.116,"regulation of phosphorylation"),
c("GO:0051239","regulation of multicellular organismal process",5.506,2.4318,0.907,0.131,"regulation of phosphorylation"),
c("GO:0048518","positive regulation of biological process",28.712,2.3298,0.885,0.190,"regulation of phosphorylation"),
c("GO:0060904","regulation of protein folding in endoplasmic reticulum",0.001,1.6486,0.832,0.208,"regulation of phosphorylation"),
c("GO:0042127","regulation of cell proliferation",3.148,1.9855,0.796,0.250,"regulation of phosphorylation"),
c("GO:0002682","regulation of immune system process",21.361,1.6476,0.845,0.251,"regulation of phosphorylation"),
c("GO:0048583","regulation of response to stimulus",26.518,2.2291,0.864,0.273,"regulation of phosphorylation"),
c("GO:0032784","regulation of DNA-templated transcription, elongation",0.096,2.2161,0.786,0.296,"regulation of phosphorylation"),
c("GO:0048522","positive regulation of cellular process",8.548,1.8834,0.780,0.297,"regulation of phosphorylation"),
c("GO:0050789","regulation of biological process",49.744,1.7535,0.882,0.335,"regulation of phosphorylation"),
c("GO:0050794","regulation of cellular process",28.971,1.8703,0.859,0.337,"regulation of phosphorylation"),
c("GO:0051338","regulation of transferase activity",1.829,2.3696,0.807,0.375,"regulation of phosphorylation"),
c("GO:0010849","regulation of proton-transporting ATPase activity, rotational mechanism",0.001,1.6486,0.777,0.387,"regulation of phosphorylation"),
c("GO:2000299","negative regulation of Rho-dependent protein serine/threonine kinase activity",0.002,1.6486,0.770,0.406,"regulation of phosphorylation"),
c("GO:1900086","positive regulation of peptidyl-tyrosine autophosphorylation",0.003,1.6486,0.761,0.418,"regulation of phosphorylation"),
c("GO:0032793","positive regulation of CREB transcription factor activity",0.030,1.6169,0.786,0.430,"regulation of phosphorylation"),
c("GO:2000298","regulation of Rho-dependent protein serine/threonine kinase activity",0.002,1.6486,0.790,0.432,"regulation of phosphorylation"),
c("GO:0070345","negative regulation of fat cell proliferation",0.003,1.6486,0.854,0.447,"regulation of phosphorylation"),
c("GO:0090324","negative regulation of oxidative phosphorylation",0.002,1.6486,0.767,0.453,"regulation of phosphorylation"),
c("GO:0051174","regulation of phosphorus metabolic process",4.788,1.7610,0.734,0.470,"regulation of phosphorylation"),
c("GO:0009893","positive regulation of metabolic process",5.415,1.7009,0.800,0.477,"regulation of phosphorylation"),
c("GO:0007257","activation of JUN kinase activity",0.058,3.4559,0.623,0.525,"regulation of phosphorylation"),
c("GO:0023014","signal transduction by phosphorylation",1.554,1.8955,0.708,0.530,"regulation of phosphorylation"),
c("GO:0016310","phosphorylation",10.160,2.2692,0.844,0.541,"regulation of phosphorylation"),
c("GO:0002822","regulation of adaptive immune response based on somatic recombination of immune receptors built from immunoglobulin superfamily domains",19.145,1.4859,0.802,0.542,"regulation of phosphorylation"),
c("GO:1900034","regulation of cellular response to heat",0.003,1.6486,0.821,0.546,"regulation of phosphorylation"),
c("GO:0043616","keratinocyte proliferation",0.052,1.8474,0.963,0.558,"regulation of phosphorylation"),
c("GO:0006468","protein phosphorylation",5.136,2.4486,0.806,0.627,"regulation of phosphorylation"),
c("GO:1902533","positive regulation of intracellular signal transduction",1.490,2.0640,0.673,0.629,"regulation of phosphorylation"),
c("GO:0010837","regulation of keratinocyte proliferation",0.031,1.5441,0.855,0.629,"regulation of phosphorylation"),
c("GO:0051716","cellular response to stimulus",19.092,2.2958,0.895,0.089,"cellular response to stimulus"));

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
