

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
revigo.data <- rbind(c("GO:0008152","metabolic process",54.733,1.3518,0.997,0.000,"metabolism"),
c("GO:0010225","response to UV-C",0.027,3.8861,0.948,0.000,"response to UV-C"),
c("GO:0007634","optokinetic behavior",0.001,1.9763,0.878,0.510,"response to UV-C"),
c("GO:0071214","cellular response to abiotic stimulus",0.450,1.6755,0.878,0.544,"response to UV-C"),
c("GO:0010629","negative regulation of gene expression",2.446,5.4437,0.714,0.000,"negative regulation of gene expression"),
c("GO:0019222","regulation of metabolic process",17.756,3.5686,0.866,0.129,"negative regulation of gene expression"),
c("GO:0048519","negative regulation of biological process",8.588,1.9527,0.904,0.168,"negative regulation of gene expression"),
c("GO:0044237","cellular metabolic process",42.121,1.6747,0.875,0.210,"negative regulation of gene expression"),
c("GO:0048518","positive regulation of biological process",28.712,3.2441,0.885,0.236,"negative regulation of gene expression"),
c("GO:0006725","cellular aromatic compound metabolic process",24.907,1.5423,0.854,0.242,"negative regulation of gene expression"),
c("GO:0007072","positive regulation of transcription on exit from mitosis",0.001,1.9763,0.746,0.248,"negative regulation of gene expression"),
c("GO:0044725","chromatin reprogramming in the zygote",0.003,1.9763,0.727,0.267,"negative regulation of gene expression"),
c("GO:0050794","regulation of cellular process",28.971,2.2366,0.855,0.282,"negative regulation of gene expression"),
c("GO:0045896","regulation of transcription during mitosis",0.008,1.3812,0.802,0.285,"negative regulation of gene expression"),
c("GO:0010467","gene expression",15.379,3.1612,0.862,0.304,"negative regulation of gene expression"),
c("GO:0090038","negative regulation of protein kinase C signaling",0.002,1.6778,0.815,0.312,"negative regulation of gene expression"),
c("GO:0044238","primary metabolic process",41.881,1.4726,0.917,0.314,"negative regulation of gene expression"),
c("GO:0043170","macromolecule metabolic process",29.866,1.9834,0.887,0.315,"negative regulation of gene expression"),
c("GO:0071704","organic substance metabolic process",42.826,1.5112,0.916,0.319,"negative regulation of gene expression"),
c("GO:0006295","nucleotide-excision repair, DNA incision, 3'-to lesion",0.003,1.6778,0.822,0.325,"negative regulation of gene expression"),
c("GO:0050789","regulation of biological process",49.744,1.8348,0.882,0.337,"negative regulation of gene expression"),
c("GO:0007264","small GTPase mediated signal transduction",2.633,1.4777,0.756,0.352,"negative regulation of gene expression"),
c("GO:0046483","heterocycle metabolic process",24.799,1.5315,0.854,0.359,"negative regulation of gene expression"),
c("GO:0071157","negative regulation of cell cycle arrest",0.063,2.2441,0.811,0.405,"negative regulation of gene expression"),
c("GO:0006366","transcription from RNA polymerase II promoter",3.963,3.3979,0.757,0.457,"negative regulation of gene expression"),
c("GO:0032966","negative regulation of collagen biosynthetic process",0.005,1.5039,0.743,0.465,"negative regulation of gene expression"),
c("GO:0035556","intracellular signal transduction",6.704,2.1284,0.741,0.484,"negative regulation of gene expression"),
c("GO:0031323","regulation of cellular metabolic process",15.735,4.1938,0.673,0.511,"negative regulation of gene expression"),
c("GO:0044260","cellular macromolecule metabolic process",25.627,2.0083,0.802,0.524,"negative regulation of gene expression"),
c("GO:0019438","aromatic compound biosynthetic process",13.512,2.5702,0.777,0.529,"negative regulation of gene expression"),
c("GO:0010646","regulation of cell communication",6.570,1.3785,0.766,0.529,"negative regulation of gene expression"),
c("GO:0023051","regulation of signaling",6.570,1.3839,0.848,0.534,"negative regulation of gene expression"),
c("GO:1900477","negative regulation of G1/S transition of mitotic cell cycle by negative regulation of transcription from RNA polymerase II promoter",0.001,1.9763,0.775,0.555,"negative regulation of gene expression"),
c("GO:0051726","regulation of cell cycle",1.952,1.4022,0.802,0.561,"negative regulation of gene expression"),
c("GO:0008285","negative regulation of cell proliferation",1.492,2.0980,0.771,0.567,"negative regulation of gene expression"),
c("GO:0045893","positive regulation of transcription, DNA-templated",2.722,1.9370,0.627,0.586,"negative regulation of gene expression"),
c("GO:0009893","positive regulation of metabolic process",5.415,1.9821,0.768,0.597,"negative regulation of gene expression"),
c("GO:0033137","negative regulation of peptidyl-serine phosphorylation",0.100,1.8684,0.748,0.600,"negative regulation of gene expression"),
c("GO:0006139","nucleobase-containing compound metabolic process",24.258,1.7615,0.784,0.611,"negative regulation of gene expression"),
c("GO:0009967","positive regulation of signal transduction",2.348,1.8652,0.713,0.612,"negative regulation of gene expression"),
c("GO:0006357","regulation of transcription from RNA polymerase II promoter",3.684,2.6819,0.654,0.613,"negative regulation of gene expression"),
c("GO:0000720","pyrimidine dimer repair by nucleotide-excision repair",0.008,1.5039,0.815,0.625,"negative regulation of gene expression"),
c("GO:0090427","activation of meiosis",0.116,1.5039,0.742,0.631,"negative regulation of gene expression"),
c("GO:0090304","nucleic acid metabolic process",15.268,1.7881,0.781,0.636,"negative regulation of gene expression"),
c("GO:0007265","Ras protein signal transduction",1.560,1.3940,0.769,0.647,"negative regulation of gene expression"),
c("GO:0009892","negative regulation of metabolic process",3.994,2.8601,0.753,0.648,"negative regulation of gene expression"),
c("GO:1901538","changes to DNA methylation involved in embryo development",0.010,1.3812,0.751,0.656,"negative regulation of gene expression"),
c("GO:1901362","organic cyclic compound biosynthetic process",13.849,2.3335,0.809,0.676,"negative regulation of gene expression"),
c("GO:0023056","positive regulation of signaling",2.489,1.7474,0.823,0.683,"negative regulation of gene expression"),
c("GO:0010647","positive regulation of cell communication",2.500,1.7378,0.735,0.684,"negative regulation of gene expression"),
c("GO:0018130","heterocycle biosynthetic process",13.553,2.5498,0.777,0.691,"negative regulation of gene expression"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",13.670,2.4045,0.772,0.693,"negative regulation of gene expression"),
c("GO:0034641","cellular nitrogen compound metabolic process",25.263,1.4027,0.806,0.697,"negative regulation of gene expression"),
c("GO:0032502","developmental process",13.055,1.3410,0.994,0.000,"developmental process"),
c("GO:0048569","post-embryonic organ development",0.038,3.6383,0.833,0.000,"post-embryonic organ development"),
c("GO:0001302","replicative cell aging",0.010,1.5039,0.841,0.208,"post-embryonic organ development"),
c("GO:0021599","abducens nerve formation",0.001,1.9763,0.831,0.217,"post-embryonic organ development"),
c("GO:0001974","blood vessel remodeling",0.109,1.5819,0.887,0.218,"post-embryonic organ development"),
c("GO:0021570","rhombomere 4 development",0.005,1.9763,0.831,0.270,"post-embryonic organ development"),
c("GO:0060021","palate development",0.311,1.7167,0.843,0.280,"post-embryonic organ development"),
c("GO:0002352","B cell negative selection",0.009,3.4815,0.803,0.281,"post-embryonic organ development"),
c("GO:0010624","regulation of Schwann cell proliferation",0.010,1.5039,0.742,0.298,"post-embryonic organ development"),
c("GO:0048593","camera-type eye morphogenesis",0.270,3.4202,0.779,0.350,"post-embryonic organ development"),
c("GO:0060068","vagina development",0.051,2.3279,0.822,0.358,"post-embryonic organ development"),
c("GO:1902262","apoptotic process involved in patterning of blood vessels",0.018,2.9666,0.738,0.364,"post-embryonic organ development"),
c("GO:0007389","pattern specification process",1.143,2.0357,0.808,0.374,"post-embryonic organ development"),
c("GO:0009886","post-embryonic morphogenesis",0.027,2.4214,0.823,0.375,"post-embryonic organ development"),
c("GO:0009791","post-embryonic development",0.281,1.4095,0.827,0.375,"post-embryonic organ development"),
c("GO:0031018","endocrine pancreas development",0.111,1.4290,0.822,0.380,"post-embryonic organ development"),
c("GO:0051146","striated muscle cell differentiation",0.776,1.7921,0.761,0.381,"post-embryonic organ development"),
c("GO:0031100","organ regeneration",0.148,1.3509,0.818,0.388,"post-embryonic organ development"),
c("GO:0035270","endocrine system development",0.434,1.3645,0.813,0.392,"post-embryonic organ development"),
c("GO:0048736","appendage development",0.500,1.5651,0.818,0.397,"post-embryonic organ development"),
c("GO:0060325","face morphogenesis",0.182,1.4864,0.815,0.433,"post-embryonic organ development"),
c("GO:0030318","melanocyte differentiation",0.079,2.0339,0.786,0.449,"post-embryonic organ development"),
c("GO:0006949","syncytium formation",0.077,1.8684,0.790,0.452,"post-embryonic organ development"),
c("GO:0060806","negative regulation of cell differentiation involved in embryonic placenta development",0.001,1.9763,0.738,0.464,"post-embryonic organ development"),
c("GO:0035108","limb morphogenesis",0.455,1.6733,0.789,0.468,"post-embryonic organ development"),
c("GO:0007423","sensory organ development",1.365,1.5532,0.786,0.473,"post-embryonic organ development"),
c("GO:0030901","midbrain development",0.190,1.7321,0.799,0.487,"post-embryonic organ development"),
c("GO:0061311","cell surface receptor signaling pathway involved in heart development",0.160,1.9197,0.679,0.492,"post-embryonic organ development"),
c("GO:0048702","embryonic neurocranium morphogenesis",0.017,1.3812,0.813,0.508,"post-embryonic organ development"),
c("GO:0021993","initiation of neural tube closure",0.006,1.9763,0.818,0.513,"post-embryonic organ development"),
c("GO:0060876","semicircular canal formation",0.005,1.9763,0.813,0.532,"post-embryonic organ development"),
c("GO:0043585","nose morphogenesis",0.007,1.5039,0.826,0.546,"post-embryonic organ development"),
c("GO:0021754","facial nucleus development",0.003,1.6778,0.837,0.548,"post-embryonic organ development"),
c("GO:0021560","abducens nerve development",0.001,1.9763,0.846,0.570,"post-embryonic organ development"),
c("GO:0007399","nervous system development",4.932,1.4302,0.773,0.573,"post-embryonic organ development"),
c("GO:0021592","fourth ventricle development",0.011,1.6778,0.824,0.582,"post-embryonic organ development"),
c("GO:0042113","B cell activation",0.487,1.5025,0.911,0.585,"post-embryonic organ development"),
c("GO:0060536","cartilage morphogenesis",0.136,2.6498,0.793,0.592,"post-embryonic organ development"),
c("GO:0002339","B cell selection",0.010,3.4815,0.802,0.641,"post-embryonic organ development"),
c("GO:0009952","anterior/posterior pattern specification",0.642,1.9606,0.807,0.647,"post-embryonic organ development"),
c("GO:0021603","cranial nerve formation",0.008,1.6778,0.816,0.651,"post-embryonic organ development"),
c("GO:0021555","midbrain-hindbrain boundary morphogenesis",0.010,1.6778,0.802,0.653,"post-embryonic organ development"),
c("GO:0061312","BMP signaling pathway involved in heart development",0.113,1.3812,0.592,0.654,"post-embryonic organ development"),
c("GO:0060800","regulation of cell differentiation involved in embryonic placenta development",0.001,1.9763,0.764,0.654,"post-embryonic organ development"),
c("GO:1901741","positive regulation of myoblast fusion",0.016,1.3812,0.668,0.676,"post-embryonic organ development"),
c("GO:0048856","anatomical structure development",11.534,1.4790,0.801,0.685,"post-embryonic organ development"),
c("GO:0048806","genitalia development",0.128,1.3509,0.813,0.688,"post-embryonic organ development"),
c("GO:0065007","biological regulation",51.216,1.8348,0.997,0.000,"biological regulation"),
c("GO:0010248","establishment or maintenance of transmembrane electrochemical gradient",0.005,3.4815,0.912,0.011,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0035526","retrograde transport, plasma membrane to Golgi",0.003,1.9763,0.929,0.170,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0051928","positive regulation of calcium ion transport",0.122,2.1325,0.852,0.282,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0070727","cellular macromolecule localization",3.140,1.8170,0.914,0.380,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0010609","mRNA localization resulting in posttranscriptional regulation of gene expression",0.006,1.6778,0.809,0.410,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0016081","synaptic vesicle docking involved in exocytosis",0.010,1.3812,0.832,0.413,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0061462","protein localization to lysosome",0.018,1.6778,0.936,0.449,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:2001179","regulation of interleukin-10 secretion",0.025,1.3812,0.735,0.462,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:1902578","single-organism localization",14.013,1.3305,0.916,0.497,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:2001137","positive regulation of endocytic recycling",0.011,1.6778,0.798,0.535,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0050821","protein stabilization",0.131,1.6349,0.799,0.578,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0061157","mRNA destabilization",0.009,1.5039,0.833,0.595,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0051050","positive regulation of transport",1.381,1.4167,0.837,0.603,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0045806","negative regulation of endocytosis",0.080,1.6167,0.738,0.614,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0032388","positive regulation of intracellular transport",0.369,1.4435,0.778,0.686,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:1902580","single-organism cellular localization",1.731,1.3305,0.902,0.695,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0043487","regulation of RNA stability",0.093,1.3032,0.805,0.696,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0071461","cellular response to redox state",0.001,1.9763,0.980,0.040,"cellular response to redox state"),
c("GO:0010046","response to mycotoxin",0.009,3.1871,0.968,0.045,"response to mycotoxin"),
c("GO:1900103","positive regulation of endoplasmic reticulum unfolded protein response",0.005,2.9666,0.791,0.231,"response to mycotoxin"),
c("GO:0034696","response to prostaglandin F",0.002,1.9763,0.967,0.254,"response to mycotoxin"),
c("GO:0009744","response to sucrose",0.038,1.5039,0.961,0.364,"response to mycotoxin"),
c("GO:0006974","cellular response to DNA damage stimulus",1.968,2.0726,0.862,0.465,"response to mycotoxin"),
c("GO:0043516","regulation of DNA damage response, signal transduction by p53 class mediator",0.040,1.6916,0.792,0.551,"response to mycotoxin"),
c("GO:0006990","positive regulation of transcription from RNA polymerase II promoter involved in unfolded protein response",0.002,1.6778,0.730,0.646,"response to mycotoxin"),
c("GO:0008630","intrinsic apoptotic signaling pathway in response to DNA damage",0.252,1.8745,0.738,0.654,"response to mycotoxin"),
c("GO:0034285","response to disaccharide",0.038,1.5039,0.961,0.670,"response to mycotoxin"),
c("GO:1900101","regulation of endoplasmic reticulum unfolded protein response",0.006,2.7932,0.811,0.676,"response to mycotoxin"),
c("GO:0006775","fat-soluble vitamin metabolic process",0.064,1.6916,0.930,0.049,"fat-soluble vitamin metabolism"),
c("GO:0006184","GTP catabolic process",2.612,1.5805,0.795,0.314,"fat-soluble vitamin metabolism"),
c("GO:0001574","ganglioside biosynthetic process",0.014,1.3812,0.859,0.320,"fat-soluble vitamin metabolism"),
c("GO:0006914","autophagy",0.414,1.4551,0.907,0.547,"fat-soluble vitamin metabolism"),
c("GO:1901068","guanosine-containing compound metabolic process",2.687,1.4900,0.804,0.628,"fat-soluble vitamin metabolism"),
c("GO:0009620","response to fungus",0.062,1.8684,0.969,0.051,"response to fungus"),
c("GO:0019046","release from viral latency",0.003,1.6778,0.960,0.337,"response to fungus"),
c("GO:0023035","CD40 signaling pathway",0.006,1.6778,0.854,0.052,"CD40 signaling pathway"),
c("GO:0032970","regulation of actin filament-based process",0.660,1.3299,0.831,0.119,"CD40 signaling pathway"),
c("GO:0038034","signal transduction in absence of ligand",0.226,1.5067,0.814,0.194,"CD40 signaling pathway"),
c("GO:0060158","phospholipase C-activating dopamine receptor signaling pathway",0.013,1.3812,0.846,0.235,"CD40 signaling pathway"),
c("GO:0038003","opioid receptor signaling pathway",0.036,1.3812,0.834,0.387,"CD40 signaling pathway"),
c("GO:0043497","regulation of protein heterodimerization activity",0.016,2.9666,0.936,0.052,"regulation of protein heterodimerization activity"),
c("GO:2000326","negative regulation of ligand-dependent nuclear receptor transcription coactivator activity",0.001,1.9763,0.896,0.259,"regulation of protein heterodimerization activity"),
c("GO:2000325","regulation of ligand-dependent nuclear receptor transcription coactivator activity",0.003,1.5039,0.890,0.274,"regulation of protein heterodimerization activity"),
c("GO:0008635","activation of cysteine-type endopeptidase activity involved in apoptotic process by cytochrome c",0.021,2.7932,0.755,0.302,"regulation of protein heterodimerization activity"),
c("GO:0044346","fibroblast apoptotic process",0.033,2.0339,0.881,0.373,"regulation of protein heterodimerization activity"),
c("GO:0097285","cell-type specific apoptotic process",1.126,1.7167,0.855,0.492,"regulation of protein heterodimerization activity"),
c("GO:0080120","CAAX-box protein maturation",0.005,1.6778,0.896,0.520,"regulation of protein heterodimerization activity"),
c("GO:0071586","CAAX-box protein processing",0.005,1.6778,0.896,0.526,"regulation of protein heterodimerization activity"),
c("GO:1902742","apoptotic process involved in development",0.092,1.6533,0.765,0.536,"regulation of protein heterodimerization activity"),
c("GO:0010623","developmental programmed cell death",0.111,1.4571,0.757,0.542,"regulation of protein heterodimerization activity"),
c("GO:0051345","positive regulation of hydrolase activity",2.284,1.4837,0.796,0.550,"regulation of protein heterodimerization activity"),
c("GO:0001783","B cell apoptotic process",0.046,1.9747,0.876,0.565,"regulation of protein heterodimerization activity"),
c("GO:2001055","positive regulation of mesenchymal cell apoptotic process",0.111,1.6778,0.772,0.612,"regulation of protein heterodimerization activity"),
c("GO:0097152","mesenchymal cell apoptotic process",0.145,1.5039,0.869,0.665,"regulation of protein heterodimerization activity"),
c("GO:0032471","negative regulation of endoplasmic reticulum calcium ion concentration",0.021,2.6498,0.891,0.054,"negative regulation of endoplasmic reticulum calcium ion concentration"),
c("GO:0051881","regulation of mitochondrial membrane potential",0.095,1.4290,0.917,0.313,"negative regulation of endoplasmic reticulum calcium ion concentration"),
c("GO:0002260","lymphocyte homeostasis",0.164,2.3054,0.902,0.446,"negative regulation of endoplasmic reticulum calcium ion concentration"),
c("GO:0032469","endoplasmic reticulum calcium ion homeostasis",0.058,2.0980,0.883,0.614,"negative regulation of endoplasmic reticulum calcium ion concentration"),
c("GO:0040012","regulation of locomotion",1.268,1.7333,0.905,0.087,"regulation of locomotion"),
c("GO:0046598","positive regulation of viral entry into host cell",0.003,1.6778,0.853,0.451,"regulation of locomotion"),
c("GO:0051130","positive regulation of cellular component organization",1.698,3.0809,0.810,0.090,"positive regulation of cellular component organization"),
c("GO:0000390","spliceosomal complex disassembly",0.006,1.9763,0.819,0.264,"positive regulation of cellular component organization"),
c("GO:0048522","positive regulation of cellular process",8.548,3.6576,0.790,0.272,"positive regulation of cellular component organization"),
c("GO:0060988","lipid tube assembly",0.002,1.9763,0.941,0.272,"positive regulation of cellular component organization"),
c("GO:0010256","endomembrane system organization",0.734,1.3196,0.921,0.407,"positive regulation of cellular component organization"),
c("GO:0016570","histone modification",1.247,1.3551,0.747,0.433,"positive regulation of cellular component organization"),
c("GO:1901030","positive regulation of mitochondrial outer membrane permeabilization involved in apoptotic signaling pathway",0.010,2.6498,0.663,0.473,"positive regulation of cellular component organization"),
c("GO:0051128","regulation of cellular component organization",3.835,2.7645,0.839,0.499,"positive regulation of cellular component organization"),
c("GO:0008053","mitochondrial fusion",0.043,2.0339,0.845,0.591,"positive regulation of cellular component organization"),
c("GO:0006996","organelle organization",7.033,1.4891,0.852,0.619,"positive regulation of cellular component organization"),
c("GO:0072659","protein localization to plasma membrane",0.280,1.7773,0.840,0.620,"positive regulation of cellular component organization"),
c("GO:1902589","single-organism organelle organization",5.234,1.4847,0.813,0.673,"positive regulation of cellular component organization"),
c("GO:0061025","membrane fusion",0.229,1.3357,0.907,0.677,"positive regulation of cellular component organization"),
c("GO:0001558","regulation of cell growth",0.643,2.0778,0.763,0.687,"positive regulation of cellular component organization"),
c("GO:0010821","regulation of mitochondrion organization",0.142,1.3943,0.788,0.700,"positive regulation of cellular component organization"));

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
