

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
revigo.data <- rbind(c("GO:0002478","antigen processing and presentation of exogenous peptide antigen",0.296,2.0814,0.968,0.000,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0002475","antigen processing and presentation via MHC class Ib",0.015,1.3018,0.983,0.144,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0019884","antigen processing and presentation of exogenous antigen",0.303,2.2168,0.980,0.181,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0002474","antigen processing and presentation of peptide antigen via MHC class I",19.037,2.7670,0.972,0.357,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0019882","antigen processing and presentation",24.721,1.9416,0.975,0.567,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0048002","antigen processing and presentation of peptide antigen",19.164,2.1403,0.973,0.635,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0022904","respiratory electron transport chain",4.683,6.0044,0.825,0.000,"respiratory electron transport chain"),
c("GO:0043603","cellular amide metabolic process",0.480,1.5461,0.904,0.119,"respiratory electron transport chain"),
c("GO:0006412","translation",1.984,2.7986,0.821,0.143,"respiratory electron transport chain"),
c("GO:0006091","generation of precursor metabolites and energy",6.571,6.5686,0.900,0.173,"respiratory electron transport chain"),
c("GO:0010025","wax biosynthetic process",0.003,1.4464,0.953,0.189,"respiratory electron transport chain"),
c("GO:0006302","double-strand break repair",0.313,2.7645,0.799,0.221,"respiratory electron transport chain"),
c("GO:0042180","cellular ketone metabolic process",0.444,1.6882,0.867,0.231,"respiratory electron transport chain"),
c("GO:0019722","calcium-mediated signaling",0.299,2.1643,0.833,0.231,"respiratory electron transport chain"),
c("GO:0009211","pyrimidine deoxyribonucleoside triphosphate metabolic process",0.025,1.4464,0.874,0.252,"respiratory electron transport chain"),
c("GO:0009265","2'-deoxyribonucleotide biosynthetic process",0.024,1.3018,0.850,0.259,"respiratory electron transport chain"),
c("GO:0070262","peptidyl-serine dephosphorylation",0.007,1.4464,0.879,0.263,"respiratory electron transport chain"),
c("GO:0044723","single-organism carbohydrate metabolic process",1.976,1.8114,0.872,0.280,"respiratory electron transport chain"),
c("GO:0018214","protein carboxylation",0.022,1.3018,0.881,0.288,"respiratory electron transport chain"),
c("GO:0007268","synaptic transmission",1.611,1.7994,0.880,0.291,"respiratory electron transport chain"),
c("GO:0023019","signal transduction involved in regulation of gene expression",0.169,1.5832,0.803,0.307,"respiratory electron transport chain"),
c("GO:0035637","multicellular organismal signaling",0.539,1.3330,0.893,0.310,"respiratory electron transport chain"),
c("GO:0016071","mRNA metabolic process",1.098,1.7570,0.856,0.310,"respiratory electron transport chain"),
c("GO:0017014","protein nitrosylation",0.072,2.2660,0.871,0.318,"respiratory electron transport chain"),
c("GO:0051437","positive regulation of ubiquitin-protein ligase activity involved in mitotic cell cycle",0.085,2.4584,0.752,0.323,"respiratory electron transport chain"),
c("GO:0018198","peptidyl-cysteine modification",0.089,2.5346,0.863,0.325,"respiratory electron transport chain"),
c("GO:0033539","fatty acid beta-oxidation using acyl-CoA dehydrogenase",0.013,1.6341,0.848,0.327,"respiratory electron transport chain"),
c("GO:0000432","positive regulation of transcription from RNA polymerase II promoter by glucose",0.007,2.1701,0.770,0.344,"respiratory electron transport chain"),
c("GO:2000327","positive regulation of ligand-dependent nuclear receptor transcription coactivator activity",0.002,1.4464,0.909,0.353,"respiratory electron transport chain"),
c("GO:0000398","mRNA splicing, via spliceosome",0.423,1.9176,0.847,0.359,"respiratory electron transport chain"),
c("GO:0006069","ethanol oxidation",0.036,1.3018,0.909,0.359,"respiratory electron transport chain"),
c("GO:0043687","post-translational protein modification",0.259,2.0953,0.859,0.360,"respiratory electron transport chain"),
c("GO:0055114","oxidation-reduction process",10.933,3.5086,0.893,0.370,"respiratory electron transport chain"),
c("GO:0071375","cellular response to peptide hormone stimulus",0.615,2.1701,0.872,0.375,"respiratory electron transport chain"),
c("GO:0045945","positive regulation of transcription from RNA polymerase III promoter",0.014,1.8592,0.824,0.379,"respiratory electron transport chain"),
c("GO:0006413","translational initiation",0.465,2.2534,0.836,0.382,"respiratory electron transport chain"),
c("GO:0010498","proteasomal protein catabolic process",0.487,2.2373,0.811,0.384,"respiratory electron transport chain"),
c("GO:0071287","cellular response to manganese ion",0.011,1.4464,0.911,0.389,"respiratory electron transport chain"),
c("GO:0016601","Rac protein signal transduction",0.100,1.5498,0.852,0.396,"respiratory electron transport chain"),
c("GO:0032006","regulation of TOR signaling",0.103,1.7319,0.843,0.397,"respiratory electron transport chain"),
c("GO:0031929","TOR signaling",0.133,1.7254,0.849,0.406,"respiratory electron transport chain"),
c("GO:0051340","regulation of ligase activity",0.133,1.5746,0.896,0.408,"respiratory electron transport chain"),
c("GO:0042214","terpene metabolic process",0.010,1.4464,0.894,0.412,"respiratory electron transport chain"),
c("GO:0032071","regulation of endodeoxyribonuclease activity",0.003,1.4464,0.823,0.417,"respiratory electron transport chain"),
c("GO:0006521","regulation of cellular amino acid metabolic process",0.082,1.4595,0.822,0.428,"respiratory electron transport chain"),
c("GO:0042986","positive regulation of amyloid precursor protein biosynthetic process",0.003,1.4464,0.816,0.429,"respiratory electron transport chain"),
c("GO:0036119","response to platelet-derived growth factor",0.010,1.4464,0.950,0.444,"respiratory electron transport chain"),
c("GO:0071474","cellular hyperosmotic response",0.016,1.8592,0.917,0.447,"respiratory electron transport chain"),
c("GO:0019932","second-messenger-mediated signaling",0.427,1.4761,0.836,0.447,"respiratory electron transport chain"),
c("GO:0017187","peptidyl-glutamic acid carboxylation",0.022,1.3018,0.875,0.468,"respiratory electron transport chain"),
c("GO:0042522","regulation of tyrosine phosphorylation of Stat5 protein",0.044,1.5611,0.756,0.491,"respiratory electron transport chain"),
c("GO:0044267","cellular protein metabolic process",12.981,1.4233,0.822,0.493,"respiratory electron transport chain"),
c("GO:0010922","positive regulation of phosphatase activity",0.048,1.3188,0.848,0.494,"respiratory electron transport chain"),
c("GO:0010388","cullin deneddylation",0.010,2.2660,0.869,0.506,"respiratory electron transport chain"),
c("GO:0018119","peptidyl-cysteine S-nitrosylation",0.072,2.2660,0.865,0.507,"respiratory electron transport chain"),
c("GO:0042340","keratan sulfate catabolic process",0.014,1.5611,0.832,0.521,"respiratory electron transport chain"),
c("GO:0018196","peptidyl-asparagine modification",0.114,1.9574,0.861,0.524,"respiratory electron transport chain"),
c("GO:0043137","DNA replication, removal of RNA primer",0.007,1.4464,0.841,0.531,"respiratory electron transport chain"),
c("GO:0009057","macromolecule catabolic process",2.264,1.6003,0.867,0.531,"respiratory electron transport chain"),
c("GO:0016042","lipid catabolic process",0.537,1.3125,0.862,0.537,"respiratory electron transport chain"),
c("GO:0006099","tricarboxylic acid cycle",0.104,1.6770,0.873,0.550,"respiratory electron transport chain"),
c("GO:0034199","activation of protein kinase A activity",0.019,2.0565,0.791,0.572,"respiratory electron transport chain"),
c("GO:0070966","nuclear-transcribed mRNA catabolic process, no-go decay",0.006,1.4464,0.858,0.593,"respiratory electron transport chain"),
c("GO:0006303","double-strand break repair via nonhomologous end joining",0.054,1.4670,0.822,0.632,"respiratory electron transport chain"),
c("GO:0018279","protein N-linked glycosylation via asparagine",0.113,1.7390,0.785,0.632,"respiratory electron transport chain"),
c("GO:0000726","non-recombinational repair",0.057,1.3188,0.821,0.635,"respiratory electron transport chain"),
c("GO:0006415","translational termination",0.130,1.8210,0.747,0.639,"respiratory electron transport chain"),
c("GO:0022400","regulation of rhodopsin mediated signaling pathway",0.034,1.3188,0.847,0.643,"respiratory electron transport chain"),
c("GO:0071313","cellular response to caffeine",0.021,1.3018,0.898,0.654,"respiratory electron transport chain"),
c("GO:0071415","cellular response to purine-containing compound",0.021,1.3018,0.898,0.654,"respiratory electron transport chain"),
c("GO:0000209","protein polyubiquitination",0.252,1.4375,0.841,0.654,"respiratory electron transport chain"),
c("GO:0006094","gluconeogenesis",0.180,1.8142,0.865,0.661,"respiratory electron transport chain"),
c("GO:0015012","heparan sulfate proteoglycan biosynthetic process",0.048,1.3188,0.819,0.662,"respiratory electron transport chain"),
c("GO:1901799","negative regulation of proteasomal protein catabolic process",0.039,1.4670,0.764,0.666,"respiratory electron transport chain"),
c("GO:0000354","cis assembly of pre-catalytic spliceosome",0.002,1.4464,0.809,0.674,"respiratory electron transport chain"),
c("GO:0006414","translational elongation",0.313,1.5053,0.841,0.690,"respiratory electron transport chain"),
c("GO:0044699","single-organism process",71.655,1.3617,0.998,0.000,"single-organism process"),
c("GO:0051179","localization",18.927,2.2027,0.996,0.000,"localization"),
c("GO:0051704","multi-organism process",4.431,2.7721,0.995,0.000,"multi-organism process"),
c("GO:0086001","cardiac muscle cell action potential",0.122,2.5800,0.880,0.000,"cardiac muscle cell action potential"),
c("GO:0042447","hormone catabolic process",0.011,1.3018,0.862,0.307,"cardiac muscle cell action potential"),
c("GO:0019725","cellular homeostasis",1.642,1.7520,0.819,0.447,"cardiac muscle cell action potential"),
c("GO:0033484","nitric oxide homeostasis",0.005,1.4464,0.907,0.471,"cardiac muscle cell action potential"),
c("GO:0000722","telomere maintenance via recombination",0.030,1.3188,0.740,0.543,"cardiac muscle cell action potential"),
c("GO:0060373","regulation of ventricular cardiac muscle cell membrane depolarization",0.011,1.8592,0.844,0.576,"cardiac muscle cell action potential"),
c("GO:0060307","regulation of ventricular cardiac muscle cell membrane repolarization",0.026,2.4437,0.743,0.608,"cardiac muscle cell action potential"),
c("GO:0086009","membrane repolarization",0.042,1.6360,0.766,0.628,"cardiac muscle cell action potential"),
c("GO:0045454","cell redox homeostasis",0.245,1.5498,0.819,0.656,"cardiac muscle cell action potential"),
c("GO:0006879","cellular iron ion homeostasis",0.185,1.3170,0.840,0.657,"cardiac muscle cell action potential"),
c("GO:1901019","regulation of calcium ion transmembrane transporter activity",0.147,1.8536,0.741,0.662,"cardiac muscle cell action potential"),
c("GO:0007635","chemosensory behavior",0.028,1.6341,0.934,0.017,"chemosensory behavior"),
c("GO:0017085","response to insecticide",0.043,1.5611,0.947,0.281,"chemosensory behavior"),
c("GO:0046959","habituation",0.005,1.4464,0.889,0.505,"chemosensory behavior"),
c("GO:0042755","eating behavior",0.071,1.5611,0.972,0.535,"chemosensory behavior"),
c("GO:0042048","olfactory behavior",0.018,1.6341,0.936,0.547,"chemosensory behavior"),
c("GO:0046684","response to pyrethroid",0.013,1.4464,0.951,0.681,"chemosensory behavior"),
c("GO:0060992","response to fungicide",0.015,1.4464,0.950,0.688,"chemosensory behavior"),
c("GO:0000041","transition metal ion transport",0.287,3.5850,0.848,0.021,"transition metal ion transport"),
c("GO:0051643","endoplasmic reticulum localization",0.006,1.4464,0.887,0.173,"transition metal ion transport"),
c("GO:0006833","water transport",0.117,1.8520,0.875,0.274,"transition metal ion transport"),
c("GO:0042044","fluid transport",0.132,1.4715,0.874,0.277,"transition metal ion transport"),
c("GO:0045184","establishment of protein localization",3.785,3.4437,0.826,0.328,"transition metal ion transport"),
c("GO:0048193","Golgi vesicle transport",0.508,2.9208,0.813,0.350,"transition metal ion transport"),
c("GO:0015701","bicarbonate transport",0.080,1.3188,0.858,0.362,"transition metal ion transport"),
c("GO:0045175","basal protein localization",0.002,1.4464,0.908,0.414,"transition metal ion transport"),
c("GO:2000286","receptor internalization involved in canonical Wnt signaling pathway",0.003,1.4464,0.775,0.425,"transition metal ion transport"),
c("GO:0033036","macromolecule localization",5.646,2.0521,0.860,0.439,"transition metal ion transport"),
c("GO:0006818","hydrogen transport",3.252,1.4307,0.831,0.447,"transition metal ion transport"),
c("GO:0016192","vesicle-mediated transport",3.273,2.2190,0.857,0.447,"transition metal ion transport"),
c("GO:0032383","regulation of intracellular cholesterol transport",0.002,1.4464,0.805,0.450,"transition metal ion transport"),
c("GO:0051641","cellular localization",6.184,1.9646,0.859,0.477,"transition metal ion transport"),
c("GO:0016973","poly(A)+ mRNA export from nucleus",0.017,1.3295,0.786,0.515,"transition metal ion transport"),
c("GO:0030001","metal ion transport",2.230,2.3716,0.819,0.538,"transition metal ion transport"),
c("GO:2000369","regulation of clathrin-mediated endocytosis",0.014,1.3018,0.770,0.543,"transition metal ion transport"),
c("GO:0008089","anterograde axon cargo transport",0.049,1.5473,0.797,0.557,"transition metal ion transport"),
c("GO:0006891","intra-Golgi vesicle-mediated transport",0.092,1.9352,0.836,0.585,"transition metal ion transport"),
c("GO:0006826","iron ion transport",0.189,2.0550,0.848,0.613,"transition metal ion transport"),
c("GO:0051650","establishment of vesicle localization",0.406,1.4253,0.837,0.614,"transition metal ion transport"),
c("GO:0072511","divalent inorganic cation transport",1.032,1.6253,0.832,0.620,"transition metal ion transport"),
c("GO:0044765","single-organism transport",13.545,3.9586,0.802,0.623,"transition metal ion transport"),
c("GO:0071702","organic substance transport",5.810,3.1079,0.847,0.625,"transition metal ion transport"),
c("GO:0090263","positive regulation of canonical Wnt signaling pathway",0.120,1.3783,0.829,0.628,"transition metal ion transport"),
c("GO:0015868","purine ribonucleotide transport",0.014,1.3018,0.879,0.652,"transition metal ion transport"),
c("GO:0048194","Golgi vesicle budding",0.018,1.3920,0.751,0.674,"transition metal ion transport"),
c("GO:0090150","establishment of protein localization to membrane",0.514,1.9087,0.742,0.677,"transition metal ion transport"),
c("GO:0006941","striated muscle contraction",0.336,2.7852,0.860,0.022,"striated muscle contraction"),
c("GO:0048263","determination of dorsal identity",0.019,1.3018,0.918,0.225,"striated muscle contraction"),
c("GO:0032692","negative regulation of interleukin-1 production",0.027,2.4437,0.873,0.231,"striated muscle contraction"),
c("GO:2000270","negative regulation of fibroblast apoptotic process",0.019,1.5611,0.881,0.268,"striated muscle contraction"),
c("GO:0016246","RNA interference",0.022,1.6341,0.847,0.270,"striated muscle contraction"),
c("GO:0001911","negative regulation of leukocyte mediated cytotoxicity",0.023,1.6341,0.925,0.271,"striated muscle contraction"),
c("GO:0031342","negative regulation of cell killing",0.023,1.6341,0.942,0.271,"striated muscle contraction"),
c("GO:0033689","negative regulation of osteoblast proliferation",0.021,1.3018,0.893,0.275,"striated muscle contraction"),
c("GO:0050912","detection of chemical stimulus involved in sensory perception of taste",0.054,1.4464,0.850,0.458,"striated muscle contraction"),
c("GO:1990086","lens fiber cell apoptotic process",0.006,1.4464,0.938,0.484,"striated muscle contraction"),
c("GO:0060047","heart contraction",0.483,2.3726,0.848,0.549,"striated muscle contraction"),
c("GO:0045948","positive regulation of translational initiation",0.018,1.3018,0.800,0.556,"striated muscle contraction"),
c("GO:0007601","visual perception",0.288,1.3064,0.878,0.596,"striated muscle contraction"),
c("GO:0003012","muscle system process",0.830,1.5318,0.871,0.598,"striated muscle contraction"),
c("GO:0002003","angiotensin maturation",0.016,1.5611,0.721,0.633,"striated muscle contraction"),
c("GO:0010166","wax metabolic process",0.003,1.4464,0.972,0.041,"wax metabolism"),
c("GO:0040034","regulation of development, heterochronic",0.034,1.3018,0.937,0.044,"regulation of development, heterochronic"),
c("GO:0014823","response to activity",0.126,1.5879,0.979,0.053,"response to activity"),
c("GO:0016032","viral process",0.955,2.3382,0.918,0.054,"viral process"),
c("GO:0050690","regulation of defense response to virus by virus",0.033,1.8520,0.898,0.470,"viral process"),
c("GO:0046329","negative regulation of JNK cascade",0.039,1.5473,0.778,0.486,"viral process"),
c("GO:2000254","regulation of male germ cell proliferation",0.006,1.4464,0.840,0.588,"viral process"),
c("GO:0019086","late viral transcription",0.002,1.4464,0.873,0.598,"viral process"),
c("GO:0044419","interspecies interaction between organisms",1.105,2.4597,0.968,0.651,"viral process"),
c("GO:0044764","multi-organism cellular process",0.977,2.1986,0.926,0.652,"viral process"),
c("GO:0019043","establishment of viral latency",0.011,1.3295,0.938,0.668,"viral process"),
c("GO:0019054","modulation by virus of host process",0.021,1.3295,0.845,0.697,"viral process"),
c("GO:0010652","positive regulation of cell communication by chemical coupling",0.006,1.4464,0.871,0.067,"positive regulation of cell communication by chemical coupling"),
c("GO:0051606","detection of stimulus",1.214,1.4494,0.976,0.071,"detection of stimulus"),
c("GO:0005975","carbohydrate metabolic process",3.046,1.6666,0.931,0.083,"carbohydrate metabolism"),
c("GO:0019255","glucose 1-phosphate metabolic process",0.018,1.4464,0.914,0.086,"glucose 1-phosphate metabolism"),
c("GO:0033059","cellular pigmentation",0.108,1.7655,0.904,0.088,"cellular pigmentation"),
c("GO:0009056","catabolic process",7.851,1.8274,0.953,0.097,"catabolism"),
c("GO:0030041","actin filament polymerization",0.348,2.7620,0.771,0.099,"actin filament polymerization"),
c("GO:0002093","auditory receptor cell morphogenesis",0.031,2.2660,0.802,0.266,"actin filament polymerization"),
c("GO:0002335","mature B cell differentiation",0.023,1.3295,0.865,0.293,"actin filament polymerization"),
c("GO:0048630","skeletal muscle tissue growth",0.009,2.1701,0.913,0.349,"actin filament polymerization"),
c("GO:0021553","olfactory nerve development",0.066,1.4464,0.908,0.371,"actin filament polymerization"),
c("GO:0007029","endoplasmic reticulum organization",0.071,1.4984,0.881,0.382,"actin filament polymerization"),
c("GO:0003294","atrial ventricular junction remodeling",0.006,1.4464,0.919,0.415,"actin filament polymerization"),
c("GO:0070842","aggresome assembly",0.021,1.6341,0.912,0.416,"actin filament polymerization"),
c("GO:0072235","metanephric distal tubule development",0.016,1.4464,0.907,0.420,"actin filament polymerization"),
c("GO:0048332","mesoderm morphogenesis",0.199,1.3170,0.937,0.425,"actin filament polymerization"),
c("GO:0043933","macromolecular complex subunit organization",5.276,1.6484,0.891,0.425,"actin filament polymerization"),
c("GO:0010591","regulation of lamellipodium assembly",0.033,1.7020,0.808,0.431,"actin filament polymerization"),
c("GO:0060218","hematopoietic stem cell differentiation",0.032,1.3295,0.861,0.490,"actin filament polymerization"),
c("GO:0071824","protein-DNA complex subunit organization",0.357,1.8719,0.890,0.493,"actin filament polymerization"),
c("GO:0048747","muscle fiber development",0.231,1.4793,0.889,0.543,"actin filament polymerization"),
c("GO:0010603","regulation of cytoplasmic mRNA processing body assembly",0.010,1.8592,0.821,0.543,"actin filament polymerization"),
c("GO:0048631","regulation of skeletal muscle tissue growth",0.006,1.4464,0.885,0.557,"actin filament polymerization"),
c("GO:0034728","nucleosome organization",0.259,2.6882,0.844,0.559,"actin filament polymerization"),
c("GO:2000251","positive regulation of actin cytoskeleton reorganization",0.014,1.3018,0.788,0.572,"actin filament polymerization"),
c("GO:0032200","telomere organization",0.157,1.3170,0.870,0.592,"actin filament polymerization"),
c("GO:0045653","negative regulation of megakaryocyte differentiation",0.007,1.3018,0.822,0.649,"actin filament polymerization"),
c("GO:0006333","chromatin assembly or disassembly",0.277,1.5524,0.852,0.670,"actin filament polymerization"),
c("GO:0030048","actin filament-based movement",0.175,2.5287,0.865,0.677,"actin filament polymerization"),
c("GO:0060491","regulation of cell projection assembly",0.201,1.4551,0.788,0.694,"actin filament polymerization"),
c("GO:0034622","cellular macromolecular complex assembly",1.656,2.0039,0.863,0.698,"actin filament polymerization"));

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
