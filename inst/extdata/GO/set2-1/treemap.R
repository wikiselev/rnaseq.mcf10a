

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
revigo.data <- rbind(c("GO:0002478","antigen processing and presentation of exogenous peptide antigen",0.296,1.8811,0.966,0.000,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0019884","antigen processing and presentation of exogenous antigen",0.303,1.8425,0.975,0.181,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0002474","antigen processing and presentation of peptide antigen via MHC class I",19.037,2.4815,0.967,0.357,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0048002","antigen processing and presentation of peptide antigen",19.164,1.6633,0.968,0.635,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0022904","respiratory electron transport chain",4.683,7.5528,0.792,0.000,"respiratory electron transport chain"),
c("GO:0044763","single-organism cellular process",45.302,1.5361,0.922,0.108,"respiratory electron transport chain"),
c("GO:0043603","cellular amide metabolic process",0.480,1.6338,0.880,0.119,"respiratory electron transport chain"),
c("GO:0032920","putrescine acetylation",0.001,1.6012,0.874,0.123,"respiratory electron transport chain"),
c("GO:0044710","single-organism metabolic process",26.477,1.6377,0.919,0.124,"respiratory electron transport chain"),
c("GO:0051186","cofactor metabolic process",0.798,1.8817,0.905,0.127,"respiratory electron transport chain"),
c("GO:0009056","catabolic process",7.851,1.4342,0.939,0.141,"respiratory electron transport chain"),
c("GO:0044598","doxorubicin metabolic process",0.009,4.8861,0.783,0.158,"respiratory electron transport chain"),
c("GO:0006091","generation of precursor metabolites and energy",6.571,6.7696,0.886,0.173,"respiratory electron transport chain"),
c("GO:0008207","C21-steroid hormone metabolic process",0.049,4.2076,0.790,0.183,"respiratory electron transport chain"),
c("GO:0019748","secondary metabolic process",0.100,2.4935,0.894,0.196,"respiratory electron transport chain"),
c("GO:0006081","cellular aldehyde metabolic process",0.106,1.4940,0.864,0.197,"respiratory electron transport chain"),
c("GO:0042180","cellular ketone metabolic process",0.444,3.8861,0.810,0.235,"respiratory electron transport chain"),
c("GO:0016137","glycoside metabolic process",0.030,3.3768,0.877,0.259,"respiratory electron transport chain"),
c("GO:1901564","organonitrogen compound metabolic process",11.844,1.4735,0.868,0.261,"respiratory electron transport chain"),
c("GO:0032471","negative regulation of endoplasmic reticulum calcium ion concentration",0.021,1.9183,0.892,0.300,"respiratory electron transport chain"),
c("GO:0032312","regulation of ARF GTPase activity",0.142,2.6308,0.668,0.308,"respiratory electron transport chain"),
c("GO:0009308","amine metabolic process",0.369,1.9606,0.872,0.309,"respiratory electron transport chain"),
c("GO:0035563","positive regulation of chromatin binding",0.008,1.6012,0.948,0.326,"respiratory electron transport chain"),
c("GO:0051881","regulation of mitochondrial membrane potential",0.095,3.1612,0.932,0.332,"respiratory electron transport chain"),
c("GO:0019388","galactose catabolic process",0.011,2.2262,0.849,0.349,"respiratory electron transport chain"),
c("GO:0009111","vitamin catabolic process",0.014,1.3057,0.797,0.353,"respiratory electron transport chain"),
c("GO:0055114","oxidation-reduction process",10.933,8.5850,0.843,0.370,"respiratory electron transport chain"),
c("GO:0072395","signal transduction involved in cell cycle checkpoint",0.114,1.9910,0.786,0.378,"respiratory electron transport chain"),
c("GO:0019752","carboxylic acid metabolic process",2.886,3.1739,0.742,0.386,"respiratory electron transport chain"),
c("GO:0048385","regulation of retinoic acid receptor signaling pathway",0.073,1.6087,0.864,0.387,"respiratory electron transport chain"),
c("GO:0016115","terpenoid catabolic process",0.007,2.7352,0.796,0.389,"respiratory electron transport chain"),
c("GO:0019402","galactitol metabolic process",0.005,1.6012,0.834,0.403,"respiratory electron transport chain"),
c("GO:0006682","galactosylceramide biosynthetic process",0.017,1.6012,0.773,0.411,"respiratory electron transport chain"),
c("GO:0051351","positive regulation of ligase activity",0.109,2.2865,0.862,0.417,"respiratory electron transport chain"),
c("GO:0051340","regulation of ligase activity",0.133,2.0106,0.888,0.424,"respiratory electron transport chain"),
c("GO:2001170","negative regulation of ATP biosynthetic process",0.002,1.3057,0.750,0.451,"respiratory electron transport chain"),
c("GO:0000184","nuclear-transcribed mRNA catabolic process, nonsense-mediated decay",0.142,2.2725,0.816,0.456,"respiratory electron transport chain"),
c("GO:0044281","small molecule metabolic process",13.539,2.8153,0.840,0.464,"respiratory electron transport chain"),
c("GO:0009057","macromolecule catabolic process",2.264,1.4785,0.847,0.468,"respiratory electron transport chain"),
c("GO:0051092","positive regulation of NF-kappaB transcription factor activity",0.194,1.4789,0.786,0.480,"respiratory electron transport chain"),
c("GO:0045978","negative regulation of nucleoside metabolic process",0.007,1.3057,0.764,0.482,"respiratory electron transport chain"),
c("GO:0051897","positive regulation of protein kinase B signaling",0.138,1.4166,0.828,0.483,"respiratory electron transport chain"),
c("GO:0019358","nicotinate nucleotide salvage",0.003,1.6012,0.786,0.489,"respiratory electron transport chain"),
c("GO:0006082","organic acid metabolic process",3.105,2.3615,0.777,0.493,"respiratory electron transport chain"),
c("GO:0006487","protein N-linked glycosylation",0.157,1.6853,0.782,0.495,"respiratory electron transport chain"),
c("GO:0000053","argininosuccinate metabolic process",0.005,1.6012,0.817,0.498,"respiratory electron transport chain"),
c("GO:0019413","acetate biosynthetic process",0.006,1.3057,0.798,0.507,"respiratory electron transport chain"),
c("GO:0019541","propionate metabolic process",0.008,1.3057,0.795,0.520,"respiratory electron transport chain"),
c("GO:0072366","regulation of cellular ketone metabolic process by positive regulation of transcription from RNA polymerase II promoter",0.001,1.6012,0.777,0.521,"respiratory electron transport chain"),
c("GO:0072363","regulation of glycolytic by positive regulation of transcription from RNA polymerase II promoter",0.001,1.6012,0.732,0.523,"respiratory electron transport chain"),
c("GO:0010507","negative regulation of autophagy",0.068,2.2480,0.785,0.525,"respiratory electron transport chain"),
c("GO:0006420","arginyl-tRNA aminoacylation",0.010,1.3057,0.770,0.530,"respiratory electron transport chain"),
c("GO:0045454","cell redox homeostasis",0.245,1.6232,0.851,0.557,"respiratory electron transport chain"),
c("GO:0032008","positive regulation of TOR signaling",0.027,1.3312,0.844,0.560,"respiratory electron transport chain"),
c("GO:0034308","primary alcohol metabolic process",0.080,1.4566,0.840,0.569,"respiratory electron transport chain"),
c("GO:0006105","succinate metabolic process",0.025,1.6087,0.813,0.570,"respiratory electron transport chain"),
c("GO:0009229","thiamine diphosphate biosynthetic process",0.008,1.6012,0.825,0.574,"respiratory electron transport chain"),
c("GO:0051900","regulation of mitochondrial depolarization",0.028,1.9183,0.882,0.602,"respiratory electron transport chain"),
c("GO:0006012","galactose metabolic process",0.071,1.6983,0.871,0.606,"respiratory electron transport chain"),
c("GO:0072350","tricarboxylic acid metabolic process",0.051,1.3912,0.807,0.607,"respiratory electron transport chain"),
c("GO:0019747","regulation of isoprenoid metabolic process",0.003,1.3057,0.803,0.609,"respiratory electron transport chain"),
c("GO:0046497","nicotinate nucleotide metabolic process",0.003,1.6012,0.809,0.614,"respiratory electron transport chain"),
c("GO:0032469","endoplasmic reticulum calcium ion homeostasis",0.058,1.3912,0.885,0.614,"respiratory electron transport chain"),
c("GO:0006769","nicotinamide metabolic process",0.002,1.3057,0.813,0.629,"respiratory electron transport chain"),
c("GO:0006754","ATP biosynthetic process",1.284,1.3118,0.716,0.632,"respiratory electron transport chain"),
c("GO:0006423","cysteinyl-tRNA aminoacylation",0.010,1.3057,0.770,0.640,"respiratory electron transport chain"),
c("GO:1901661","quinone metabolic process",0.055,3.6576,0.787,0.641,"respiratory electron transport chain"),
c("GO:0032011","ARF protein signal transduction",0.218,1.9187,0.850,0.646,"respiratory electron transport chain"),
c("GO:0008300","isoprenoid catabolic process",0.011,2.2262,0.798,0.648,"respiratory electron transport chain"),
c("GO:0042357","thiamine diphosphate metabolic process",0.010,1.6012,0.844,0.649,"respiratory electron transport chain"),
c("GO:1900053","negative regulation of retinoic acid biosynthetic process",0.001,1.6012,0.687,0.654,"respiratory electron transport chain"),
c("GO:0042776","mitochondrial ATP synthesis coupled proton transport",0.018,1.3312,0.702,0.657,"respiratory electron transport chain"),
c("GO:0043161","proteasome-mediated ubiquitin-dependent protein catabolic process",0.459,1.6328,0.815,0.663,"respiratory electron transport chain"),
c("GO:0046204","nor-spermidine metabolic process",0.001,1.6012,0.876,0.669,"respiratory electron transport chain"),
c("GO:0006749","glutathione metabolic process",0.149,1.4166,0.760,0.671,"respiratory electron transport chain"),
c("GO:2000224","regulation of testosterone biosynthetic process",0.002,1.3057,0.734,0.679,"respiratory electron transport chain"),
c("GO:0072329","monocarboxylic acid catabolic process",0.172,1.5857,0.744,0.681,"respiratory electron transport chain"),
c("GO:0006772","thiamine metabolic process",0.011,1.3057,0.808,0.685,"respiratory electron transport chain"),
c("GO:0071156","regulation of cell cycle arrest",0.201,1.8514,0.809,0.686,"respiratory electron transport chain"),
c("GO:0072361","regulation of glycolytic process by regulation of transcription from RNA polymerase II promoter",0.002,1.3057,0.740,0.692,"respiratory electron transport chain"),
c("GO:0043648","dicarboxylic acid metabolic process",0.213,3.1079,0.788,0.696,"respiratory electron transport chain"),
c("GO:0034613","cellular protein localization",3.129,3.9586,0.841,0.000,"cellular protein localization"),
c("GO:0015846","polyamine transport",0.005,1.6012,0.914,0.201,"cellular protein localization"),
c("GO:0000296","spermine transport",0.001,1.6012,0.918,0.364,"cellular protein localization"),
c("GO:0072369","regulation of lipid transport by positive regulation of transcription from RNA polymerase II promoter",0.002,1.3057,0.758,0.383,"cellular protein localization"),
c("GO:1902600","hydrogen ion transmembrane transport",3.156,3.3372,0.804,0.390,"cellular protein localization"),
c("GO:1901475","pyruvate transmembrane transport",0.006,1.6012,0.873,0.397,"cellular protein localization"),
c("GO:0051641","cellular localization",6.184,2.2277,0.894,0.433,"cellular protein localization"),
c("GO:0033036","macromolecule localization",5.646,2.1232,0.895,0.477,"cellular protein localization"),
c("GO:0006903","vesicle targeting",0.072,2.1487,0.828,0.488,"cellular protein localization"),
c("GO:0006818","hydrogen transport",3.252,2.7144,0.871,0.502,"cellular protein localization"),
c("GO:0051683","establishment of Golgi localization",0.008,1.3057,0.905,0.608,"cellular protein localization"),
c("GO:0044765","single-organism transport",13.545,2.5719,0.847,0.623,"cellular protein localization"),
c("GO:0006614","SRP-dependent cotranslational protein targeting to membrane",0.150,3.2218,0.783,0.673,"cellular protein localization"),
c("GO:0070972","protein localization to endoplasmic reticulum",0.196,2.7905,0.874,0.691,"cellular protein localization"),
c("GO:1902580","single-organism cellular localization",1.731,1.5991,0.849,0.694,"cellular protein localization"),
c("GO:0044699","single-organism process",71.655,1.3375,0.998,0.000,"single-organism process"),
c("GO:0051179","localization",18.927,1.6306,0.995,0.000,"localization"),
c("GO:0009758","carbohydrate utilization",0.005,1.6012,0.981,0.014,"carbohydrate utilization"),
c("GO:0043610","regulation of carbohydrate utilization",0.005,1.6012,0.961,0.014,"regulation of carbohydrate utilization"),
c("GO:0019740","nitrogen utilization",0.009,1.6012,0.981,0.015,"nitrogen utilization"),
c("GO:0071395","cellular response to jasmonic acid stimulus",0.005,4.2147,0.907,0.032,"cellular response to jasmonic acid stimulus"),
c("GO:1990117","B cell receptor apoptotic signaling pathway",0.001,1.6012,0.866,0.125,"cellular response to jasmonic acid stimulus"),
c("GO:0001101","response to acid chemical",0.711,2.6073,0.949,0.299,"cellular response to jasmonic acid stimulus"),
c("GO:0070669","response to interleukin-2",0.009,1.3057,0.958,0.313,"cellular response to jasmonic acid stimulus"),
c("GO:0031001","response to brefeldin A",0.001,1.6012,0.958,0.316,"cellular response to jasmonic acid stimulus"),
c("GO:0032095","regulation of response to food",0.035,2.2262,0.899,0.346,"cellular response to jasmonic acid stimulus"),
c("GO:0071418","cellular response to amine stimulus",0.006,1.6012,0.915,0.361,"cellular response to jasmonic acid stimulus"),
c("GO:1990009","retinal cell apoptotic process",0.002,1.3057,0.930,0.402,"cellular response to jasmonic acid stimulus"),
c("GO:0001905","activation of membrane attack complex",0.011,1.3057,0.831,0.441,"cellular response to jasmonic acid stimulus"),
c("GO:2001274","negative regulation of glucose import in response to insulin stimulus",0.005,1.3057,0.781,0.449,"cellular response to jasmonic acid stimulus"),
c("GO:0009753","response to jasmonic acid",0.005,4.2147,0.947,0.491,"cellular response to jasmonic acid stimulus"),
c("GO:1901701","cellular response to oxygen-containing compound",1.893,1.4033,0.876,0.501,"cellular response to jasmonic acid stimulus"),
c("GO:0042744","hydrogen peroxide catabolic process",0.034,1.3312,0.766,0.566,"cellular response to jasmonic acid stimulus"),
c("GO:0071229","cellular response to acid chemical",0.366,3.1192,0.886,0.629,"cellular response to jasmonic acid stimulus"),
c("GO:0032870","cellular response to hormone stimulus",1.400,1.3750,0.879,0.669,"cellular response to jasmonic acid stimulus"),
c("GO:0007584","response to nutrient",0.548,1.7913,0.919,0.686,"cellular response to jasmonic acid stimulus"),
c("GO:0006808","regulation of nitrogen utilization",0.009,1.6012,0.959,0.036,"regulation of nitrogen utilization"),
c("GO:0040009","regulation of growth rate",0.005,1.3057,0.969,0.036,"regulation of growth rate"),
c("GO:1901143","insulin catabolic process",0.001,1.6012,0.890,0.038,"insulin catabolism"),
c("GO:0045358","negative regulation of interferon-beta biosynthetic process",0.009,1.6012,0.797,0.142,"insulin catabolism"),
c("GO:1901142","insulin metabolic process",0.014,1.3057,0.917,0.162,"insulin catabolism"),
c("GO:0061187","regulation of chromatin silencing at rDNA",0.003,1.3057,0.803,0.368,"insulin catabolism"),
c("GO:0006953","acute-phase response",0.088,2.3098,0.921,0.046,"acute-phase response"),
c("GO:0002526","acute inflammatory response",0.259,1.6623,0.929,0.651,"acute-phase response"),
c("GO:0001970","positive regulation of activation of membrane attack complex",0.005,1.6012,0.760,0.698,"acute-phase response"),
c("GO:0016032","viral process",0.955,2.3615,0.911,0.054,"viral process"),
c("GO:0007340","acrosome reaction",0.056,1.3912,0.808,0.491,"viral process"),
c("GO:0044033","multi-organism metabolic process",0.213,1.9743,0.927,0.551,"viral process"),
c("GO:0046745","viral capsid secondary envelopment",0.001,1.6012,0.940,0.572,"viral process"),
c("GO:0019086","late viral transcription",0.002,1.3057,0.853,0.598,"viral process"),
c("GO:0044764","multi-organism cellular process",0.977,2.3125,0.920,0.642,"viral process"),
c("GO:0044419","interspecies interaction between organisms",1.105,2.0410,0.962,0.652,"viral process"),
c("GO:0010831","positive regulation of myotube differentiation",0.023,2.2262,0.853,0.076,"positive regulation of myotube differentiation"),
c("GO:0009838","abscission",0.007,1.3057,0.965,0.198,"positive regulation of myotube differentiation"),
c("GO:0045136","development of secondary sexual characteristics",0.034,1.6087,0.974,0.216,"positive regulation of myotube differentiation"),
c("GO:0043587","tongue morphogenesis",0.027,1.9183,0.958,0.230,"positive regulation of myotube differentiation"),
c("GO:0033634","positive regulation of cell-cell adhesion mediated by integrin",0.006,1.3057,0.901,0.248,"positive regulation of myotube differentiation"),
c("GO:0070346","positive regulation of fat cell proliferation",0.006,1.6012,0.898,0.248,"positive regulation of myotube differentiation"),
c("GO:0032298","positive regulation of DNA-dependent DNA replication initiation",0.008,1.6012,0.809,0.252,"positive regulation of myotube differentiation"),
c("GO:0035441","cell migration involved in vasculogenesis",0.005,1.6012,0.877,0.291,"positive regulation of myotube differentiation"),
c("GO:0002358","B cell homeostatic proliferation",0.010,1.6012,0.918,0.324,"positive regulation of myotube differentiation"),
c("GO:0046544","development of secondary male sexual characteristics",0.010,1.3057,0.961,0.466,"positive regulation of myotube differentiation"),
c("GO:0048239","negative regulation of DNA recombination at telomere",0.001,1.6012,0.826,0.490,"positive regulation of myotube differentiation"),
c("GO:0043586","tongue development",0.070,1.3912,0.957,0.547,"positive regulation of myotube differentiation"),
c("GO:1902512","positive regulation of apoptotic DNA fragmentation",0.001,1.6012,0.747,0.575,"positive regulation of myotube differentiation"),
c("GO:0001777","T cell homeostatic proliferation",0.014,1.6012,0.879,0.576,"positive regulation of myotube differentiation"),
c("GO:0072695","regulation of DNA recombination at telomere",0.001,1.6012,0.854,0.585,"positive regulation of myotube differentiation"),
c("GO:0098528","skeletal muscle fiber differentiation",0.003,1.6012,0.910,0.630,"positive regulation of myotube differentiation"),
c("GO:0030264","nuclear fragmentation involved in apoptotic nuclear change",0.001,1.3057,0.863,0.667,"positive regulation of myotube differentiation"),
c("GO:0090298","negative regulation of mitochondrial DNA replication",0.001,1.6012,0.764,0.696,"positive regulation of myotube differentiation"),
c("GO:0008053","mitochondrial fusion",0.043,3.4949,0.836,0.080,"mitochondrial fusion"),
c("GO:0000461","endonucleolytic cleavage to generate mature 3'-end of SSU-rRNA from (SSU-rRNA, 5.8S rRNA, LSU-rRNA)",0.003,1.6012,0.832,0.201,"mitochondrial fusion"),
c("GO:0006415","translational termination",0.130,3.0000,0.771,0.254,"mitochondrial fusion"),
c("GO:0018196","peptidyl-asparagine modification",0.114,1.8262,0.876,0.265,"mitochondrial fusion"),
c("GO:0097031","mitochondrial respiratory chain complex I biogenesis",0.018,1.4566,0.927,0.304,"mitochondrial fusion"),
c("GO:0006412","translation",1.984,1.8620,0.827,0.336,"mitochondrial fusion"),
c("GO:0010452","histone H3-K36 methylation",0.011,2.0570,0.799,0.354,"mitochondrial fusion"),
c("GO:0036034","mediator complex assembly",0.001,1.6012,0.928,0.360,"mitochondrial fusion"),
c("GO:0007005","mitochondrion organization",0.649,2.0205,0.878,0.386,"mitochondrial fusion"),
c("GO:0061024","membrane organization",1.629,1.9884,0.919,0.400,"mitochondrial fusion"),
c("GO:0048284","organelle fusion",0.165,1.4166,0.889,0.431,"mitochondrial fusion"),
c("GO:0010257","NADH dehydrogenase complex assembly",0.018,1.4566,0.918,0.450,"mitochondrial fusion"),
c("GO:0031334","positive regulation of protein complex assembly",0.286,1.8262,0.858,0.519,"mitochondrial fusion"),
c("GO:0032976","release of matrix enzymes from mitochondria",0.001,1.6012,0.879,0.523,"mitochondrial fusion"),
c("GO:0033615","mitochondrial proton-transporting ATP synthase complex assembly",0.002,1.3057,0.885,0.543,"mitochondrial fusion"),
c("GO:0006407","rRNA export from nucleus",0.003,1.3057,0.842,0.556,"mitochondrial fusion"),
c("GO:1902591","single-organism membrane budding",0.063,1.6716,0.789,0.559,"mitochondrial fusion"),
c("GO:0043653","mitochondrial fragmentation involved in apoptotic process",0.011,1.9183,0.864,0.595,"mitochondrial fusion"),
c("GO:0097198","histone H3-K36 trimethylation",0.002,1.3057,0.813,0.595,"mitochondrial fusion"),
c("GO:2001178","positive regulation of mediator complex assembly",0.001,1.6012,0.889,0.600,"mitochondrial fusion"),
c("GO:0032981","mitochondrial respiratory chain complex I assembly",0.018,1.4566,0.872,0.612,"mitochondrial fusion"),
c("GO:0034316","negative regulation of Arp2/3 complex-mediated actin nucleation",0.002,1.3057,0.781,0.626,"mitochondrial fusion"),
c("GO:0006413","translational initiation",0.465,2.6882,0.838,0.639,"mitochondrial fusion"),
c("GO:0033625","positive regulation of integrin activation",0.006,1.3057,0.886,0.662,"mitochondrial fusion"),
c("GO:0006414","translational elongation",0.313,2.5622,0.843,0.690,"mitochondrial fusion"),
c("GO:0010821","regulation of mitochondrion organization",0.142,1.4678,0.829,0.700,"mitochondrial fusion"));

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
