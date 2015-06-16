

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
revigo.data <- rbind(c("GO:0002480","antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent",0.085,2.8697,0.973,0.000,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0042117","monocyte activation",0.008,1.5691,0.926,0.105,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0071425","hematopoietic stem cell proliferation",0.036,2.6383,0.887,0.116,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0002475","antigen processing and presentation via MHC class Ib",0.015,1.3677,0.975,0.132,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0002428","antigen processing and presentation of peptide antigen via MHC class Ib",0.008,1.8496,0.975,0.162,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0040034","regulation of development, heterochronic",0.034,1.3677,0.928,0.223,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0007601","visual perception",0.288,2.3449,0.901,0.233,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0042094","interleukin-2 biosynthetic process",0.044,1.7506,0.861,0.237,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0046850","regulation of bone remodeling",0.096,1.5553,0.908,0.251,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0044243","multicellular organismal catabolic process",0.112,1.3082,0.892,0.254,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0021527","spinal cord association neuron differentiation",0.026,1.5691,0.879,0.299,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0002003","angiotensin maturation",0.016,2.0088,0.755,0.415,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0001938","positive regulation of endothelial cell proliferation",0.107,1.7508,0.879,0.416,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0046959","habituation",0.005,2.3054,0.901,0.438,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0070664","negative regulation of leukocyte proliferation",0.141,1.4238,0.846,0.500,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0007635","chemosensory behavior",0.028,1.5691,0.914,0.505,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0045066","regulatory T cell differentiation",0.033,1.3677,0.863,0.506,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0042048","olfactory behavior",0.018,1.5691,0.916,0.547,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0045200","establishment of neuroblast polarity",0.005,1.8496,0.862,0.594,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0046958","nonassociative learning",0.008,1.8496,0.898,0.604,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0042447","hormone catabolic process",0.011,1.3677,0.900,0.604,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0050877","neurological system process",2.809,1.6872,0.894,0.643,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0007612","learning",0.278,1.3101,0.875,0.679,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0050953","sensory perception of light stimulus",0.293,2.2097,0.905,0.682,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:2000114","regulation of establishment of cell polarity",0.046,1.8277,0.887,0.684,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0016486","peptide hormone processing",0.058,1.4725,0.817,0.696,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-independent"),
c("GO:0007156","homophilic cell adhesion via plasma membrane adhesion molecules",0.489,2.4401,0.992,0.000,"homophilic cell adhesion via plasma membrane adhesion molecules"),
c("GO:0015031","protein transport",3.600,3.4559,0.798,0.000,"protein transport"),
c("GO:0032400","melanosome localization",0.070,2.8356,0.758,0.255,"protein transport"),
c("GO:0006833","water transport",0.117,2.4763,0.868,0.301,"protein transport"),
c("GO:0042044","fluid transport",0.132,2.1791,0.867,0.304,"protein transport"),
c("GO:0070838","divalent metal ion transport",1.028,1.7701,0.817,0.383,"protein transport"),
c("GO:0016197","endosomal transport",0.316,1.9122,0.813,0.401,"protein transport"),
c("GO:0045175","basal protein localization",0.002,2.3054,0.899,0.413,"protein transport"),
c("GO:0032879","regulation of localization",4.330,1.3266,0.817,0.418,"protein transport"),
c("GO:0015867","ATP transport",0.010,1.5691,0.853,0.429,"protein transport"),
c("GO:0033036","macromolecule localization",5.646,2.2366,0.853,0.449,"protein transport"),
c("GO:0016192","vesicle-mediated transport",3.273,1.8422,0.850,0.449,"protein transport"),
c("GO:0033344","cholesterol efflux",0.087,1.3211,0.843,0.523,"protein transport"),
c("GO:0051643","endoplasmic reticulum localization",0.006,2.3054,0.874,0.551,"protein transport"),
c("GO:0006891","intra-Golgi vesicle-mediated transport",0.092,1.4725,0.829,0.563,"protein transport"),
c("GO:0072511","divalent inorganic cation transport",1.032,1.7440,0.832,0.568,"protein transport"),
c("GO:0006810","transport",16.357,3.2291,0.820,0.583,"protein transport"),
c("GO:0002790","peptide secretion",0.500,1.6712,0.819,0.622,"protein transport"),
c("GO:0070509","calcium ion import",0.077,1.3211,0.856,0.633,"protein transport"),
c("GO:0006614","SRP-dependent cotranslational protein targeting to membrane",0.150,2.1945,0.754,0.641,"protein transport"),
c("GO:0071702","organic substance transport",5.810,2.9666,0.840,0.643,"protein transport"),
c("GO:0070972","protein localization to endoplasmic reticulum",0.196,1.6916,0.832,0.677,"protein transport"),
c("GO:1902582","single-organism intracellular transport",2.514,1.4527,0.779,0.683,"protein transport"),
c("GO:0044699","single-organism process",71.655,2.4157,0.998,0.000,"single-organism process"),
c("GO:0046329","negative regulation of JNK cascade",0.039,3.1249,0.731,0.000,"negative regulation of JNK cascade"),
c("GO:2000109","regulation of macrophage apoptotic process",0.027,1.5691,0.903,0.110,"negative regulation of JNK cascade"),
c("GO:0032970","regulation of actin filament-based process",0.660,1.6761,0.851,0.137,"negative regulation of JNK cascade"),
c("GO:0070085","glycosylation",0.734,2.5421,0.861,0.153,"negative regulation of JNK cascade"),
c("GO:0006104","succinyl-CoA metabolic process",0.010,1.3677,0.916,0.169,"negative regulation of JNK cascade"),
c("GO:0032071","regulation of endodeoxyribonuclease activity",0.003,2.3054,0.845,0.172,"negative regulation of JNK cascade"),
c("GO:0009211","pyrimidine deoxyribonucleoside triphosphate metabolic process",0.025,2.3054,0.879,0.179,"negative regulation of JNK cascade"),
c("GO:0006112","energy reserve metabolic process",0.325,1.8022,0.887,0.184,"negative regulation of JNK cascade"),
c("GO:0001676","long-chain fatty acid metabolic process",0.188,1.3101,0.875,0.237,"negative regulation of JNK cascade"),
c("GO:0007267","cell-cell signaling",2.522,1.6548,0.884,0.251,"negative regulation of JNK cascade"),
c("GO:0009157","deoxyribonucleoside monophosphate biosynthetic process",0.024,1.8496,0.851,0.259,"negative regulation of JNK cascade"),
c("GO:0031342","negative regulation of cell killing",0.023,1.5691,0.912,0.276,"negative regulation of JNK cascade"),
c("GO:0009200","deoxyribonucleoside triphosphate metabolic process",0.047,1.3249,0.874,0.287,"negative regulation of JNK cascade"),
c("GO:0006069","ethanol oxidation",0.036,1.3677,0.915,0.289,"negative regulation of JNK cascade"),
c("GO:0033194","response to hydroperoxide",0.042,1.5426,0.909,0.294,"negative regulation of JNK cascade"),
c("GO:0000184","nuclear-transcribed mRNA catabolic process, nonsense-mediated decay",0.142,1.7560,0.882,0.297,"negative regulation of JNK cascade"),
c("GO:0034405","response to fluid shear stress",0.066,1.3939,0.936,0.304,"negative regulation of JNK cascade"),
c("GO:0002698","negative regulation of immune effector process",0.166,2.7375,0.876,0.315,"negative regulation of JNK cascade"),
c("GO:0042182","ketone catabolic process",0.011,1.5691,0.886,0.320,"negative regulation of JNK cascade"),
c("GO:0032410","negative regulation of transporter activity",0.060,2.1707,0.792,0.325,"negative regulation of JNK cascade"),
c("GO:0001914","regulation of T cell mediated cytotoxicity",18.949,1.5575,0.857,0.327,"negative regulation of JNK cascade"),
c("GO:0022400","regulation of rhodopsin mediated signaling pathway",0.034,1.7506,0.814,0.337,"negative regulation of JNK cascade"),
c("GO:0007259","JAK-STAT cascade",0.253,1.5084,0.840,0.364,"negative regulation of JNK cascade"),
c("GO:0007268","synaptic transmission",1.611,1.5546,0.882,0.371,"negative regulation of JNK cascade"),
c("GO:0000720","pyrimidine dimer repair by nucleotide-excision repair",0.008,1.8496,0.832,0.375,"negative regulation of JNK cascade"),
c("GO:0002683","negative regulation of immune system process",0.540,1.5640,0.883,0.386,"negative regulation of JNK cascade"),
c("GO:0007202","activation of phospholipase C activity",0.076,1.5899,0.883,0.387,"negative regulation of JNK cascade"),
c("GO:0050848","regulation of calcium-mediated signaling",0.080,2.1707,0.831,0.424,"negative regulation of JNK cascade"),
c("GO:0034199","activation of protein kinase A activity",0.019,2.2692,0.794,0.425,"negative regulation of JNK cascade"),
c("GO:2000479","regulation of cAMP-dependent protein kinase activity",0.015,2.0088,0.807,0.472,"negative regulation of JNK cascade"),
c("GO:0090101","negative regulation of transmembrane receptor protein serine/threonine kinase signaling pathway",0.206,2.0339,0.774,0.540,"negative regulation of JNK cascade"),
c("GO:2000480","negative regulation of cAMP-dependent protein kinase activity",0.007,2.2284,0.782,0.555,"negative regulation of JNK cascade"),
c("GO:0031348","negative regulation of defense response",0.286,1.8768,0.831,0.597,"negative regulation of JNK cascade"),
c("GO:0006109","regulation of carbohydrate metabolic process",0.300,1.5003,0.848,0.631,"negative regulation of JNK cascade"),
c("GO:0050690","regulation of defense response to virus by virus",0.033,1.7846,0.838,0.640,"negative regulation of JNK cascade"),
c("GO:0043124","negative regulation of I-kappaB kinase/NF-kappaB signaling",0.066,1.4238,0.794,0.643,"negative regulation of JNK cascade"),
c("GO:0006401","RNA catabolic process",0.316,1.3415,0.876,0.643,"negative regulation of JNK cascade"),
c("GO:0031585","regulation of inositol 1,4,5-trisphosphate-sensitive calcium-release channel activity",0.008,1.8496,0.747,0.683,"negative regulation of JNK cascade"),
c("GO:0033692","cellular polysaccharide biosynthetic process",0.183,1.6035,0.797,0.686,"negative regulation of JNK cascade"),
c("GO:0032070","regulation of deoxyribonuclease activity",0.005,1.8496,0.843,0.699,"negative regulation of JNK cascade"),
c("GO:0051179","localization",18.927,2.3382,0.994,0.000,"localization"),
c("GO:0051704","multi-organism process",4.431,3.2596,0.993,0.000,"multi-organism process"),
c("GO:0043473","pigmentation",0.223,1.5056,0.975,0.014,"pigmentation"),
c("GO:0036119","response to platelet-derived growth factor",0.010,2.3054,0.934,0.046,"response to platelet-derived growth factor"),
c("GO:0060337","type I interferon signaling pathway",0.179,2.1296,0.776,0.338,"response to platelet-derived growth factor"),
c("GO:0042246","tissue regeneration",0.101,1.7846,0.883,0.348,"response to platelet-derived growth factor"),
c("GO:0002548","monocyte chemotaxis",0.042,1.4725,0.767,0.391,"response to platelet-derived growth factor"),
c("GO:0030422","production of siRNA involved in RNA interference",0.018,1.8496,0.751,0.394,"response to platelet-derived growth factor"),
c("GO:0001707","mesoderm formation",0.193,1.4877,0.903,0.462,"response to platelet-derived growth factor"),
c("GO:0036005","response to macrophage colony-stimulating factor",0.013,1.5691,0.930,0.540,"response to platelet-derived growth factor"),
c("GO:0036006","cellular response to macrophage colony-stimulating factor stimulus",0.013,1.5691,0.890,0.568,"response to platelet-derived growth factor"),
c("GO:1901699","cellular response to nitrogen compound",1.214,1.5148,0.858,0.582,"response to platelet-derived growth factor"),
c("GO:0048670","regulation of collateral sprouting",0.026,1.5426,0.776,0.636,"response to platelet-derived growth factor"),
c("GO:0034340","response to type I interferon",0.180,2.1296,0.877,0.654,"response to platelet-derived growth factor"),
c("GO:0033762","response to glucagon",0.088,1.4877,0.918,0.662,"response to platelet-derived growth factor"),
c("GO:0044763","single-organism cellular process",45.302,1.3336,0.928,0.048,"single-organism cellular process"),
c("GO:0010817","regulation of hormone levels",1.029,1.5411,0.914,0.053,"regulation of hormone levels"),
c("GO:0060371","regulation of atrial cardiac muscle cell membrane depolarization",0.016,1.3677,0.895,0.363,"regulation of hormone levels"),
c("GO:0007098","centrosome cycle",0.170,2.0773,0.860,0.061,"centrosome cycle"),
c("GO:0070842","aggresome assembly",0.021,1.5691,0.946,0.246,"centrosome cycle"),
c("GO:0051784","negative regulation of nuclear division",0.112,1.3705,0.790,0.375,"centrosome cycle"),
c("GO:0007610","behavior",1.517,1.3237,0.963,0.066,"behavior"),
c("GO:0022406","membrane docking",0.141,1.3059,0.932,0.067,"membrane docking"),
c("GO:0009101","glycoprotein biosynthetic process",0.809,2.9208,0.799,0.079,"glycoprotein biosynthesis"),
c("GO:0005975","carbohydrate metabolic process",3.046,1.7044,0.934,0.122,"glycoprotein biosynthesis"),
c("GO:0051725","protein de-ADP-ribosylation",0.007,1.5691,0.894,0.204,"glycoprotein biosynthesis"),
c("GO:0051088","PMA-inducible membrane protein ectodomain proteolysis",0.008,1.8496,0.908,0.206,"glycoprotein biosynthesis"),
c("GO:0042983","amyloid precursor protein biosynthetic process",0.009,2.2284,0.908,0.208,"glycoprotein biosynthesis"),
c("GO:0060177","regulation of angiotensin metabolic process",0.018,1.6745,0.862,0.219,"glycoprotein biosynthesis"),
c("GO:0043687","post-translational protein modification",0.259,2.6990,0.868,0.273,"glycoprotein biosynthesis"),
c("GO:0071569","protein ufmylation",0.009,1.3677,0.892,0.274,"glycoprotein biosynthesis"),
c("GO:0042157","lipoprotein metabolic process",0.387,1.3050,0.895,0.284,"glycoprotein biosynthesis"),
c("GO:0006415","translational termination",0.130,2.7959,0.781,0.290,"glycoprotein biosynthesis"),
c("GO:0019083","viral transcription",0.174,1.6156,0.830,0.292,"glycoprotein biosynthesis"),
c("GO:0019255","glucose 1-phosphate metabolic process",0.018,2.3054,0.897,0.299,"glycoprotein biosynthesis"),
c("GO:0018198","peptidyl-cysteine modification",0.089,1.7506,0.877,0.323,"glycoprotein biosynthesis"),
c("GO:0006022","aminoglycan metabolic process",0.332,1.4566,0.887,0.382,"glycoprotein biosynthesis"),
c("GO:0044267","cellular protein metabolic process",12.981,1.5969,0.832,0.429,"glycoprotein biosynthesis"),
c("GO:0044033","multi-organism metabolic process",0.213,1.5880,0.933,0.476,"glycoprotein biosynthesis"),
c("GO:1901137","carbohydrate derivative biosynthetic process",2.961,2.5157,0.878,0.482,"glycoprotein biosynthesis"),
c("GO:0009100","glycoprotein metabolic process",0.923,2.3820,0.841,0.490,"glycoprotein biosynthesis"),
c("GO:0009265","2'-deoxyribonucleotide biosynthetic process",0.024,2.5058,0.820,0.519,"glycoprotein biosynthesis"),
c("GO:0009615","response to virus",0.537,1.4658,0.902,0.523,"glycoprotein biosynthesis"),
c("GO:0006024","glycosaminoglycan biosynthetic process",0.149,2.2366,0.827,0.603,"glycoprotein biosynthesis"),
c("GO:0044419","interspecies interaction between organisms",1.105,1.3299,0.954,0.612,"glycoprotein biosynthesis"),
c("GO:0006413","translational initiation",0.465,2.5528,0.843,0.639,"glycoprotein biosynthesis"),
c("GO:0006414","translational elongation",0.313,2.1543,0.847,0.690,"glycoprotein biosynthesis"));

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
