

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
revigo.data <- rbind(c("GO:0006953","acute-phase response",0.088,2.4510,0.974,0.000,"acute-phase response"),
c("GO:0022904","respiratory electron transport chain",4.683,20.2757,0.731,0.000,"respiratory electron transport chain"),
c("GO:0046835","carbohydrate phosphorylation",0.161,1.5074,0.850,0.105,"respiratory electron transport chain"),
c("GO:0072593","reactive oxygen species metabolic process",0.387,1.5123,0.897,0.116,"respiratory electron transport chain"),
c("GO:0044710","single-organism metabolic process",26.477,1.9158,0.905,0.124,"respiratory electron transport chain"),
c("GO:1902600","hydrogen ion transmembrane transport",3.156,5.1249,0.730,0.133,"respiratory electron transport chain"),
c("GO:0006091","generation of precursor metabolites and energy",6.571,11.7447,0.867,0.173,"respiratory electron transport chain"),
c("GO:0044242","cellular lipid catabolic process",0.310,2.2190,0.772,0.221,"respiratory electron transport chain"),
c("GO:0015893","drug transport",0.060,1.4203,0.832,0.318,"respiratory electron transport chain"),
c("GO:0048488","synaptic vesicle endocytosis",0.072,1.6676,0.770,0.323,"respiratory electron transport chain"),
c("GO:0046386","deoxyribose phosphate catabolic process",0.023,1.3409,0.826,0.342,"respiratory electron transport chain"),
c("GO:0055114","oxidation-reduction process",10.933,10.2366,0.806,0.370,"respiratory electron transport chain"),
c("GO:0010507","negative regulation of autophagy",0.068,1.3409,0.824,0.383,"respiratory electron transport chain"),
c("GO:0045947","negative regulation of translational initiation",0.028,1.3409,0.810,0.412,"respiratory electron transport chain"),
c("GO:0006817","phosphate ion transport",0.062,2.1267,0.865,0.434,"respiratory electron transport chain"),
c("GO:0032276","regulation of gonadotropin secretion",0.014,1.5706,0.630,0.445,"respiratory electron transport chain"),
c("GO:0051608","histamine transport",0.036,1.5706,0.866,0.457,"respiratory electron transport chain"),
c("GO:0044281","small molecule metabolic process",13.539,3.9208,0.801,0.464,"respiratory electron transport chain"),
c("GO:0006122","mitochondrial electron transport, ubiquinol to cytochrome c",0.014,1.5706,0.755,0.474,"respiratory electron transport chain"),
c("GO:0034755","iron ion transmembrane transport",0.022,1.7762,0.813,0.488,"respiratory electron transport chain"),
c("GO:0006818","hydrogen transport",3.252,4.6021,0.840,0.502,"respiratory electron transport chain"),
c("GO:0045117","azole transport",0.055,1.4103,0.907,0.504,"respiratory electron transport chain"),
c("GO:1901021","positive regulation of calcium ion transmembrane transporter activity",0.035,2.0173,0.762,0.509,"respiratory electron transport chain"),
c("GO:0042776","mitochondrial ATP synthesis coupled proton transport",0.018,2.2388,0.634,0.550,"respiratory electron transport chain"),
c("GO:0006099","tricarboxylic acid cycle",0.104,2.5346,0.808,0.550,"respiratory electron transport chain"),
c("GO:0000041","transition metal ion transport",0.287,2.3439,0.850,0.558,"respiratory electron transport chain"),
c("GO:0055085","transmembrane transport",7.528,4.2076,0.741,0.575,"respiratory electron transport chain"),
c("GO:0051645","Golgi localization",0.022,1.4103,0.912,0.599,"respiratory electron transport chain"),
c("GO:0016042","lipid catabolic process",0.537,1.9477,0.806,0.608,"respiratory electron transport chain"),
c("GO:0019217","regulation of fatty acid metabolic process",0.148,2.1096,0.687,0.609,"respiratory electron transport chain"),
c("GO:0034440","lipid oxidation",0.158,1.3817,0.781,0.612,"respiratory electron transport chain"),
c("GO:0035435","phosphate ion transmembrane transport",0.023,1.5706,0.818,0.612,"respiratory electron transport chain"),
c("GO:0051234","establishment of localization",16.610,1.3306,0.863,0.616,"respiratory electron transport chain"),
c("GO:0015698","inorganic anion transport",0.768,1.4148,0.837,0.651,"respiratory electron transport chain"),
c("GO:0072329","monocarboxylic acid catabolic process",0.172,1.9796,0.721,0.662,"respiratory electron transport chain"),
c("GO:0030258","lipid modification",0.468,1.6253,0.784,0.672,"respiratory electron transport chain"),
c("GO:0006811","ion transport",7.803,3.9586,0.824,0.673,"respiratory electron transport chain"),
c("GO:0019752","carboxylic acid metabolic process",2.886,1.6047,0.679,0.681,"respiratory electron transport chain"),
c("GO:0046488","phosphatidylinositol metabolic process",0.472,1.3521,0.738,0.698,"respiratory electron transport chain"),
c("GO:0019086","late viral transcription",0.002,2.5229,0.865,0.073,"late viral transcription"),
c("GO:0018196","peptidyl-asparagine modification",0.114,2.3883,0.881,0.116,"late viral transcription"),
c("GO:0043603","cellular amide metabolic process",0.480,2.4647,0.859,0.128,"late viral transcription"),
c("GO:0043096","purine nucleobase salvage",0.008,2.0615,0.752,0.174,"late viral transcription"),
c("GO:0034982","mitochondrial protein processing",0.021,1.4103,0.890,0.233,"late viral transcription"),
c("GO:0019674","NAD metabolic process",0.099,1.8294,0.746,0.261,"late viral transcription"),
c("GO:0010388","cullin deneddylation",0.010,1.5706,0.896,0.262,"late viral transcription"),
c("GO:0042180","cellular ketone metabolic process",0.444,1.6402,0.764,0.280,"late viral transcription"),
c("GO:0006518","peptide metabolic process",0.350,1.5314,0.834,0.299,"late viral transcription"),
c("GO:0006526","arginine biosynthetic process",0.019,2.0615,0.724,0.381,"late viral transcription"),
c("GO:0006101","citrate metabolic process",0.014,1.4103,0.785,0.395,"late viral transcription"),
c("GO:0072350","tricarboxylic acid metabolic process",0.051,1.5074,0.766,0.427,"late viral transcription"),
c("GO:0018202","peptidyl-histidine modification",0.025,1.4103,0.892,0.480,"late viral transcription"),
c("GO:0009081","branched-chain amino acid metabolic process",0.043,1.8294,0.757,0.501,"late viral transcription"),
c("GO:0018279","protein N-linked glycosylation via asparagine",0.113,1.9674,0.755,0.533,"late viral transcription"),
c("GO:0022417","protein maturation by protein folding",0.015,1.4103,0.892,0.555,"late viral transcription"),
c("GO:0006534","cysteine metabolic process",0.018,1.7762,0.756,0.571,"late viral transcription"),
c("GO:1901659","glycosyl compound biosynthetic process",1.506,1.5995,0.719,0.622,"late viral transcription"),
c("GO:0002335","mature B cell differentiation",0.023,3.2840,0.815,0.076,"mature B cell differentiation"),
c("GO:0003012","muscle system process",0.830,2.3947,0.784,0.244,"mature B cell differentiation"),
c("GO:0032692","negative regulation of interleukin-1 production",0.027,2.3125,0.826,0.247,"mature B cell differentiation"),
c("GO:0050879","multicellular organismal movement",0.145,1.6676,0.868,0.283,"mature B cell differentiation"),
c("GO:0060088","auditory receptor cell stereocilium organization",0.022,2.0615,0.785,0.287,"mature B cell differentiation"),
c("GO:0022602","ovulation cycle process",0.243,1.4165,0.863,0.289,"mature B cell differentiation"),
c("GO:0031529","ruffle organization",0.066,1.3440,0.872,0.444,"mature B cell differentiation"),
c("GO:0003071","renal system process involved in regulation of systemic arterial blood pressure",0.048,1.3409,0.748,0.487,"mature B cell differentiation"),
c("GO:1900165","negative regulation of interleukin-6 secretion",0.007,2.0615,0.726,0.501,"mature B cell differentiation"),
c("GO:0022011","myelination in peripheral nervous system",0.095,2.0173,0.642,0.515,"mature B cell differentiation"),
c("GO:0060373","regulation of ventricular cardiac muscle cell membrane depolarization",0.011,1.4103,0.821,0.567,"mature B cell differentiation"),
c("GO:0032823","regulation of natural killer cell differentiation",0.024,1.8315,0.769,0.587,"mature B cell differentiation"),
c("GO:0008585","female gonad development",0.277,1.3151,0.848,0.589,"mature B cell differentiation"),
c("GO:0006936","muscle contraction",0.724,2.0975,0.749,0.623,"mature B cell differentiation"),
c("GO:0051881","regulation of mitochondrial membrane potential",0.095,1.7124,0.854,0.653,"mature B cell differentiation"),
c("GO:0086019","cell-cell signaling involved in cardiac conduction",0.031,1.7109,0.679,0.690,"mature B cell differentiation"),
c("GO:0002313","mature B cell differentiation involved in immune response",0.016,2.5376,0.816,0.692,"mature B cell differentiation"),
c("GO:0097050","type B pancreatic cell apoptotic process",0.027,1.5706,0.907,0.077,"type B pancreatic cell apoptotic process"),
c("GO:0032006","regulation of TOR signaling",0.103,3.0555,0.803,0.087,"regulation of TOR signaling"),
c("GO:0033632","regulation of cell-cell adhesion mediated by integrin",0.011,1.7762,0.909,0.110,"regulation of TOR signaling"),
c("GO:0034315","regulation of Arp2/3 complex-mediated actin nucleation",0.015,2.1267,0.750,0.112,"regulation of TOR signaling"),
c("GO:0000432","positive regulation of transcription from RNA polymerase II promoter by glucose",0.007,2.0615,0.709,0.244,"regulation of TOR signaling"),
c("GO:0010452","histone H3-K36 methylation",0.011,1.4103,0.814,0.312,"regulation of TOR signaling"),
c("GO:0042391","regulation of membrane potential",1.008,1.9296,0.865,0.361,"regulation of TOR signaling"),
c("GO:0031929","TOR signaling",0.133,3.1249,0.811,0.373,"regulation of TOR signaling"),
c("GO:0045880","positive regulation of smoothened signaling pathway",0.077,2.0173,0.798,0.380,"regulation of TOR signaling"),
c("GO:0033143","regulation of intracellular steroid hormone receptor signaling pathway",0.098,1.8979,0.810,0.386,"regulation of TOR signaling"),
c("GO:0070272","proton-transporting ATP synthase complex biogenesis",0.007,2.0615,0.948,0.387,"regulation of TOR signaling"),
c("GO:0071417","cellular response to organonitrogen compound",1.122,1.9215,0.822,0.391,"regulation of TOR signaling"),
c("GO:0043491","protein kinase B signaling",0.280,1.6605,0.801,0.404,"regulation of TOR signaling"),
c("GO:0030509","BMP signaling pathway",0.343,1.3151,0.709,0.417,"regulation of TOR signaling"),
c("GO:1902745","positive regulation of lamellipodium organization",0.027,1.8315,0.830,0.471,"regulation of TOR signaling"),
c("GO:0051896","regulation of protein kinase B signaling",0.222,2.1226,0.792,0.489,"regulation of TOR signaling"),
c("GO:0043461","proton-transporting ATP synthase complex assembly",0.007,2.0615,0.939,0.489,"regulation of TOR signaling"),
c("GO:0070071","proton-transporting two-sector ATPase complex assembly",0.009,1.7762,0.939,0.497,"regulation of TOR signaling"),
c("GO:0019725","cellular homeostasis",1.642,1.7075,0.776,0.556,"regulation of TOR signaling"),
c("GO:0046716","muscle cell cellular homeostasis",0.112,1.6036,0.815,0.609,"regulation of TOR signaling"),
c("GO:0007584","response to nutrient",0.548,1.5429,0.899,0.609,"regulation of TOR signaling"),
c("GO:0006879","cellular iron ion homeostasis",0.185,1.3752,0.807,0.638,"regulation of TOR signaling"),
c("GO:0042592","homeostatic process",3.235,1.3482,0.852,0.642,"regulation of TOR signaling"),
c("GO:1901701","cellular response to oxygen-containing compound",1.893,1.5070,0.828,0.651,"regulation of TOR signaling"),
c("GO:0071313","cellular response to caffeine",0.021,1.5706,0.863,0.671,"regulation of TOR signaling"),
c("GO:0071415","cellular response to purine-containing compound",0.021,1.5706,0.863,0.671,"regulation of TOR signaling"),
c("GO:0042743","hydrogen peroxide metabolic process",0.089,1.3440,0.908,0.099,"hydrogen peroxide metabolism"));

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
