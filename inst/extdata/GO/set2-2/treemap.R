

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
revigo.data <- rbind(c("GO:0000089","mitotic metaphase",0.013,1.4096,0.993,0.000,"mitotic metaphase"),
c("GO:0002478","antigen processing and presentation of exogenous peptide antigen",0.296,1.4362,0.976,0.000,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0019884","antigen processing and presentation of exogenous antigen",0.303,1.4076,0.986,0.181,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0048002","antigen processing and presentation of peptide antigen",19.164,1.7357,0.983,0.282,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0019882","antigen processing and presentation",24.721,1.8216,0.985,0.568,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0016071","mRNA metabolic process",1.098,4.3188,0.813,0.000,"mRNA metabolism"),
c("GO:0044238","primary metabolic process",41.881,1.8251,0.929,0.101,"mRNA metabolism"),
c("GO:0018065","protein-cofactor linkage",0.018,2.2612,0.871,0.154,"mRNA metabolism"),
c("GO:0036138","peptidyl-histidine hydroxylation",0.001,1.7064,0.878,0.209,"mRNA metabolism"),
c("GO:1990167","protein K27-linked deubiquitination",0.002,1.7064,0.871,0.217,"mRNA metabolism"),
c("GO:0044324","regulation of transcription involved in anterior/posterior axis specification",0.005,1.7064,0.759,0.247,"mRNA metabolism"),
c("GO:0000724","double-strand break repair via homologous recombination",0.136,2.7878,0.707,0.287,"mRNA metabolism"),
c("GO:0044260","cellular macromolecule metabolic process",25.627,2.3820,0.817,0.289,"mRNA metabolism"),
c("GO:0002523","leukocyte migration involved in inflammatory response",0.016,2.4318,0.860,0.299,"mRNA metabolism"),
c("GO:0044237","cellular metabolic process",42.121,1.7959,0.894,0.314,"mRNA metabolism"),
c("GO:0071704","organic substance metabolic process",42.826,1.4203,0.929,0.319,"mRNA metabolism"),
c("GO:0018160","peptidyl-pyrromethane cofactor linkage",0.005,1.7064,0.873,0.338,"mRNA metabolism"),
c("GO:0018197","peptidyl-aspartic acid modification",0.002,1.4096,0.878,0.350,"mRNA metabolism"),
c("GO:1901360","organic cyclic compound metabolic process",25.430,1.3770,0.898,0.355,"mRNA metabolism"),
c("GO:0046483","heterocycle metabolic process",24.799,1.4350,0.865,0.363,"mRNA metabolism"),
c("GO:0006725","cellular aromatic compound metabolic process",24.907,1.3124,0.865,0.364,"mRNA metabolism"),
c("GO:0008380","RNA splicing",0.652,3.5850,0.792,0.375,"mRNA metabolism"),
c("GO:0034198","cellular response to amino acid starvation",0.003,1.7064,0.848,0.384,"mRNA metabolism"),
c("GO:0050832","defense response to fungus",0.038,2.1209,0.913,0.405,"mRNA metabolism"),
c("GO:0006396","RNA processing",1.631,2.3391,0.804,0.415,"mRNA metabolism"),
c("GO:0006259","DNA metabolic process",3.159,2.2557,0.800,0.421,"mRNA metabolism"),
c("GO:0006139","nucleobase-containing compound metabolic process",24.258,1.3078,0.809,0.430,"mRNA metabolism"),
c("GO:2000016","negative regulation of determination of dorsal identity",0.001,1.7064,0.843,0.435,"mRNA metabolism"),
c("GO:0045005","maintenance of fidelity involved in DNA-dependent DNA replication",0.038,1.8983,0.813,0.462,"mRNA metabolism"),
c("GO:0043620","regulation of DNA-templated transcription in response to stress",0.077,1.5100,0.708,0.471,"mRNA metabolism"),
c("GO:0060457","negative regulation of digestive system process",0.024,1.4096,0.829,0.482,"mRNA metabolism"),
c("GO:0090246","convergent extension involved in somitogenesis",0.003,1.7064,0.898,0.495,"mRNA metabolism"),
c("GO:0051053","negative regulation of DNA metabolic process",0.171,2.4647,0.682,0.516,"mRNA metabolism"),
c("GO:0002544","chronic inflammatory response",0.068,1.6517,0.919,0.527,"mRNA metabolism"),
c("GO:0009620","response to fungus",0.062,1.3654,0.956,0.538,"mRNA metabolism"),
c("GO:0019985","translesion synthesis",0.015,2.0017,0.726,0.545,"mRNA metabolism"),
c("GO:0010989","negative regulation of low-density lipoprotein particle clearance",0.013,1.4096,0.845,0.548,"mRNA metabolism"),
c("GO:0006301","postreplication repair",0.027,1.6517,0.739,0.568,"mRNA metabolism"),
c("GO:0042594","response to starvation",0.374,1.3434,0.901,0.568,"mRNA metabolism"),
c("GO:1902402","signal transduction involved in mitotic DNA damage checkpoint",0.111,2.4283,0.677,0.574,"mRNA metabolism"),
c("GO:0032077","positive regulation of deoxyribonuclease activity",0.001,1.7064,0.747,0.575,"mRNA metabolism"),
c("GO:2000054","negative regulation of Wnt signaling pathway involved in dorsal/ventral axis specification",0.002,1.7064,0.760,0.591,"mRNA metabolism"),
c("GO:0051436","negative regulation of ubiquitin-protein ligase activity involved in mitotic cell cycle",0.076,1.7535,0.650,0.592,"mRNA metabolism"),
c("GO:0006260","DNA replication",0.926,1.7142,0.774,0.605,"mRNA metabolism"),
c("GO:0031440","regulation of mRNA 3'-end processing",0.024,1.3654,0.753,0.606,"mRNA metabolism"),
c("GO:0043111","replication fork arrest",0.001,1.7064,0.749,0.611,"mRNA metabolism"),
c("GO:0006974","cellular response to DNA damage stimulus",1.968,2.1746,0.808,0.615,"mRNA metabolism"),
c("GO:0035523","protein K29-linked deubiquitination",0.003,1.4096,0.869,0.627,"mRNA metabolism"),
c("GO:0033554","cellular response to stress",3.483,1.5197,0.823,0.631,"mRNA metabolism"),
c("GO:0007050","cell cycle arrest",0.482,1.9965,0.749,0.636,"mRNA metabolism"),
c("GO:0090304","nucleic acid metabolic process",15.268,1.3157,0.802,0.636,"mRNA metabolism"),
c("GO:1990168","protein K33-linked deubiquitination",0.003,1.4096,0.869,0.640,"mRNA metabolism"),
c("GO:0042770","signal transduction in response to DNA damage",0.211,1.3592,0.759,0.642,"mRNA metabolism"),
c("GO:0000209","protein polyubiquitination",0.252,1.7201,0.833,0.649,"mRNA metabolism"),
c("GO:0006323","DNA packaging",0.361,1.6077,0.720,0.649,"mRNA metabolism"),
c("GO:0042265","peptidyl-asparagine hydroxylation",0.001,1.7064,0.878,0.673,"mRNA metabolism"),
c("GO:0006310","DNA recombination",0.532,1.5870,0.793,0.675,"mRNA metabolism"),
c("GO:0006302","double-strand break repair",0.313,1.9825,0.695,0.679,"mRNA metabolism"),
c("GO:0010792","DNA double-strand break processing involved in repair via single-strand annealing",0.003,1.7064,0.736,0.681,"mRNA metabolism"),
c("GO:0042264","peptidyl-aspartic acid hydroxylation",0.002,1.4096,0.874,0.695,"mRNA metabolism"),
c("GO:0070488","neutrophil aggregation",0.002,3.4202,0.968,0.000,"neutrophil aggregation"),
c("GO:0090136","epithelial cell-cell adhesion",0.050,1.8983,0.965,0.542,"neutrophil aggregation"),
c("GO:0071603","endothelial cell-cell adhesion",0.006,1.4096,0.968,0.571,"neutrophil aggregation"),
c("GO:0070486","leukocyte aggregation",0.011,2.1209,0.966,0.692,"neutrophil aggregation"),
c("GO:0071840","cellular component organization or biogenesis",12.603,2.6440,0.994,0.000,"cellular component organization or biogenesis"),
c("GO:0007191","adenylate cyclase-activating dopamine receptor signaling pathway",0.032,2.6478,0.829,0.033,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0010507","negative regulation of autophagy",0.068,2.5436,0.744,0.115,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0048742","regulation of skeletal muscle fiber development",0.076,1.9516,0.795,0.122,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0031958","corticosteroid receptor signaling pathway",0.048,1.8983,0.830,0.196,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0097202","activation of cysteine-type endopeptidase activity",0.163,2.5157,0.761,0.207,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0040032","post-embryonic body morphogenesis",0.005,1.7064,0.928,0.226,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0072331","signal transduction by p53 class mediator",0.265,1.8837,0.805,0.226,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:2000079","regulation of canonical Wnt signaling pathway involved in controlling type B pancreatic cell proliferation",0.002,1.7064,0.823,0.235,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0010565","regulation of cellular ketone metabolic process",0.322,1.4951,0.774,0.239,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0035860","glial cell-derived neurotrophic factor receptor signaling pathway",0.018,1.4096,0.838,0.264,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:2000672","negative regulation of motor neuron apoptotic process",0.005,1.7064,0.834,0.271,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0044345","stromal-epithelial cell signaling involved in prostate gland development",0.003,1.7064,0.863,0.276,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0009822","alkaloid catabolic process",0.003,1.4096,0.874,0.284,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0034050","host programmed cell death induced by symbiont",0.002,1.7064,0.930,0.296,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0042738","exogenous drug catabolic process",0.015,1.4096,0.876,0.310,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0035425","autocrine signaling",0.002,1.4096,0.906,0.342,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0045926","negative regulation of growth",0.466,1.6743,0.853,0.355,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0014034","neural crest cell fate commitment",0.006,1.7064,0.800,0.358,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0006348","chromatin silencing at telomere",0.003,1.4096,0.756,0.362,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0003408","optic cup formation involved in camera-type eye development",0.010,1.4096,0.906,0.374,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0006914","autophagy",0.414,2.0862,0.871,0.391,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0031279","regulation of cyclase activity",0.121,1.8554,0.844,0.425,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0051339","regulation of lyase activity",0.126,1.8105,0.844,0.426,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0042977","activation of JAK2 kinase activity",0.015,1.4096,0.706,0.431,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0060399","positive regulation of growth hormone receptor signaling pathway",0.003,1.4096,0.821,0.431,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0007212","dopamine receptor signaling pathway",0.100,2.3089,0.819,0.437,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0097193","intrinsic apoptotic signaling pathway",0.550,1.7018,0.786,0.453,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0032317","regulation of Rap GTPase activity",0.039,1.8983,0.677,0.479,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:2001013","epithelial cell proliferation involved in renal tubule morphogenesis",0.007,1.7064,0.904,0.480,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0090101","negative regulation of transmembrane receptor protein serine/threonine kinase signaling pathway",0.206,1.3125,0.754,0.495,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0044338","canonical Wnt signaling pathway involved in mesenchymal stem cell differentiation",0.002,1.4096,0.810,0.500,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0044339","canonical Wnt signaling pathway involved in osteoblast differentiation",0.002,1.4096,0.811,0.500,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0042684","cardioblast cell fate commitment",0.003,1.4096,0.864,0.504,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:1901320","negative regulation of heart induction",0.003,1.4096,0.757,0.504,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0045761","regulation of adenylate cyclase activity",0.106,1.8554,0.713,0.514,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0009894","regulation of catabolic process",2.662,1.8824,0.812,0.515,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0043161","proteasome-mediated ubiquitin-dependent protein catabolic process",0.459,1.8564,0.786,0.521,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0032486","Rap protein signal transduction",0.051,1.4143,0.823,0.531,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0051336","regulation of hydrolase activity",3.070,1.6985,0.800,0.563,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0051091","positive regulation of sequence-specific DNA binding transcription factor activity",0.342,1.4786,0.713,0.569,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0051090","regulation of sequence-specific DNA binding transcription factor activity",0.562,1.3153,0.710,0.602,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0014029","neural crest formation",0.008,1.4096,0.802,0.610,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0000288","nuclear-transcribed mRNA catabolic process, deadenylation-dependent decay",0.090,1.6445,0.785,0.639,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0031329","regulation of cellular catabolic process",2.423,1.9965,0.740,0.641,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0031959","mineralocorticoid receptor signaling pathway",0.003,1.4096,0.853,0.677,"adenylate cyclase-activating dopamine receptor signaling pathway"),
c("GO:0043044","ATP-dependent chromatin remodeling",0.079,3.0969,0.831,0.036,"ATP-dependent chromatin remodeling"),
c("GO:0002934","desmosome organization",0.021,2.0017,0.862,0.234,"ATP-dependent chromatin remodeling"),
c("GO:0046847","filopodium assembly",0.140,2.8827,0.815,0.267,"ATP-dependent chromatin remodeling"),
c("GO:0045048","protein insertion into ER membrane",0.013,2.6478,0.831,0.306,"ATP-dependent chromatin remodeling"),
c("GO:0034330","cell junction organization",0.493,1.6949,0.828,0.308,"ATP-dependent chromatin remodeling"),
c("GO:0030046","parallel actin filament bundle assembly",0.002,1.7064,0.843,0.341,"ATP-dependent chromatin remodeling"),
c("GO:0036399","TCR signalosome assembly",0.002,1.7064,0.891,0.341,"ATP-dependent chromatin remodeling"),
c("GO:0010256","endomembrane system organization",0.734,1.5991,0.886,0.358,"ATP-dependent chromatin remodeling"),
c("GO:0046907","intracellular transport",3.541,1.8182,0.939,0.424,"ATP-dependent chromatin remodeling"),
c("GO:0035409","histone H3-Y41 phosphorylation",0.001,1.7064,0.777,0.444,"ATP-dependent chromatin remodeling"),
c("GO:0007010","cytoskeleton organization",2.674,2.1838,0.815,0.458,"ATP-dependent chromatin remodeling"),
c("GO:0016973","poly(A)+ mRNA export from nucleus",0.017,2.0017,0.856,0.460,"ATP-dependent chromatin remodeling"),
c("GO:0051639","actin filament network formation",0.003,1.4096,0.847,0.461,"ATP-dependent chromatin remodeling"),
c("GO:0045184","establishment of protein localization",3.785,1.5372,0.944,0.472,"ATP-dependent chromatin remodeling"),
c("GO:0051668","localization within membrane",0.075,1.5100,0.955,0.496,"ATP-dependent chromatin remodeling"),
c("GO:0006891","intra-Golgi vesicle-mediated transport",0.092,1.3198,0.936,0.535,"ATP-dependent chromatin remodeling"),
c("GO:0060155","platelet dense granule organization",0.013,2.4318,0.869,0.543,"ATP-dependent chromatin remodeling"),
c("GO:0034622","cellular macromolecular complex assembly",1.656,2.2644,0.834,0.552,"ATP-dependent chromatin remodeling"),
c("GO:0071826","ribonucleoprotein complex subunit organization",0.332,2.0472,0.870,0.568,"ATP-dependent chromatin remodeling"),
c("GO:0071824","protein-DNA complex subunit organization",0.357,1.4249,0.869,0.572,"ATP-dependent chromatin remodeling"),
c("GO:0032387","negative regulation of intracellular transport",0.183,1.3511,0.781,0.573,"ATP-dependent chromatin remodeling"),
c("GO:0030035","microspike assembly",0.006,1.4096,0.848,0.604,"ATP-dependent chromatin remodeling"),
c("GO:0007015","actin filament organization",0.768,1.8972,0.785,0.621,"ATP-dependent chromatin remodeling"),
c("GO:0035406","histone-tyrosine phosphorylation",0.001,1.7064,0.777,0.633,"ATP-dependent chromatin remodeling"),
c("GO:0016043","cellular component organization",12.380,2.5901,0.853,0.634,"ATP-dependent chromatin remodeling"),
c("GO:0051205","protein insertion into membrane",0.066,1.6866,0.851,0.643,"ATP-dependent chromatin remodeling"),
c("GO:0042766","nucleosome mobilization",0.001,1.7064,0.862,0.651,"ATP-dependent chromatin remodeling"),
c("GO:0044087","regulation of cellular component biogenesis",1.045,1.3323,0.817,0.664,"ATP-dependent chromatin remodeling"),
c("GO:0051276","chromosome organization",2.327,1.4193,0.817,0.669,"ATP-dependent chromatin remodeling"),
c("GO:0033363","secretory granule organization",0.047,1.6517,0.858,0.684,"ATP-dependent chromatin remodeling"),
c("GO:0006325","chromatin organization",1.762,1.6996,0.797,0.685,"ATP-dependent chromatin remodeling"),
c("GO:0022618","ribonucleoprotein complex assembly",0.317,1.6390,0.846,0.691,"ATP-dependent chromatin remodeling"),
c("GO:0000354","cis assembly of pre-catalytic spliceosome",0.002,1.4096,0.758,0.692,"ATP-dependent chromatin remodeling"),
c("GO:0034695","response to prostaglandin E",0.022,2.1209,0.946,0.048,"response to prostaglandin E"),
c("GO:0035722","interleukin-12-mediated signaling pathway",0.003,1.4096,0.840,0.280,"response to prostaglandin E"),
c("GO:0010043","response to zinc ion",0.099,1.3654,0.956,0.291,"response to prostaglandin E"),
c("GO:0007638","mechanosensory behavior",0.026,2.2612,0.945,0.049,"mechanosensory behavior"),
c("GO:0016062","adaptation of rhodopsin mediated signaling",0.003,1.7064,0.828,0.400,"mechanosensory behavior"),
c("GO:0061428","negative regulation of transcription from RNA polymerase II promoter in response to hypoxia",0.005,1.4096,0.702,0.406,"mechanosensory behavior"),
c("GO:0032119","sequestering of zinc ion",0.010,2.2612,0.885,0.050,"sequestering of zinc ion"),
c("GO:0015709","thiosulfate transport",0.088,1.7064,0.947,0.166,"sequestering of zinc ion"),
c("GO:0003084","positive regulation of systemic arterial blood pressure",0.027,2.0017,0.894,0.278,"sequestering of zinc ion"),
c("GO:0014846","esophagus smooth muscle contraction",0.011,1.7064,0.936,0.350,"sequestering of zinc ion"),
c("GO:0051235","maintenance of location",0.656,1.5050,0.906,0.366,"sequestering of zinc ion"),
c("GO:0070779","D-aspartate import",0.003,1.4096,0.950,0.461,"sequestering of zinc ion"),
c("GO:0007608","sensory perception of smell",0.790,1.4667,0.919,0.464,"sequestering of zinc ion"),
c("GO:0051238","sequestering of metal ion",0.226,1.6189,0.908,0.654,"sequestering of zinc ion"),
c("GO:0055069","zinc ion homeostasis",0.031,1.5847,0.936,0.658,"sequestering of zinc ion"),
c("GO:0007049","cell cycle",3.703,1.3067,0.902,0.076,"cell cycle"),
c("GO:0006094","gluconeogenesis",0.180,2.5784,0.858,0.093,"gluconeogenesis"),
c("GO:0016098","monoterpenoid metabolic process",0.007,1.7064,0.896,0.123,"gluconeogenesis"),
c("GO:0044107","cellular alcohol metabolic process",0.008,1.4096,0.876,0.124,"gluconeogenesis"),
c("GO:0019276","UDP-N-acetylgalactosamine metabolic process",0.003,1.4096,0.870,0.175,"gluconeogenesis"),
c("GO:0009449","gamma-aminobutyric acid biosynthetic process",0.010,1.4096,0.839,0.374,"gluconeogenesis"),
c("GO:0030201","heparan sulfate proteoglycan metabolic process",0.063,1.3198,0.826,0.408,"gluconeogenesis"),
c("GO:1902652","secondary alcohol metabolic process",0.008,1.4096,0.903,0.516,"gluconeogenesis"),
c("GO:0009110","vitamin biosynthetic process",0.052,1.3198,0.833,0.531,"gluconeogenesis"),
c("GO:0016051","carbohydrate biosynthetic process",0.513,1.3392,0.855,0.664,"gluconeogenesis"));

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
