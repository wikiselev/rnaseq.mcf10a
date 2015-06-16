

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
revigo.data <- rbind(c("GO:0010817","regulation of hormone levels",1.029,2.8601,0.857,0.000,"regulation of hormone levels"),
c("GO:0070254","mucus secretion",0.025,2.1261,0.737,0.376,"regulation of hormone levels"),
c("GO:0031648","protein destabilization",0.034,1.5312,0.830,0.386,"regulation of hormone levels"),
c("GO:0008361","regulation of cell size",0.235,2.1979,0.804,0.455,"regulation of hormone levels"),
c("GO:0055067","monovalent inorganic cation homeostasis",0.235,2.6778,0.860,0.455,"regulation of hormone levels"),
c("GO:0042445","hormone metabolic process",0.448,1.8713,0.818,0.485,"regulation of hormone levels"),
c("GO:0090066","regulation of anatomical structure size",0.957,2.2899,0.858,0.525,"regulation of hormone levels"),
c("GO:0042391","regulation of membrane potential",1.008,2.0825,0.857,0.528,"regulation of hormone levels"),
c("GO:0051481","negative regulation of cytosolic calcium ion concentration",0.013,1.5005,0.845,0.571,"regulation of hormone levels"),
c("GO:0048871","multicellular organismal homeostasis",0.562,1.4693,0.784,0.591,"regulation of hormone levels"),
c("GO:0035813","regulation of renal sodium excretion",0.050,2.4023,0.672,0.629,"regulation of hormone levels"),
c("GO:0006702","androgen biosynthetic process",0.026,1.5784,0.706,0.663,"regulation of hormone levels"),
c("GO:0042593","glucose homeostasis",0.473,1.4202,0.855,0.667,"regulation of hormone levels"),
c("GO:0016339","calcium-dependent cell-cell adhesion via plasma membrane cell adhesion molecules",0.056,3.4815,0.987,0.000,"calcium-dependent cell-cell adhesion via plasma membrane cell adhesion molecules"),
c("GO:0033630","positive regulation of cell adhesion mediated by integrin",0.028,1.4484,0.899,0.443,"calcium-dependent cell-cell adhesion via plasma membrane cell adhesion molecules"),
c("GO:0019752","carboxylic acid metabolic process",2.886,5.1871,0.747,0.000,"carboxylic acid metabolism"),
c("GO:0051186","cofactor metabolic process",0.798,2.4855,0.915,0.119,"carboxylic acid metabolism"),
c("GO:0007267","cell-cell signaling",2.522,4.6021,0.860,0.120,"carboxylic acid metabolism"),
c("GO:0006928","cellular component movement",3.830,1.4892,0.895,0.127,"carboxylic acid metabolism"),
c("GO:0005975","carbohydrate metabolic process",3.046,1.8630,0.922,0.138,"carboxylic acid metabolism"),
c("GO:0009804","coumarin metabolic process",0.010,1.5005,0.874,0.153,"carboxylic acid metabolism"),
c("GO:0006091","generation of precursor metabolites and energy",6.571,5.6021,0.895,0.160,"carboxylic acid metabolism"),
c("GO:0007168","receptor guanylyl cyclase signaling pathway",0.013,1.5005,0.868,0.229,"carboxylic acid metabolism"),
c("GO:0005996","monosaccharide metabolic process",0.738,3.8239,0.800,0.231,"carboxylic acid metabolism"),
c("GO:0048385","regulation of retinoic acid receptor signaling pathway",0.073,1.4484,0.832,0.266,"carboxylic acid metabolism"),
c("GO:0046950","cellular ketone body metabolic process",0.016,1.9083,0.852,0.281,"carboxylic acid metabolism"),
c("GO:0042776","mitochondrial ATP synthesis coupled proton transport",0.018,3.4559,0.667,0.284,"carboxylic acid metabolism"),
c("GO:0015949","nucleobase-containing small molecule interconversion",0.021,1.4409,0.836,0.287,"carboxylic acid metabolism"),
c("GO:0007215","glutamate receptor signaling pathway",0.198,2.0969,0.842,0.293,"carboxylic acid metabolism"),
c("GO:0022904","respiratory electron transport chain",4.683,4.6198,0.772,0.296,"carboxylic acid metabolism"),
c("GO:0006629","lipid metabolic process",3.159,3.0655,0.846,0.300,"carboxylic acid metabolism"),
c("GO:0046951","ketone body biosynthetic process",0.009,2.1261,0.821,0.323,"carboxylic acid metabolism"),
c("GO:0046184","aldehyde biosynthetic process",0.021,1.5005,0.827,0.339,"carboxylic acid metabolism"),
c("GO:0055114","oxidation-reduction process",10.933,8.3468,0.830,0.370,"carboxylic acid metabolism"),
c("GO:0007268","synaptic transmission",1.611,4.8861,0.807,0.371,"carboxylic acid metabolism"),
c("GO:0044282","small molecule catabolic process",0.575,4.1079,0.808,0.397,"carboxylic acid metabolism"),
c("GO:0050994","regulation of lipid catabolic process",0.089,4.0915,0.789,0.448,"carboxylic acid metabolism"),
c("GO:0007186","G-protein coupled receptor signaling pathway",3.393,1.6688,0.800,0.458,"carboxylic acid metabolism"),
c("GO:0044281","small molecule metabolic process",13.539,3.0177,0.825,0.464,"carboxylic acid metabolism"),
c("GO:0006082","organic acid metabolic process",3.105,4.2291,0.773,0.493,"carboxylic acid metabolism"),
c("GO:0006839","mitochondrial transport",0.326,1.5777,0.823,0.501,"carboxylic acid metabolism"),
c("GO:0006438","valyl-tRNA aminoacylation",0.009,2.2336,0.816,0.525,"carboxylic acid metabolism"),
c("GO:0019322","pentose biosynthetic process",0.008,2.7747,0.807,0.536,"carboxylic acid metabolism"),
c("GO:0072522","purine-containing compound biosynthetic process",1.805,1.6059,0.808,0.542,"carboxylic acid metabolism"),
c("GO:0019216","regulation of lipid metabolic process",0.558,2.7328,0.801,0.548,"carboxylic acid metabolism"),
c("GO:1902600","hydrogen ion transmembrane transport",3.156,2.5214,0.740,0.550,"carboxylic acid metabolism"),
c("GO:0006099","tricarboxylic acid cycle",0.104,2.4672,0.837,0.550,"carboxylic acid metabolism"),
c("GO:0046390","ribose phosphate biosynthetic process",1.781,2.2321,0.802,0.560,"carboxylic acid metabolism"),
c("GO:0044712","single-organism catabolic process",5.557,1.3816,0.806,0.583,"carboxylic acid metabolism"),
c("GO:0019321","pentose metabolic process",0.028,2.3089,0.837,0.589,"carboxylic acid metabolism"),
c("GO:0006112","energy reserve metabolic process",0.325,1.8239,0.823,0.607,"carboxylic acid metabolism"),
c("GO:0044042","glucan metabolic process",0.206,1.6949,0.859,0.610,"carboxylic acid metabolism"),
c("GO:0016115","terpenoid catabolic process",0.007,1.7788,0.829,0.626,"carboxylic acid metabolism"),
c("GO:0006820","anion transport",1.726,1.3888,0.806,0.626,"carboxylic acid metabolism"),
c("GO:0005976","polysaccharide metabolic process",0.292,1.3946,0.870,0.630,"carboxylic acid metabolism"),
c("GO:0016042","lipid catabolic process",0.537,2.0186,0.808,0.642,"carboxylic acid metabolism"),
c("GO:0006851","mitochondrial calcium ion transport",0.014,1.9083,0.838,0.652,"carboxylic acid metabolism"),
c("GO:0050805","negative regulation of synaptic transmission",0.105,2.9318,0.786,0.653,"carboxylic acid metabolism"),
c("GO:0048172","regulation of short-term neuronal synaptic plasticity",0.023,1.5005,0.780,0.658,"carboxylic acid metabolism"),
c("GO:0016052","carbohydrate catabolic process",0.480,2.6615,0.834,0.661,"carboxylic acid metabolism"),
c("GO:0071805","potassium ion transmembrane transport",0.456,2.0061,0.776,0.664,"carboxylic acid metabolism"),
c("GO:0060079","regulation of excitatory postsynaptic membrane potential",0.156,3.6990,0.762,0.677,"carboxylic acid metabolism"),
c("GO:0035249","synaptic transmission, glutamatergic",0.199,3.7959,0.823,0.694,"carboxylic acid metabolism"),
c("GO:0034637","cellular carbohydrate biosynthetic process",0.207,1.5998,0.740,0.694,"carboxylic acid metabolism"),
c("GO:0050996","positive regulation of lipid catabolic process",0.036,1.8573,0.792,0.696,"carboxylic acid metabolism"),
c("GO:0043648","dicarboxylic acid metabolic process",0.213,1.7828,0.798,0.696,"carboxylic acid metabolism"),
c("GO:0040011","locomotion",3.285,1.4252,0.994,0.000,"locomotion"),
c("GO:0006848","pyruvate transport",0.010,3.3468,0.835,0.015,"pyruvate transport"),
c("GO:0060627","regulation of vesicle-mediated transport",0.665,2.2882,0.750,0.213,"pyruvate transport"),
c("GO:0006818","hydrogen transport",3.252,2.1481,0.815,0.359,"pyruvate transport"),
c("GO:0006836","neurotransmitter transport",0.450,1.4889,0.845,0.392,"pyruvate transport"),
c("GO:0015849","organic acid transport",0.681,1.5567,0.812,0.411,"pyruvate transport"),
c("GO:0051953","negative regulation of amine transport",0.040,2.1397,0.760,0.517,"pyruvate transport"),
c("GO:0015844","monoamine transport",0.164,1.4193,0.815,0.547,"pyruvate transport"),
c("GO:0006811","ion transport",7.803,1.9940,0.798,0.578,"pyruvate transport"),
c("GO:0017157","regulation of exocytosis",0.239,2.2807,0.708,0.600,"pyruvate transport"),
c("GO:0015727","lactate transport",0.008,1.5005,0.830,0.633,"pyruvate transport"),
c("GO:0035873","lactate transmembrane transport",0.008,1.5005,0.799,0.633,"pyruvate transport"),
c("GO:0006850","mitochondrial pyruvate transport",0.009,2.2336,0.823,0.638,"pyruvate transport"),
c("GO:0051270","regulation of cellular component movement",1.289,2.0173,0.724,0.642,"pyruvate transport"),
c("GO:0015718","monocarboxylic acid transport",0.270,2.0516,0.799,0.658,"pyruvate transport"),
c("GO:1902476","chloride transmembrane transport",0.222,1.4891,0.784,0.664,"pyruvate transport"),
c("GO:0055085","transmembrane transport",7.528,1.8447,0.749,0.673,"pyruvate transport"),
c("GO:0015911","plasma membrane long-chain fatty acid transport",0.015,1.9083,0.798,0.674,"pyruvate transport"),
c("GO:0043271","negative regulation of ion transport",0.145,1.4350,0.752,0.685,"pyruvate transport"),
c("GO:0002092","positive regulation of receptor internalization",0.026,1.9083,0.696,0.697,"pyruvate transport"),
c("GO:0007588","excretion",0.129,2.7375,0.893,0.019,"excretion"),
c("GO:0060157","urinary bladder development",0.006,1.7788,0.910,0.195,"excretion"),
c("GO:0002730","regulation of dendritic cell cytokine production",0.022,2.2336,0.846,0.213,"excretion"),
c("GO:0001702","gastrulation with mouth forming second",0.108,1.8173,0.894,0.238,"excretion"),
c("GO:0048539","bone marrow development",0.008,1.5005,0.902,0.251,"excretion"),
c("GO:0060068","vagina development",0.051,1.4484,0.888,0.284,"excretion"),
c("GO:0061304","retinal blood vessel morphogenesis",0.011,1.7788,0.899,0.332,"excretion"),
c("GO:0043217","myelin maintenance",0.066,2.5045,0.737,0.433,"excretion"),
c("GO:0045776","negative regulation of blood pressure",0.091,1.3580,0.809,0.443,"excretion"),
c("GO:0002087","regulation of respiratory gaseous exchange by neurological system process",0.025,1.7296,0.865,0.445,"excretion"),
c("GO:0001964","startle response",0.066,2.3089,0.864,0.474,"excretion"),
c("GO:0097091","synaptic vesicle clustering",0.010,2.2336,0.838,0.512,"excretion"),
c("GO:0090360","platelet-derived growth factor production",0.025,1.7788,0.897,0.516,"excretion"),
c("GO:0072014","proximal tubule development",0.010,1.5005,0.905,0.522,"excretion"),
c("GO:0090361","regulation of platelet-derived growth factor production",0.025,1.7788,0.864,0.533,"excretion"),
c("GO:0050718","positive regulation of interleukin-1 beta secretion",0.025,1.7296,0.675,0.537,"excretion"),
c("GO:0043113","receptor clustering",0.082,1.7268,0.819,0.586,"excretion"),
c("GO:0045765","regulation of angiogenesis",0.366,1.3933,0.838,0.601,"excretion"),
c("GO:0086013","membrane repolarization during cardiac muscle cell action potential",0.010,1.7788,0.766,0.622,"excretion"),
c("GO:0060041","retina development in camera-type eye",0.348,1.5546,0.881,0.656,"excretion"),
c("GO:0032286","central nervous system myelin maintenance",0.008,2.2336,0.764,0.679,"excretion"),
c("GO:0001935","endothelial cell proliferation",0.163,1.4433,0.968,0.019,"endothelial cell proliferation"),
c("GO:0071276","cellular response to cadmium ion",0.032,3.0044,0.913,0.036,"cellular response to cadmium ion"),
c("GO:0043279","response to alkaloid",0.450,2.7721,0.932,0.332,"cellular response to cadmium ion"),
c("GO:0042178","xenobiotic catabolic process",0.021,1.7296,0.857,0.333,"cellular response to cadmium ion"),
c("GO:0071395","cellular response to jasmonic acid stimulus",0.005,1.5005,0.917,0.412,"cellular response to cadmium ion"),
c("GO:0045471","response to ethanol",0.329,1.8804,0.937,0.472,"cellular response to cadmium ion"),
c("GO:0009753","response to jasmonic acid",0.005,1.5005,0.946,0.491,"cellular response to cadmium ion"),
c("GO:0071384","cellular response to corticosteroid stimulus",0.112,1.3580,0.902,0.520,"cellular response to cadmium ion"),
c("GO:0009414","response to water deprivation",0.017,1.7788,0.927,0.545,"cellular response to cadmium ion"),
c("GO:0010044","response to aluminum ion",0.009,1.7788,0.949,0.579,"cellular response to cadmium ion"),
c("GO:0035094","response to nicotine",0.207,2.9101,0.931,0.667,"cellular response to cadmium ion"),
c("GO:0032768","regulation of monooxygenase activity",0.082,2.2262,0.907,0.056,"regulation of monooxygenase activity"),
c("GO:0051341","regulation of oxidoreductase activity",0.137,1.9038,0.910,0.407,"regulation of monooxygenase activity"),
c("GO:0007610","behavior",1.517,2.5467,0.969,0.065,"behavior"),
c("GO:0033004","negative regulation of mast cell activation",0.024,2.7747,0.863,0.073,"negative regulation of mast cell activation"),
c("GO:0002861","regulation of inflammatory response to antigenic stimulus",0.073,2.3089,0.873,0.156,"negative regulation of mast cell activation"),
c("GO:0002922","positive regulation of humoral immune response",0.052,1.5005,0.926,0.170,"negative regulation of mast cell activation"),
c("GO:0010621","negative regulation of transcription by transcription factor localization",0.003,1.7788,0.770,0.252,"negative regulation of mast cell activation"),
c("GO:0010529","negative regulation of transposition",0.008,1.5005,0.880,0.264,"negative regulation of mast cell activation"),
c("GO:0033555","multicellular organismal response to stress",0.203,2.0061,0.870,0.342,"negative regulation of mast cell activation"),
c("GO:0009611","response to wounding",2.056,1.7657,0.944,0.456,"negative regulation of mast cell activation"),
c("GO:0048678","response to axon injury",0.155,1.7547,0.948,0.556,"negative regulation of mast cell activation"),
c("GO:0060340","positive regulation of type I interferon-mediated signaling pathway",0.021,1.9083,0.786,0.565,"negative regulation of mast cell activation"),
c("GO:0002437","inflammatory response to antigenic stimulus",0.114,1.9147,0.939,0.604,"negative regulation of mast cell activation"),
c("GO:0032103","positive regulation of response to external stimulus",0.398,1.4817,0.887,0.678,"negative regulation of mast cell activation"),
c("GO:0040012","regulation of locomotion",1.268,2.2503,0.908,0.073,"regulation of locomotion"),
c("GO:0010634","positive regulation of epithelial cell migration",0.119,1.8804,0.694,0.595,"regulation of locomotion"),
c("GO:1901163","regulation of trophoblast cell migration",0.006,1.5005,0.738,0.625,"regulation of locomotion"),
c("GO:0061450","trophoblast cell migration",0.006,1.5005,0.793,0.671,"regulation of locomotion"),
c("GO:0050795","regulation of behavior",0.338,2.7986,0.849,0.080,"regulation of behavior"),
c("GO:0048521","negative regulation of behavior",0.063,2.6498,0.836,0.632,"regulation of behavior"),
c("GO:0033057","multicellular organismal reproductive behavior",0.065,2.3089,0.837,0.633,"regulation of behavior"),
c("GO:0048512","circadian behavior",0.079,2.5391,0.878,0.643,"regulation of behavior"),
c("GO:0001662","behavioral fear response",0.084,1.5784,0.804,0.646,"regulation of behavior"),
c("GO:0002209","behavioral defense response",0.084,1.5784,0.873,0.646,"regulation of behavior"),
c("GO:0019098","reproductive behavior",0.099,1.5312,0.888,0.655,"regulation of behavior"),
c("GO:0007622","rhythmic behavior",0.084,2.3915,0.888,0.688,"regulation of behavior"),
c("GO:0033028","myeloid cell apoptotic process",0.084,2.1331,0.920,0.082,"myeloid cell apoptotic process"),
c("GO:0033032","regulation of myeloid cell apoptotic process",0.073,1.8573,0.886,0.620,"myeloid cell apoptotic process"),
c("GO:0051156","glucose 6-phosphate metabolic process",0.024,2.1261,0.894,0.084,"glucose 6-phosphate metabolism"),
c("GO:0016137","glycoside metabolic process",0.030,1.6297,0.878,0.244,"glucose 6-phosphate metabolism"),
c("GO:0090407","organophosphate biosynthetic process",2.638,1.7091,0.833,0.340,"glucose 6-phosphate metabolism"),
c("GO:0044711","single-organism biosynthetic process",4.776,1.5253,0.822,0.403,"glucose 6-phosphate metabolism"),
c("GO:0051187","cofactor catabolic process",0.047,2.8861,0.873,0.089,"cofactor catabolism"),
c("GO:0046149","pigment catabolic process",0.010,2.4023,0.872,0.278,"cofactor catabolism"),
c("GO:0006787","porphyrin-containing compound catabolic process",0.027,2.4023,0.839,0.604,"cofactor catabolism"),
c("GO:0006739","NADP metabolic process",0.087,2.2958,0.789,0.651,"cofactor catabolism"),
c("GO:0071616","acyl-CoA biosynthetic process",0.065,1.4942,0.858,0.698,"cofactor catabolism"),
c("GO:0065008","regulation of biological quality",7.337,1.5174,0.943,0.094,"regulation of biological quality"),
c("GO:0050808","synapse organization",0.424,3.0809,0.892,0.096,"synapse organization"),
c("GO:0090296","regulation of mitochondrial DNA replication",0.010,1.7788,0.825,0.250,"synapse organization"),
c("GO:0007416","synapse assembly",0.210,3.2757,0.826,0.315,"synapse organization"),
c("GO:0007399","nervous system development",4.932,1.3990,0.862,0.456,"synapse organization"),
c("GO:0021536","diencephalon development",0.350,2.8386,0.875,0.484,"synapse organization"),
c("GO:0000266","mitochondrial fission",0.042,1.6297,0.937,0.590,"synapse organization"),
c("GO:0048853","forebrain morphogenesis",0.042,1.5784,0.889,0.661,"synapse organization"),
c("GO:0021762","substantia nigra development",0.055,2.7328,0.888,0.674,"synapse organization"),
c("GO:0006584","catecholamine metabolic process",0.123,1.8173,0.871,0.098,"catecholamine metabolism"),
c("GO:0006518","peptide metabolic process",0.350,1.5214,0.870,0.304,"catecholamine metabolism"),
c("GO:0033013","tetrapyrrole metabolic process",0.173,1.4674,0.878,0.313,"catecholamine metabolism"),
c("GO:0008206","bile acid metabolic process",0.077,1.5632,0.775,0.641,"catecholamine metabolism"));

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
