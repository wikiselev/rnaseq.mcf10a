

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
revigo.data <- rbind(c("GO:0016338","calcium-independent cell-cell adhesion via plasma membrane cell-adhesion molecules",0.035,1.3133,0.993,0.000,"calcium-independent cell-cell adhesion via plasma membrane cell-adhesion molecules"),
c("GO:0044241","lipid digestion",0.028,3.8539,0.899,0.000,"lipid digestion"),
c("GO:0036363","transforming growth factor beta activation",0.001,2.3036,0.920,0.164,"lipid digestion"),
c("GO:0060430","lung saccule development",0.030,3.4437,0.858,0.197,"lipid digestion"),
c("GO:0055113","epiboly involved in gastrulation with mouth forming second",0.001,2.3036,0.886,0.199,"lipid digestion"),
c("GO:0030049","muscle filament sliding",0.047,2.5045,0.830,0.203,"lipid digestion"),
c("GO:0007586","digestion",0.235,1.6801,0.899,0.234,"lipid digestion"),
c("GO:0097155","fasciculation of sensory neuron axon",0.010,2.0039,0.825,0.242,"lipid digestion"),
c("GO:0072497","mesenchymal stem cell differentiation",0.009,1.4651,0.886,0.251,"lipid digestion"),
c("GO:0061029","eyelid development in camera-type eye",0.025,1.4082,0.873,0.294,"lipid digestion"),
c("GO:0060325","face morphogenesis",0.182,2.1057,0.887,0.299,"lipid digestion"),
c("GO:0060322","head development",0.238,1.7366,0.904,0.310,"lipid digestion"),
c("GO:0030502","negative regulation of bone mineralization",0.027,1.4082,0.827,0.310,"lipid digestion"),
c("GO:0061038","uterus morphogenesis",0.005,1.8289,0.876,0.324,"lipid digestion"),
c("GO:0097070","ductus arteriosus closure",0.010,2.0039,0.874,0.341,"lipid digestion"),
c("GO:0003008","system process",4.235,1.5262,0.876,0.348,"lipid digestion"),
c("GO:0055123","digestive system development",0.349,1.3494,0.864,0.364,"lipid digestion"),
c("GO:0002035","brain renin-angiotensin system",0.015,2.0039,0.865,0.367,"lipid digestion"),
c("GO:0006930","substrate-dependent cell migration, cell extension",0.009,1.7049,0.869,0.378,"lipid digestion"),
c("GO:0048246","macrophage chemotaxis",0.038,1.3133,0.783,0.425,"lipid digestion"),
c("GO:0010171","body morphogenesis",0.222,1.8642,0.893,0.426,"lipid digestion"),
c("GO:0061205","paramesonephric duct development",0.006,2.0039,0.880,0.453,"lipid digestion"),
c("GO:0071907","determination of digestive tract left/right asymmetry",0.008,2.0039,0.879,0.462,"lipid digestion"),
c("GO:0060971","embryonic heart tube left/right pattern formation",0.008,1.7049,0.866,0.468,"lipid digestion"),
c("GO:0060349","bone morphogenesis",0.344,1.5627,0.847,0.473,"lipid digestion"),
c("GO:0003184","pulmonary valve morphogenesis",0.019,1.5309,0.866,0.481,"lipid digestion"),
c("GO:2000739","regulation of mesenchymal stem cell differentiation",0.007,1.6091,0.854,0.501,"lipid digestion"),
c("GO:0043587","tongue morphogenesis",0.027,1.4651,0.864,0.534,"lipid digestion"),
c("GO:0042074","cell migration involved in gastrulation",0.025,1.5309,0.802,0.551,"lipid digestion"),
c("GO:0043585","nose morphogenesis",0.007,1.8289,0.864,0.565,"lipid digestion"),
c("GO:0030048","actin filament-based movement",0.175,1.4350,0.912,0.580,"lipid digestion"),
c("GO:0031444","slow-twitch skeletal muscle fiber contraction",0.014,2.3036,0.888,0.591,"lipid digestion"),
c("GO:0060900","embryonic camera-type eye formation",0.033,1.3580,0.859,0.593,"lipid digestion"),
c("GO:0060539","diaphragm development",0.017,1.4082,0.870,0.596,"lipid digestion"),
c("GO:0060426","lung vasculature development",0.016,1.6091,0.859,0.608,"lipid digestion"),
c("GO:0043584","nose development",0.028,1.3580,0.862,0.615,"lipid digestion"),
c("GO:0048286","lung alveolus development",0.106,2.0168,0.849,0.685,"lipid digestion"),
c("GO:0006910","phagocytosis, recognition",0.026,1.5309,0.875,0.692,"lipid digestion"),
c("GO:0006957","complement activation, alternative pathway",0.016,3.6198,0.766,0.011,"complement activation, alternative pathway"),
c("GO:0001523","retinoid metabolic process",0.126,2.9066,0.816,0.127,"complement activation, alternative pathway"),
c("GO:0006959","humoral immune response",0.457,1.6108,0.944,0.133,"complement activation, alternative pathway"),
c("GO:0045980","negative regulation of nucleotide metabolic process",0.067,2.4547,0.783,0.140,"complement activation, alternative pathway"),
c("GO:0006081","cellular aldehyde metabolic process",0.106,2.0752,0.882,0.145,"complement activation, alternative pathway"),
c("GO:0042264","peptidyl-aspartic acid hydroxylation",0.002,2.0039,0.927,0.151,"complement activation, alternative pathway"),
c("GO:0072376","protein activation cascade",0.335,2.0752,0.851,0.204,"complement activation, alternative pathway"),
c("GO:0016553","base conversion or substitution editing",0.008,1.8289,0.898,0.204,"complement activation, alternative pathway"),
c("GO:0044598","doxorubicin metabolic process",0.009,1.4651,0.828,0.208,"complement activation, alternative pathway"),
c("GO:0006629","lipid metabolic process",3.159,1.7428,0.867,0.213,"complement activation, alternative pathway"),
c("GO:0035863","dITP catabolic process",0.001,2.3036,0.819,0.231,"complement activation, alternative pathway"),
c("GO:0018126","protein hydroxylation",0.047,1.6091,0.916,0.240,"complement activation, alternative pathway"),
c("GO:2000781","positive regulation of double-strand break repair",0.005,1.7049,0.764,0.245,"complement activation, alternative pathway"),
c("GO:0016077","snoRNA catabolic process",0.001,2.3036,0.878,0.263,"complement activation, alternative pathway"),
c("GO:0051409","response to nitrosative stress",0.016,1.4651,0.921,0.263,"complement activation, alternative pathway"),
c("GO:0006072","glycerol-3-phosphate metabolic process",0.030,1.8289,0.876,0.264,"complement activation, alternative pathway"),
c("GO:0002819","regulation of adaptive immune response",19.159,1.4222,0.878,0.268,"complement activation, alternative pathway"),
c("GO:1901639","XDP catabolic process",0.001,2.3036,0.808,0.277,"complement activation, alternative pathway"),
c("GO:0009450","gamma-aminobutyric acid catabolic process",0.009,2.0039,0.823,0.289,"complement activation, alternative pathway"),
c("GO:0009112","nucleobase metabolic process",0.142,1.5943,0.819,0.308,"complement activation, alternative pathway"),
c("GO:0018197","peptidyl-aspartic acid modification",0.002,2.0039,0.927,0.338,"complement activation, alternative pathway"),
c("GO:0055114","oxidation-reduction process",10.933,1.8060,0.860,0.345,"complement activation, alternative pathway"),
c("GO:0042126","nitrate metabolic process",0.007,1.8289,0.859,0.357,"complement activation, alternative pathway"),
c("GO:0006032","chitin catabolic process",0.033,1.6091,0.837,0.382,"complement activation, alternative pathway"),
c("GO:0006105","succinate metabolic process",0.025,1.3133,0.856,0.391,"complement activation, alternative pathway"),
c("GO:0045978","negative regulation of nucleoside metabolic process",0.007,2.0039,0.792,0.429,"complement activation, alternative pathway"),
c("GO:0045979","positive regulation of nucleoside metabolic process",0.024,1.8289,0.777,0.434,"complement activation, alternative pathway"),
c("GO:0016074","snoRNA metabolic process",0.006,2.0039,0.899,0.439,"complement activation, alternative pathway"),
c("GO:0006663","platelet activating factor biosynthetic process",0.005,1.8289,0.791,0.449,"complement activation, alternative pathway"),
c("GO:0002526","acute inflammatory response",0.259,3.5686,0.864,0.458,"complement activation, alternative pathway"),
c("GO:0080134","regulation of response to stress",1.961,1.5193,0.861,0.465,"complement activation, alternative pathway"),
c("GO:0006083","acetate metabolic process",0.014,1.8289,0.860,0.469,"complement activation, alternative pathway"),
c("GO:0006681","galactosylceramide metabolic process",0.031,2.0039,0.785,0.507,"complement activation, alternative pathway"),
c("GO:0009448","gamma-aminobutyric acid metabolic process",0.039,1.6091,0.832,0.509,"complement activation, alternative pathway"),
c("GO:0002537","nitric oxide production involved in inflammatory response",0.005,2.0039,0.824,0.530,"complement activation, alternative pathway"),
c("GO:0034656","nucleobase-containing small molecule catabolic process",0.007,1.7049,0.834,0.543,"complement activation, alternative pathway"),
c("GO:0006720","isoprenoid metabolic process",0.232,2.3372,0.817,0.587,"complement activation, alternative pathway"),
c("GO:0006382","adenosine to inosine editing",0.003,2.0039,0.902,0.589,"complement activation, alternative pathway"),
c("GO:0006574","valine catabolic process",0.005,2.0039,0.827,0.606,"complement activation, alternative pathway"),
c("GO:0019432","triglyceride biosynthetic process",0.096,1.7565,0.795,0.638,"complement activation, alternative pathway"),
c("GO:0006954","inflammatory response",1.375,1.7945,0.867,0.657,"complement activation, alternative pathway"),
c("GO:0001905","activation of membrane attack complex",0.011,2.0039,0.812,0.660,"complement activation, alternative pathway"),
c("GO:0009134","nucleoside diphosphate catabolic process",0.010,1.4651,0.809,0.665,"complement activation, alternative pathway"),
c("GO:0046469","platelet activating factor metabolic process",0.006,1.7049,0.804,0.672,"complement activation, alternative pathway"),
c("GO:0044255","cellular lipid metabolic process",2.183,1.9318,0.794,0.677,"complement activation, alternative pathway"),
c("GO:0008037","cell recognition",0.236,1.5473,0.934,0.013,"cell recognition"),
c("GO:0008655","pyrimidine-containing compound salvage",0.013,3.3010,0.825,0.057,"pyrimidine-containing compound salvage"),
c("GO:2001057","reactive nitrogen species metabolic process",0.008,1.7049,0.931,0.106,"pyrimidine-containing compound salvage"),
c("GO:0043094","cellular metabolic compound salvage",0.092,2.2426,0.920,0.173,"pyrimidine-containing compound salvage"),
c("GO:0072527","pyrimidine-containing compound metabolic process",0.235,1.5784,0.862,0.250,"pyrimidine-containing compound salvage"),
c("GO:0009163","nucleoside biosynthetic process",1.503,2.0004,0.744,0.519,"pyrimidine-containing compound salvage"),
c("GO:2001169","regulation of ATP biosynthetic process",0.005,1.8289,0.786,0.582,"pyrimidine-containing compound salvage"),
c("GO:2001170","negative regulation of ATP biosynthetic process",0.002,2.0039,0.778,0.598,"pyrimidine-containing compound salvage"),
c("GO:0019858","cytosine metabolic process",0.005,2.0039,0.815,0.636,"pyrimidine-containing compound salvage"),
c("GO:0051606","detection of stimulus",1.214,2.6055,0.958,0.060,"detection of stimulus"),
c("GO:0009605","response to external stimulus",4.459,2.0650,0.954,0.105,"detection of stimulus"),
c("GO:0007603","phototransduction, visible light",0.111,2.8239,0.796,0.071,"phototransduction, visible light"),
c("GO:0070346","positive regulation of fat cell proliferation",0.006,2.3036,0.901,0.106,"phototransduction, visible light"),
c("GO:0050766","positive regulation of phagocytosis",0.103,2.3625,0.799,0.129,"phototransduction, visible light"),
c("GO:0032846","positive regulation of homeostatic process",0.154,1.7174,0.923,0.133,"phototransduction, visible light"),
c("GO:0010649","regulation of cell communication by electrical coupling",0.015,1.4651,0.911,0.184,"phototransduction, visible light"),
c("GO:0071939","vitamin A import",0.003,2.3036,0.867,0.201,"phototransduction, visible light"),
c("GO:0000002","mitochondrial genome maintenance",0.056,2.3625,0.927,0.255,"phototransduction, visible light"),
c("GO:0051289","protein homotetramerization",0.128,1.8413,0.943,0.270,"phototransduction, visible light"),
c("GO:0097168","mesenchymal stem cell proliferation",0.002,2.3036,0.966,0.300,"phototransduction, visible light"),
c("GO:0042135","neurotransmitter catabolic process",0.021,1.4651,0.865,0.323,"phototransduction, visible light"),
c("GO:0070341","fat cell proliferation",0.011,1.8289,0.967,0.326,"phototransduction, visible light"),
c("GO:0008643","carbohydrate transport",0.363,1.9743,0.898,0.337,"phototransduction, visible light"),
c("GO:0090069","regulation of ribosome biogenesis",0.007,1.8289,0.930,0.354,"phototransduction, visible light"),
c("GO:0010876","lipid localization",0.809,1.9300,0.919,0.359,"phototransduction, visible light"),
c("GO:0034754","cellular hormone metabolic process",0.197,1.4891,0.895,0.381,"phototransduction, visible light"),
c("GO:2001274","negative regulation of glucose import in response to insulin stimulus",0.005,2.0039,0.785,0.393,"phototransduction, visible light"),
c("GO:0015721","bile acid and bile salt transport",0.046,1.4651,0.907,0.403,"phototransduction, visible light"),
c("GO:0031585","regulation of inositol 1,4,5-trisphosphate-sensitive calcium-release channel activity",0.008,1.8289,0.818,0.406,"phototransduction, visible light"),
c("GO:0044321","response to leptin",0.035,1.3580,0.934,0.410,"phototransduction, visible light"),
c("GO:0002820","negative regulation of adaptive immune response",0.060,1.4082,0.899,0.413,"phototransduction, visible light"),
c("GO:0045835","negative regulation of meiosis",0.032,1.7049,0.853,0.420,"phototransduction, visible light"),
c("GO:0042297","vocal learning",0.007,2.3036,0.809,0.452,"phototransduction, visible light"),
c("GO:0044320","cellular response to leptin stimulus",0.027,1.4651,0.907,0.462,"phototransduction, visible light"),
c("GO:0001556","oocyte maturation",0.064,1.4651,0.838,0.471,"phototransduction, visible light"),
c("GO:0046864","isoprenoid transport",0.005,2.0039,0.904,0.481,"phototransduction, visible light"),
c("GO:1902462","positive regulation of mesenchymal stem cell proliferation",0.001,2.3036,0.906,0.482,"phototransduction, visible light"),
c("GO:0048520","positive regulation of behavior",0.205,1.5032,0.893,0.523,"phototransduction, visible light"),
c("GO:0060065","uterus development",0.042,1.3580,0.871,0.529,"phototransduction, visible light"),
c("GO:0090298","negative regulation of mitochondrial DNA replication",0.001,2.3036,0.817,0.530,"phototransduction, visible light"),
c("GO:0032101","regulation of response to external stimulus",1.256,1.6390,0.847,0.531,"phototransduction, visible light"),
c("GO:0010884","positive regulation of lipid storage",0.043,1.3133,0.847,0.539,"phototransduction, visible light"),
c("GO:0090005","negative regulation of establishment of protein localization to plasma membrane",0.019,1.3133,0.825,0.554,"phototransduction, visible light"),
c("GO:0005513","detection of calcium ion",0.014,1.4082,0.923,0.555,"phototransduction, visible light"),
c("GO:0050716","positive regulation of interleukin-1 secretion",0.026,1.3580,0.757,0.558,"phototransduction, visible light"),
c("GO:2000233","negative regulation of rRNA processing",0.002,2.0039,0.832,0.564,"phototransduction, visible light"),
c("GO:0010996","response to auditory stimulus",0.026,1.6091,0.889,0.611,"phototransduction, visible light"),
c("GO:0010635","regulation of mitochondrial fusion",0.007,1.7049,0.809,0.624,"phototransduction, visible light"),
c("GO:0009314","response to radiation",0.915,1.3475,0.925,0.644,"phototransduction, visible light"),
c("GO:0007638","mechanosensory behavior",0.026,1.5309,0.871,0.660,"phototransduction, visible light"),
c("GO:0045780","positive regulation of bone resorption",0.030,1.3133,0.852,0.668,"phototransduction, visible light"),
c("GO:0009581","detection of external stimulus",0.312,2.1409,0.875,0.693,"phototransduction, visible light"),
c("GO:0046683","response to organophosphorus",0.335,2.2848,0.930,0.078,"response to organophosphorus"),
c("GO:0051410","detoxification of nitrogen compound",0.006,1.8289,0.849,0.288,"response to organophosphorus"),
c("GO:0001101","response to acid chemical",0.711,1.8735,0.930,0.419,"response to organophosphorus"),
c("GO:0071229","cellular response to acid chemical",0.366,1.9003,0.893,0.423,"response to organophosphorus"),
c("GO:0009753","response to jasmonic acid",0.005,1.7049,0.935,0.629,"response to organophosphorus"),
c("GO:0071395","cellular response to jasmonic acid stimulus",0.005,1.7049,0.911,0.629,"response to organophosphorus"));

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
