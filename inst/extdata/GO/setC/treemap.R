

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
revigo.data <- rbind(c("GO:0002376","immune system process",29.354,2.0851,0.996,0.000,"immune system process"),
c("GO:0006954","inflammatory response",1.375,3.3768,0.916,0.000,"inflammatory response"),
c("GO:0006952","defense response",3.096,2.7399,0.915,0.592,"inflammatory response"),
c("GO:0080134","regulation of response to stress",1.961,1.9965,0.863,0.620,"inflammatory response"),
c("GO:0009611","response to wounding",2.056,1.7632,0.918,0.624,"inflammatory response"),
c("GO:0007155","cell adhesion",2.821,3.5086,0.965,0.000,"cell adhesion"),
c("GO:0007157","heterophilic cell-cell adhesion via plasma membrane cell adhesion molecules",0.084,1.7817,0.972,0.651,"cell adhesion"),
c("GO:0007159","leukocyte cell-cell adhesion",0.106,2.9031,0.952,0.665,"cell adhesion"),
c("GO:0022610","biological adhesion",2.826,3.4949,0.994,0.000,"biological adhesion"),
c("GO:0023052","signaling",17.329,3.0915,0.995,0.000,"signaling"),
c("GO:0032501","multicellular organismal process",15.657,4.2518,0.995,0.000,"multicellular organismal process"),
c("GO:0032502","developmental process",13.055,5.4949,0.995,0.000,"developmental process"),
c("GO:0040011","locomotion",3.285,2.0106,0.995,0.000,"locomotion"),
c("GO:0042127","regulation of cell proliferation",3.148,4.6990,0.799,0.000,"regulation of cell proliferation"),
c("GO:0050847","progesterone receptor signaling pathway",0.008,2.6198,0.846,0.136,"regulation of cell proliferation"),
c("GO:0048518","positive regulation of biological process",28.712,6.3279,0.906,0.149,"regulation of cell proliferation"),
c("GO:0065008","regulation of biological quality",7.337,2.3143,0.927,0.169,"regulation of cell proliferation"),
c("GO:0048519","negative regulation of biological process",8.588,2.0052,0.921,0.190,"regulation of cell proliferation"),
c("GO:1902531","regulation of intracellular signal transduction",3.702,3.5229,0.707,0.261,"regulation of cell proliferation"),
c("GO:0007216","G-protein coupled glutamate receptor signaling pathway",0.027,1.9263,0.833,0.267,"regulation of cell proliferation"),
c("GO:0048583","regulation of response to stimulus",26.518,3.2840,0.879,0.273,"regulation of cell proliferation"),
c("GO:0071216","cellular response to biotic stimulus",0.370,3.3565,0.868,0.301,"regulation of cell proliferation"),
c("GO:0038034","signal transduction in absence of ligand",0.226,2.5800,0.809,0.327,"regulation of cell proliferation"),
c("GO:0050789","regulation of biological process",49.744,1.6515,0.904,0.335,"regulation of cell proliferation"),
c("GO:0030522","intracellular receptor signaling pathway",0.684,2.3429,0.789,0.371,"regulation of cell proliferation"),
c("GO:0016055","Wnt signaling pathway",0.887,2.1024,0.778,0.383,"regulation of cell proliferation"),
c("GO:0023014","signal transduction by phosphorylation",1.554,1.9492,0.737,0.412,"regulation of cell proliferation"),
c("GO:0010646","regulation of cell communication",6.570,4.4559,0.765,0.477,"regulation of cell proliferation"),
c("GO:0023051","regulation of signaling",6.570,4.2924,0.846,0.481,"regulation of cell proliferation"),
c("GO:0070561","vitamin D receptor signaling pathway",0.016,2.6198,0.763,0.545,"regulation of cell proliferation"),
c("GO:2001237","negative regulation of extrinsic apoptotic signaling pathway",0.243,3.1135,0.724,0.572,"regulation of cell proliferation"),
c("GO:0070424","regulation of nucleotide-binding oligomerization domain containing signaling pathway",0.019,1.9263,0.779,0.573,"regulation of cell proliferation"),
c("GO:0007249","I-kappaB kinase/NF-kappaB signaling",0.425,2.0146,0.788,0.576,"regulation of cell proliferation"),
c("GO:0032107","regulation of response to nutrient levels",0.109,2.4672,0.846,0.580,"regulation of cell proliferation"),
c("GO:0002676","regulation of chronic inflammatory response",0.035,1.9263,0.849,0.585,"regulation of cell proliferation"),
c("GO:0034139","regulation of toll-like receptor 3 signaling pathway",0.006,1.9263,0.804,0.599,"regulation of cell proliferation"),
c("GO:0007165","signal transduction",16.054,3.4089,0.702,0.637,"regulation of cell proliferation"),
c("GO:0035556","intracellular signal transduction",6.704,2.0250,0.731,0.640,"regulation of cell proliferation"),
c("GO:0008219","cell death",4.485,2.4248,0.841,0.649,"regulation of cell proliferation"),
c("GO:0032104","regulation of response to extracellular stimulus",0.109,2.4672,0.854,0.652,"regulation of cell proliferation"),
c("GO:0050679","positive regulation of epithelial cell proliferation",0.313,2.5436,0.789,0.666,"regulation of cell proliferation"),
c("GO:0007166","cell surface receptor signaling pathway",8.919,3.4559,0.721,0.683,"regulation of cell proliferation"),
c("GO:0060054","positive regulation of epithelial cell proliferation involved in wound healing",0.011,1.9263,0.801,0.689,"regulation of cell proliferation"),
c("GO:0050896","response to stimulus",47.248,3.1135,0.997,0.000,"response to stimulus"),
c("GO:0065007","biological regulation",51.216,2.4584,0.997,0.000,"biological regulation"),
c("GO:0006622","protein targeting to lysosome",0.015,2.1186,0.947,0.015,"protein targeting to lysosome"),
c("GO:0014047","glutamate secretion",0.067,1.7817,0.908,0.342,"protein targeting to lysosome"),
c("GO:0019915","lipid storage",0.141,1.9543,0.924,0.353,"protein targeting to lysosome"),
c("GO:0048871","multicellular organismal homeostasis",0.562,1.8102,0.808,0.412,"protein targeting to lysosome"),
c("GO:0072665","protein localization to vacuole",0.019,1.7807,0.968,0.496,"protein targeting to lysosome"),
c("GO:0045039","protein import into mitochondrial inner membrane",0.006,1.9263,0.873,0.496,"protein targeting to lysosome"),
c("GO:0010573","vascular endothelial growth factor production",0.071,4.5229,0.860,0.018,"vascular endothelial growth factor production"),
c("GO:0072358","cardiovascular system development",2.258,4.2441,0.708,0.291,"vascular endothelial growth factor production"),
c("GO:0034103","regulation of tissue remodeling",0.163,3.0362,0.820,0.315,"vascular endothelial growth factor production"),
c("GO:0061031","endodermal digestive tract morphogenesis",0.011,1.9263,0.797,0.325,"vascular endothelial growth factor production"),
c("GO:0048771","tissue remodeling",0.384,1.9880,0.853,0.343,"vascular endothelial growth factor production"),
c("GO:0007569","cell aging",0.203,2.3429,0.775,0.356,"vascular endothelial growth factor production"),
c("GO:0010623","developmental programmed cell death",0.111,2.1152,0.727,0.361,"vascular endothelial growth factor production"),
c("GO:0010092","specification of organ identity",0.103,2.9136,0.746,0.392,"vascular endothelial growth factor production"),
c("GO:2000209","regulation of anoikis",0.025,1.7817,0.845,0.406,"vascular endothelial growth factor production"),
c("GO:0001889","liver development",0.340,2.7077,0.742,0.441,"vascular endothelial growth factor production"),
c("GO:0061008","hepaticobiliary system development",0.344,2.6556,0.768,0.442,"vascular endothelial growth factor production"),
c("GO:1902742","apoptotic process involved in development",0.092,1.9439,0.745,0.444,"vascular endothelial growth factor production"),
c("GO:0070166","enamel mineralization",0.018,2.6198,0.771,0.478,"vascular endothelial growth factor production"),
c("GO:0035295","tube development",1.620,2.2190,0.742,0.491,"vascular endothelial growth factor production"),
c("GO:0060363","cranial suture morphogenesis",0.032,1.7807,0.772,0.496,"vascular endothelial growth factor production"),
c("GO:0051240","positive regulation of multicellular organismal process",1.418,1.8389,0.758,0.513,"vascular endothelial growth factor production"),
c("GO:0000902","cell morphogenesis",2.742,4.1135,0.626,0.517,"vascular endothelial growth factor production"),
c("GO:0045165","cell fate commitment",0.620,2.8356,0.737,0.518,"vascular endothelial growth factor production"),
c("GO:0050793","regulation of developmental process",4.431,2.5100,0.705,0.527,"vascular endothelial growth factor production"),
c("GO:0060429","epithelium development",2.640,2.1198,0.745,0.528,"vascular endothelial growth factor production"),
c("GO:0032604","granulocyte macrophage colony-stimulating factor production",0.013,2.9957,0.876,0.532,"vascular endothelial growth factor production"),
c("GO:0007420","brain development",1.782,3.7959,0.691,0.535,"vascular endothelial growth factor production"),
c("GO:0043588","skin development",0.701,1.9179,0.741,0.537,"vascular endothelial growth factor production"),
c("GO:0021545","cranial nerve development",0.150,2.0329,0.766,0.544,"vascular endothelial growth factor production"),
c("GO:0072359","circulatory system development",2.260,4.2441,0.723,0.552,"vascular endothelial growth factor production"),
c("GO:0048645","organ formation",0.168,2.1475,0.742,0.558,"vascular endothelial growth factor production"),
c("GO:0009888","tissue development",4.199,3.7447,0.750,0.565,"vascular endothelial growth factor production"),
c("GO:0030323","respiratory tube development",0.585,1.8841,0.741,0.570,"vascular endothelial growth factor production"),
c("GO:0010575","positive regulation vascular endothelial growth factor production",0.047,4.0969,0.807,0.579,"vascular endothelial growth factor production"),
c("GO:0032725","positive regulation of granulocyte macrophage colony-stimulating factor production",0.007,3.5850,0.829,0.593,"vascular endothelial growth factor production"),
c("GO:0007399","nervous system development",4.932,2.6757,0.698,0.618,"vascular endothelial growth factor production"),
c("GO:0042476","odontogenesis",0.418,1.8508,0.723,0.624,"vascular endothelial growth factor production"),
c("GO:0003148","outflow tract septum morphogenesis",0.035,1.6467,0.761,0.631,"vascular endothelial growth factor production"),
c("GO:0044707","single-multicellular organism process",15.092,4.5086,0.790,0.638,"vascular endothelial growth factor production"),
c("GO:0009653","anatomical structure morphogenesis",5.999,6.1367,0.739,0.656,"vascular endothelial growth factor production"),
c("GO:0021846","cell proliferation in forebrain",0.079,2.3391,0.732,0.665,"vascular endothelial growth factor production"),
c("GO:0048869","cellular developmental process",8.570,5.7447,0.673,0.672,"vascular endothelial growth factor production"),
c("GO:0048468","cell development",4.830,3.3565,0.667,0.678,"vascular endothelial growth factor production"),
c("GO:0097186","amelogenesis",0.033,2.3410,0.769,0.681,"vascular endothelial growth factor production"),
c("GO:0008544","epidermis development",0.590,1.8887,0.727,0.693,"vascular endothelial growth factor production"),
c("GO:0022603","regulation of anatomical structure morphogenesis",1.794,1.8931,0.689,0.694,"vascular endothelial growth factor production"),
c("GO:0008283","cell proliferation",4.075,4.6576,0.967,0.028,"cell proliferation"),
c("GO:0016265","death",4.501,2.4248,0.967,0.030,"death"),
c("GO:0006790","sulfur compound metabolic process",0.742,3.6383,0.923,0.050,"sulfur compound metabolism"),
c("GO:0030203","glycosaminoglycan metabolic process",0.296,3.6383,0.916,0.051,"glycosaminoglycan metabolism"),
c("GO:0035608","protein deglutamylation",0.011,2.3851,0.918,0.114,"glycosaminoglycan metabolism"),
c("GO:0031123","RNA 3'-end processing",0.197,2.0264,0.897,0.162,"glycosaminoglycan metabolism"),
c("GO:0010604","positive regulation of macromolecule metabolic process",4.917,3.2518,0.780,0.192,"glycosaminoglycan metabolism"),
c("GO:0045787","positive regulation of cell cycle",0.253,2.3665,0.812,0.198,"glycosaminoglycan metabolism"),
c("GO:0040017","positive regulation of locomotion",0.632,2.4401,0.875,0.220,"glycosaminoglycan metabolism"),
c("GO:1901564","organonitrogen compound metabolic process",11.844,2.5086,0.921,0.245,"glycosaminoglycan metabolism"),
c("GO:0032792","negative regulation of CREB transcription factor activity",0.003,2.3851,0.849,0.246,"glycosaminoglycan metabolism"),
c("GO:0006244","pyrimidine nucleotide catabolic process",0.010,1.9359,0.868,0.251,"glycosaminoglycan metabolism"),
c("GO:0006566","threonine metabolic process",0.010,2.3851,0.886,0.251,"glycosaminoglycan metabolism"),
c("GO:0010980","positive regulation of vitamin D 24-hydroxylase activity",0.003,2.3851,0.909,0.253,"glycosaminoglycan metabolism"),
c("GO:0070935","3'-UTR-mediated mRNA stabilization",0.014,1.6467,0.892,0.274,"glycosaminoglycan metabolism"),
c("GO:2000378","negative regulation of reactive oxygen species metabolic process",0.072,3.0177,0.827,0.277,"glycosaminoglycan metabolism"),
c("GO:0045428","regulation of nitric oxide biosynthetic process",0.095,2.1959,0.821,0.285,"glycosaminoglycan metabolism"),
c("GO:0042439","ethanolamine-containing compound metabolic process",0.129,1.8173,0.862,0.301,"glycosaminoglycan metabolism"),
c("GO:0048522","positive regulation of cellular process",8.548,5.5086,0.811,0.325,"glycosaminoglycan metabolism"),
c("GO:0018193","peptidyl-amino acid modification",2.453,1.7951,0.878,0.328,"glycosaminoglycan metabolism"),
c("GO:0006029","proteoglycan metabolic process",0.173,2.3429,0.901,0.330,"glycosaminoglycan metabolism"),
c("GO:0006022","aminoglycan metabolic process",0.332,3.8239,0.925,0.349,"glycosaminoglycan metabolism"),
c("GO:0019538","protein metabolic process",17.009,2.8069,0.920,0.354,"glycosaminoglycan metabolism"),
c("GO:0006366","transcription from RNA polymerase II promoter",3.963,1.8834,0.848,0.378,"glycosaminoglycan metabolism"),
c("GO:0090209","negative regulation of triglyceride metabolic process",0.009,2.3851,0.810,0.385,"glycosaminoglycan metabolism"),
c("GO:2000279","negative regulation of DNA biosynthetic process",0.010,1.9263,0.827,0.387,"glycosaminoglycan metabolism"),
c("GO:0051272","positive regulation of cellular component movement",0.616,1.6572,0.763,0.406,"glycosaminoglycan metabolism"),
c("GO:1901566","organonitrogen compound biosynthetic process",2.941,3.2596,0.905,0.407,"glycosaminoglycan metabolism"),
c("GO:0006518","peptide metabolic process",0.350,2.0004,0.897,0.410,"glycosaminoglycan metabolism"),
c("GO:0048585","negative regulation of response to stimulus",2.501,2.3063,0.862,0.411,"glycosaminoglycan metabolism"),
c("GO:0043412","macromolecule modification",10.189,1.7815,0.925,0.418,"glycosaminoglycan metabolism"),
c("GO:0009894","regulation of catabolic process",2.662,2.0227,0.849,0.428,"glycosaminoglycan metabolism"),
c("GO:0033129","positive regulation of histone phosphorylation",0.007,1.9263,0.751,0.438,"glycosaminoglycan metabolism"),
c("GO:0048584","positive regulation of response to stimulus",22.389,2.5935,0.819,0.450,"glycosaminoglycan metabolism"),
c("GO:0046777","protein autophosphorylation",0.414,1.6566,0.873,0.455,"glycosaminoglycan metabolism"),
c("GO:0051174","regulation of phosphorus metabolic process",4.788,1.9318,0.769,0.470,"glycosaminoglycan metabolism"),
c("GO:0009893","positive regulation of metabolic process",5.415,3.1079,0.830,0.480,"glycosaminoglycan metabolism"),
c("GO:0035313","wound healing, spreading of epidermal cells",0.018,2.3410,0.708,0.483,"glycosaminoglycan metabolism"),
c("GO:0018212","peptidyl-tyrosine modification",1.147,1.9176,0.883,0.534,"glycosaminoglycan metabolism"),
c("GO:0016310","phosphorylation",10.160,2.0747,0.869,0.541,"glycosaminoglycan metabolism"),
c("GO:0008652","cellular amino acid biosynthetic process",0.373,1.8891,0.830,0.553,"glycosaminoglycan metabolism"),
c("GO:0036092","phosphatidylinositol-3-phosphate biosynthetic process",0.038,1.7807,0.849,0.556,"glycosaminoglycan metabolism"),
c("GO:0070374","positive regulation of ERK1 and ERK2 cascade",0.247,2.3969,0.677,0.612,"glycosaminoglycan metabolism"),
c("GO:0006357","regulation of transcription from RNA polymerase II promoter",3.684,1.6975,0.746,0.613,"glycosaminoglycan metabolism"),
c("GO:0006468","protein phosphorylation",5.136,2.3307,0.838,0.627,"glycosaminoglycan metabolism"),
c("GO:0050776","regulation of immune response",20.571,1.6708,0.853,0.634,"glycosaminoglycan metabolism"),
c("GO:0014068","positive regulation of phosphatidylinositol 3-kinase signaling",0.092,1.9650,0.755,0.638,"glycosaminoglycan metabolism"),
c("GO:0010979","regulation of vitamin D 24-hydroxylase activity",0.003,2.3851,0.909,0.640,"glycosaminoglycan metabolism"),
c("GO:0009896","positive regulation of catabolic process",0.386,1.8380,0.833,0.644,"glycosaminoglycan metabolism"),
c("GO:0046890","regulation of lipid biosynthetic process",0.247,2.2306,0.824,0.674,"glycosaminoglycan metabolism"),
c("GO:0030166","proteoglycan biosynthetic process",0.088,2.0804,0.888,0.693,"glycosaminoglycan metabolism"),
c("GO:0009064","glutamine family amino acid metabolic process",0.229,1.6776,0.858,0.700,"glycosaminoglycan metabolism"),
c("GO:0060558","regulation of calcidiol 1-monooxygenase activity",0.016,2.3410,0.793,0.700,"glycosaminoglycan metabolism"),
c("GO:0030030","cell projection organization",2.744,4.0655,0.840,0.059,"cell projection organization"),
c("GO:0030029","actin filament-based process",1.610,1.8690,0.903,0.112,"cell projection organization"),
c("GO:0006928","cellular component movement",3.830,1.8595,0.894,0.126,"cell projection organization"),
c("GO:0007154","cell communication",17.535,3.2218,0.872,0.173,"cell projection organization"),
c("GO:0002934","desmosome organization",0.021,1.9359,0.891,0.303,"cell projection organization"),
c("GO:0043954","cellular component maintenance",0.032,1.9970,0.890,0.314,"cell projection organization"),
c("GO:0051017","actin filament bundle assembly",0.235,2.8729,0.844,0.379,"cell projection organization"),
c("GO:0051290","protein heterotetramerization",0.027,1.7807,0.931,0.455,"cell projection organization"),
c("GO:0044087","regulation of cellular component biogenesis",1.045,2.7055,0.862,0.542,"cell projection organization"),
c("GO:0044085","cellular component biogenesis",4.871,1.6739,0.914,0.547,"cell projection organization"),
c("GO:0030031","cell projection assembly",0.692,2.4962,0.835,0.603,"cell projection organization"),
c("GO:0034331","cell junction maintenance",0.017,1.9359,0.892,0.616,"cell projection organization"),
c("GO:0070925","organelle assembly",0.934,1.9179,0.874,0.623,"cell projection organization"),
c("GO:0044782","cilium organization",0.384,2.4101,0.842,0.664,"cell projection organization"),
c("GO:0048627","myoblast development",0.002,2.3851,0.813,0.061,"myoblast development"),
c("GO:0060352","cell adhesion molecule production",0.005,1.9263,0.938,0.064,"cell adhesion molecule production"),
c("GO:0014719","skeletal muscle satellite cell activation",0.007,1.9263,0.934,0.066,"skeletal muscle satellite cell activation"),
c("GO:0032101","regulation of response to external stimulus",1.256,2.4001,0.841,0.091,"regulation of response to external stimulus"),
c("GO:0071496","cellular response to external stimulus",0.549,2.1057,0.899,0.620,"regulation of response to external stimulus"),
c("GO:0044272","sulfur compound biosynthetic process",0.311,2.5436,0.904,0.094,"sulfur compound biosynthesis"),
c("GO:0033993","response to lipid",2.113,3.0177,0.901,0.097,"response to lipid"),
c("GO:0009605","response to external stimulus",4.459,2.8327,0.948,0.114,"response to lipid"),
c("GO:0042221","response to chemical",8.684,2.6364,0.944,0.142,"response to lipid"),
c("GO:0051716","cellular response to stimulus",19.092,2.5482,0.891,0.193,"response to lipid"),
c("GO:0035865","cellular response to potassium ion",0.007,2.3851,0.887,0.332,"response to lipid"),
c("GO:0038145","macrophage colony-stimulating factor signaling pathway",0.008,1.9263,0.821,0.395,"response to lipid"),
c("GO:0080184","response to phenylpropanoid",0.042,2.6198,0.924,0.451,"response to lipid"),
c("GO:0035634","response to stilbenoid",0.024,1.9263,0.926,0.457,"response to lipid"),
c("GO:0035864","response to potassium ion",0.013,1.9263,0.936,0.541,"response to lipid"),
c("GO:0071396","cellular response to lipid",1.069,2.9626,0.825,0.625,"response to lipid"),
c("GO:0071391","cellular response to estrogen stimulus",0.064,2.2581,0.858,0.635,"response to lipid"),
c("GO:0070887","cellular response to chemical stimulus",5.433,1.8844,0.812,0.659,"response to lipid"));

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
