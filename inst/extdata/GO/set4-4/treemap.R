

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
revigo.data <- rbind(c("GO:0007005","mitochondrion organization",0.649,3.0269,0.871,0.000,"mitochondrion organization"),
c("GO:0035617","stress granule disassembly",0.005,1.5411,0.869,0.244,"mitochondrion organization"),
c("GO:0010823","negative regulation of mitochondrion organization",0.043,2.6144,0.777,0.386,"mitochondrion organization"),
c("GO:1902511","negative regulation of apoptotic DNA fragmentation",0.001,1.5411,0.690,0.459,"mitochondrion organization"),
c("GO:0034553","mitochondrial respiratory chain complex II assembly",0.001,1.8389,0.871,0.523,"mitochondrion organization"),
c("GO:0033615","mitochondrial proton-transporting ATP synthase complex assembly",0.002,1.5411,0.863,0.543,"mitochondrion organization"),
c("GO:0035694","mitochondrial protein catabolic process",0.003,1.3680,0.781,0.555,"mitochondrion organization"),
c("GO:0010821","regulation of mitochondrion organization",0.142,1.6919,0.785,0.700,"mitochondrion organization"),
c("GO:0060065","uterus development",0.042,2.1537,0.911,0.000,"uterus development"),
c("GO:0001964","startle response",0.066,2.0610,0.897,0.213,"uterus development"),
c("GO:0001826","inner cell mass cell differentiation",0.011,1.5411,0.863,0.230,"uterus development"),
c("GO:0048627","myoblast development",0.002,1.5411,0.897,0.235,"uterus development"),
c("GO:0021562","vestibulocochlear nerve development",0.009,1.8389,0.922,0.245,"uterus development"),
c("GO:0061144","alveolar secondary septum development",0.008,1.5411,0.915,0.281,"uterus development"),
c("GO:0031133","regulation of axon diameter",0.006,1.8389,0.750,0.300,"uterus development"),
c("GO:0014834","skeletal muscle satellite cell maintenance involved in skeletal muscle regeneration",0.003,1.5411,0.904,0.308,"uterus development"),
c("GO:0090102","cochlea development",0.091,1.4369,0.911,0.327,"uterus development"),
c("GO:0060005","vestibular reflex",0.003,1.5411,0.956,0.338,"uterus development"),
c("GO:0032680","regulation of tumor necrosis factor production",0.182,1.6182,0.856,0.341,"uterus development"),
c("GO:0010989","negative regulation of low-density lipoprotein particle clearance",0.013,1.5411,0.859,0.358,"uterus development"),
c("GO:2001016","positive regulation of skeletal muscle cell differentiation",0.013,1.5411,0.780,0.424,"uterus development"),
c("GO:0061038","uterus morphogenesis",0.005,1.3680,0.913,0.495,"uterus development"),
c("GO:0060066","oviduct development",0.011,1.5411,0.917,0.522,"uterus development"),
c("GO:0032536","regulation of cell projection size",0.009,1.3680,0.845,0.539,"uterus development"),
c("GO:1900017","positive regulation of cytokine production involved in inflammatory response",0.010,1.3680,0.815,0.575,"uterus development"),
c("GO:0045077","negative regulation of interferon-gamma biosynthetic process",0.011,1.3680,0.728,0.579,"uterus development"),
c("GO:0014012","peripheral nervous system axon regeneration",0.018,1.3680,0.765,0.597,"uterus development"),
c("GO:0071706","tumor necrosis factor superfamily cytokine production",0.190,1.5417,0.907,0.687,"uterus development"),
c("GO:0071169","establishment of protein localization to chromatin",0.007,1.8389,0.936,0.000,"establishment of protein localization to chromatin"),
c("GO:0072683","T cell extravasation",0.008,1.8389,0.839,0.142,"establishment of protein localization to chromatin"),
c("GO:0006897","endocytosis",1.430,1.7328,0.930,0.216,"establishment of protein localization to chromatin"),
c("GO:1902389","ceramide 1-phosphate transport",0.001,1.8389,0.926,0.259,"establishment of protein localization to chromatin"),
c("GO:0006836","neurotransmitter transport",0.450,1.4279,0.922,0.314,"establishment of protein localization to chromatin"),
c("GO:0034436","glycoprotein transport",0.003,1.3680,0.931,0.317,"establishment of protein localization to chromatin"),
c("GO:0032218","riboflavin transport",0.003,1.3680,0.927,0.426,"establishment of protein localization to chromatin"),
c("GO:2001140","positive regulation of phospholipid transport",0.006,1.5411,0.869,0.611,"establishment of protein localization to chromatin"),
c("GO:2001138","regulation of phospholipid transport",0.007,1.3680,0.883,0.667,"establishment of protein localization to chromatin"),
c("GO:0006909","phagocytosis",0.545,1.5624,0.911,0.699,"establishment of protein localization to chromatin"),
c("GO:0002431","Fc receptor mediated stimulatory signaling pathway",0.277,2.8327,0.747,0.038,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:1901857","positive regulation of cellular respiration",0.002,1.5411,0.806,0.107,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0051900","regulation of mitochondrial depolarization",0.028,2.3799,0.836,0.125,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0071393","cellular response to progesterone stimulus",0.002,1.8389,0.866,0.162,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0050863","regulation of T cell activation",0.561,1.8233,0.789,0.219,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0002253","activation of immune response",1.043,1.4621,0.860,0.249,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0071279","cellular response to cobalt ion",0.001,1.8389,0.881,0.250,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:1990144","intrinsic apoptotic signaling pathway in response to hypoxia",0.001,1.8389,0.798,0.250,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0038061","NIK/NF-kappaB signaling",0.080,1.5180,0.803,0.272,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0002764","immune response-regulating signaling pathway",1.064,1.4047,0.761,0.294,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0035966","response to topologically incorrect protein",0.209,1.4814,0.905,0.311,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0070265","necrotic cell death",0.120,1.5622,0.884,0.327,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0042059","negative regulation of epidermal growth factor receptor signaling pathway",0.071,2.7167,0.733,0.335,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0007269","neurotransmitter secretion",0.278,1.7742,0.759,0.345,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0007172","signal complex assembly",0.030,2.3799,0.728,0.347,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0097032","mitochondrial respiratory chain complex II biogenesis",0.001,1.8389,0.922,0.365,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0010266","response to vitamin B1",0.009,1.5411,0.910,0.368,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0010940","positive regulation of necrotic cell death",0.009,1.3680,0.825,0.370,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0016226","iron-sulfur cluster assembly",0.047,1.9780,0.870,0.373,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0090263","positive regulation of canonical Wnt signaling pathway",0.120,2.5114,0.740,0.381,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0031163","metallo-sulfur cluster assembly",0.047,1.9780,0.914,0.384,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0070272","proton-transporting ATP synthase complex biogenesis",0.007,1.3680,0.916,0.402,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0008626","granzyme-mediated apoptotic signaling pathway",0.005,1.3680,0.821,0.405,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0050778","positive regulation of immune response",20.108,1.5119,0.818,0.409,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0070555","response to interleukin-1",0.154,1.4269,0.913,0.415,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0008284","positive regulation of cell proliferation",1.657,1.5484,0.798,0.415,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0070232","regulation of T cell apoptotic process",0.101,1.4763,0.825,0.435,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0034552","respiratory chain complex II assembly",0.001,1.8389,0.916,0.461,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0006839","mitochondrial transport",0.326,1.3462,0.914,0.475,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0090035","positive regulation of chaperone-mediated protein complex assembly",0.002,1.5411,0.851,0.478,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0060054","positive regulation of epithelial cell proliferation involved in wound healing",0.011,1.3680,0.835,0.508,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0006406","mRNA export from nucleus",0.117,1.3251,0.845,0.517,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0035659","Wnt signaling pathway involved in wound healing, spreading of epidermal cells",0.001,1.8389,0.756,0.517,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0014719","skeletal muscle satellite cell activation",0.007,1.3680,0.902,0.518,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0045014","negative regulation of transcription by glucose",0.003,1.5411,0.716,0.529,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0009966","regulation of signal transduction",5.885,1.3152,0.700,0.532,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0040037","negative regulation of fibroblast growth factor receptor signaling pathway",0.035,2.0610,0.727,0.535,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0001560","regulation of cell growth by extracellular stimulus",0.005,1.5411,0.780,0.536,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0001759","organ induction",0.070,1.6596,0.746,0.545,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0045837","negative regulation of membrane potential",0.023,2.2588,0.914,0.550,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0097049","motor neuron apoptotic process",0.011,1.3680,0.896,0.555,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0033625","positive regulation of integrin activation",0.006,1.5411,0.851,0.571,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0060338","regulation of type I interferon-mediated signaling pathway",0.059,1.3996,0.738,0.595,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0051881","regulation of mitochondrial membrane potential",0.095,2.0830,0.907,0.602,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0071803","positive regulation of podosome assembly",0.014,1.3680,0.796,0.626,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0038127","ERBB signaling pathway",0.360,2.2668,0.753,0.632,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0045124","regulation of bone resorption",0.077,1.4369,0.847,0.636,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0043623","cellular protein complex assembly",1.060,1.4791,0.885,0.637,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0060124","positive regulation of growth hormone secretion",0.017,1.3680,0.725,0.645,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:1901655","cellular response to ketone",0.071,1.4763,0.843,0.651,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0022007","convergent extension involved in neural plate elongation",0.008,1.3680,0.907,0.654,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0036245","cellular response to menadione",0.002,1.5411,0.868,0.678,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0071248","cellular response to metal ion",0.232,1.3446,0.840,0.683,"Fc receptor mediated stimulatory signaling pathway"),
c("GO:0006396","RNA processing",1.631,2.3125,0.802,0.046,"RNA processing"),
c("GO:0052548","regulation of endopeptidase activity",0.736,2.0195,0.768,0.188,"RNA processing"),
c("GO:0018277","protein deamination",0.002,1.5411,0.888,0.188,"RNA processing"),
c("GO:0018125","peptidyl-cysteine methylation",0.003,1.3680,0.882,0.200,"RNA processing"),
c("GO:0031365","N-terminal protein amino acid modification",0.048,1.5622,0.866,0.234,"RNA processing"),
c("GO:0032447","protein urmylation",0.007,1.3680,0.879,0.243,"RNA processing"),
c("GO:0019218","regulation of steroid metabolic process",0.175,1.3446,0.814,0.275,"RNA processing"),
c("GO:1901068","guanosine-containing compound metabolic process",2.687,1.8798,0.715,0.277,"RNA processing"),
c("GO:0046054","dGMP metabolic process",0.001,1.8389,0.813,0.296,"RNA processing"),
c("GO:0001522","pseudouridine synthesis",0.080,1.7133,0.825,0.318,"RNA processing"),
c("GO:0071897","DNA biosynthetic process",0.291,2.2168,0.817,0.320,"RNA processing"),
c("GO:0042325","regulation of phosphorylation",2.769,1.8309,0.697,0.335,"RNA processing"),
c("GO:0009451","RNA modification",0.295,2.2676,0.815,0.360,"RNA processing"),
c("GO:0030204","chondroitin sulfate metabolic process",0.089,1.6449,0.768,0.378,"RNA processing"),
c("GO:0032264","IMP salvage",0.034,1.3680,0.777,0.383,"RNA processing"),
c("GO:0034470","ncRNA processing",0.554,2.3372,0.806,0.384,"RNA processing"),
c("GO:0034660","ncRNA metabolic process",0.917,1.5137,0.814,0.406,"RNA processing"),
c("GO:0070534","protein K63-linked ubiquitination",0.050,1.3304,0.863,0.489,"RNA processing"),
c("GO:0018108","peptidyl-tyrosine phosphorylation",1.130,1.4638,0.767,0.509,"RNA processing"),
c("GO:0006270","DNA replication initiation",0.088,1.5622,0.829,0.520,"RNA processing"),
c("GO:0007250","activation of NF-kappaB-inducing kinase activity",0.054,1.7133,0.638,0.522,"RNA processing"),
c("GO:0032856","activation of Ras GTPase activity",0.080,1.5180,0.598,0.561,"RNA processing"),
c("GO:0046777","protein autophosphorylation",0.414,1.3697,0.790,0.565,"RNA processing"),
c("GO:0009207","purine ribonucleoside triphosphate catabolic process",3.700,1.6014,0.650,0.617,"RNA processing"),
c("GO:0032862","activation of Rho GTPase activity",0.050,1.6596,0.610,0.625,"RNA processing"),
c("GO:0051338","regulation of transferase activity",1.829,1.9846,0.823,0.626,"RNA processing"),
c("GO:0070372","regulation of ERK1 and ERK2 cascade",0.352,1.4437,0.653,0.628,"RNA processing"),
c("GO:2001268","negative regulation of cysteine-type endopeptidase activity involved in apoptotic signaling pathway",0.003,1.8389,0.730,0.634,"RNA processing"),
c("GO:0035553","oxidative single-stranded RNA demethylation",0.003,1.5411,0.834,0.667,"RNA processing"),
c("GO:0000460","maturation of 5.8S rRNA",0.025,1.9780,0.785,0.689,"RNA processing"));

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
