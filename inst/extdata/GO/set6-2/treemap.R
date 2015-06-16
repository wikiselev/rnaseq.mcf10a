

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
revigo.data <- rbind(c("GO:0006414","translational elongation",0.313,7.0410,0.816,0.000,"translational elongation"),
c("GO:0033490","cholesterol biosynthetic process via lathosterol",0.001,2.3936,0.837,0.159,"translational elongation"),
c("GO:0000184","nuclear-transcribed mRNA catabolic process, nonsense-mediated decay",0.142,5.4089,0.794,0.164,"translational elongation"),
c("GO:0000720","pyrimidine dimer repair by nucleotide-excision repair",0.008,1.9187,0.836,0.199,"translational elongation"),
c("GO:0045935","positive regulation of nucleobase-containing compound metabolic process",3.128,2.1373,0.664,0.214,"translational elongation"),
c("GO:0002764","immune response-regulating signaling pathway",1.064,1.4292,0.830,0.220,"translational elongation"),
c("GO:0042982","amyloid precursor protein metabolic process",0.072,2.6326,0.901,0.226,"translational elongation"),
c("GO:0009187","cyclic nucleotide metabolic process",0.382,1.4578,0.814,0.238,"translational elongation"),
c("GO:0006499","N-terminal protein myristoylation",0.023,1.7945,0.846,0.251,"translational elongation"),
c("GO:0042157","lipoprotein metabolic process",0.387,1.3952,0.886,0.260,"translational elongation"),
c("GO:0002682","regulation of immune system process",21.361,1.7089,0.900,0.285,"translational elongation"),
c("GO:0043491","protein kinase B signaling",0.280,1.3108,0.853,0.295,"translational elongation"),
c("GO:0016071","mRNA metabolic process",1.098,1.8362,0.805,0.323,"translational elongation"),
c("GO:0030574","collagen catabolic process",0.104,1.8511,0.803,0.349,"translational elongation"),
c("GO:0048584","positive regulation of response to stimulus",22.389,1.9097,0.859,0.359,"translational elongation"),
c("GO:0043619","regulation of transcription from RNA polymerase II promoter in response to oxidative stress",0.025,1.6985,0.747,0.366,"translational elongation"),
c("GO:0006412","translation",1.984,4.5850,0.785,0.367,"translational elongation"),
c("GO:0043950","positive regulation of cAMP-mediated signaling",0.021,1.6985,0.831,0.376,"translational elongation"),
c("GO:0042986","positive regulation of amyloid precursor protein biosynthetic process",0.003,2.0937,0.764,0.411,"translational elongation"),
c("GO:0051896","regulation of protein kinase B signaling",0.222,1.4363,0.847,0.435,"translational elongation"),
c("GO:0031327","negative regulation of cellular biosynthetic process",2.588,1.9562,0.693,0.438,"translational elongation"),
c("GO:0009893","positive regulation of metabolic process",5.415,2.1878,0.801,0.446,"translational elongation"),
c("GO:0042415","norepinephrine metabolic process",0.033,1.7945,0.856,0.458,"translational elongation"),
c("GO:0006290","pyrimidine dimer repair",0.023,1.5541,0.825,0.472,"translational elongation"),
c("GO:0035308","negative regulation of protein dephosphorylation",0.007,1.7945,0.782,0.480,"translational elongation"),
c("GO:0071310","cellular response to organic substance",4.572,1.4090,0.891,0.484,"translational elongation"),
c("GO:0044267","cellular protein metabolic process",12.981,1.4385,0.795,0.493,"translational elongation"),
c("GO:0010872","regulation of cholesterol esterification",0.011,1.7945,0.782,0.495,"translational elongation"),
c("GO:0045899","positive regulation of RNA polymerase II transcriptional preinitiation complex assembly",0.007,2.0937,0.669,0.509,"translational elongation"),
c("GO:0032774","RNA biosynthetic process",10.939,2.5467,0.702,0.532,"translational elongation"),
c("GO:0035970","peptidyl-threonine dephosphorylation",0.016,1.4969,0.870,0.535,"translational elongation"),
c("GO:0043162","ubiquitin-dependent protein catabolic process via the multivesicular body sorting pathway",0.032,1.4016,0.840,0.542,"translational elongation"),
c("GO:0010991","negative regulation of SMAD protein complex assembly",0.013,2.0937,0.755,0.557,"translational elongation"),
c("GO:0007183","SMAD protein complex assembly",0.028,1.4466,0.784,0.560,"translational elongation"),
c("GO:0002684","positive regulation of immune system process",20.525,1.6275,0.854,0.578,"translational elongation"),
c("GO:0006139","nucleobase-containing compound metabolic process",24.258,1.8665,0.768,0.578,"translational elongation"),
c("GO:0032927","positive regulation of activin receptor signaling pathway",0.008,1.6985,0.835,0.579,"translational elongation"),
c("GO:0032464","positive regulation of protein homooligomerization",0.014,1.4466,0.832,0.579,"translational elongation"),
c("GO:0045721","negative regulation of gluconeogenesis",0.023,1.6202,0.765,0.589,"translational elongation"),
c("GO:0034433","steroid esterification",0.015,1.6985,0.841,0.597,"translational elongation"),
c("GO:0006415","translational termination",0.130,6.0915,0.721,0.619,"translational elongation"),
c("GO:0070897","DNA-templated transcriptional preinitiation complex assembly",0.016,1.5541,0.748,0.625,"translational elongation"),
c("GO:0090304","nucleic acid metabolic process",15.268,1.4544,0.761,0.636,"translational elongation"),
c("GO:0006401","RNA catabolic process",0.316,4.0000,0.784,0.643,"translational elongation"),
c("GO:1901362","organic cyclic compound biosynthetic process",13.849,2.3497,0.768,0.652,"translational elongation"),
c("GO:0031326","regulation of cellular biosynthetic process",11.466,1.3175,0.676,0.656,"translational elongation"),
c("GO:0030816","positive regulation of cAMP metabolic process",0.130,2.1637,0.691,0.657,"translational elongation"),
c("GO:0034655","nucleobase-containing compound catabolic process",4.390,2.6216,0.764,0.665,"translational elongation"),
c("GO:0035305","negative regulation of dephosphorylation",0.016,1.6202,0.804,0.671,"translational elongation"),
c("GO:0019438","aromatic compound biosynthetic process",13.512,2.0857,0.753,0.676,"translational elongation"),
c("GO:0045981","positive regulation of nucleotide metabolic process",0.171,1.9492,0.712,0.676,"translational elongation"),
c("GO:0006413","translational initiation",0.465,6.0269,0.810,0.690,"translational elongation"),
c("GO:0018130","heterocycle biosynthetic process",13.553,2.0747,0.754,0.691,"translational elongation"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",13.670,1.9940,0.750,0.693,"translational elongation"),
c("GO:0034641","cellular nitrogen compound metabolic process",25.263,1.5063,0.808,0.697,"translational elongation"),
c("GO:0006614","SRP-dependent cotranslational protein targeting to membrane",0.150,5.7212,0.738,0.000,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:1901998","toxin transport",0.016,1.7945,0.914,0.199,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0034374","low-density lipoprotein particle remodeling",0.019,1.6202,0.826,0.243,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0045835","negative regulation of meiosis",0.032,1.7945,0.791,0.252,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0050860","negative regulation of T cell receptor signaling pathway",0.036,1.4969,0.822,0.293,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0022411","cellular component disassembly",0.713,4.4437,0.845,0.320,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0033700","phospholipid efflux",0.017,1.7945,0.851,0.357,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0034436","glycoprotein transport",0.003,1.9187,0.877,0.382,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0061024","membrane organization",1.629,4.1427,0.892,0.404,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0044087","regulation of cellular component biogenesis",1.045,1.4292,0.837,0.417,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0007020","microtubule nucleation",0.027,1.3611,0.839,0.450,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0001556","oocyte maturation",0.064,1.5541,0.847,0.471,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0071822","protein complex subunit organization",3.467,3.0605,0.859,0.490,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:1902580","single-organism cellular localization",1.731,4.5528,0.828,0.495,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0034367","macromolecular complex remodeling",0.040,1.3242,0.898,0.498,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0044803","multi-organism membrane organization",0.007,1.6985,0.874,0.503,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0010887","negative regulation of cholesterol storage",0.016,1.7945,0.766,0.549,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0001778","plasma membrane repair",0.016,1.7945,0.882,0.554,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0050765","negative regulation of phagocytosis",0.025,1.6202,0.729,0.563,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0043933","macromolecular complex subunit organization",5.276,3.7447,0.880,0.581,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0043691","reverse cholesterol transport",0.032,1.5541,0.839,0.584,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0045184","establishment of protein localization",3.785,3.1308,0.809,0.592,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0042347","negative regulation of NF-kappaB import into nucleus",0.030,1.3242,0.706,0.631,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0043254","regulation of protein complex assembly",0.549,2.3737,0.815,0.651,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:1902582","single-organism intracellular transport",2.514,3.9208,0.810,0.675,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0070972","protein localization to endoplasmic reticulum",0.196,5.3665,0.833,0.677,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:2000142","regulation of DNA-templated transcription, initiation",0.031,1.3242,0.683,0.679,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0009720","detection of hormone stimulus",0.001,2.3936,0.967,0.000,"detection of hormone stimulus"),
c("GO:0055099","response to high density lipoprotein particle",0.003,2.0937,0.967,0.293,"detection of hormone stimulus"),
c("GO:0055094","response to lipoprotein particle",0.036,1.4969,0.963,0.348,"detection of hormone stimulus"),
c("GO:0097067","cellular response to thyroid hormone stimulus",0.016,1.4466,0.925,0.381,"detection of hormone stimulus"),
c("GO:0009726","detection of endogenous stimulus",0.008,2.0937,0.974,0.419,"detection of hormone stimulus"),
c("GO:0051179","localization",18.927,1.3645,0.994,0.000,"localization"),
c("GO:0051704","multi-organism process",4.431,3.1192,0.993,0.000,"multi-organism process"),
c("GO:0071840","cellular component organization or biogenesis",12.603,2.6144,0.994,0.000,"cellular component organization or biogenesis"),
c("GO:0002035","brain renin-angiotensin system",0.015,2.0937,0.890,0.012,"brain renin-angiotensin system"),
c("GO:0048597","post-embryonic camera-type eye morphogenesis",0.010,1.7945,0.920,0.178,"brain renin-angiotensin system"),
c("GO:0048625","myoblast fate commitment",0.016,1.7945,0.919,0.213,"brain renin-angiotensin system"),
c("GO:0044236","multicellular organismal metabolic process",0.220,1.3564,0.882,0.215,"brain renin-angiotensin system"),
c("GO:0055091","phospholipid homeostasis",0.014,1.7945,0.916,0.273,"brain renin-angiotensin system"),
c("GO:0048569","post-embryonic organ development",0.038,1.3242,0.933,0.283,"brain renin-angiotensin system"),
c("GO:2000543","positive regulation of gastrulation",0.014,1.7945,0.883,0.293,"brain renin-angiotensin system"),
c("GO:0040034","regulation of development, heterochronic",0.034,1.6985,0.924,0.353,"brain renin-angiotensin system"),
c("GO:0010745","negative regulation of macrophage derived foam cell differentiation",0.019,1.4969,0.844,0.360,"brain renin-angiotensin system"),
c("GO:0008544","epidermis development",0.590,1.3028,0.917,0.371,"brain renin-angiotensin system"),
c("GO:0043129","surfactant homeostasis",0.023,1.4466,0.883,0.440,"brain renin-angiotensin system"),
c("GO:0051901","positive regulation of mitochondrial depolarization",0.015,1.7945,0.849,0.474,"brain renin-angiotensin system"),
c("GO:0032844","regulation of homeostatic process",0.737,1.4186,0.894,0.499,"brain renin-angiotensin system"),
c("GO:0030218","erythrocyte differentiation",0.267,1.4053,0.816,0.613,"brain renin-angiotensin system"),
c("GO:0048875","chemical homeostasis within a tissue",0.025,1.3611,0.882,0.662,"brain renin-angiotensin system"),
c("GO:0009886","post-embryonic morphogenesis",0.027,1.4466,0.923,0.674,"brain renin-angiotensin system"),
c("GO:2000021","regulation of ion homeostasis",0.358,1.3952,0.893,0.675,"brain renin-angiotensin system"),
c("GO:0042100","B cell proliferation",0.158,2.1918,0.876,0.034,"B cell proliferation"),
c("GO:0042127","regulation of cell proliferation",3.148,1.3478,0.834,0.620,"B cell proliferation"),
c("GO:0051343","positive regulation of cyclic-nucleotide phosphodiesterase activity",0.005,1.7945,0.894,0.035,"positive regulation of cyclic-nucleotide phosphodiesterase activity"),
c("GO:0051342","regulation of cyclic-nucleotide phosphodiesterase activity",0.023,1.5541,0.883,0.367,"positive regulation of cyclic-nucleotide phosphodiesterase activity"),
c("GO:0010224","response to UV-B",0.034,1.4466,0.977,0.041,"response to UV-B"),
c("GO:0044033","multi-organism metabolic process",0.213,5.8239,0.900,0.046,"multi-organism metabolism"),
c("GO:1901165","positive regulation of trophoblast cell migration",0.002,2.0937,0.733,0.354,"multi-organism metabolism"),
c("GO:0051270","regulation of cellular component movement",1.289,1.7069,0.741,0.417,"multi-organism metabolism"),
c("GO:1902578","single-organism localization",14.013,4.5528,0.841,0.427,"multi-organism metabolism"),
c("GO:0010818","T cell chemotaxis",0.018,1.4969,0.823,0.484,"multi-organism metabolism"),
c("GO:0060632","regulation of microtubule-based movement",0.022,1.6202,0.799,0.491,"multi-organism metabolism"),
c("GO:0019058","viral life cycle",0.401,5.4949,0.887,0.510,"multi-organism metabolism"),
c("GO:0040017","positive regulation of locomotion",0.632,1.3561,0.885,0.547,"multi-organism metabolism"),
c("GO:0033036","macromolecule localization",5.646,2.7471,0.869,0.558,"multi-organism metabolism"),
c("GO:0071702","organic substance transport",5.810,1.9270,0.860,0.561,"multi-organism metabolism"),
c("GO:0051641","cellular localization",6.184,1.9851,0.867,0.568,"multi-organism metabolism"),
c("GO:0044764","multi-organism cellular process",0.977,4.3768,0.895,0.587,"multi-organism metabolism"),
c("GO:1902590","multi-organism organelle organization",0.007,2.0937,0.856,0.607,"multi-organism metabolism"),
c("GO:0046755","viral budding",0.007,2.0937,0.779,0.610,"multi-organism metabolism"),
c("GO:0061450","trophoblast cell migration",0.006,1.7945,0.799,0.641,"multi-organism metabolism"),
c("GO:0044419","interspecies interaction between organisms",1.105,4.1805,0.933,0.652,"multi-organism metabolism"),
c("GO:0051272","positive regulation of cellular component movement",0.616,1.3783,0.713,0.665,"multi-organism metabolism"),
c("GO:0019068","virion assembly",0.024,1.3611,0.842,0.665,"multi-organism metabolism"),
c("GO:0044765","single-organism transport",13.545,1.6602,0.826,0.681,"multi-organism metabolism"),
c("GO:0030010","establishment of cell polarity",0.232,1.6153,0.918,0.069,"establishment of cell polarity"),
c("GO:0009058","biosynthetic process",19.017,2.0168,0.920,0.073,"biosynthesis"),
c("GO:0009056","catabolic process",7.851,1.8681,0.930,0.130,"biosynthesis"),
c("GO:1901360","organic cyclic compound metabolic process",25.430,1.8914,0.875,0.180,"biosynthesis"),
c("GO:0006725","cellular aromatic compound metabolic process",24.907,1.7235,0.852,0.198,"biosynthesis"),
c("GO:0019538","protein metabolic process",17.009,1.8480,0.843,0.309,"biosynthesis"),
c("GO:0046483","heterocycle metabolic process",24.799,1.7165,0.852,0.359,"biosynthesis"),
c("GO:0010467","gene expression",15.379,1.7118,0.847,0.465,"biosynthesis"));

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
