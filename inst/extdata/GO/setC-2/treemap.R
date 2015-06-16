

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
revigo.data <- rbind(c("GO:0006396","RNA processing",1.631,5.3665,0.834,0.000,"RNA processing"),
c("GO:0006790","sulfur compound metabolic process",0.742,1.9670,0.917,0.111,"RNA processing"),
c("GO:1901135","carbohydrate derivative metabolic process",10.573,1.6874,0.927,0.152,"RNA processing"),
c("GO:0006458","'de novo' protein folding",0.103,1.5911,0.903,0.184,"RNA processing"),
c("GO:0043414","macromolecule methylation",0.645,1.4755,0.885,0.221,"RNA processing"),
c("GO:1901566","organonitrogen compound biosynthetic process",2.941,3.0706,0.854,0.255,"RNA processing"),
c("GO:0043923","positive regulation by host of viral transcription",0.006,1.6983,0.810,0.258,"RNA processing"),
c("GO:0070935","3'-UTR-mediated mRNA stabilization",0.014,1.6087,0.881,0.259,"RNA processing"),
c("GO:2000278","regulation of DNA biosynthetic process",0.060,1.6087,0.817,0.276,"RNA processing"),
c("GO:0006363","termination of RNA polymerase I transcription",0.027,2.0182,0.865,0.290,"RNA processing"),
c("GO:0006360","transcription from RNA polymerase I promoter",0.067,2.0991,0.864,0.313,"RNA processing"),
c("GO:0006353","DNA-templated transcription, termination",0.101,2.9031,0.860,0.325,"RNA processing"),
c("GO:1901564","organonitrogen compound metabolic process",11.844,3.4202,0.876,0.344,"RNA processing"),
c("GO:0090066","regulation of anatomical structure size",0.957,1.5237,0.935,0.357,"RNA processing"),
c("GO:0006418","tRNA aminoacylation for protein translation",0.275,2.3778,0.768,0.399,"RNA processing"),
c("GO:0006397","mRNA processing",0.818,4.7696,0.822,0.401,"RNA processing"),
c("GO:0030203","glycosaminoglycan metabolic process",0.296,2.1778,0.873,0.402,"RNA processing"),
c("GO:0034660","ncRNA metabolic process",0.917,2.3420,0.845,0.406,"RNA processing"),
c("GO:0006022","aminoglycan metabolic process",0.332,2.0443,0.878,0.407,"RNA processing"),
c("GO:0016071","mRNA metabolic process",1.098,2.4225,0.842,0.415,"RNA processing"),
c("GO:0044728","DNA methylation or demethylation",0.168,1.5600,0.864,0.485,"RNA processing"),
c("GO:0032535","regulation of cellular component size",0.571,1.6407,0.775,0.493,"RNA processing"),
c("GO:1901068","guanosine-containing compound metabolic process",2.687,1.8085,0.753,0.527,"RNA processing"),
c("GO:0048878","chemical homeostasis",2.056,1.3716,0.929,0.567,"RNA processing"),
c("GO:0055086","nucleobase-containing small molecule metabolic process",9.487,1.5400,0.746,0.579,"RNA processing"),
c("GO:0045727","positive regulation of translation",0.121,1.6562,0.794,0.609,"RNA processing"),
c("GO:0031133","regulation of axon diameter",0.006,1.6012,0.676,0.616,"RNA processing"),
c("GO:0009166","nucleotide catabolic process",3.840,1.3394,0.744,0.620,"RNA processing"),
c("GO:0046039","GTP metabolic process",2.665,1.5624,0.741,0.630,"RNA processing"),
c("GO:1901070","guanosine-containing compound biosynthetic process",0.066,1.5287,0.799,0.643,"RNA processing"),
c("GO:1901657","glycosyl compound metabolic process",8.489,1.3760,0.837,0.661,"RNA processing"),
c("GO:0043038","amino acid activation",0.286,2.2104,0.810,0.695,"RNA processing"),
c("GO:1901607","alpha-amino acid biosynthetic process",0.283,1.3391,0.786,0.696,"RNA processing"),
c("GO:0007157","heterophilic cell-cell adhesion via plasma membrane cell adhesion molecules",0.084,2.1656,0.975,0.000,"heterophilic cell-cell adhesion via plasma membrane cell adhesion molecules"),
c("GO:0033631","cell-cell adhesion mediated by integrin",0.031,1.6983,0.958,0.457,"heterophilic cell-cell adhesion via plasma membrane cell adhesion molecules"),
c("GO:0007155","cell adhesion",2.821,1.8941,0.970,0.651,"heterophilic cell-cell adhesion via plasma membrane cell adhesion molecules"),
c("GO:0034446","substrate adhesion-dependent cell spreading",0.125,1.6904,0.669,0.676,"heterophilic cell-cell adhesion via plasma membrane cell adhesion molecules"),
c("GO:0009987","cellular process",59.614,1.7162,0.998,0.000,"cellular process"),
c("GO:0022610","biological adhesion",2.826,1.8861,0.994,0.000,"biological adhesion"),
c("GO:0032502","developmental process",13.055,1.7254,0.995,0.000,"developmental process"),
c("GO:0071840","cellular component organization or biogenesis",12.603,2.3215,0.995,0.000,"cellular component organization or biogenesis"),
c("GO:0097186","amelogenesis",0.033,3.5376,0.807,0.000,"amelogenesis"),
c("GO:0032616","interleukin-13 production",0.031,1.8005,0.901,0.199,"amelogenesis"),
c("GO:0048627","myoblast development",0.002,3.2076,0.820,0.204,"amelogenesis"),
c("GO:0036179","osteoclast maturation",0.001,1.6012,0.815,0.261,"amelogenesis"),
c("GO:0021870","Cajal-Retzius cell differentiation",0.006,1.6012,0.792,0.271,"amelogenesis"),
c("GO:0048589","developmental growth",0.781,1.9722,0.793,0.276,"amelogenesis"),
c("GO:1902742","apoptotic process involved in development",0.092,1.7744,0.790,0.299,"amelogenesis"),
c("GO:0060065","uterus development",0.042,1.6983,0.823,0.306,"amelogenesis"),
c("GO:0035313","wound healing, spreading of epidermal cells",0.018,3.5376,0.704,0.318,"amelogenesis"),
c("GO:0061037","negative regulation of cartilage development",0.025,2.4401,0.766,0.359,"amelogenesis"),
c("GO:0035116","embryonic hindlimb morphogenesis",0.194,1.7744,0.787,0.371,"amelogenesis"),
c("GO:0034103","regulation of tissue remodeling",0.163,2.0516,0.852,0.372,"amelogenesis"),
c("GO:0051930","regulation of sensory perception of pain",0.042,1.9183,0.863,0.386,"amelogenesis"),
c("GO:0072264","metanephric glomerular endothelium development",0.007,1.6012,0.818,0.389,"amelogenesis"),
c("GO:0035295","tube development",1.620,1.9626,0.782,0.396,"amelogenesis"),
c("GO:0061008","hepaticobiliary system development",0.344,1.4456,0.804,0.396,"amelogenesis"),
c("GO:2000811","negative regulation of anoikis",0.021,1.3912,0.867,0.397,"amelogenesis"),
c("GO:0061383","trabecula morphogenesis",0.095,1.4940,0.812,0.400,"amelogenesis"),
c("GO:0010662","regulation of striated muscle cell apoptotic process",0.063,1.4566,0.872,0.428,"amelogenesis"),
c("GO:0001501","skeletal system development",1.209,1.3685,0.781,0.455,"amelogenesis"),
c("GO:0006929","substrate-dependent cell migration",0.063,2.0894,0.852,0.457,"amelogenesis"),
c("GO:0042231","interleukin-13 biosynthetic process",0.003,1.6012,0.870,0.470,"amelogenesis"),
c("GO:0043154","negative regulation of cysteine-type endopeptidase activity involved in apoptotic process",0.142,1.4437,0.803,0.481,"amelogenesis"),
c("GO:0002548","monocyte chemotaxis",0.042,2.0182,0.800,0.482,"amelogenesis"),
c("GO:0003245","cardiac muscle tissue growth involved in heart morphogenesis",0.002,1.6012,0.804,0.483,"amelogenesis"),
c("GO:0060429","epithelium development",2.640,2.2534,0.768,0.509,"amelogenesis"),
c("GO:0021972","corticospinal neuron axon guidance through spinal cord",0.001,1.6012,0.701,0.514,"amelogenesis"),
c("GO:0050793","regulation of developmental process",4.431,1.4187,0.759,0.524,"amelogenesis"),
c("GO:0072498","embryonic skeletal joint development",0.042,1.5287,0.827,0.543,"amelogenesis"),
c("GO:0071676","negative regulation of mononuclear cell migration",0.002,1.6012,0.828,0.569,"amelogenesis"),
c("GO:0060008","Sertoli cell differentiation",0.047,1.6087,0.753,0.569,"amelogenesis"),
c("GO:0046697","decidualization",0.051,1.3912,0.804,0.577,"amelogenesis"),
c("GO:0050918","positive chemotaxis",0.098,1.4940,0.898,0.586,"amelogenesis"),
c("GO:0071672","negative regulation of smooth muscle cell chemotaxis",0.002,1.6012,0.788,0.595,"amelogenesis"),
c("GO:0060603","mammary gland duct morphogenesis",0.146,2.1487,0.761,0.598,"amelogenesis"),
c("GO:0030216","keratinocyte differentiation",0.196,1.9289,0.724,0.615,"amelogenesis"),
c("GO:0042640","anagen",0.003,1.5287,0.826,0.618,"amelogenesis"),
c("GO:0031214","biomineral tissue development",0.252,1.4904,0.785,0.632,"amelogenesis"),
c("GO:0060010","Sertoli cell fate commitment",0.005,1.6012,0.786,0.645,"amelogenesis"),
c("GO:0002011","morphogenesis of an epithelial sheet",0.109,1.5786,0.782,0.666,"amelogenesis"),
c("GO:0070166","enamel mineralization",0.018,3.8239,0.804,0.681,"amelogenesis"),
c("GO:0097305","response to alcohol",0.774,2.1605,0.920,0.000,"response to alcohol"),
c("GO:0071393","cellular response to progesterone stimulus",0.002,1.6012,0.899,0.435,"response to alcohol"),
c("GO:0034341","response to interferon-gamma",0.263,1.4904,0.917,0.486,"response to alcohol"),
c("GO:1901032","negative regulation of response to reactive oxygen species",0.014,1.6012,0.884,0.491,"response to alcohol"),
c("GO:0070561","vitamin D receptor signaling pathway",0.016,2.2262,0.809,0.497,"response to alcohol"),
c("GO:1901421","positive regulation of response to alcohol",0.003,1.6012,0.905,0.507,"response to alcohol"),
c("GO:0060766","negative regulation of androgen receptor signaling pathway",0.018,1.8005,0.832,0.571,"response to alcohol"),
c("GO:0048545","response to steroid hormone",1.316,1.7176,0.915,0.578,"response to alcohol"),
c("GO:0033993","response to lipid",2.113,1.3768,0.919,0.641,"response to alcohol"),
c("GO:0071391","cellular response to estrogen stimulus",0.064,1.4566,0.880,0.646,"response to alcohol"),
c("GO:0051182","coenzyme transport",0.019,2.2262,0.925,0.011,"coenzyme transport"),
c("GO:0006403","RNA localization",0.263,1.5611,0.939,0.186,"coenzyme transport"),
c("GO:1901337","thioester transport",0.005,1.6012,0.926,0.186,"coenzyme transport"),
c("GO:0030001","metal ion transport",2.230,2.1046,0.905,0.280,"coenzyme transport"),
c("GO:0045921","positive regulation of exocytosis",0.074,1.5354,0.802,0.314,"coenzyme transport"),
c("GO:0071806","protein transmembrane transport",0.112,1.5354,0.863,0.426,"coenzyme transport"),
c("GO:0070838","divalent metal ion transport",1.028,1.7181,0.908,0.620,"coenzyme transport"),
c("GO:0072511","divalent inorganic cation transport",1.032,1.7022,0.911,0.620,"coenzyme transport"),
c("GO:0008283","cell proliferation",4.075,1.9027,0.967,0.017,"cell proliferation"),
c("GO:0010980","positive regulation of vitamin D 24-hydroxylase activity",0.003,3.2076,0.912,0.038,"positive regulation of vitamin D 24-hydroxylase activity"),
c("GO:0071072","negative regulation of phospholipid biosynthetic process",0.006,2.4401,0.794,0.142,"positive regulation of vitamin D 24-hydroxylase activity"),
c("GO:0051902","negative regulation of mitochondrial depolarization",0.006,1.6012,0.889,0.230,"positive regulation of vitamin D 24-hydroxylase activity"),
c("GO:2000326","negative regulation of ligand-dependent nuclear receptor transcription coactivator activity",0.001,1.6012,0.904,0.241,"positive regulation of vitamin D 24-hydroxylase activity"),
c("GO:0051098","regulation of binding",0.553,1.9197,0.926,0.337,"positive regulation of vitamin D 24-hydroxylase activity"),
c("GO:0007070","negative regulation of transcription from RNA polymerase II promoter during mitosis",0.002,1.6012,0.832,0.348,"positive regulation of vitamin D 24-hydroxylase activity"),
c("GO:0006747","FAD biosynthetic process",0.003,1.6012,0.825,0.353,"positive regulation of vitamin D 24-hydroxylase activity"),
c("GO:0031284","positive regulation of guanylate cyclase activity",0.015,1.6012,0.768,0.397,"positive regulation of vitamin D 24-hydroxylase activity"),
c("GO:0048875","chemical homeostasis within a tissue",0.025,1.5287,0.869,0.421,"positive regulation of vitamin D 24-hydroxylase activity"),
c("GO:0044283","small molecule biosynthetic process",1.120,1.5277,0.844,0.435,"positive regulation of vitamin D 24-hydroxylase activity"),
c("GO:0071071","regulation of phospholipid biosynthetic process",0.013,2.0570,0.798,0.638,"positive regulation of vitamin D 24-hydroxylase activity"),
c("GO:0010979","regulation of vitamin D 24-hydroxylase activity",0.003,3.2076,0.913,0.640,"positive regulation of vitamin D 24-hydroxylase activity"),
c("GO:0060558","regulation of calcidiol 1-monooxygenase activity",0.016,2.0570,0.758,0.692,"positive regulation of vitamin D 24-hydroxylase activity"),
c("GO:0007015","actin filament organization",0.768,4.0809,0.753,0.047,"actin filament organization"),
c("GO:0002934","desmosome organization",0.021,3.1024,0.837,0.274,"actin filament organization"),
c("GO:0042254","ribosome biogenesis",0.322,3.6198,0.848,0.341,"actin filament organization"),
c("GO:0045039","protein import into mitochondrial inner membrane",0.006,2.7352,0.786,0.382,"actin filament organization"),
c("GO:0048210","Golgi vesicle fusion to target membrane",0.002,1.6012,0.809,0.413,"actin filament organization"),
c("GO:0044085","cellular component biogenesis",4.871,3.9586,0.833,0.459,"actin filament organization"),
c("GO:0033623","regulation of integrin activation",0.014,2.2262,0.830,0.471,"actin filament organization"),
c("GO:0046607","positive regulation of centrosome cycle",0.005,1.6012,0.779,0.474,"actin filament organization"),
c("GO:0071800","podosome assembly",0.024,2.0570,0.837,0.491,"actin filament organization"),
c("GO:0051290","protein heterotetramerization",0.027,1.6983,0.866,0.496,"actin filament organization"),
c("GO:0033622","integrin activation",0.030,1.8005,0.866,0.500,"actin filament organization"),
c("GO:0006405","RNA export from nucleus",0.130,2.2211,0.900,0.501,"actin filament organization"),
c("GO:0051130","positive regulation of cellular component organization",1.698,1.7635,0.778,0.510,"actin filament organization"),
c("GO:0000902","cell morphogenesis",2.742,3.7212,0.606,0.547,"actin filament organization"),
c("GO:0030030","cell projection organization",2.744,1.9996,0.771,0.547,"actin filament organization"),
c("GO:0048311","mitochondrion distribution",0.025,2.0570,0.783,0.554,"actin filament organization"),
c("GO:0044087","regulation of cellular component biogenesis",1.045,3.0269,0.804,0.558,"actin filament organization"),
c("GO:0051169","nuclear transport",0.833,1.4837,0.921,0.564,"actin filament organization"),
c("GO:0009888","tissue development",4.199,1.5674,0.786,0.565,"actin filament organization"),
c("GO:0051963","regulation of synapse assembly",0.099,1.7744,0.617,0.571,"actin filament organization"),
c("GO:0051128","regulation of cellular component organization",3.835,2.3820,0.800,0.576,"actin filament organization"),
c("GO:0034334","adherens junction maintenance",0.003,1.6012,0.853,0.580,"actin filament organization"),
c("GO:0007010","cytoskeleton organization",2.674,2.0580,0.790,0.581,"actin filament organization"),
c("GO:0022613","ribonucleoprotein complex biogenesis",0.598,2.6819,0.843,0.594,"actin filament organization"),
c("GO:0006903","vesicle targeting",0.072,1.3803,0.864,0.604,"actin filament organization"),
c("GO:0002159","desmosome assembly",0.013,2.4401,0.826,0.623,"actin filament organization"),
c("GO:0048167","regulation of synaptic plasticity",0.337,1.6107,0.812,0.644,"actin filament organization"),
c("GO:0051258","protein polymerization",0.564,1.4108,0.833,0.646,"actin filament organization"),
c("GO:0090151","establishment of protein localization to mitochondrial membrane",0.010,1.9183,0.789,0.675,"actin filament organization"),
c("GO:0071822","protein complex subunit organization",3.467,1.5651,0.822,0.677,"actin filament organization"),
c("GO:0048468","cell development",4.830,2.1302,0.693,0.678,"actin filament organization"),
c("GO:0048666","neuron development",2.265,2.2154,0.679,0.681,"actin filament organization"),
c("GO:0048856","anatomical structure development",11.534,2.1433,0.774,0.682,"actin filament organization"),
c("GO:0006766","vitamin metabolic process",0.209,1.6631,0.890,0.053,"vitamin metabolism"),
c("GO:0014719","skeletal muscle satellite cell activation",0.007,2.7352,0.927,0.060,"skeletal muscle satellite cell activation"),
c("GO:0090162","establishment of epithelial cell polarity",0.027,1.6087,0.925,0.066,"establishment of epithelial cell polarity"),
c("GO:0035020","regulation of Rac protein signal transduction",0.072,3.0269,0.821,0.072,"regulation of Rac protein signal transduction"),
c("GO:0032103","positive regulation of response to external stimulus",0.398,2.2725,0.877,0.153,"regulation of Rac protein signal transduction"),
c("GO:0042127","regulation of cell proliferation",3.148,2.0696,0.850,0.165,"regulation of Rac protein signal transduction"),
c("GO:0038001","paracrine signaling",0.008,1.6012,0.905,0.174,"regulation of Rac protein signal transduction"),
c("GO:0038183","bile acid signaling pathway",0.005,1.6012,0.878,0.178,"regulation of Rac protein signal transduction"),
c("GO:0007216","G-protein coupled glutamate receptor signaling pathway",0.027,2.7352,0.862,0.199,"regulation of Rac protein signal transduction"),
c("GO:0035791","platelet-derived growth factor receptor-beta signaling pathway",0.018,2.0570,0.864,0.262,"regulation of Rac protein signal transduction"),
c("GO:0023051","regulation of signaling",6.570,1.7399,0.885,0.291,"regulation of Rac protein signal transduction"),
c("GO:0048522","positive regulation of cellular process",8.548,2.0458,0.844,0.297,"regulation of Rac protein signal transduction"),
c("GO:0010646","regulation of cell communication",6.570,1.9062,0.799,0.340,"regulation of Rac protein signal transduction"),
c("GO:0051142","positive regulation of NK T cell proliferation",0.003,1.6012,0.867,0.447,"regulation of Rac protein signal transduction"),
c("GO:0050929","induction of negative chemotaxis",0.001,1.6012,0.877,0.511,"regulation of Rac protein signal transduction"),
c("GO:0040036","regulation of fibroblast growth factor receptor signaling pathway",0.070,1.8891,0.802,0.513,"regulation of Rac protein signal transduction"),
c("GO:0051450","myoblast proliferation",0.025,2.0570,0.968,0.523,"regulation of Rac protein signal transduction"),
c("GO:0043410","positive regulation of MAPK cascade",0.842,1.8874,0.704,0.528,"regulation of Rac protein signal transduction"),
c("GO:0002882","positive regulation of chronic inflammatory response to non-antigenic stimulus",0.002,1.6012,0.888,0.533,"regulation of Rac protein signal transduction"),
c("GO:0001921","positive regulation of receptor recycling",0.024,1.6983,0.814,0.549,"regulation of Rac protein signal transduction"),
c("GO:0051058","negative regulation of small GTPase mediated signal transduction",0.082,1.4544,0.806,0.565,"regulation of Rac protein signal transduction"),
c("GO:0016601","Rac protein signal transduction",0.100,2.3344,0.830,0.579,"regulation of Rac protein signal transduction"),
c("GO:0042330","taxis",1.276,1.5619,0.907,0.601,"regulation of Rac protein signal transduction"),
c("GO:0014812","muscle cell migration",0.136,1.4166,0.844,0.603,"regulation of Rac protein signal transduction"),
c("GO:0007265","Ras protein signal transduction",1.560,2.0482,0.791,0.640,"regulation of Rac protein signal transduction"),
c("GO:0007264","small GTPase mediated signal transduction",2.633,1.6782,0.789,0.647,"regulation of Rac protein signal transduction"),
c("GO:0002545","chronic inflammatory response to non-antigenic stimulus",0.002,1.6012,0.964,0.681,"regulation of Rac protein signal transduction"),
c("GO:0048518","positive regulation of biological process",28.712,2.5346,0.933,0.083,"positive regulation of biological process"),
c("GO:0065008","regulation of biological quality",7.337,2.3516,0.945,0.169,"positive regulation of biological process"),
c("GO:0048583","regulation of response to stimulus",26.518,1.4269,0.920,0.273,"positive regulation of biological process"),
c("GO:0030029","actin filament-based process",1.610,2.6517,0.896,0.096,"actin filament-based process"));

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
