

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
revigo.data <- rbind(c("GO:0015931","nucleobase-containing compound transport",0.319,3.8239,0.928,0.000,"nucleobase-containing compound transport"),
c("GO:0006403","RNA localization",0.263,3.0506,0.944,0.231,"nucleobase-containing compound transport"),
c("GO:0043271","negative regulation of ion transport",0.145,2.0645,0.883,0.247,"nucleobase-containing compound transport"),
c("GO:0051168","nuclear export",0.246,2.1555,0.937,0.258,"nucleobase-containing compound transport"),
c("GO:0071578","zinc ion transmembrane import",0.007,1.6231,0.897,0.292,"nucleobase-containing compound transport"),
c("GO:0071705","nitrogen compound transport",1.894,2.0177,0.940,0.312,"nucleobase-containing compound transport"),
c("GO:0030279","negative regulation of ossification",0.076,2.0487,0.847,0.327,"nucleobase-containing compound transport"),
c("GO:0045830","positive regulation of isotype switching",0.049,1.6887,0.666,0.370,"nucleobase-containing compound transport"),
c("GO:0050818","regulation of coagulation",0.206,1.3865,0.845,0.410,"nucleobase-containing compound transport"),
c("GO:0014911","positive regulation of smooth muscle cell migration",0.040,1.9014,0.835,0.418,"nucleobase-containing compound transport"),
c("GO:0002513","tolerance induction to self antigen",0.011,1.6231,0.879,0.469,"nucleobase-containing compound transport"),
c("GO:0060401","cytosolic calcium ion transport",0.258,1.4289,0.923,0.478,"nucleobase-containing compound transport"),
c("GO:0072384","organelle transport along microtubule",0.097,1.5574,0.865,0.498,"nucleobase-containing compound transport"),
c("GO:0015711","organic anion transport",0.945,1.4916,0.909,0.515,"nucleobase-containing compound transport"),
c("GO:0010764","negative regulation of fibroblast migration",0.021,1.6231,0.843,0.548,"nucleobase-containing compound transport"),
c("GO:0002521","leukocyte differentiation",1.015,1.6655,0.778,0.642,"nucleobase-containing compound transport"),
c("GO:0060216","definitive hemopoiesis",0.048,1.4724,0.863,0.659,"nucleobase-containing compound transport"),
c("GO:0050658","RNA transport",0.247,2.9747,0.913,0.662,"nucleobase-containing compound transport"),
c("GO:0043267","negative regulation of potassium ion transport",0.039,1.6231,0.889,0.683,"nucleobase-containing compound transport"),
c("GO:0022613","ribonucleoprotein complex biogenesis",0.598,6.4202,0.915,0.000,"ribonucleoprotein complex biogenesis"),
c("GO:1990164","histone H2A phosphorylation",0.003,1.6231,0.815,0.235,"ribonucleoprotein complex biogenesis"),
c("GO:0034332","adherens junction organization",0.198,2.5702,0.852,0.319,"ribonucleoprotein complex biogenesis"),
c("GO:0030307","positive regulation of cell growth",0.216,2.2716,0.813,0.322,"ribonucleoprotein complex biogenesis"),
c("GO:0034330","cell junction organization",0.493,2.1118,0.866,0.347,"ribonucleoprotein complex biogenesis"),
c("GO:0000492","box C/D snoRNP assembly",0.003,1.6231,0.926,0.373,"ribonucleoprotein complex biogenesis"),
c("GO:0044085","cellular component biogenesis",4.871,2.7190,0.919,0.445,"ribonucleoprotein complex biogenesis"),
c("GO:0085029","extracellular matrix assembly",0.041,1.8579,0.874,0.445,"ribonucleoprotein complex biogenesis"),
c("GO:0031065","positive regulation of histone deacetylation",0.050,1.5148,0.736,0.484,"ribonucleoprotein complex biogenesis"),
c("GO:0051291","protein heterooligomerization",0.251,2.9101,0.913,0.518,"ribonucleoprotein complex biogenesis"),
c("GO:0000491","small nucleolar ribonucleoprotein complex assembly",0.003,1.6231,0.926,0.558,"ribonucleoprotein complex biogenesis"),
c("GO:0034214","protein hexamerization",0.009,1.3493,0.928,0.607,"ribonucleoprotein complex biogenesis"),
c("GO:0097490","sympathetic neuron projection extension",0.017,1.3493,0.782,0.633,"ribonucleoprotein complex biogenesis"),
c("GO:0033182","regulation of histone ubiquitination",0.005,1.3493,0.782,0.686,"ribonucleoprotein complex biogenesis"),
c("GO:0032364","oxygen homeostasis",0.010,2.1713,0.902,0.000,"oxygen homeostasis"),
c("GO:0043488","regulation of mRNA stability",0.087,2.1494,0.797,0.298,"oxygen homeostasis"),
c("GO:0055065","metal ion homeostasis",1.153,2.1113,0.856,0.558,"oxygen homeostasis"),
c("GO:0033483","gas homeostasis",0.015,1.6887,0.900,0.573,"oxygen homeostasis"),
c("GO:0043487","regulation of RNA stability",0.093,1.9838,0.798,0.676,"oxygen homeostasis"),
c("GO:0045727","positive regulation of translation",0.121,1.3988,0.765,0.692,"oxygen homeostasis"),
c("GO:0034660","ncRNA metabolic process",0.917,11.0000,0.804,0.000,"ncRNA metabolism"),
c("GO:0002541","activation of plasma proteins involved in acute inflammatory response",0.003,2.0726,0.884,0.113,"ncRNA metabolism"),
c("GO:0018153","isopeptide cross-linking via N6-(L-isoglutamyl)-L-lysine",0.008,2.0726,0.874,0.149,"ncRNA metabolism"),
c("GO:0046483","heterocycle metabolic process",24.799,2.4295,0.855,0.164,"ncRNA metabolism"),
c("GO:0006760","folic acid-containing compound metabolic process",0.128,3.1549,0.791,0.185,"ncRNA metabolism"),
c("GO:0006807","nitrogen compound metabolic process",26.566,1.8245,0.926,0.201,"ncRNA metabolism"),
c("GO:0006458","'de novo' protein folding",0.103,1.7089,0.861,0.218,"ncRNA metabolism"),
c("GO:0006474","N-terminal protein amino acid acetylation",0.013,1.5148,0.878,0.227,"ncRNA metabolism"),
c("GO:0043633","polyadenylation-dependent RNA catabolic process",0.003,3.1079,0.834,0.239,"ncRNA metabolism"),
c("GO:0046098","guanine metabolic process",0.011,2.0726,0.844,0.239,"ncRNA metabolism"),
c("GO:0071704","organic substance metabolic process",42.826,1.4007,0.921,0.251,"ncRNA metabolism"),
c("GO:0006730","one-carbon metabolic process",0.111,1.4175,0.866,0.257,"ncRNA metabolism"),
c("GO:0010467","gene expression",15.379,2.8125,0.857,0.258,"ncRNA metabolism"),
c("GO:0034205","beta-amyloid formation",0.041,1.6231,0.849,0.260,"ncRNA metabolism"),
c("GO:0006595","polyamine metabolic process",0.049,2.5171,0.847,0.263,"ncRNA metabolism"),
c("GO:0000959","mitochondrial RNA metabolic process",0.027,1.6936,0.848,0.277,"ncRNA metabolism"),
c("GO:0008334","histone mRNA metabolic process",0.034,2.1255,0.829,0.282,"ncRNA metabolism"),
c("GO:0042558","pteridine-containing compound metabolic process",0.154,3.0177,0.852,0.286,"ncRNA metabolism"),
c("GO:0006369","termination of RNA polymerase II transcription",0.054,1.4267,0.830,0.293,"ncRNA metabolism"),
c("GO:1901360","organic cyclic compound metabolic process",25.430,1.9735,0.888,0.299,"ncRNA metabolism"),
c("GO:0001522","pseudouridine synthesis",0.080,2.8416,0.819,0.303,"ncRNA metabolism"),
c("GO:0044238","primary metabolic process",41.881,1.3156,0.921,0.318,"ncRNA metabolism"),
c("GO:0044237","cellular metabolic process",42.121,1.3974,0.887,0.319,"ncRNA metabolism"),
c("GO:0090501","RNA phosphodiester bond hydrolysis",0.193,1.4353,0.824,0.327,"ncRNA metabolism"),
c("GO:0009451","RNA modification",0.295,2.8928,0.809,0.340,"ncRNA metabolism"),
c("GO:0006725","cellular aromatic compound metabolic process",24.907,2.3809,0.855,0.359,"ncRNA metabolism"),
c("GO:0034470","ncRNA processing",0.554,9.5528,0.740,0.362,"ncRNA metabolism"),
c("GO:0043170","macromolecule metabolic process",29.866,1.4799,0.886,0.376,"ncRNA metabolism"),
c("GO:0006396","RNA processing",1.631,8.6778,0.789,0.406,"ncRNA metabolism"),
c("GO:0016071","mRNA metabolic process",1.098,1.6815,0.801,0.415,"ncRNA metabolism"),
c("GO:0002248","connective tissue replacement involved in inflammatory response wound healing",0.006,1.6231,0.892,0.422,"ncRNA metabolism"),
c("GO:0018208","peptidyl-proline modification",0.207,1.7224,0.849,0.463,"ncRNA metabolism"),
c("GO:0018199","peptidyl-glutamine modification",0.010,1.3493,0.875,0.471,"ncRNA metabolism"),
c("GO:0016070","RNA metabolic process",12.843,3.0655,0.757,0.516,"ncRNA metabolism"),
c("GO:0044260","cellular macromolecule metabolic process",25.627,1.9763,0.811,0.524,"ncRNA metabolism"),
c("GO:0031639","plasminogen activation",0.028,1.3689,0.889,0.528,"ncRNA metabolism"),
c("GO:0050729","positive regulation of inflammatory response",0.195,1.3988,0.918,0.528,"ncRNA metabolism"),
c("GO:0000963","mitochondrial RNA processing",0.007,2.1713,0.772,0.548,"ncRNA metabolism"),
c("GO:0000966","RNA 5'-end processing",0.007,1.3493,0.827,0.548,"ncRNA metabolism"),
c("GO:0000413","protein peptidyl-prolyl isomerization",0.163,1.3695,0.852,0.574,"ncRNA metabolism"),
c("GO:0071034","CUT catabolic process",0.003,3.1079,0.808,0.601,"ncRNA metabolism"),
c("GO:0071043","CUT metabolic process",0.003,3.1079,0.836,0.601,"ncRNA metabolism"),
c("GO:0006139","nucleobase-containing compound metabolic process",24.258,2.3036,0.789,0.605,"ncRNA metabolism"),
c("GO:0006370","7-methylguanosine mRNA capping",0.043,1.5025,0.793,0.626,"ncRNA metabolism"),
c("GO:0036260","RNA capping",0.052,1.3386,0.804,0.635,"ncRNA metabolism"),
c("GO:0090304","nucleic acid metabolic process",15.268,1.6761,0.787,0.636,"ncRNA metabolism"),
c("GO:0000729","DNA double-strand break processing",0.010,1.3493,0.795,0.649,"ncRNA metabolism"),
c("GO:0051085","chaperone mediated protein folding requiring cofactor",0.052,1.3689,0.867,0.678,"ncRNA metabolism"),
c("GO:0009086","methionine biosynthetic process",0.044,2.4342,0.797,0.681,"ncRNA metabolism"),
c("GO:0034661","ncRNA catabolic process",0.026,4.2441,0.794,0.692,"ncRNA metabolism"),
c("GO:0034641","cellular nitrogen compound metabolic process",25.263,2.2125,0.800,0.697,"ncRNA metabolism"),
c("GO:0046469","platelet activating factor metabolic process",0.006,1.3493,0.821,0.699,"ncRNA metabolism"),
c("GO:0072089","stem cell proliferation",0.477,2.4271,0.951,0.000,"stem cell proliferation"),
c("GO:0070445","regulation of oligodendrocyte progenitor proliferation",0.010,2.0726,0.778,0.423,"stem cell proliferation"),
c("GO:0035988","chondrocyte proliferation",0.017,1.3493,0.959,0.438,"stem cell proliferation"),
c("GO:0061351","neural precursor cell proliferation",0.400,1.6962,0.952,0.565,"stem cell proliferation"),
c("GO:0070444","oligodendrocyte progenitor proliferation",0.010,2.0726,0.815,0.599,"stem cell proliferation"),
c("GO:0050767","regulation of neurogenesis",1.387,1.6035,0.716,0.610,"stem cell proliferation"),
c("GO:0061072","iris morphogenesis",0.011,2.1713,0.865,0.013,"iris morphogenesis"),
c("GO:0050881","musculoskeletal movement",0.145,2.1255,0.892,0.206,"iris morphogenesis"),
c("GO:0050884","neuromuscular process controlling posture",0.021,1.3689,0.902,0.214,"iris morphogenesis"),
c("GO:0050879","multicellular organismal movement",0.145,2.1255,0.892,0.246,"iris morphogenesis"),
c("GO:0021895","cerebral cortex neuron differentiation",0.049,2.0218,0.807,0.289,"iris morphogenesis"),
c("GO:0014032","neural crest cell development",0.144,1.6957,0.787,0.341,"iris morphogenesis"),
c("GO:0061549","sympathetic ganglion development",0.021,1.3493,0.857,0.404,"iris morphogenesis"),
c("GO:0061548","ganglion development",0.023,1.3493,0.856,0.407,"iris morphogenesis"),
c("GO:0060762","regulation of branching involved in mammary gland duct morphogenesis",0.016,2.1713,0.812,0.416,"iris morphogenesis"),
c("GO:0097491","sympathetic neuron projection guidance",0.017,1.3493,0.744,0.425,"iris morphogenesis"),
c("GO:0072148","epithelial cell fate commitment",0.039,1.3689,0.829,0.426,"iris morphogenesis"),
c("GO:0032331","negative regulation of chondrocyte differentiation",0.049,1.5865,0.769,0.429,"iris morphogenesis"),
c("GO:0050974","detection of mechanical stimulus involved in sensory perception",0.071,1.3689,0.880,0.441,"iris morphogenesis"),
c("GO:0048732","gland development",1.335,1.3062,0.836,0.444,"iris morphogenesis"),
c("GO:0007492","endoderm development",0.161,1.4267,0.880,0.468,"iris morphogenesis"),
c("GO:0060996","dendritic spine development",0.116,1.3446,0.765,0.500,"iris morphogenesis"),
c("GO:0022009","central nervous system vasculogenesis",0.013,1.3493,0.810,0.508,"iris morphogenesis"),
c("GO:0060605","tube lumen cavitation",0.014,1.3493,0.877,0.529,"iris morphogenesis"),
c("GO:1902285","semaphorin-plexin signaling pathway involved in neuron projection guidance",0.019,1.3493,0.720,0.579,"iris morphogenesis"),
c("GO:0070306","lens fiber cell differentiation",0.070,1.8016,0.799,0.591,"iris morphogenesis"),
c("GO:0003273","cell migration involved in endocardial cushion formation",0.008,1.6231,0.789,0.640,"iris morphogenesis"),
c("GO:0060688","regulation of morphogenesis of a branching structure",0.153,1.6234,0.818,0.659,"iris morphogenesis"),
c("GO:0007595","lactation",0.145,1.9374,0.749,0.678,"iris morphogenesis"),
c("GO:0007589","body fluid secretion",0.269,1.3393,0.778,0.692,"iris morphogenesis"),
c("GO:0016265","death",4.501,1.5050,0.973,0.022,"death"),
c("GO:0000320","re-entry into mitotic cell cycle",0.007,3.1079,0.936,0.029,"re-entry into mitotic cell cycle"),
c("GO:0017145","stem cell division",0.089,2.3316,0.909,0.052,"stem cell division"),
c("GO:0046349","amino sugar biosynthetic process",0.008,2.7011,0.923,0.069,"amino sugar biosynthesis"),
c("GO:0043552","positive regulation of phosphatidylinositol 3-kinase activity",0.051,3.2366,0.794,0.082,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:2000114","regulation of establishment of cell polarity",0.046,1.5148,0.886,0.115,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0007169","transmembrane receptor protein tyrosine kinase signaling pathway",1.599,2.3002,0.839,0.150,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0030155","regulation of cell adhesion",0.746,2.1979,0.868,0.195,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0042981","regulation of apoptotic process",3.144,1.9948,0.829,0.232,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0016311","dephosphorylation",1.340,1.5940,0.881,0.244,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0071300","cellular response to retinoic acid",0.122,2.2388,0.894,0.247,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0030521","androgen receptor signaling pathway",0.112,2.2373,0.874,0.281,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0010226","response to lithium ion",0.075,1.9194,0.951,0.321,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0071243","cellular response to arsenic-containing substance",0.016,1.6887,0.916,0.356,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0007216","G-protein coupled glutamate receptor signaling pathway",0.027,1.6231,0.882,0.357,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0051341","regulation of oxidoreductase activity",0.137,1.4353,0.884,0.394,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0031584","activation of phospholipase D activity",0.019,1.6231,0.890,0.407,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0010923","negative regulation of phosphatase activity",0.088,1.5933,0.827,0.433,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0051353","positive regulation of oxidoreductase activity",0.071,2.3316,0.875,0.443,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0051099","positive regulation of binding",0.197,1.9488,0.917,0.465,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0030148","sphingolipid biosynthetic process",0.134,1.7317,0.793,0.472,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0006776","vitamin A metabolic process",0.011,1.6231,0.856,0.477,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0006931","substrate-dependent cell migration, cell attachment to substrate",0.007,1.6231,0.868,0.479,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0006188","IMP biosynthetic process",0.058,1.3689,0.807,0.487,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0090080","positive regulation of MAPKKK cascade by fibroblast growth factor receptor signaling pathway",0.013,2.0726,0.791,0.558,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0022408","negative regulation of cell-cell adhesion",0.062,2.2240,0.864,0.564,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:1900746","regulation of vascular endothelial growth factor signaling pathway",0.019,1.6231,0.856,0.577,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0051345","positive regulation of hydrolase activity",2.284,1.3093,0.849,0.626,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0043405","regulation of MAP kinase activity",0.610,1.4903,0.708,0.634,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0071375","cellular response to peptide hormone stimulus",0.615,1.4939,0.876,0.660,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0035335","peptidyl-tyrosine dephosphorylation",0.501,1.4861,0.829,0.690,"positive regulation of phosphatidylinositol 3-kinase activity"),
c("GO:0001954","positive regulation of cell-matrix adhesion",0.139,2.0273,0.857,0.696,"positive regulation of phosphatidylinositol 3-kinase activity"));

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
