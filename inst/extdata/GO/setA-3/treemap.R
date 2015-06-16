

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
revigo.data <- rbind(c("GO:0002468","dendritic cell antigen processing and presentation",0.035,1.6951,0.968,0.000,"dendritic cell antigen processing and presentation"),
c("GO:0010324","membrane invagination",0.064,2.2013,0.964,0.000,"membrane invagination"),
c("GO:0097494","regulation of vesicle size",0.001,1.9940,0.867,0.195,"membrane invagination"),
c("GO:0097350","neutrophil clearance",0.001,1.9940,0.814,0.213,"membrane invagination"),
c("GO:0030198","extracellular matrix organization",0.708,1.9259,0.902,0.297,"membrane invagination"),
c("GO:0043062","extracellular structure organization",0.709,1.9259,0.902,0.370,"membrane invagination"),
c("GO:0032594","protein transport within lipid bilayer",0.023,1.6951,0.842,0.514,"membrane invagination"),
c("GO:0010757","negative regulation of plasminogen activation",0.010,3.2218,0.853,0.000,"negative regulation of plasminogen activation"),
c("GO:0018149","peptide cross-linking",0.099,3.0605,0.932,0.183,"negative regulation of plasminogen activation"),
c("GO:0001905","activation of membrane attack complex",0.011,1.6951,0.838,0.184,"negative regulation of plasminogen activation"),
c("GO:0002578","negative regulation of antigen processing and presentation",0.006,1.9940,0.870,0.237,"negative regulation of plasminogen activation"),
c("GO:0018277","protein deamination",0.002,1.6951,0.944,0.238,"negative regulation of plasminogen activation"),
c("GO:0018153","isopeptide cross-linking via N6-(L-isoglutamyl)-L-lysine",0.008,1.6951,0.936,0.256,"negative regulation of plasminogen activation"),
c("GO:0050746","regulation of lipoprotein metabolic process",0.021,1.3984,0.863,0.337,"negative regulation of plasminogen activation"),
c("GO:0018125","peptidyl-cysteine methylation",0.003,1.5211,0.942,0.367,"negative regulation of plasminogen activation"),
c("GO:0018199","peptidyl-glutamine modification",0.010,1.3984,0.938,0.388,"negative regulation of plasminogen activation"),
c("GO:0000188","inactivation of MAPK activity",0.074,1.6142,0.734,0.526,"negative regulation of plasminogen activation"),
c("GO:0045626","negative regulation of T-helper 1 cell differentiation",0.009,1.6951,0.695,0.544,"negative regulation of plasminogen activation"),
c("GO:0019220","regulation of phosphate metabolic process",4.763,1.3890,0.803,0.564,"negative regulation of plasminogen activation"),
c("GO:0030804","positive regulation of cyclic nucleotide biosynthetic process",0.137,1.4075,0.761,0.600,"negative regulation of plasminogen activation"),
c("GO:0042177","negative regulation of protein catabolic process",0.111,1.3823,0.835,0.615,"negative regulation of plasminogen activation"),
c("GO:1902532","negative regulation of intracellular signal transduction",0.734,1.4413,0.753,0.625,"negative regulation of plasminogen activation"),
c("GO:0046580","negative regulation of Ras protein signal transduction",0.081,1.4889,0.781,0.681,"negative regulation of plasminogen activation"),
c("GO:0051058","negative regulation of small GTPase mediated signal transduction",0.082,1.4607,0.782,0.686,"negative regulation of plasminogen activation"),
c("GO:0001971","negative regulation of activation of membrane attack complex",0.007,1.9940,0.700,0.699,"negative regulation of plasminogen activation"),
c("GO:0022610","biological adhesion",2.826,2.4056,0.994,0.000,"biological adhesion"),
c("GO:0032501","multicellular organismal process",15.657,1.8022,0.995,0.000,"multicellular organismal process"),
c("GO:0044699","single-organism process",71.655,1.8431,0.998,0.000,"single-organism process"),
c("GO:0050974","detection of mechanical stimulus involved in sensory perception",0.071,4.0915,0.759,0.000,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0010982","regulation of high-density lipoprotein particle clearance",0.003,1.9940,0.826,0.183,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0030728","ovulation",0.055,2.2013,0.856,0.212,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0070365","hepatocyte differentiation",0.042,2.5622,0.823,0.214,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0050817","coagulation",0.929,3.7447,0.841,0.269,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0032914","positive regulation of transforming growth factor beta1 production",0.013,1.5211,0.793,0.284,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0002040","sprouting angiogenesis",0.117,2.0883,0.839,0.288,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0010631","epithelial cell migration",0.363,3.5376,0.674,0.312,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0090130","tissue migration",0.371,3.5086,0.852,0.313,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0052565","response to defense-related host nitric oxide production",0.007,1.9940,0.907,0.353,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0050878","regulation of body fluid levels",1.269,3.0088,0.749,0.355,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0033591","response to L-ascorbic acid",0.025,1.5211,0.901,0.382,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0051482","positive regulation of cytosolic calcium ion concentration involved in phospholipase C-activating G-protein coupled signaling pathway",0.032,2.6840,0.791,0.390,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0003008","system process",4.235,1.7338,0.819,0.427,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0007200","phospholipase C-activating G-protein coupled receptor signaling pathway",0.131,1.6142,0.845,0.445,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0051969","regulation of transmission of nerve impulse",0.025,1.6951,0.728,0.447,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0006971","hypotonic response",0.022,1.3036,0.921,0.472,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0042628","mating plug formation",0.008,1.6951,0.823,0.473,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0061107","seminal vesicle development",0.006,1.9940,0.862,0.485,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0061108","seminal vesicle epithelium development",0.006,1.9940,0.862,0.485,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0008217","regulation of blood pressure",0.397,2.7986,0.740,0.489,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0055091","phospholipid homeostasis",0.014,1.3984,0.877,0.495,"detection of mechanical stimulus involved in sensory perception"),
c("GO:1901492","positive regulation of lymphangiogenesis",0.006,1.9940,0.797,0.510,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0032101","regulation of response to external stimulus",1.256,3.3188,0.829,0.511,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0060662","salivary gland cavitation",0.014,1.3984,0.855,0.511,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0021943","formation of radial glial scaffolds",0.021,1.5211,0.711,0.518,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0007635","chemosensory behavior",0.028,1.3984,0.905,0.521,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0042534","regulation of tumor necrosis factor biosynthetic process",0.033,1.3036,0.730,0.524,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0050918","positive chemotaxis",0.098,1.4889,0.827,0.527,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0045214","sarcomere organization",0.131,1.7245,0.870,0.532,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0050913","sensory perception of bitter taste",0.055,1.3984,0.840,0.540,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0042048","olfactory behavior",0.018,1.3984,0.907,0.547,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0003065","positive regulation of heart rate by epinephrine",0.003,1.9940,0.760,0.563,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0032695","negative regulation of interleukin-12 production",0.046,1.3036,0.767,0.567,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0048266","behavioral response to pain",0.044,1.3036,0.790,0.577,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0006936","muscle contraction",0.724,2.2097,0.809,0.579,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0002687","positive regulation of leukocyte migration",0.130,2.0595,0.675,0.596,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0009612","response to mechanical stimulus",0.422,2.3585,0.886,0.604,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0044707","single-multicellular organism process",15.092,2.0516,0.800,0.619,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0003012","muscle system process",0.830,1.8884,0.812,0.623,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0060605","tube lumen cavitation",0.014,1.3984,0.861,0.641,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0003013","circulatory system process",1.113,1.5993,0.807,0.652,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0003062","regulation of heart rate by chemical signal",0.015,1.3036,0.763,0.655,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0044057","regulation of system process",1.035,1.3270,0.742,0.668,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0097531","mast cell migration",0.011,1.3036,0.802,0.668,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0021683","cerebellar granular layer morphogenesis",0.035,1.3036,0.848,0.676,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0001667","ameboidal cell migration",0.556,2.7773,0.775,0.676,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0071674","mononuclear cell migration",0.016,1.3036,0.801,0.683,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0050900","leukocyte migration",0.509,1.4708,0.762,0.698,"detection of mechanical stimulus involved in sensory perception"),
c("GO:0060206","estrous cycle phase",0.007,1.5211,0.994,0.000,"estrous cycle phase"),
c("GO:0001775","cell activation",2.008,2.7399,0.916,0.017,"cell activation"),
c("GO:0006869","lipid transport",0.732,2.3288,0.824,0.021,"lipid transport"),
c("GO:0035445","borate transmembrane transport",0.001,1.9940,0.855,0.212,"lipid transport"),
c("GO:0046713","borate transport",0.001,1.9940,0.877,0.350,"lipid transport"),
c("GO:0006887","exocytosis",0.769,2.3019,0.805,0.353,"lipid transport"),
c("GO:0070779","D-aspartate import",0.003,1.6951,0.840,0.368,"lipid transport"),
c("GO:0006820","anion transport",1.726,1.8811,0.831,0.387,"lipid transport"),
c("GO:0016192","vesicle-mediated transport",3.273,1.8128,0.865,0.405,"lipid transport"),
c("GO:0033227","dsRNA transport",0.022,1.5211,0.854,0.416,"lipid transport"),
c("GO:0051586","positive regulation of dopamine uptake involved in synaptic transmission",0.006,1.5211,0.691,0.427,"lipid transport"),
c("GO:0046903","secretion",2.293,1.3136,0.842,0.441,"lipid transport"),
c("GO:1900182","positive regulation of protein localization to nucleus",0.171,1.6951,0.741,0.480,"lipid transport"),
c("GO:0015849","organic acid transport",0.681,1.8005,0.835,0.541,"lipid transport"),
c("GO:0010876","lipid localization",0.809,2.0177,0.879,0.557,"lipid transport"),
c("GO:0015711","organic anion transport",0.945,1.7693,0.807,0.560,"lipid transport"),
c("GO:0051050","positive regulation of transport",1.381,1.5054,0.758,0.564,"lipid transport"),
c("GO:0044765","single-organism transport",13.545,1.5891,0.815,0.585,"lipid transport"),
c("GO:0015824","proline transport",0.019,1.6951,0.831,0.604,"lipid transport"),
c("GO:0043271","negative regulation of ion transport",0.145,1.3579,0.746,0.613,"lipid transport"),
c("GO:0042940","D-amino acid transport",0.009,1.5211,0.839,0.618,"lipid transport"),
c("GO:0010766","negative regulation of sodium ion transport",0.013,1.3984,0.780,0.634,"lipid transport"),
c("GO:0015803","branched-chain amino acid transport",0.018,1.6951,0.833,0.643,"lipid transport"),
c("GO:0002576","platelet degranulation",0.105,2.5031,0.830,0.654,"lipid transport"),
c("GO:0006909","phagocytosis",0.545,2.1778,0.843,0.656,"lipid transport"),
c("GO:0015740","C4-dicarboxylate transport",0.021,1.3984,0.838,0.657,"lipid transport"),
c("GO:0006911","phagocytosis, engulfment",0.056,2.3615,0.842,0.659,"lipid transport"),
c("GO:0043090","amino acid import",0.036,1.3036,0.826,0.670,"lipid transport"),
c("GO:0008283","cell proliferation",4.075,2.2518,0.967,0.027,"cell proliferation"),
c("GO:0033343","positive regulation of collagen binding",0.007,1.9940,0.945,0.035,"positive regulation of collagen binding"),
c("GO:0033341","regulation of collagen binding",0.008,1.6951,0.944,0.633,"positive regulation of collagen binding"),
c("GO:0030155","regulation of cell adhesion",0.746,2.8665,0.839,0.050,"regulation of cell adhesion"),
c("GO:0043032","positive regulation of macrophage activation",0.018,2.8268,0.803,0.130,"regulation of cell adhesion"),
c("GO:0002577","regulation of antigen processing and presentation",0.047,1.3984,0.920,0.149,"regulation of cell adhesion"),
c("GO:0007229","integrin-mediated signaling pathway",0.418,2.6126,0.833,0.170,"regulation of cell adhesion"),
c("GO:0007263","nitric oxide mediated signal transduction",0.026,2.4559,0.847,0.224,"regulation of cell adhesion"),
c("GO:0033034","positive regulation of myeloid cell apoptotic process",0.015,1.5211,0.842,0.258,"regulation of cell adhesion"),
c("GO:0002684","positive regulation of immune system process",20.525,1.6381,0.841,0.262,"regulation of cell adhesion"),
c("GO:0048661","positive regulation of smooth muscle cell proliferation",0.107,2.5157,0.829,0.291,"regulation of cell adhesion"),
c("GO:1900087","positive regulation of G1/S transition of mitotic cell cycle",0.036,1.9017,0.839,0.305,"regulation of cell adhesion"),
c("GO:0031346","positive regulation of cell projection organization",0.460,1.8608,0.791,0.368,"regulation of cell adhesion"),
c("GO:0050769","positive regulation of neurogenesis",0.373,1.7305,0.680,0.410,"regulation of cell adhesion"),
c("GO:0040034","regulation of development, heterochronic",0.034,1.3036,0.909,0.439,"regulation of cell adhesion"),
c("GO:0021540","corpus callosum morphogenesis",0.010,1.3984,0.816,0.480,"regulation of cell adhesion"),
c("GO:0032060","bleb assembly",0.010,1.3984,0.919,0.480,"regulation of cell adhesion"),
c("GO:0048505","regulation of timing of cell differentiation",0.033,1.3984,0.851,0.487,"regulation of cell adhesion"),
c("GO:0007161","calcium-independent cell-matrix adhesion",0.009,1.5211,0.959,0.488,"regulation of cell adhesion"),
c("GO:0048708","astrocyte differentiation",0.138,1.5488,0.808,0.534,"regulation of cell adhesion"),
c("GO:0010754","negative regulation of cGMP-mediated signaling",0.001,1.9940,0.821,0.553,"regulation of cell adhesion"),
c("GO:0002682","regulation of immune system process",21.361,1.3228,0.881,0.554,"regulation of cell adhesion"),
c("GO:0050865","regulation of cell activation",0.901,1.5743,0.814,0.575,"regulation of cell adhesion"),
c("GO:0010751","negative regulation of nitric oxide mediated signal transduction",0.005,1.9940,0.809,0.596,"regulation of cell adhesion"),
c("GO:0042127","regulation of cell proliferation",3.148,1.4143,0.840,0.596,"regulation of cell adhesion"),
c("GO:0033002","muscle cell proliferation",0.345,1.4078,0.960,0.673,"regulation of cell adhesion"),
c("GO:0019934","cGMP-mediated signaling",0.014,1.3984,0.851,0.692,"regulation of cell adhesion"),
c("GO:0019417","sulfur oxidation",0.010,1.9940,0.912,0.066,"sulfur oxidation"),
c("GO:0006147","guanine catabolic process",0.009,1.9940,0.884,0.106,"sulfur oxidation"),
c("GO:0046086","adenosine biosynthetic process",0.001,1.9940,0.899,0.215,"sulfur oxidation"),
c("GO:0001516","prostaglandin biosynthetic process",0.051,1.8080,0.852,0.306,"sulfur oxidation"),
c("GO:0006196","AMP catabolic process",0.002,1.6951,0.899,0.315,"sulfur oxidation"),
c("GO:0072521","purine-containing compound metabolic process",8.772,1.5436,0.905,0.320,"sulfur oxidation"),
c("GO:0032314","regulation of Rac GTPase activity",0.039,1.6857,0.765,0.367,"sulfur oxidation"),
c("GO:0010739","positive regulation of protein kinase A signaling",0.010,1.5211,0.810,0.373,"sulfur oxidation"),
c("GO:0010694","positive regulation of alkaline phosphatase activity",0.025,1.3984,0.863,0.418,"sulfur oxidation"),
c("GO:0046434","organophosphate catabolic process",3.952,1.3589,0.900,0.437,"sulfur oxidation"),
c("GO:0051174","regulation of phosphorus metabolic process",4.788,1.3470,0.816,0.460,"sulfur oxidation"),
c("GO:0008611","ether lipid biosynthetic process",0.010,1.3984,0.878,0.507,"sulfur oxidation"),
c("GO:0097384","cellular lipid biosynthetic process",0.010,1.3984,0.891,0.507,"sulfur oxidation"),
c("GO:0019418","sulfide oxidation",0.006,1.3036,0.915,0.513,"sulfur oxidation"),
c("GO:0070221","sulfide oxidation, using sulfide:quinone oxidoreductase",0.006,1.3036,0.915,0.513,"sulfur oxidation"),
c("GO:0046498","S-adenosylhomocysteine metabolic process",0.010,1.5211,0.882,0.530,"sulfur oxidation"),
c("GO:0046500","S-adenosylmethionine metabolic process",0.028,1.3036,0.875,0.590,"sulfur oxidation"),
c("GO:0009611","response to wounding",2.056,4.0000,0.908,0.071,"response to wounding"),
c("GO:0009605","response to external stimulus",4.459,1.4235,0.957,0.113,"response to wounding"),
c("GO:0042060","wound healing",1.314,3.9208,0.888,0.559,"response to wounding"),
c("GO:0090331","negative regulation of platelet aggregation",0.016,3.2218,0.589,0.582,"response to wounding"),
c("GO:0031347","regulation of defense response",1.124,2.3206,0.831,0.583,"response to wounding"),
c("GO:0080134","regulation of response to stress",1.961,2.0635,0.846,0.588,"response to wounding"),
c("GO:0032103","positive regulation of response to external stimulus",0.398,1.6341,0.801,0.606,"response to wounding"),
c("GO:0006952","defense response",3.096,1.6704,0.904,0.624,"response to wounding"),
c("GO:0034138","toll-like receptor 3 signaling pathway",0.103,1.4848,0.772,0.678,"response to wounding"),
c("GO:0045785","positive regulation of cell adhesion",0.418,3.1549,0.793,0.684,"response to wounding"),
c("GO:0006790","sulfur compound metabolic process",0.742,1.5264,0.945,0.071,"sulfur compound metabolism"),
c("GO:0016311","dephosphorylation",1.340,1.4944,0.927,0.109,"sulfur compound metabolism"),
c("GO:0014823","response to activity",0.126,1.6142,0.967,0.075,"response to activity"),
c("GO:0065008","regulation of biological quality",7.337,1.5911,0.923,0.087,"regulation of biological quality"),
c("GO:0051239","regulation of multicellular organismal process",5.506,1.5299,0.920,0.118,"regulation of biological quality"),
c("GO:0044763","single-organism cellular process",45.302,1.3574,0.929,0.089,"single-organism cellular process"),
c("GO:0042493","response to drug",1.179,1.9348,0.931,0.095,"response to drug"),
c("GO:0035771","interleukin-4-mediated signaling pathway",0.019,1.5211,0.844,0.344,"response to drug"),
c("GO:0040036","regulation of fibroblast growth factor receptor signaling pathway",0.070,1.7650,0.805,0.381,"response to drug"),
c("GO:0030579","ubiquitin-dependent SMAD protein catabolic process",0.008,1.3036,0.843,0.438,"response to drug"),
c("GO:0090287","regulation of cellular response to growth factor stimulus",0.346,1.5336,0.825,0.651,"response to drug"));

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
