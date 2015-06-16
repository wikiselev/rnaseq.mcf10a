

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
revigo.data <- rbind(c("GO:0006366","transcription from RNA polymerase II promoter",3.963,8.5376,0.676,0.000,"transcription from RNA polymerase II promoter"),
c("GO:0006807","nitrogen compound metabolic process",26.566,5.3372,0.896,0.120,"transcription from RNA polymerase II promoter"),
c("GO:0019222","regulation of metabolic process",17.756,3.2218,0.855,0.179,"transcription from RNA polymerase II promoter"),
c("GO:0009058","biosynthetic process",19.017,2.6234,0.902,0.183,"transcription from RNA polymerase II promoter"),
c("GO:0061077","chaperone-mediated protein folding",0.109,3.0000,0.819,0.202,"transcription from RNA polymerase II promoter"),
c("GO:0046483","heterocycle metabolic process",24.799,7.2076,0.813,0.217,"transcription from RNA polymerase II promoter"),
c("GO:0043170","macromolecule metabolic process",29.866,6.1805,0.838,0.219,"transcription from RNA polymerase II promoter"),
c("GO:0035246","peptidyl-arginine N-methylation",0.016,2.4685,0.809,0.228,"transcription from RNA polymerase II promoter"),
c("GO:0009110","vitamin biosynthetic process",0.052,1.8265,0.822,0.256,"transcription from RNA polymerase II promoter"),
c("GO:0044238","primary metabolic process",41.881,4.1612,0.886,0.262,"transcription from RNA polymerase II promoter"),
c("GO:0050789","regulation of biological process",49.744,1.8024,0.896,0.269,"transcription from RNA polymerase II promoter"),
c("GO:0045359","positive regulation of interferon-beta biosynthetic process",0.015,2.4776,0.654,0.271,"transcription from RNA polymerase II promoter"),
c("GO:0008213","protein alkylation",0.447,1.5382,0.787,0.296,"transcription from RNA polymerase II promoter"),
c("GO:0043412","macromolecule modification",10.189,1.8336,0.805,0.308,"transcription from RNA polymerase II promoter"),
c("GO:0003056","regulation of vascular smooth muscle contraction",0.014,1.8576,0.858,0.309,"transcription from RNA polymerase II promoter"),
c("GO:0006184","GTP catabolic process",2.612,1.8526,0.706,0.312,"transcription from RNA polymerase II promoter"),
c("GO:0044237","cellular metabolic process",42.121,3.6383,0.856,0.314,"transcription from RNA polymerase II promoter"),
c("GO:0033578","protein glycosylation in Golgi",0.011,1.3417,0.780,0.316,"transcription from RNA polymerase II promoter"),
c("GO:0071704","organic substance metabolic process",42.826,3.5086,0.885,0.319,"transcription from RNA polymerase II promoter"),
c("GO:0008334","histone mRNA metabolic process",0.034,1.4921,0.796,0.319,"transcription from RNA polymerase II promoter"),
c("GO:0070534","protein K63-linked ubiquitination",0.050,1.3693,0.821,0.322,"transcription from RNA polymerase II promoter"),
c("GO:0050794","regulation of cellular process",28.971,1.7011,0.854,0.337,"transcription from RNA polymerase II promoter"),
c("GO:0006725","cellular aromatic compound metabolic process",24.907,6.7696,0.813,0.359,"transcription from RNA polymerase II promoter"),
c("GO:0023014","signal transduction by phosphorylation",1.554,1.5227,0.711,0.371,"transcription from RNA polymerase II promoter"),
c("GO:0006369","termination of RNA polymerase II transcription",0.054,3.3872,0.781,0.372,"transcription from RNA polymerase II promoter"),
c("GO:1901360","organic cyclic compound metabolic process",25.430,6.0655,0.843,0.376,"transcription from RNA polymerase II promoter"),
c("GO:0016072","rRNA metabolic process",0.219,1.6169,0.780,0.383,"transcription from RNA polymerase II promoter"),
c("GO:0006353","DNA-templated transcription, termination",0.101,2.7570,0.773,0.396,"transcription from RNA polymerase II promoter"),
c("GO:0018206","peptidyl-methionine modification",0.008,1.3417,0.837,0.398,"transcription from RNA polymerase II promoter"),
c("GO:0090304","nucleic acid metabolic process",15.268,8.6990,0.711,0.420,"transcription from RNA polymerase II promoter"),
c("GO:0006260","DNA replication",0.926,2.0132,0.734,0.421,"transcription from RNA polymerase II promoter"),
c("GO:0018195","peptidyl-arginine modification",0.026,1.5453,0.823,0.426,"transcription from RNA polymerase II promoter"),
c("GO:0042355","L-fucose catabolic process",0.011,1.3417,0.877,0.429,"transcription from RNA polymerase II promoter"),
c("GO:0008380","RNA splicing",0.652,4.1135,0.727,0.433,"transcription from RNA polymerase II promoter"),
c("GO:0035556","intracellular signal transduction",6.704,1.3758,0.736,0.447,"transcription from RNA polymerase II promoter"),
c("GO:0030433","ER-associated ubiquitin-dependent protein catabolic process",0.058,1.8085,0.804,0.450,"transcription from RNA polymerase II promoter"),
c("GO:0034660","ncRNA metabolic process",0.917,2.2958,0.754,0.452,"transcription from RNA polymerase II promoter"),
c("GO:0006352","DNA-templated transcription, initiation",0.406,1.4288,0.745,0.459,"transcription from RNA polymerase II promoter"),
c("GO:0018193","peptidyl-amino acid modification",2.453,1.3544,0.748,0.459,"transcription from RNA polymerase II promoter"),
c("GO:0016071","mRNA metabolic process",1.098,1.6092,0.749,0.462,"transcription from RNA polymerase II promoter"),
c("GO:0006259","DNA metabolic process",3.159,2.2104,0.729,0.477,"transcription from RNA polymerase II promoter"),
c("GO:0006396","RNA processing",1.631,4.5528,0.733,0.487,"transcription from RNA polymerase II promoter"),
c("GO:0072643","interferon-gamma secretion",0.014,1.4851,0.815,0.487,"transcription from RNA polymerase II promoter"),
c("GO:0051171","regulation of nitrogen compound metabolic process",13.046,5.5376,0.681,0.497,"transcription from RNA polymerase II promoter"),
c("GO:0051253","negative regulation of RNA metabolic process",2.255,1.9248,0.600,0.510,"transcription from RNA polymerase II promoter"),
c("GO:0044267","cellular protein metabolic process",12.981,1.3773,0.719,0.511,"transcription from RNA polymerase II promoter"),
c("GO:0044260","cellular macromolecule metabolic process",25.627,8.1549,0.737,0.523,"transcription from RNA polymerase II promoter"),
c("GO:0010467","gene expression",15.379,7.0315,0.793,0.524,"transcription from RNA polymerase II promoter"),
c("GO:0006659","phosphatidylserine biosynthetic process",0.010,1.3417,0.810,0.531,"transcription from RNA polymerase II promoter"),
c("GO:0032633","interleukin-4 production",0.068,2.2495,0.893,0.536,"transcription from RNA polymerase II promoter"),
c("GO:0032743","positive regulation of interleukin-2 production",0.019,1.7902,0.839,0.545,"transcription from RNA polymerase II promoter"),
c("GO:0009893","positive regulation of metabolic process",5.415,1.8548,0.748,0.574,"transcription from RNA polymerase II promoter"),
c("GO:1902680","positive regulation of RNA biosynthetic process",2.779,5.5086,0.566,0.579,"transcription from RNA polymerase II promoter"),
c("GO:0016070","RNA metabolic process",12.843,7.8539,0.674,0.603,"transcription from RNA polymerase II promoter"),
c("GO:0002726","positive regulation of T cell cytokine production",0.024,1.4851,0.820,0.606,"transcription from RNA polymerase II promoter"),
c("GO:0010499","proteasomal ubiquitin-independent protein catabolic process",0.005,1.3417,0.835,0.608,"transcription from RNA polymerase II promoter"),
c("GO:0006379","mRNA cleavage",0.025,1.7902,0.784,0.608,"transcription from RNA polymerase II promoter"),
c("GO:0006357","regulation of transcription from RNA polymerase II promoter",3.684,5.5086,0.589,0.613,"transcription from RNA polymerase II promoter"),
c("GO:1901068","guanosine-containing compound metabolic process",2.687,1.7595,0.744,0.628,"transcription from RNA polymerase II promoter"),
c("GO:0034645","cellular macromolecule biosynthetic process",14.343,6.9586,0.682,0.630,"transcription from RNA polymerase II promoter"),
c("GO:0032862","activation of Rho GTPase activity",0.050,1.6676,0.650,0.631,"transcription from RNA polymerase II promoter"),
c("GO:0016458","gene silencing",0.191,1.4324,0.722,0.634,"transcription from RNA polymerase II promoter"),
c("GO:0006139","nucleobase-containing compound metabolic process",24.258,7.6990,0.724,0.636,"transcription from RNA polymerase II promoter"),
c("GO:0032675","regulation of interleukin-6 production",0.224,1.9722,0.831,0.645,"transcription from RNA polymerase II promoter"),
c("GO:0032673","regulation of interleukin-4 production",0.046,1.5060,0.850,0.646,"transcription from RNA polymerase II promoter"),
c("GO:0043414","macromolecule methylation",0.645,1.9834,0.770,0.655,"transcription from RNA polymerase II promoter"),
c("GO:0034969","histone arginine methylation",0.021,1.6368,0.759,0.667,"transcription from RNA polymerase II promoter"),
c("GO:0006367","transcription initiation from RNA polymerase II promoter",0.283,1.4302,0.749,0.676,"transcription from RNA polymerase II promoter"),
c("GO:0009889","regulation of biosynthetic process",11.561,3.7959,0.700,0.678,"transcription from RNA polymerase II promoter"),
c("GO:0051085","chaperone mediated protein folding requiring cofactor",0.052,1.3791,0.829,0.681,"transcription from RNA polymerase II promoter"),
c("GO:0051052","regulation of DNA metabolic process",0.589,1.4409,0.679,0.682,"transcription from RNA polymerase II promoter"),
c("GO:0010468","regulation of gene expression",11.954,4.7447,0.647,0.683,"transcription from RNA polymerase II promoter"),
c("GO:0043484","regulation of RNA splicing",0.131,3.1079,0.684,0.694,"transcription from RNA polymerase II promoter"),
c("GO:0045860","positive regulation of protein kinase activity",0.938,2.9281,0.571,0.694,"transcription from RNA polymerase II promoter"),
c("GO:0006464","cellular protein modification process",9.809,1.5166,0.702,0.695,"transcription from RNA polymerase II promoter"),
c("GO:0043046","DNA methylation involved in gamete generation",0.036,1.6368,0.643,0.697,"transcription from RNA polymerase II promoter"),
c("GO:1901362","organic cyclic compound biosynthetic process",13.849,2.8861,0.739,0.697,"transcription from RNA polymerase II promoter"),
c("GO:0034641","cellular nitrogen compound metabolic process",25.263,5.6383,0.746,0.697,"transcription from RNA polymerase II promoter"),
c("GO:0006403","RNA localization",0.263,3.1675,0.952,0.000,"RNA localization"),
c("GO:0047496","vesicle transport along microtubule",0.059,2.5045,0.878,0.202,"RNA localization"),
c("GO:0045920","negative regulation of exocytosis",0.060,1.6368,0.792,0.372,"RNA localization"),
c("GO:0010764","negative regulation of fibroblast migration",0.021,1.8576,0.822,0.394,"RNA localization"),
c("GO:0030970","retrograde protein transport, ER to cytosol",0.006,1.3417,0.934,0.417,"RNA localization"),
c("GO:2001256","regulation of store-operated calcium entry",0.025,1.3417,0.908,0.422,"RNA localization"),
c("GO:0051028","mRNA transport",0.204,2.6696,0.926,0.447,"RNA localization"),
c("GO:0072393","microtubule anchoring at microtubule organizing center",0.018,1.4851,0.828,0.489,"RNA localization"),
c("GO:0017038","protein import",0.591,1.3956,0.927,0.490,"RNA localization"),
c("GO:0006913","nucleocytoplasmic transport",0.827,2.4522,0.930,0.527,"RNA localization"),
c("GO:0016197","endosomal transport",0.316,1.4989,0.926,0.611,"RNA localization"),
c("GO:0015931","nucleobase-containing compound transport",0.319,2.0200,0.943,0.652,"RNA localization"),
c("GO:0045022","early endosome to late endosome transport",0.041,1.6499,0.931,0.653,"RNA localization"),
c("GO:0051169","nuclear transport",0.833,2.6596,0.937,0.673,"RNA localization"),
c("GO:0051534","negative regulation of NFAT protein import into nucleus",0.011,1.3417,0.806,0.684,"RNA localization"),
c("GO:0010700","negative regulation of norepinephrine secretion",0.010,1.3417,0.806,0.690,"RNA localization"),
c("GO:0008152","metabolic process",54.733,2.3536,0.998,0.000,"metabolism"),
c("GO:0032092","positive regulation of protein binding",0.106,2.3936,0.878,0.000,"positive regulation of protein binding"),
c("GO:1900274","regulation of phospholipase C activity",0.088,1.3702,0.806,0.375,"positive regulation of protein binding"),
c("GO:0051091","positive regulation of sequence-specific DNA binding transcription factor activity",0.342,2.3507,0.643,0.500,"positive regulation of protein binding"),
c("GO:0051338","regulation of transferase activity",1.829,2.1746,0.747,0.539,"positive regulation of protein binding"),
c("GO:0051090","regulation of sequence-specific DNA binding transcription factor activity",0.562,1.5291,0.636,0.568,"positive regulation of protein binding"),
c("GO:0060674","placenta blood vessel development",0.082,3.0000,0.848,0.000,"placenta blood vessel development"),
c("GO:0060972","left/right pattern formation",0.040,1.7080,0.884,0.260,"placenta blood vessel development"),
c("GO:0045598","regulation of fat cell differentiation",0.201,2.7258,0.755,0.267,"placenta blood vessel development"),
c("GO:0072673","lamellipodium morphogenesis",0.017,1.9674,0.829,0.302,"placenta blood vessel development"),
c("GO:0060613","fat pad development",0.017,1.8706,0.868,0.306,"placenta blood vessel development"),
c("GO:0001701","in utero embryonic development",1.158,2.9586,0.833,0.336,"placenta blood vessel development"),
c("GO:0061515","myeloid cell development",0.120,1.7991,0.798,0.359,"placenta blood vessel development"),
c("GO:0048663","neuron fate commitment",0.153,1.7991,0.806,0.366,"placenta blood vessel development"),
c("GO:0060021","palate development",0.311,1.6540,0.893,0.374,"placenta blood vessel development"),
c("GO:0090141","positive regulation of mitochondrial fission",0.010,1.3417,0.753,0.387,"placenta blood vessel development"),
c("GO:0002067","glandular epithelial cell differentiation",0.117,1.7991,0.815,0.394,"placenta blood vessel development"),
c("GO:0048318","axial mesoderm development",0.017,1.4851,0.895,0.394,"placenta blood vessel development"),
c("GO:0045444","fat cell differentiation",0.409,2.2993,0.822,0.396,"placenta blood vessel development"),
c("GO:0060926","cardiac pacemaker cell development",0.007,1.8576,0.825,0.444,"placenta blood vessel development"),
c("GO:0003183","mitral valve morphogenesis",0.007,1.4851,0.872,0.451,"placenta blood vessel development"),
c("GO:0048863","stem cell differentiation",0.847,1.6306,0.811,0.452,"placenta blood vessel development"),
c("GO:0060763","mammary duct terminal end bud growth",0.014,1.3417,0.857,0.452,"placenta blood vessel development"),
c("GO:0003160","endocardium morphogenesis",0.019,1.3417,0.867,0.477,"placenta blood vessel development"),
c("GO:0045668","negative regulation of osteoblast differentiation",0.095,1.6511,0.727,0.503,"placenta blood vessel development"),
c("GO:0021522","spinal cord motor neuron differentiation",0.090,1.6499,0.798,0.514,"placenta blood vessel development"),
c("GO:2000736","regulation of stem cell differentiation",0.169,1.6857,0.751,0.527,"placenta blood vessel development"),
c("GO:0060743","epithelial cell maturation involved in prostate gland development",0.008,1.8576,0.815,0.531,"placenta blood vessel development"),
c("GO:0048570","notochord morphogenesis",0.024,1.4851,0.858,0.554,"placenta blood vessel development"),
c("GO:0045666","positive regulation of neuron differentiation",0.248,1.7404,0.685,0.555,"placenta blood vessel development"),
c("GO:0060216","definitive hemopoiesis",0.048,1.5060,0.860,0.561,"placenta blood vessel development"),
c("GO:0003162","atrioventricular node development",0.007,1.8576,0.868,0.564,"placenta blood vessel development"),
c("GO:0003334","keratinocyte development",0.018,1.3417,0.818,0.587,"placenta blood vessel development"),
c("GO:0021953","central nervous system neuron differentiation",0.427,1.6419,0.788,0.605,"placenta blood vessel development"),
c("GO:0060612","adipose tissue development",0.075,1.6461,0.855,0.623,"placenta blood vessel development"),
c("GO:0060920","cardiac pacemaker cell differentiation",0.008,1.8576,0.825,0.634,"placenta blood vessel development"),
c("GO:0021510","spinal cord development",0.198,1.4021,0.849,0.636,"placenta blood vessel development"),
c("GO:0001833","inner cell mass cell proliferation",0.038,2.4685,0.864,0.642,"placenta blood vessel development"),
c("GO:0045655","regulation of monocyte differentiation",0.019,1.6368,0.758,0.644,"placenta blood vessel development"),
c("GO:0030850","prostate gland development",0.195,1.3702,0.845,0.659,"placenta blood vessel development"),
c("GO:0048319","axial mesoderm morphogenesis",0.013,1.3417,0.884,0.660,"placenta blood vessel development"),
c("GO:2000188","regulation of cholesterol homeostasis",0.032,1.8706,0.930,0.044,"regulation of cholesterol homeostasis"),
c("GO:0031570","DNA integrity checkpoint",0.317,1.6678,0.910,0.047,"DNA integrity checkpoint"),
c("GO:0050792","regulation of viral process",0.191,2.3585,0.800,0.050,"regulation of viral process"),
c("GO:0048522","positive regulation of cellular process",8.548,1.5253,0.789,0.202,"regulation of viral process"),
c("GO:0032494","response to peptidoglycan",0.033,1.4851,0.910,0.417,"regulation of viral process"),
c("GO:0052312","modulation of transcription in other organism involved in symbiotic interaction",0.011,1.5060,0.701,0.581,"regulation of viral process"),
c("GO:0016568","chromatin modification",1.536,2.4365,0.877,0.056,"chromatin modification"),
c("GO:0022613","ribonucleoprotein complex biogenesis",0.598,2.0742,0.951,0.390,"chromatin modification"),
c("GO:0071826","ribonucleoprotein complex subunit organization",0.332,1.7272,0.947,0.564,"chromatin modification"),
c("GO:0070544","histone H3-K36 demethylation",0.013,1.3417,0.782,0.603,"chromatin modification"),
c("GO:0051276","chromosome organization",2.327,1.8179,0.887,0.622,"chromatin modification"),
c("GO:0033554","cellular response to stress",3.483,3.5376,0.798,0.063,"cellular response to stress"),
c("GO:0071260","cellular response to mechanical stimulus",0.133,1.3785,0.874,0.269,"cellular response to stress"),
c("GO:0006984","ER-nucleus signaling pathway",0.141,2.9066,0.815,0.270,"cellular response to stress"),
c("GO:0030518","intracellular steroid hormone receptor signaling pathway",0.228,1.4426,0.808,0.284,"cellular response to stress"),
c("GO:0048011","neurotrophin TRK receptor signaling pathway",0.337,2.5361,0.784,0.296,"cellular response to stress"),
c("GO:0097193","intrinsic apoptotic signaling pathway",0.550,3.2007,0.763,0.313,"cellular response to stress"),
c("GO:0030522","intracellular receptor signaling pathway",0.684,2.4949,0.790,0.321,"cellular response to stress"),
c("GO:0032057","negative regulation of translational initiation in response to stress",0.008,1.8706,0.662,0.359,"cellular response to stress"),
c("GO:0071499","cellular response to laminar fluid shear stress",0.008,3.0969,0.853,0.359,"cellular response to stress"),
c("GO:0007252","I-kappaB phosphorylation",0.024,1.9674,0.731,0.372,"cellular response to stress"),
c("GO:0035329","hippo signaling",0.068,1.9508,0.806,0.404,"cellular response to stress"),
c("GO:0038061","NIK/NF-kappaB signaling",0.080,2.1805,0.804,0.409,"cellular response to stress"),
c("GO:0035458","cellular response to interferon-beta",0.021,1.4851,0.888,0.415,"cellular response to stress"),
c("GO:0035966","response to topologically incorrect protein",0.209,1.7018,0.885,0.482,"cellular response to stress"),
c("GO:0070266","necroptotic process",0.081,1.7080,0.910,0.497,"cellular response to stress"),
c("GO:0035625","epidermal growth factor-activated receptor transactivation by G-protein coupled receptor signaling pathway",0.005,1.8576,0.668,0.519,"cellular response to stress"),
c("GO:0031098","stress-activated protein kinase signaling cascade",0.435,2.4895,0.730,0.522,"cellular response to stress"),
c("GO:0070848","response to growth factor",1.438,1.5532,0.944,0.528,"cellular response to stress"),
c("GO:0060395","SMAD protein signal transduction",0.031,2.0899,0.831,0.531,"cellular response to stress"),
c("GO:0030968","endoplasmic reticulum unfolded protein response",0.124,1.9931,0.745,0.534,"cellular response to stress"),
c("GO:0034976","response to endoplasmic reticulum stress",0.253,2.1537,0.818,0.568,"cellular response to stress"),
c("GO:0080135","regulation of cellular response to stress",0.758,2.3893,0.717,0.628,"cellular response to stress"),
c("GO:0035666","TRIF-dependent toll-like receptor signaling pathway",0.087,2.3840,0.735,0.646,"cellular response to stress"),
c("GO:0006446","regulation of translational initiation",0.145,1.3659,0.684,0.669,"cellular response to stress"),
c("GO:1902229","regulation of intrinsic apoptotic signaling pathway in response to DNA damage",0.047,1.8005,0.726,0.672,"cellular response to stress"),
c("GO:2001020","regulation of response to DNA damage stimulus",0.197,1.5476,0.736,0.697,"cellular response to stress"),
c("GO:0032259","methylation",1.044,1.8630,0.934,0.070,"methylation"));

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
