

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
revigo.data <- rbind(c("GO:0006839","mitochondrial transport",0.326,3.0862,0.874,0.000,"mitochondrial transport"),
c("GO:0003333","amino acid transmembrane transport",0.160,2.1785,0.830,0.284,"mitochondrial transport"),
c("GO:0032941","secretion by tissue",0.226,2.1925,0.755,0.292,"mitochondrial transport"),
c("GO:0071705","nitrogen compound transport",1.894,1.3748,0.894,0.312,"mitochondrial transport"),
c("GO:0010248","establishment or maintenance of transmembrane electrochemical gradient",0.005,1.6084,0.875,0.320,"mitochondrial transport"),
c("GO:0072512","trivalent inorganic cation transport",0.049,1.8153,0.891,0.334,"mitochondrial transport"),
c("GO:0033572","transferrin transport",0.044,1.8153,0.875,0.379,"mitochondrial transport"),
c("GO:0015734","taurine transport",0.002,2.0820,0.904,0.454,"mitochondrial transport"),
c("GO:0015992","proton transport",3.250,1.7131,0.853,0.477,"mitochondrial transport"),
c("GO:0071702","organic substance transport",5.810,1.4844,0.884,0.483,"mitochondrial transport"),
c("GO:2001137","positive regulation of endocytic recycling",0.011,1.7828,0.781,0.485,"mitochondrial transport"),
c("GO:0070257","positive regulation of mucus secretion",0.018,1.6084,0.685,0.502,"mitochondrial transport"),
c("GO:0006818","hydrogen transport",3.252,1.6803,0.862,0.504,"mitochondrial transport"),
c("GO:0032218","riboflavin transport",0.003,1.6084,0.895,0.552,"mitochondrial transport"),
c("GO:2001140","positive regulation of phospholipid transport",0.006,1.7828,0.824,0.570,"mitochondrial transport"),
c("GO:0006626","protein targeting to mitochondrion",0.105,2.2190,0.794,0.571,"mitochondrial transport"),
c("GO:0055085","transmembrane transport",7.528,2.7721,0.799,0.575,"mitochondrial transport"),
c("GO:0070131","positive regulation of mitochondrial translation",0.005,1.7828,0.750,0.594,"mitochondrial transport"),
c("GO:0007589","body fluid secretion",0.269,2.0443,0.708,0.614,"mitochondrial transport"),
c("GO:0035646","endosome to melanosome transport",0.010,1.4852,0.709,0.629,"mitochondrial transport"),
c("GO:0070585","protein localization to mitochondrion",0.147,1.7469,0.902,0.644,"mitochondrial transport"),
c("GO:2001138","regulation of phospholipid transport",0.007,1.6084,0.836,0.667,"mitochondrial transport"),
c("GO:0006811","ion transport",7.803,2.4724,0.851,0.673,"mitochondrial transport"),
c("GO:1902598","creatine transmembrane transport",0.008,2.0820,0.857,0.695,"mitochondrial transport"),
c("GO:0007005","mitochondrion organization",0.649,3.6990,0.899,0.000,"mitochondrion organization"),
c("GO:0048251","elastic fiber assembly",0.016,1.3901,0.895,0.266,"mitochondrion organization"),
c("GO:0033615","mitochondrial proton-transporting ATP synthase complex assembly",0.002,1.7828,0.905,0.314,"mitochondrion organization"),
c("GO:0070272","proton-transporting ATP synthase complex biogenesis",0.007,1.6084,0.948,0.351,"mitochondrion organization"),
c("GO:0060155","platelet dense granule organization",0.013,1.3901,0.920,0.352,"mitochondrion organization"),
c("GO:0031063","regulation of histone deacetylation",0.079,2.1785,0.752,0.405,"mitochondrion organization"),
c("GO:0042256","mature ribosome assembly",0.010,1.3901,0.915,0.406,"mitochondrion organization"),
c("GO:0070071","proton-transporting two-sector ATPase complex assembly",0.009,1.4852,0.943,0.450,"mitochondrion organization"),
c("GO:0010950","positive regulation of endopeptidase activity",0.231,2.0434,0.847,0.451,"mitochondrion organization"),
c("GO:0033135","regulation of peptidyl-serine phosphorylation",0.224,2.0443,0.804,0.526,"mitochondrion organization"),
c("GO:0045936","negative regulation of phosphate metabolic process",0.841,1.7632,0.808,0.533,"mitochondrion organization"),
c("GO:0010563","negative regulation of phosphorus metabolic process",0.841,1.7632,0.811,0.666,"mitochondrion organization"),
c("GO:0008152","metabolic process",54.733,1.7870,0.997,0.000,"metabolism"),
c("GO:0060013","righting reflex",0.013,1.4852,0.942,0.000,"righting reflex"),
c("GO:0001569","patterning of blood vessels",0.121,2.8570,0.705,0.015,"patterning of blood vessels"),
c("GO:0070315","G1 to G0 transition involved in cell differentiation",0.006,1.7828,0.812,0.215,"patterning of blood vessels"),
c("GO:0021768","nucleus accumbens development",0.001,2.0820,0.820,0.231,"patterning of blood vessels"),
c("GO:0032649","regulation of interferon-gamma production",0.175,2.3036,0.760,0.246,"patterning of blood vessels"),
c("GO:0045162","clustering of voltage-gated sodium channels",0.010,1.4852,0.745,0.278,"patterning of blood vessels"),
c("GO:0048569","post-embryonic organ development",0.038,2.3737,0.786,0.286,"patterning of blood vessels"),
c("GO:0035270","endocrine system development",0.434,1.6332,0.763,0.344,"patterning of blood vessels"),
c("GO:0014707","branchiomeric skeletal muscle development",0.007,1.7828,0.784,0.372,"patterning of blood vessels"),
c("GO:0070314","G1 to G0 transition",0.022,1.3901,0.929,0.391,"patterning of blood vessels"),
c("GO:0060541","respiratory system development",0.648,1.5432,0.756,0.399,"patterning of blood vessels"),
c("GO:0048593","camera-type eye morphogenesis",0.270,2.8539,0.724,0.419,"patterning of blood vessels"),
c("GO:0035802","adrenal cortex formation",0.003,1.7828,0.792,0.419,"patterning of blood vessels"),
c("GO:0061032","visceral serous pericardium development",0.005,2.0820,0.777,0.443,"patterning of blood vessels"),
c("GO:0048625","myoblast fate commitment",0.016,1.4852,0.785,0.455,"patterning of blood vessels"),
c("GO:0002521","leukocyte differentiation",1.015,2.4295,0.657,0.460,"patterning of blood vessels"),
c("GO:0072166","posterior mesonephric tubule development",0.002,1.7828,0.779,0.466,"patterning of blood vessels"),
c("GO:0072302","negative regulation of metanephric glomerular mesangial cell proliferation",0.001,2.0820,0.680,0.470,"patterning of blood vessels"),
c("GO:0002520","immune system development",1.845,1.5527,0.708,0.487,"patterning of blood vessels"),
c("GO:1902367","negative regulation of Notch signaling pathway involved in somitogenesis",0.001,2.0820,0.686,0.488,"patterning of blood vessels"),
c("GO:0051240","positive regulation of multicellular organismal process",1.418,2.0232,0.718,0.517,"patterning of blood vessels"),
c("GO:0039534","negative regulation of MDA-5 signaling pathway",0.002,1.7828,0.706,0.523,"patterning of blood vessels"),
c("GO:0045995","regulation of embryonic development",0.207,1.8182,0.706,0.525,"patterning of blood vessels"),
c("GO:1901741","positive regulation of myoblast fusion",0.016,1.4852,0.651,0.526,"patterning of blood vessels"),
c("GO:0060166","olfactory pit development",0.005,2.0820,0.801,0.532,"patterning of blood vessels"),
c("GO:0002829","negative regulation of type 2 immune response",0.021,1.6084,0.886,0.541,"patterning of blood vessels"),
c("GO:0007423","sensory organ development",1.365,1.5558,0.727,0.543,"patterning of blood vessels"),
c("GO:1902359","Notch signaling pathway involved in somitogenesis",0.001,2.0820,0.728,0.547,"patterning of blood vessels"),
c("GO:0048739","cardiac muscle fiber development",0.015,1.4852,0.722,0.549,"patterning of blood vessels"),
c("GO:0048646","anatomical structure formation involved in morphogenesis",2.581,1.8508,0.756,0.553,"patterning of blood vessels"),
c("GO:0060319","primitive erythrocyte differentiation",0.006,1.6084,0.709,0.561,"patterning of blood vessels"),
c("GO:2001016","positive regulation of skeletal muscle cell differentiation",0.013,1.7828,0.664,0.572,"patterning of blood vessels"),
c("GO:0070970","interleukin-2 secretion",0.016,1.6084,0.740,0.572,"patterning of blood vessels"),
c("GO:0090183","regulation of kidney development",0.131,1.6821,0.685,0.576,"patterning of blood vessels"),
c("GO:0002043","blood vessel endothelial cell proliferation involved in sprouting angiogenesis",0.008,1.4852,0.757,0.576,"patterning of blood vessels"),
c("GO:0060982","coronary artery morphogenesis",0.022,1.7828,0.744,0.583,"patterning of blood vessels"),
c("GO:0051094","positive regulation of developmental process",1.985,1.5859,0.702,0.590,"patterning of blood vessels"),
c("GO:0033299","secretion of lysosomal enzymes",0.019,1.4852,0.848,0.596,"patterning of blood vessels"),
c("GO:0001763","morphogenesis of a branching structure",0.639,1.5432,0.745,0.607,"patterning of blood vessels"),
c("GO:0048638","regulation of developmental growth",0.309,1.4527,0.747,0.614,"patterning of blood vessels"),
c("GO:0097084","vascular smooth muscle cell development",0.021,1.3901,0.726,0.617,"patterning of blood vessels"),
c("GO:0032695","negative regulation of interleukin-12 production",0.046,1.3901,0.769,0.635,"patterning of blood vessels"),
c("GO:0002260","lymphocyte homeostasis",0.164,1.5187,0.874,0.637,"patterning of blood vessels"),
c("GO:0060421","positive regulation of heart growth",0.009,1.3901,0.705,0.638,"patterning of blood vessels"),
c("GO:0000578","embryonic axis specification",0.089,1.7796,0.768,0.643,"patterning of blood vessels"),
c("GO:2001076","positive regulation of metanephric ureteric bud development",0.002,1.7828,0.703,0.658,"patterning of blood vessels"),
c("GO:0009880","embryonic pattern specification",0.162,1.4059,0.764,0.673,"patterning of blood vessels"),
c("GO:0031077","post-embryonic camera-type eye development",0.023,2.7352,0.777,0.676,"patterning of blood vessels"),
c("GO:0030225","macrophage differentiation",0.071,1.8914,0.710,0.681,"patterning of blood vessels"),
c("GO:0060923","cardiac muscle cell fate commitment",0.015,1.3901,0.726,0.684,"patterning of blood vessels"),
c("GO:0032609","interferon-gamma production",0.198,2.1409,0.813,0.687,"patterning of blood vessels"),
c("GO:1902262","apoptotic process involved in patterning of blood vessels",0.018,1.3901,0.672,0.687,"patterning of blood vessels"),
c("GO:0008283","cell proliferation",4.075,1.5058,0.966,0.021,"cell proliferation"),
c("GO:0046415","urate metabolic process",0.015,3.0044,0.879,0.030,"urate metabolism"),
c("GO:0000959","mitochondrial RNA metabolic process",0.027,2.0218,0.917,0.123,"urate metabolism"),
c("GO:1901564","organonitrogen compound metabolic process",11.844,1.3468,0.931,0.188,"urate metabolism"),
c("GO:1900864","mitochondrial RNA modification",0.002,2.0820,0.905,0.189,"urate metabolism"),
c("GO:0006738","nicotinamide riboside catabolic process",0.002,2.0820,0.867,0.193,"urate metabolism"),
c("GO:0006771","riboflavin metabolic process",0.009,1.4852,0.890,0.208,"urate metabolism"),
c("GO:0042726","flavin-containing compound metabolic process",0.011,1.4852,0.923,0.210,"urate metabolism"),
c("GO:0006002","fructose 6-phosphate metabolic process",0.048,1.4852,0.924,0.219,"urate metabolism"),
c("GO:0006048","UDP-N-acetylglucosamine biosynthetic process",0.006,1.3901,0.880,0.233,"urate metabolism"),
c("GO:0046102","inosine metabolic process",0.005,1.6084,0.889,0.236,"urate metabolism"),
c("GO:0070525","threonylcarbamoyladenosine metabolic process",0.005,2.0820,0.883,0.236,"urate metabolism"),
c("GO:0019303","D-ribose catabolic process",0.002,1.7828,0.917,0.255,"urate metabolism"),
c("GO:0006082","organic acid metabolic process",3.105,1.8072,0.850,0.281,"urate metabolism"),
c("GO:0006148","inosine catabolic process",0.001,2.0820,0.884,0.286,"urate metabolism"),
c("GO:0006788","heme oxidation",0.023,1.7828,0.857,0.314,"urate metabolism"),
c("GO:0034418","urate biosynthetic process",0.002,1.7828,0.882,0.345,"urate metabolism"),
c("GO:0044281","small molecule metabolic process",13.539,1.8318,0.904,0.357,"urate metabolism"),
c("GO:0019464","glycine decarboxylation via glycine cleavage system",0.006,2.0820,0.870,0.362,"urate metabolism"),
c("GO:0006431","methionyl-tRNA aminoacylation",0.008,1.7828,0.853,0.425,"urate metabolism"),
c("GO:0045542","positive regulation of cholesterol biosynthetic process",0.013,1.3901,0.852,0.452,"urate metabolism"),
c("GO:0055114","oxidation-reduction process",10.933,1.6925,0.906,0.464,"urate metabolism"),
c("GO:0002138","retinoic acid biosynthetic process",0.021,1.3901,0.835,0.508,"urate metabolism"),
c("GO:0034656","nucleobase-containing small molecule catabolic process",0.007,1.4852,0.876,0.530,"urate metabolism"),
c("GO:0034356","NAD biosynthesis via nicotinamide riboside salvage pathway",0.001,2.0820,0.872,0.560,"urate metabolism"),
c("GO:1901605","alpha-amino acid metabolic process",0.722,1.5139,0.844,0.568,"urate metabolism"),
c("GO:0002098","tRNA wobble uridine modification",0.008,1.3901,0.901,0.577,"urate metabolism"),
c("GO:0070637","pyridine nucleoside metabolic process",0.002,2.0820,0.883,0.578,"urate metabolism"),
c("GO:0072526","pyridine-containing compound catabolic process",0.008,1.6084,0.897,0.614,"urate metabolism"),
c("GO:0046516","hypusine metabolic process",0.051,1.3901,0.869,0.653,"urate metabolism"),
c("GO:0010811","positive regulation of cell-substrate adhesion",0.255,2.9393,0.818,0.038,"positive regulation of cell-substrate adhesion"),
c("GO:0090036","regulation of protein kinase C signaling",0.031,2.5346,0.846,0.125,"positive regulation of cell-substrate adhesion"),
c("GO:2000243","positive regulation of reproductive process",0.097,2.0711,0.898,0.138,"positive regulation of cell-substrate adhesion"),
c("GO:0043467","regulation of generation of precursor metabolites and energy",0.149,2.1662,0.852,0.141,"positive regulation of cell-substrate adhesion"),
c("GO:0051249","regulation of lymphocyte activation",0.741,2.4089,0.787,0.162,"positive regulation of cell-substrate adhesion"),
c("GO:0038189","neuropilin signaling pathway",0.010,2.0820,0.868,0.178,"positive regulation of cell-substrate adhesion"),
c("GO:0002827","positive regulation of T-helper 1 type immune response",0.016,1.6084,0.900,0.178,"positive regulation of cell-substrate adhesion"),
c("GO:0042127","regulation of cell proliferation",3.148,1.7575,0.827,0.210,"positive regulation of cell-substrate adhesion"),
c("GO:1900086","positive regulation of peptidyl-tyrosine autophosphorylation",0.003,2.0820,0.811,0.277,"positive regulation of cell-substrate adhesion"),
c("GO:0007200","phospholipase C-activating G-protein coupled receptor signaling pathway",0.131,1.7796,0.847,0.278,"positive regulation of cell-substrate adhesion"),
c("GO:0061419","positive regulation of transcription from RNA polymerase II promoter in response to hypoxia",0.006,1.6084,0.801,0.286,"positive regulation of cell-substrate adhesion"),
c("GO:1901857","positive regulation of cellular respiration",0.002,1.7828,0.827,0.296,"positive regulation of cell-substrate adhesion"),
c("GO:0070528","protein kinase C signaling",0.072,2.1785,0.853,0.329,"positive regulation of cell-substrate adhesion"),
c("GO:0045742","positive regulation of epidermal growth factor receptor signaling pathway",0.031,2.3028,0.808,0.330,"positive regulation of cell-substrate adhesion"),
c("GO:0002687","positive regulation of leukocyte migration",0.130,2.3036,0.685,0.357,"positive regulation of cell-substrate adhesion"),
c("GO:0002824","positive regulation of adaptive immune response based on somatic recombination of immune receptors built from immunoglobulin superfamily domains",19.033,1.4715,0.829,0.370,"positive regulation of cell-substrate adhesion"),
c("GO:0008612","peptidyl-lysine modification to peptidyl-hypusine",0.030,1.3901,0.908,0.393,"positive regulation of cell-substrate adhesion"),
c("GO:1900103","positive regulation of endoplasmic reticulum unfolded protein response",0.005,1.3901,0.822,0.405,"positive regulation of cell-substrate adhesion"),
c("GO:0010886","positive regulation of cholesterol storage",0.030,1.3901,0.814,0.407,"positive regulation of cell-substrate adhesion"),
c("GO:0061450","trophoblast cell migration",0.006,1.4852,0.709,0.445,"positive regulation of cell-substrate adhesion"),
c("GO:0031290","retinal ganglion cell axon guidance",0.047,2.2381,0.642,0.462,"positive regulation of cell-substrate adhesion"),
c("GO:0038190","VEGF-activated neuropilin signaling pathway",0.010,2.0820,0.839,0.471,"positive regulation of cell-substrate adhesion"),
c("GO:0002158","osteoclast proliferation",0.011,1.4852,0.952,0.490,"positive regulation of cell-substrate adhesion"),
c("GO:0046545","development of primary female sexual characteristics",0.285,1.6488,0.762,0.525,"positive regulation of cell-substrate adhesion"),
c("GO:0045333","cellular respiration",5.546,1.6358,0.850,0.541,"positive regulation of cell-substrate adhesion"),
c("GO:0002575","basophil chemotaxis",0.001,2.0820,0.791,0.583,"positive regulation of cell-substrate adhesion"),
c("GO:0038083","peptidyl-tyrosine autophosphorylation",0.028,1.4852,0.901,0.593,"positive regulation of cell-substrate adhesion"),
c("GO:0007169","transmembrane receptor protein tyrosine kinase signaling pathway",1.599,2.0640,0.809,0.599,"positive regulation of cell-substrate adhesion"),
c("GO:0002352","B cell negative selection",0.009,1.6084,0.724,0.602,"positive regulation of cell-substrate adhesion"),
c("GO:0034115","negative regulation of heterotypic cell-cell adhesion",0.009,1.3901,0.687,0.637,"positive regulation of cell-substrate adhesion"),
c("GO:0030155","regulation of cell adhesion",0.746,1.5093,0.859,0.638,"positive regulation of cell-substrate adhesion"),
c("GO:1902336","positive regulation of retinal ganglion cell axon guidance",0.010,1.7828,0.562,0.639,"positive regulation of cell-substrate adhesion"),
c("GO:0002339","B cell selection",0.010,1.6084,0.722,0.641,"positive regulation of cell-substrate adhesion"),
c("GO:0010770","positive regulation of cell morphogenesis involved in differentiation",0.113,1.4271,0.621,0.651,"positive regulation of cell-substrate adhesion"),
c("GO:0072683","T cell extravasation",0.008,2.0820,0.793,0.653,"positive regulation of cell-substrate adhesion"),
c("GO:0050679","positive regulation of epithelial cell proliferation",0.313,1.3569,0.807,0.666,"positive regulation of cell-substrate adhesion"),
c("GO:0045820","negative regulation of glycolytic process",0.015,1.3901,0.788,0.666,"positive regulation of cell-substrate adhesion"),
c("GO:0097531","mast cell migration",0.011,1.3901,0.797,0.668,"positive regulation of cell-substrate adhesion"),
c("GO:1901165","positive regulation of trophoblast cell migration",0.002,1.7828,0.637,0.679,"positive regulation of cell-substrate adhesion"),
c("GO:0010046","response to mycotoxin",0.009,1.4852,0.956,0.043,"response to mycotoxin"),
c("GO:0043497","regulation of protein heterodimerization activity",0.016,1.3901,0.937,0.044,"regulation of protein heterodimerization activity"),
c("GO:0070231","T cell apoptotic process",0.136,2.6819,0.867,0.056,"T cell apoptotic process"),
c("GO:0097527","necroptotic signaling pathway",0.009,1.3901,0.844,0.385,"T cell apoptotic process"),
c("GO:0006309","apoptotic DNA fragmentation",0.039,1.9326,0.799,0.425,"T cell apoptotic process"),
c("GO:0030167","proteoglycan catabolic process",0.003,1.7828,0.898,0.437,"T cell apoptotic process"),
c("GO:0010942","positive regulation of cell death",1.003,1.8661,0.761,0.529,"T cell apoptotic process"),
c("GO:0097049","motor neuron apoptotic process",0.011,1.6084,0.891,0.566,"T cell apoptotic process"),
c("GO:0006879","cellular iron ion homeostasis",0.185,2.1662,0.861,0.067,"cellular iron ion homeostasis"),
c("GO:0043117","positive regulation of vascular permeability",0.016,1.6084,0.810,0.322,"cellular iron ion homeostasis"),
c("GO:0019227","neuronal action potential propagation",0.019,1.3901,0.808,0.350,"cellular iron ion homeostasis"),
c("GO:0051881","regulation of mitochondrial membrane potential",0.095,1.6236,0.917,0.365,"cellular iron ion homeostasis"),
c("GO:0003062","regulation of heart rate by chemical signal",0.015,1.3901,0.783,0.507,"cellular iron ion homeostasis"),
c("GO:0010917","negative regulation of mitochondrial membrane potential",0.007,1.4852,0.929,0.550,"cellular iron ion homeostasis"),
c("GO:0048878","chemical homeostasis",2.056,1.4298,0.890,0.652,"cellular iron ion homeostasis"),
c("GO:0005975","carbohydrate metabolic process",3.046,1.6805,0.953,0.079,"carbohydrate metabolism"),
c("GO:0031638","zymogen activation",0.198,1.4527,0.928,0.104,"carbohydrate metabolism"),
c("GO:0044710","single-organism metabolic process",26.477,2.0283,0.933,0.113,"carbohydrate metabolism"),
c("GO:0006091","generation of precursor metabolites and energy",6.571,1.8877,0.920,0.135,"carbohydrate metabolism"),
c("GO:0044237","cellular metabolic process",42.121,1.8251,0.920,0.249,"carbohydrate metabolism"),
c("GO:0071704","organic substance metabolic process",42.826,1.7361,0.960,0.319,"carbohydrate metabolism"),
c("GO:0001775","cell activation",2.008,1.6148,0.907,0.085,"cell activation"));

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
