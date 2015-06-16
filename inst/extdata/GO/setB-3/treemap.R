

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
revigo.data <- rbind(c("GO:0006071","glycerol metabolic process",0.052,5.1938,0.760,0.000,"glycerol metabolism"),
c("GO:0022904","respiratory electron transport chain",4.683,3.6383,0.763,0.184,"glycerol metabolism"),
c("GO:0009067","aspartate family amino acid biosynthetic process",0.060,3.1079,0.648,0.231,"glycerol metabolism"),
c("GO:0042180","cellular ketone metabolic process",0.444,1.7737,0.768,0.270,"glycerol metabolism"),
c("GO:0044711","single-organism biosynthetic process",4.776,2.2765,0.785,0.320,"glycerol metabolism"),
c("GO:0006390","transcription from mitochondrial promoter",0.011,1.5053,0.759,0.351,"glycerol metabolism"),
c("GO:0044281","small molecule metabolic process",13.539,3.9208,0.800,0.388,"glycerol metabolism"),
c("GO:0006106","fumarate metabolic process",0.003,1.9780,0.776,0.389,"glycerol metabolism"),
c("GO:1901566","organonitrogen compound biosynthetic process",2.941,1.7167,0.797,0.409,"glycerol metabolism"),
c("GO:0009123","nucleoside monophosphate metabolic process",5.669,1.6882,0.670,0.417,"glycerol metabolism"),
c("GO:0055114","oxidation-reduction process",10.933,2.5498,0.805,0.464,"glycerol metabolism"),
c("GO:0006122","mitochondrial electron transport, ubiquinol to cytochrome c",0.014,1.7577,0.768,0.474,"glycerol metabolism"),
c("GO:1901659","glycosyl compound biosynthetic process",1.506,2.4202,0.702,0.499,"glycerol metabolism"),
c("GO:0043648","dicarboxylic acid metabolic process",0.213,1.7140,0.736,0.508,"glycerol metabolism"),
c("GO:0006094","gluconeogenesis",0.180,3.1805,0.731,0.555,"glycerol metabolism"),
c("GO:0070584","mitochondrion morphogenesis",0.046,1.3485,0.723,0.597,"glycerol metabolism"),
c("GO:0072522","purine-containing compound biosynthetic process",1.805,1.9516,0.729,0.599,"glycerol metabolism"),
c("GO:0044262","cellular carbohydrate metabolic process",0.802,2.4750,0.856,0.607,"glycerol metabolism"),
c("GO:0006538","glutamate catabolic process",0.010,1.6792,0.733,0.631,"glycerol metabolism"),
c("GO:0016051","carbohydrate biosynthetic process",0.513,1.9606,0.717,0.670,"glycerol metabolism"),
c("GO:0009066","aspartate family amino acid metabolic process",0.105,2.3990,0.716,0.686,"glycerol metabolism"),
c("GO:0043102","amino acid salvage",0.019,1.7577,0.692,0.698,"glycerol metabolism"),
c("GO:0007157","heterophilic cell-cell adhesion via plasma membrane cell adhesion molecules",0.084,2.8539,0.992,0.000,"heterophilic cell-cell adhesion via plasma membrane cell adhesion molecules"),
c("GO:0031427","response to methotrexate",0.011,2.1530,0.965,0.000,"response to methotrexate"),
c("GO:0014070","response to organic cyclic compound",2.318,1.8687,0.957,0.408,"response to methotrexate"),
c("GO:0032354","response to follicle-stimulating hormone",0.041,1.5053,0.962,0.454,"response to methotrexate"),
c("GO:0009636","response to toxic substance",0.330,1.3670,0.965,0.471,"response to methotrexate"),
c("GO:0048545","response to steroid hormone",1.316,1.5607,0.953,0.648,"response to methotrexate"),
c("GO:0033993","response to lipid",2.113,1.3040,0.957,0.688,"response to methotrexate"),
c("GO:0060043","regulation of cardiac muscle cell proliferation",0.096,2.8013,0.573,0.029,"regulation of cardiac muscle cell proliferation"),
c("GO:0010694","positive regulation of alkaline phosphatase activity",0.025,1.8539,0.854,0.115,"regulation of cardiac muscle cell proliferation"),
c("GO:0006104","succinyl-CoA metabolic process",0.010,1.7577,0.862,0.165,"regulation of cardiac muscle cell proliferation"),
c("GO:0042506","tyrosine phosphorylation of Stat5 protein",0.050,1.5556,0.824,0.182,"regulation of cardiac muscle cell proliferation"),
c("GO:0030518","intracellular steroid hormone receptor signaling pathway",0.228,1.4190,0.867,0.224,"regulation of cardiac muscle cell proliferation"),
c("GO:0036304","umbilical cord morphogenesis",0.005,2.4535,0.816,0.225,"regulation of cardiac muscle cell proliferation"),
c("GO:0061027","umbilical cord development",0.005,2.4535,0.843,0.225,"regulation of cardiac muscle cell proliferation"),
c("GO:0035584","calcium-mediated signaling using intracellular calcium source",0.018,1.4196,0.883,0.311,"regulation of cardiac muscle cell proliferation"),
c("GO:0048864","stem cell development",0.713,2.7122,0.680,0.321,"regulation of cardiac muscle cell proliferation"),
c("GO:0086067","AV node cell to bundle of His cell communication",0.007,1.9780,0.773,0.331,"regulation of cardiac muscle cell proliferation"),
c("GO:0060343","trabecula formation",0.062,2.7033,0.722,0.337,"regulation of cardiac muscle cell proliferation"),
c("GO:0060033","anatomical structure regression",0.032,1.6130,0.795,0.343,"regulation of cardiac muscle cell proliferation"),
c("GO:0014898","cardiac muscle hypertrophy in response to stress",0.032,1.7577,0.807,0.343,"regulation of cardiac muscle cell proliferation"),
c("GO:2000678","negative regulation of transcription regulatory region DNA binding",0.136,1.5556,0.963,0.350,"regulation of cardiac muscle cell proliferation"),
c("GO:0006979","response to oxidative stress",0.874,1.4376,0.971,0.359,"regulation of cardiac muscle cell proliferation"),
c("GO:0007568","aging",0.730,1.7737,0.781,0.360,"regulation of cardiac muscle cell proliferation"),
c("GO:0061383","trabecula morphogenesis",0.095,2.3675,0.781,0.368,"regulation of cardiac muscle cell proliferation"),
c("GO:0007506","gonadal mesoderm development",0.009,2.4535,0.743,0.374,"regulation of cardiac muscle cell proliferation"),
c("GO:0000185","activation of MAPKKK activity",0.013,1.6130,0.797,0.380,"regulation of cardiac muscle cell proliferation"),
c("GO:0045607","regulation of auditory receptor cell differentiation",0.009,1.9780,0.688,0.405,"regulation of cardiac muscle cell proliferation"),
c("GO:0007340","acrosome reaction",0.056,1.3485,0.862,0.418,"regulation of cardiac muscle cell proliferation"),
c("GO:0007605","sensory perception of sound",0.268,1.5572,0.804,0.433,"regulation of cardiac muscle cell proliferation"),
c("GO:0050793","regulation of developmental process",4.431,1.4685,0.755,0.441,"regulation of cardiac muscle cell proliferation"),
c("GO:0035912","dorsal aorta morphogenesis",0.013,1.9780,0.704,0.465,"regulation of cardiac muscle cell proliferation"),
c("GO:0090129","positive regulation of synapse maturation",0.027,1.7577,0.678,0.469,"regulation of cardiac muscle cell proliferation"),
c("GO:0001829","trophectodermal cell differentiation",0.052,1.3826,0.714,0.477,"regulation of cardiac muscle cell proliferation"),
c("GO:0060842","arterial endothelial cell differentiation",0.015,1.9780,0.673,0.478,"regulation of cardiac muscle cell proliferation"),
c("GO:0048863","stem cell differentiation",0.847,2.3726,0.711,0.478,"regulation of cardiac muscle cell proliferation"),
c("GO:0045672","positive regulation of osteoclast differentiation",0.046,1.3826,0.681,0.483,"regulation of cardiac muscle cell proliferation"),
c("GO:0033002","muscle cell proliferation",0.345,1.5572,0.948,0.487,"regulation of cardiac muscle cell proliferation"),
c("GO:2000722","regulation of cardiac vascular smooth muscle cell differentiation",0.002,2.4535,0.637,0.490,"regulation of cardiac muscle cell proliferation"),
c("GO:1900744","regulation of p38MAPK cascade",0.018,1.5556,0.791,0.493,"regulation of cardiac muscle cell proliferation"),
c("GO:0007530","sex determination",0.126,1.3826,0.805,0.501,"regulation of cardiac muscle cell proliferation"),
c("GO:0060575","intestinal epithelial cell differentiation",0.032,1.5556,0.714,0.507,"regulation of cardiac muscle cell proliferation"),
c("GO:0007271","synaptic transmission, cholinergic",0.054,1.6130,0.899,0.516,"regulation of cardiac muscle cell proliferation"),
c("GO:0003150","muscular septum morphogenesis",0.008,1.8539,0.696,0.528,"regulation of cardiac muscle cell proliferation"),
c("GO:0001546","preantral ovarian follicle growth",0.003,2.4535,0.732,0.530,"regulation of cardiac muscle cell proliferation"),
c("GO:0001880","Mullerian duct regression",0.011,1.8539,0.771,0.533,"regulation of cardiac muscle cell proliferation"),
c("GO:0003175","tricuspid valve development",0.013,2.1530,0.689,0.543,"regulation of cardiac muscle cell proliferation"),
c("GO:0008354","germ cell migration",0.035,1.6792,0.771,0.549,"regulation of cardiac muscle cell proliferation"),
c("GO:0061314","Notch signaling involved in heart development",0.016,1.6130,0.654,0.551,"regulation of cardiac muscle cell proliferation"),
c("GO:0061099","negative regulation of protein tyrosine kinase activity",0.024,1.3170,0.829,0.556,"regulation of cardiac muscle cell proliferation"),
c("GO:2001212","regulation of vasculogenesis",0.023,1.5556,0.639,0.578,"regulation of cardiac muscle cell proliferation"),
c("GO:0006744","ubiquinone biosynthetic process",0.031,1.4603,0.720,0.582,"regulation of cardiac muscle cell proliferation"),
c("GO:0060976","coronary vasculature development",0.038,1.6792,0.681,0.583,"regulation of cardiac muscle cell proliferation"),
c("GO:0051960","regulation of nervous system development",1.545,1.4499,0.667,0.583,"regulation of cardiac muscle cell proliferation"),
c("GO:0035265","organ growth",0.300,1.6876,0.794,0.588,"regulation of cardiac muscle cell proliferation"),
c("GO:0048869","cellular developmental process",8.570,1.3508,0.675,0.635,"regulation of cardiac muscle cell proliferation"),
c("GO:0038066","p38MAPK cascade",0.022,1.5053,0.799,0.637,"regulation of cardiac muscle cell proliferation"),
c("GO:2000820","negative regulation of transcription from RNA polymerase II promoter involved in smooth muscle cell differentiation",0.005,2.4535,0.653,0.643,"regulation of cardiac muscle cell proliferation"),
c("GO:0022605","oogenesis stage",0.010,1.9780,0.734,0.656,"regulation of cardiac muscle cell proliferation"),
c("GO:0090500","endocardial cushion to mesenchymal transition",0.008,1.8539,0.637,0.658,"regulation of cardiac muscle cell proliferation"),
c("GO:0035051","cardiocyte differentiation",0.283,1.7007,0.603,0.675,"regulation of cardiac muscle cell proliferation"),
c("GO:0050954","sensory perception of mechanical stimulus",0.316,1.4848,0.802,0.682,"regulation of cardiac muscle cell proliferation"),
c("GO:0060074","synapse maturation",0.047,1.4603,0.719,0.685,"regulation of cardiac muscle cell proliferation"),
c("GO:0003214","cardiac left ventricle morphogenesis",0.031,1.7577,0.673,0.696,"regulation of cardiac muscle cell proliferation"),
c("GO:0007005","mitochondrion organization",0.649,1.9694,0.914,0.035,"mitochondrion organization"),
c("GO:0030036","actin cytoskeleton organization",1.465,1.4808,0.855,0.533,"mitochondrion organization"),
c("GO:0055089","fatty acid homeostasis",0.017,1.6130,0.963,0.042,"fatty acid homeostasis"),
c("GO:0045780","positive regulation of bone resorption",0.030,1.4603,0.798,0.395,"fatty acid homeostasis"),
c("GO:0010669","epithelial structure maintenance",0.027,1.4196,0.828,0.676,"fatty acid homeostasis"),
c("GO:0046629","gamma-delta T cell activation",0.048,1.6130,0.911,0.057,"gamma-delta T cell activation"),
c("GO:0042119","neutrophil activation",0.046,1.3170,0.912,0.532,"gamma-delta T cell activation"),
c("GO:0006801","superoxide metabolic process",0.140,2.3675,0.917,0.071,"superoxide metabolism"),
c("GO:1902600","hydrogen ion transmembrane transport",3.156,4.3872,0.824,0.079,"hydrogen ion transmembrane transport"),
c("GO:0030029","actin filament-based process",1.610,1.3106,0.889,0.114,"hydrogen ion transmembrane transport"),
c("GO:0010621","negative regulation of transcription by transcription factor localization",0.003,1.9780,0.813,0.196,"hydrogen ion transmembrane transport"),
c("GO:0010667","negative regulation of cardiac muscle cell apoptotic process",0.022,1.7577,0.859,0.250,"hydrogen ion transmembrane transport"),
c("GO:0015851","nucleobase transport",0.008,1.7577,0.939,0.268,"hydrogen ion transmembrane transport"),
c("GO:0070633","transepithelial transport",0.058,1.6130,0.936,0.317,"hydrogen ion transmembrane transport"),
c("GO:0015742","alpha-ketoglutarate transport",0.002,2.4535,0.939,0.333,"hydrogen ion transmembrane transport"),
c("GO:2000143","negative regulation of DNA-templated transcription, initiation",0.003,1.9780,0.805,0.364,"hydrogen ion transmembrane transport"),
c("GO:0006839","mitochondrial transport",0.326,1.9427,0.922,0.376,"hydrogen ion transmembrane transport"),
c("GO:0006863","purine nucleobase transport",0.006,1.8539,0.936,0.405,"hydrogen ion transmembrane transport"),
c("GO:0006818","hydrogen transport",3.252,3.9586,0.913,0.502,"hydrogen ion transmembrane transport"),
c("GO:0042776","mitochondrial ATP synthesis coupled proton transport",0.018,2.9706,0.673,0.550,"hydrogen ion transmembrane transport"),
c("GO:2000142","regulation of DNA-templated transcription, initiation",0.031,1.3826,0.798,0.597,"hydrogen ion transmembrane transport"),
c("GO:1901029","negative regulation of mitochondrial outer membrane permeabilization involved in apoptotic signaling pathway",0.006,1.8539,0.805,0.621,"hydrogen ion transmembrane transport"),
c("GO:0015988","energy coupled proton transmembrane transport, against electrochemical gradient",0.152,4.1135,0.863,0.667,"hydrogen ion transmembrane transport"),
c("GO:0015991","ATP hydrolysis coupled proton transport",0.152,4.1135,0.863,0.667,"hydrogen ion transmembrane transport"),
c("GO:0072593","reactive oxygen species metabolic process",0.387,1.3754,0.910,0.083,"reactive oxygen species metabolism"),
c("GO:0006091","generation of precursor metabolites and energy",6.571,3.2218,0.884,0.121,"reactive oxygen species metabolism"),
c("GO:0044710","single-organism metabolic process",26.477,1.7247,0.908,0.135,"reactive oxygen species metabolism"),
c("GO:0044763","single-organism cellular process",45.302,1.5972,0.907,0.098,"single-organism cellular process"));

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
