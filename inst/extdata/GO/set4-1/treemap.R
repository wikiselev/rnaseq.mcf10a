

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
revigo.data <- rbind(c("GO:0006979","response to oxidative stress",0.874,3.4437,0.909,0.000,"response to oxidative stress"),
c("GO:0051409","response to nitrosative stress",0.016,1.3558,0.929,0.341,"response to oxidative stress"),
c("GO:0034150","toll-like receptor 6 signaling pathway",0.021,1.8931,0.781,0.347,"response to oxidative stress"),
c("GO:0009408","response to heat",0.148,1.4735,0.919,0.408,"response to oxidative stress"),
c("GO:0034599","cellular response to oxidative stress",0.420,2.2441,0.810,0.450,"response to oxidative stress"),
c("GO:0090400","stress-induced premature senescence",0.014,1.4992,0.838,0.451,"response to oxidative stress"),
c("GO:0014012","peripheral nervous system axon regeneration",0.018,1.7183,0.785,0.460,"response to oxidative stress"),
c("GO:0097306","cellular response to alcohol",0.189,1.4735,0.854,0.469,"response to oxidative stress"),
c("GO:0070887","cellular response to chemical stimulus",5.433,1.4983,0.832,0.532,"response to oxidative stress"),
c("GO:0007254","JNK cascade",0.348,1.9311,0.725,0.582,"response to oxidative stress"),
c("GO:0031098","stress-activated protein kinase signaling cascade",0.435,1.5432,0.761,0.594,"response to oxidative stress"),
c("GO:0071333","cellular response to glucose stimulus",0.213,1.4388,0.767,0.627,"response to oxidative stress"),
c("GO:0052033","pathogen-associated molecular pattern dependent induction by symbiont of host innate immune response",0.032,1.7183,0.725,0.643,"response to oxidative stress"),
c("GO:0071361","cellular response to ethanol",0.022,1.4214,0.872,0.656,"response to oxidative stress"),
c("GO:0043619","regulation of transcription from RNA polymerase II promoter in response to oxidative stress",0.025,1.4992,0.650,0.683,"response to oxidative stress"),
c("GO:0071447","cellular response to hydroperoxide",0.026,1.4992,0.834,0.685,"response to oxidative stress"),
c("GO:0008152","metabolic process",54.733,1.4371,0.997,0.000,"metabolism"),
c("GO:0022414","reproductive process",3.108,1.4770,0.994,0.000,"reproductive process"),
c("GO:0031328","positive regulation of cellular biosynthetic process",3.341,3.2596,0.604,0.000,"positive regulation of cellular biosynthesis"),
c("GO:0010467","gene expression",15.379,3.5528,0.810,0.104,"positive regulation of cellular biosynthesis"),
c("GO:0019934","cGMP-mediated signaling",0.014,1.5947,0.845,0.143,"positive regulation of cellular biosynthesis"),
c("GO:2000674","regulation of type B pancreatic cell apoptotic process",0.023,1.5947,0.853,0.149,"positive regulation of cellular biosynthesis"),
c("GO:0009058","biosynthetic process",19.017,3.4685,0.903,0.154,"positive regulation of cellular biosynthesis"),
c("GO:0019222","regulation of metabolic process",17.756,2.8601,0.860,0.161,"positive regulation of cellular biosynthesis"),
c("GO:0050847","progesterone receptor signaling pathway",0.008,1.4992,0.857,0.168,"positive regulation of cellular biosynthesis"),
c("GO:0007271","synaptic transmission, cholinergic",0.054,1.3558,0.920,0.176,"positive regulation of cellular biosynthesis"),
c("GO:0006807","nitrogen compound metabolic process",26.566,2.7077,0.897,0.183,"positive regulation of cellular biosynthesis"),
c("GO:2001044","regulation of integrin-mediated signaling pathway",0.056,1.3558,0.824,0.193,"positive regulation of cellular biosynthesis"),
c("GO:0006725","cellular aromatic compound metabolic process",24.907,2.2700,0.829,0.209,"positive regulation of cellular biosynthesis"),
c("GO:1901873","regulation of post-translational protein modification",0.003,1.8931,0.781,0.228,"positive regulation of cellular biosynthesis"),
c("GO:0006750","glutathione biosynthetic process",0.040,2.6676,0.756,0.246,"positive regulation of cellular biosynthesis"),
c("GO:0016579","protein deubiquitination",0.138,1.3294,0.833,0.248,"positive regulation of cellular biosynthesis"),
c("GO:0044237","cellular metabolic process",42.121,1.8002,0.865,0.249,"positive regulation of cellular biosynthesis"),
c("GO:0043488","regulation of mRNA stability",0.087,1.7506,0.744,0.272,"positive regulation of cellular biosynthesis"),
c("GO:1901360","organic cyclic compound metabolic process",25.430,2.3251,0.848,0.299,"positive regulation of cellular biosynthesis"),
c("GO:0042447","hormone catabolic process",0.011,1.4992,0.865,0.300,"positive regulation of cellular biosynthesis"),
c("GO:0048522","positive regulation of cellular process",8.548,1.3779,0.797,0.304,"positive regulation of cellular biosynthesis"),
c("GO:0044238","primary metabolic process",41.881,1.5161,0.887,0.314,"positive regulation of cellular biosynthesis"),
c("GO:0051900","regulation of mitochondrial depolarization",0.028,1.3558,0.841,0.318,"positive regulation of cellular biosynthesis"),
c("GO:0044334","canonical Wnt signaling pathway involved in positive regulation of epithelial to mesenchymal transition",0.002,1.8931,0.762,0.319,"positive regulation of cellular biosynthesis"),
c("GO:0048102","autophagic cell death",0.011,1.4992,0.922,0.351,"positive regulation of cellular biosynthesis"),
c("GO:0009157","deoxyribonucleoside monophosphate biosynthetic process",0.024,1.7183,0.795,0.358,"positive regulation of cellular biosynthesis"),
c("GO:0046483","heterocycle metabolic process",24.799,2.2596,0.829,0.359,"positive regulation of cellular biosynthesis"),
c("GO:1901687","glutathione derivative biosynthetic process",0.031,2.3947,0.843,0.364,"positive regulation of cellular biosynthesis"),
c("GO:0043170","macromolecule metabolic process",29.866,1.3118,0.844,0.376,"positive regulation of cellular biosynthesis"),
c("GO:0010606","positive regulation of cytoplasmic mRNA processing body assembly",0.007,1.5947,0.835,0.395,"positive regulation of cellular biosynthesis"),
c("GO:0044711","single-organism biosynthetic process",4.776,1.3605,0.791,0.417,"positive regulation of cellular biosynthesis"),
c("GO:0010605","negative regulation of macromolecule metabolic process",3.670,2.3675,0.655,0.424,"positive regulation of cellular biosynthesis"),
c("GO:0070159","mitochondrial threonyl-tRNA aminoacylation",0.001,2.1925,0.767,0.425,"positive regulation of cellular biosynthesis"),
c("GO:0031937","positive regulation of chromatin silencing",0.003,1.7183,0.720,0.455,"positive regulation of cellular biosynthesis"),
c("GO:0009893","positive regulation of metabolic process",5.415,2.4815,0.730,0.457,"positive regulation of cellular biosynthesis"),
c("GO:0046293","formaldehyde biosynthetic process",0.001,2.1925,0.841,0.462,"positive regulation of cellular biosynthesis"),
c("GO:0006182","cGMP biosynthetic process",0.057,1.3558,0.768,0.478,"positive regulation of cellular biosynthesis"),
c("GO:2001237","negative regulation of extrinsic apoptotic signaling pathway",0.243,2.0814,0.741,0.481,"positive regulation of cellular biosynthesis"),
c("GO:0031274","positive regulation of pseudopodium assembly",0.014,1.4214,0.807,0.488,"positive regulation of cellular biosynthesis"),
c("GO:0051246","regulation of protein metabolic process",4.423,1.4129,0.695,0.509,"positive regulation of cellular biosynthesis"),
c("GO:0061400","positive regulation of transcription from RNA polymerase II promoter in response to calcium ion",0.011,2.1925,0.669,0.524,"positive regulation of cellular biosynthesis"),
c("GO:0044260","cellular macromolecule metabolic process",25.627,1.6929,0.762,0.524,"positive regulation of cellular biosynthesis"),
c("GO:0097050","type B pancreatic cell apoptotic process",0.027,1.4992,0.916,0.535,"positive regulation of cellular biosynthesis"),
c("GO:0034244","negative regulation of transcription elongation from RNA polymerase II promoter",0.033,1.4214,0.695,0.546,"positive regulation of cellular biosynthesis"),
c("GO:0035864","response to potassium ion",0.013,1.7183,0.927,0.556,"positive regulation of cellular biosynthesis"),
c("GO:0018400","peptidyl-proline hydroxylation to 3-hydroxy-L-proline",0.003,2.1925,0.808,0.565,"positive regulation of cellular biosynthesis"),
c("GO:1901874","negative regulation of post-translational protein modification",0.002,1.8931,0.755,0.567,"positive regulation of cellular biosynthesis"),
c("GO:0006357","regulation of transcription from RNA polymerase II promoter",3.684,2.6126,0.600,0.572,"positive regulation of cellular biosynthesis"),
c("GO:0045410","positive regulation of interleukin-6 biosynthetic process",0.038,1.4992,0.662,0.580,"positive regulation of cellular biosynthesis"),
c("GO:0006435","threonyl-tRNA aminoacylation",0.014,1.7183,0.766,0.580,"positive regulation of cellular biosynthesis"),
c("GO:0097190","apoptotic signaling pathway",1.253,1.6633,0.772,0.591,"positive regulation of cellular biosynthesis"),
c("GO:0006534","cysteine metabolic process",0.018,1.5947,0.821,0.592,"positive regulation of cellular biosynthesis"),
c("GO:0016070","RNA metabolic process",12.843,2.7747,0.708,0.595,"positive regulation of cellular biosynthesis"),
c("GO:0006139","nucleobase-containing compound metabolic process",24.258,2.4815,0.742,0.605,"positive regulation of cellular biosynthesis"),
c("GO:0031331","positive regulation of cellular catabolic process",0.268,2.3585,0.693,0.607,"positive regulation of cellular biosynthesis"),
c("GO:0006366","transcription from RNA polymerase II promoter",3.963,2.0448,0.692,0.613,"positive regulation of cellular biosynthesis"),
c("GO:0042762","regulation of sulfur metabolic process",0.036,1.7183,0.780,0.618,"positive regulation of cellular biosynthesis"),
c("GO:0010909","positive regulation of heparan sulfate proteoglycan biosynthetic process",0.002,1.8931,0.699,0.622,"positive regulation of cellular biosynthesis"),
c("GO:0090304","nucleic acid metabolic process",15.268,2.6144,0.730,0.636,"positive regulation of cellular biosynthesis"),
c("GO:0032805","positive regulation of low-density lipoprotein particle receptor catabolic process",0.001,2.1925,0.737,0.640,"positive regulation of cellular biosynthesis"),
c("GO:0016458","gene silencing",0.191,1.9278,0.718,0.647,"positive regulation of cellular biosynthesis"),
c("GO:0035865","cellular response to potassium ion",0.007,1.8931,0.886,0.648,"positive regulation of cellular biosynthesis"),
c("GO:0034654","nucleobase-containing compound biosynthetic process",13.254,3.6990,0.695,0.660,"positive regulation of cellular biosynthesis"),
c("GO:0019219","regulation of nucleobase-containing compound metabolic process",12.840,5.0605,0.602,0.662,"positive regulation of cellular biosynthesis"),
c("GO:0046292","formaldehyde metabolic process",0.009,1.8931,0.867,0.662,"positive regulation of cellular biosynthesis"),
c("GO:0009889","regulation of biosynthetic process",11.561,4.0706,0.663,0.675,"positive regulation of cellular biosynthesis"),
c("GO:0043487","regulation of RNA stability",0.093,1.7007,0.746,0.676,"positive regulation of cellular biosynthesis"),
c("GO:0010468","regulation of gene expression",11.954,4.1367,0.658,0.681,"positive regulation of cellular biosynthesis"),
c("GO:1901362","organic cyclic compound biosynthetic process",13.849,3.7447,0.743,0.683,"positive regulation of cellular biosynthesis"),
c("GO:0009892","negative regulation of metabolic process",3.994,2.1040,0.712,0.688,"positive regulation of cellular biosynthesis"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",13.670,3.8239,0.724,0.689,"positive regulation of cellular biosynthesis"),
c("GO:0019438","aromatic compound biosynthetic process",13.512,3.5686,0.733,0.693,"positive regulation of cellular biosynthesis"),
c("GO:0018130","heterocycle biosynthetic process",13.553,3.5528,0.732,0.693,"positive regulation of cellular biosynthesis"),
c("GO:0051171","regulation of nitrogen compound metabolic process",13.046,4.8239,0.675,0.695,"positive regulation of cellular biosynthesis"),
c("GO:0034641","cellular nitrogen compound metabolic process",25.263,2.2541,0.773,0.697,"positive regulation of cellular biosynthesis"),
c("GO:0060325","face morphogenesis",0.182,3.1805,0.929,0.000,"face morphogenesis"),
c("GO:0048625","myoblast fate commitment",0.016,1.5947,0.908,0.254,"face morphogenesis"),
c("GO:0060322","head development",0.238,2.6162,0.940,0.310,"face morphogenesis"),
c("GO:0007568","aging",0.730,1.7620,0.938,0.324,"face morphogenesis"),
c("GO:0060040","retinal bipolar neuron differentiation",0.006,2.1925,0.884,0.329,"face morphogenesis"),
c("GO:0060613","fat pad development",0.017,1.4992,0.923,0.329,"face morphogenesis"),
c("GO:0048619","embryonic hindgut morphogenesis",0.010,1.8931,0.915,0.341,"face morphogenesis"),
c("GO:0021527","spinal cord association neuron differentiation",0.026,1.5947,0.874,0.385,"face morphogenesis"),
c("GO:0040019","positive regulation of embryonic development",0.017,1.4214,0.861,0.397,"face morphogenesis"),
c("GO:0010171","body morphogenesis",0.222,2.8097,0.935,0.426,"face morphogenesis"),
c("GO:0030538","embryonic genitalia morphogenesis",0.013,1.7183,0.905,0.455,"face morphogenesis"),
c("GO:0048709","oligodendrocyte differentiation",0.234,1.4735,0.861,0.519,"face morphogenesis"),
c("GO:0048705","skeletal system morphogenesis",0.638,1.3198,0.899,0.528,"face morphogenesis"),
c("GO:0061525","hindgut development",0.023,1.4992,0.919,0.655,"face morphogenesis"),
c("GO:0065007","biological regulation",51.216,1.3977,0.997,0.000,"biological regulation"),
c("GO:0015760","glucose-6-phosphate transport",0.008,1.8931,0.957,0.012,"glucose-6-phosphate transport"),
c("GO:0000060","protein import into nucleus, translocation",0.103,1.8321,0.956,0.328,"glucose-6-phosphate transport"),
c("GO:0032252","secretory granule localization",0.017,1.7183,0.973,0.336,"glucose-6-phosphate transport"),
c("GO:0043691","reverse cholesterol transport",0.032,1.3558,0.953,0.363,"glucose-6-phosphate transport"),
c("GO:0015748","organophosphate ester transport",0.202,1.4735,0.956,0.410,"glucose-6-phosphate transport"),
c("GO:0033700","phospholipid efflux",0.017,1.5947,0.950,0.684,"glucose-6-phosphate transport"),
c("GO:0009399","nitrogen fixation",0.001,2.1925,0.927,0.037,"nitrogen fixation"),
c("GO:0006706","steroid catabolic process",0.035,2.5901,0.826,0.048,"steroid catabolism"),
c("GO:0046092","deoxycytidine metabolic process",0.002,2.1925,0.841,0.110,"steroid catabolism"),
c("GO:1901685","glutathione derivative metabolic process",0.031,2.3947,0.899,0.122,"steroid catabolism"),
c("GO:0009120","deoxyribonucleoside metabolic process",0.009,1.4992,0.842,0.226,"steroid catabolism"),
c("GO:0044598","doxorubicin metabolic process",0.009,1.3558,0.843,0.243,"steroid catabolism"),
c("GO:0009162","deoxyribonucleoside monophosphate metabolic process",0.028,1.4214,0.834,0.244,"steroid catabolism"),
c("GO:0051156","glucose 6-phosphate metabolic process",0.024,1.4214,0.890,0.246,"steroid catabolism"),
c("GO:0000289","nuclear-transcribed mRNA poly(A) tail shortening",0.049,1.8041,0.779,0.377,"steroid catabolism"),
c("GO:0032315","regulation of Ral GTPase activity",0.027,1.5947,0.670,0.378,"steroid catabolism"),
c("GO:0090045","positive regulation of deacetylase activity",0.007,1.4214,0.849,0.380,"steroid catabolism"),
c("GO:0009894","regulation of catabolic process",2.662,1.7726,0.735,0.417,"steroid catabolism"),
c("GO:0007264","small GTPase mediated signal transduction",2.633,1.4411,0.769,0.426,"steroid catabolism"),
c("GO:0042159","lipoprotein catabolic process",0.031,1.4214,0.845,0.471,"steroid catabolism"),
c("GO:0032484","Ral protein signal transduction",0.027,1.5947,0.835,0.499,"steroid catabolism"),
c("GO:0006710","androgen catabolic process",0.002,1.8931,0.793,0.558,"steroid catabolism"),
c("GO:0010873","positive regulation of cholesterol esterification",0.008,1.8931,0.730,0.582,"steroid catabolism"),
c("GO:0034433","steroid esterification",0.015,1.4992,0.841,0.604,"steroid catabolism"),
c("GO:0045541","negative regulation of cholesterol biosynthetic process",0.003,1.7183,0.725,0.642,"steroid catabolism"),
c("GO:0007265","Ras protein signal transduction",1.560,1.3574,0.778,0.647,"steroid catabolism"),
c("GO:2000622","regulation of nuclear-transcribed mRNA catabolic process, nonsense-mediated decay",0.003,1.7183,0.751,0.670,"steroid catabolism"),
c("GO:0043097","pyrimidine nucleoside salvage",0.013,1.3558,0.788,0.672,"steroid catabolism"),
c("GO:1902369","negative regulation of RNA catabolic process",0.008,1.4992,0.712,0.673,"steroid catabolism"),
c("GO:0034382","chylomicron remnant clearance",0.011,1.8931,0.879,0.056,"chylomicron remnant clearance"),
c("GO:0043535","regulation of blood vessel endothelial cell migration",0.070,1.7007,0.801,0.196,"chylomicron remnant clearance"),
c("GO:0035264","multicellular organism growth",0.439,1.6276,0.932,0.253,"chylomicron remnant clearance"),
c("GO:2001256","regulation of store-operated calcium entry",0.025,1.5947,0.912,0.386,"chylomicron remnant clearance"),
c("GO:0038089","positive regulation of cell migration by vascular endothelial growth factor signaling pathway",0.006,1.4992,0.776,0.525,"chylomicron remnant clearance"),
c("GO:0002115","store-operated calcium entry",0.028,1.4992,0.962,0.558,"chylomicron remnant clearance"),
c("GO:0002282","microglial cell activation involved in immune response",0.035,1.7183,0.909,0.062,"microglial cell activation involved in immune response"),
c("GO:0010544","negative regulation of platelet activation",0.016,1.4214,0.697,0.459,"microglial cell activation involved in immune response"),
c("GO:0046685","response to arsenic-containing substance",0.043,2.2857,0.926,0.063,"response to arsenic-containing substance"),
c("GO:0072702","response to methyl methanesulfonate",0.001,2.1925,0.934,0.233,"response to arsenic-containing substance"),
c("GO:0072703","cellular response to methyl methanesulfonate",0.001,2.1925,0.896,0.233,"response to arsenic-containing substance"),
c("GO:0071726","cellular response to diacyl bacterial lipopeptide",0.002,2.1925,0.810,0.242,"response to arsenic-containing substance"),
c("GO:0051595","response to methylglyoxal",0.008,2.1925,0.923,0.261,"response to arsenic-containing substance"),
c("GO:0007290","spermatid nucleus elongation",0.014,2.1925,0.780,0.304,"response to arsenic-containing substance"),
c("GO:0036123","histone H3-K9 dimethylation",0.013,2.1925,0.785,0.313,"response to arsenic-containing substance"),
c("GO:0043570","maintenance of DNA repeat elements",0.006,1.7183,0.803,0.392,"response to arsenic-containing substance"),
c("GO:0033169","histone H3-K9 demethylation",0.010,1.3558,0.798,0.477,"response to arsenic-containing substance"),
c("GO:0032493","response to bacterial lipoprotein",0.058,1.7183,0.828,0.538,"response to arsenic-containing substance"),
c("GO:0044702","single organism reproductive process",2.715,1.7319,0.949,0.538,"response to arsenic-containing substance"),
c("GO:0052173","response to defenses of other organism involved in symbiotic interaction",0.043,1.3558,0.859,0.541,"response to arsenic-containing substance"),
c("GO:0043974","histone H3-K27 acetylation",0.002,1.8931,0.808,0.551,"response to arsenic-containing substance"),
c("GO:0031056","regulation of histone modification",0.236,2.0635,0.647,0.576,"response to arsenic-containing substance"),
c("GO:0032490","detection of molecule of bacterial origin",0.044,1.4992,0.825,0.643,"response to arsenic-containing substance"),
c("GO:0033044","regulation of chromosome organization",0.410,1.7138,0.802,0.684,"response to arsenic-containing substance"),
c("GO:1901675","negative regulation of histone H3-K27 acetylation",0.001,2.1925,0.710,0.690,"response to arsenic-containing substance"));

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
