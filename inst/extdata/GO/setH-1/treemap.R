

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
revigo.data <- rbind(c("GO:0000398","mRNA splicing, via spliceosome",0.423,9.4949,0.736,0.000,"mRNA splicing, via spliceosome"),
c("GO:0046483","heterocycle metabolic process",24.799,3.2076,0.829,0.146,"mRNA splicing, via spliceosome"),
c("GO:0051436","negative regulation of ubiquitin-protein ligase activity involved in mitotic cell cycle",0.076,4.1805,0.583,0.160,"mRNA splicing, via spliceosome"),
c("GO:0006807","nitrogen compound metabolic process",26.566,2.7670,0.912,0.201,"mRNA splicing, via spliceosome"),
c("GO:1901360","organic cyclic compound metabolic process",25.430,2.7375,0.860,0.202,"mRNA splicing, via spliceosome"),
c("GO:0044265","cellular macromolecule catabolic process",1.775,3.4685,0.726,0.213,"mRNA splicing, via spliceosome"),
c("GO:0006521","regulation of cellular amino acid metabolic process",0.082,3.0315,0.763,0.218,"mRNA splicing, via spliceosome"),
c("GO:0006349","regulation of gene expression by genetic imprinting",0.062,1.3371,0.801,0.246,"mRNA splicing, via spliceosome"),
c("GO:0045945","positive regulation of transcription from RNA polymerase III promoter",0.014,2.3468,0.762,0.249,"mRNA splicing, via spliceosome"),
c("GO:0070262","peptidyl-serine dephosphorylation",0.007,2.3893,0.830,0.250,"mRNA splicing, via spliceosome"),
c("GO:0071704","organic substance metabolic process",42.826,1.5378,0.905,0.251,"mRNA splicing, via spliceosome"),
c("GO:0018065","protein-cofactor linkage",0.018,2.3468,0.824,0.265,"mRNA splicing, via spliceosome"),
c("GO:0006779","porphyrin-containing compound biosynthetic process",0.092,1.9523,0.832,0.267,"mRNA splicing, via spliceosome"),
c("GO:0006369","termination of RNA polymerase II transcription",0.054,2.2284,0.800,0.275,"mRNA splicing, via spliceosome"),
c("GO:0017014","protein nitrosylation",0.072,2.6271,0.808,0.291,"mRNA splicing, via spliceosome"),
c("GO:0018119","peptidyl-cysteine S-nitrosylation",0.072,2.6271,0.797,0.291,"mRNA splicing, via spliceosome"),
c("GO:2000327","positive regulation of ligand-dependent nuclear receptor transcription coactivator activity",0.002,2.3893,0.896,0.292,"mRNA splicing, via spliceosome"),
c("GO:2000325","regulation of ligand-dependent nuclear receptor transcription coactivator activity",0.003,1.9307,0.896,0.299,"mRNA splicing, via spliceosome"),
c("GO:0009308","amine metabolic process",0.369,1.6546,0.862,0.299,"mRNA splicing, via spliceosome"),
c("GO:0006354","DNA-templated transcription, elongation",0.203,1.3747,0.781,0.307,"mRNA splicing, via spliceosome"),
c("GO:0010608","posttranscriptional regulation of gene expression",0.840,1.6045,0.790,0.309,"mRNA splicing, via spliceosome"),
c("GO:0044238","primary metabolic process",41.881,1.5005,0.906,0.318,"mRNA splicing, via spliceosome"),
c("GO:0048554","positive regulation of metalloenzyme activity",0.014,1.4451,0.886,0.347,"mRNA splicing, via spliceosome"),
c("GO:0048552","regulation of metalloenzyme activity",0.016,1.4451,0.887,0.350,"mRNA splicing, via spliceosome"),
c("GO:0040029","regulation of gene expression, epigenetic",0.334,1.4196,0.805,0.357,"mRNA splicing, via spliceosome"),
c("GO:0016071","mRNA metabolic process",1.098,8.3188,0.763,0.359,"mRNA splicing, via spliceosome"),
c("GO:0006725","cellular aromatic compound metabolic process",24.907,3.1192,0.829,0.359,"mRNA splicing, via spliceosome"),
c("GO:0006281","DNA repair",1.410,3.3872,0.623,0.363,"mRNA splicing, via spliceosome"),
c("GO:0009635","response to herbicide",0.023,1.4451,0.940,0.363,"mRNA splicing, via spliceosome"),
c("GO:0044260","cellular macromolecule metabolic process",25.627,2.4622,0.760,0.364,"mRNA splicing, via spliceosome"),
c("GO:1901313","positive regulation of gene expression involved in extracellular matrix organization",0.007,1.9307,0.738,0.368,"mRNA splicing, via spliceosome"),
c("GO:0070647","protein modification by small protein conjugation or removal",1.542,1.8456,0.755,0.369,"mRNA splicing, via spliceosome"),
c("GO:0097296","activation of cysteine-type endopeptidase activity involved in apoptotic signaling pathway",0.015,1.9307,0.734,0.373,"mRNA splicing, via spliceosome"),
c("GO:0006972","hyperosmotic response",0.049,2.1284,0.922,0.387,"mRNA splicing, via spliceosome"),
c("GO:0006106","fumarate metabolic process",0.003,1.9307,0.877,0.396,"mRNA splicing, via spliceosome"),
c("GO:0051340","regulation of ligase activity",0.133,3.1871,0.871,0.404,"mRNA splicing, via spliceosome"),
c("GO:0006396","RNA processing",1.631,6.4202,0.746,0.415,"mRNA splicing, via spliceosome"),
c("GO:0006259","DNA metabolic process",3.159,5.3768,0.743,0.421,"mRNA splicing, via spliceosome"),
c("GO:0006139","nucleobase-containing compound metabolic process",24.258,2.8041,0.759,0.430,"mRNA splicing, via spliceosome"),
c("GO:0006412","translation",1.984,1.5354,0.731,0.439,"mRNA splicing, via spliceosome"),
c("GO:0046503","glycerolipid catabolic process",0.067,1.7902,0.800,0.441,"mRNA splicing, via spliceosome"),
c("GO:0006102","isocitrate metabolic process",0.027,1.6482,0.863,0.450,"mRNA splicing, via spliceosome"),
c("GO:0032506","cytokinetic process",0.023,1.6523,0.808,0.458,"mRNA splicing, via spliceosome"),
c("GO:0008612","peptidyl-lysine modification to peptidyl-hypusine",0.030,1.4451,0.814,0.471,"mRNA splicing, via spliceosome"),
c("GO:0046519","sphingoid metabolic process",0.021,1.4304,0.830,0.474,"mRNA splicing, via spliceosome"),
c("GO:0051973","positive regulation of telomerase activity",0.006,1.6482,0.731,0.477,"mRNA splicing, via spliceosome"),
c("GO:0046034","ATP metabolic process",5.499,1.6469,0.738,0.486,"mRNA splicing, via spliceosome"),
c("GO:0044267","cellular protein metabolic process",12.981,1.4604,0.727,0.498,"mRNA splicing, via spliceosome"),
c("GO:0010216","maintenance of DNA methylation",0.013,1.6482,0.793,0.505,"mRNA splicing, via spliceosome"),
c("GO:0018198","peptidyl-cysteine modification",0.089,1.8918,0.800,0.507,"mRNA splicing, via spliceosome"),
c("GO:1901148","gene expression involved in extracellular matrix organization",0.008,1.9307,0.784,0.517,"mRNA splicing, via spliceosome"),
c("GO:0006417","regulation of translation",0.516,1.7713,0.688,0.525,"mRNA splicing, via spliceosome"),
c("GO:0071156","regulation of cell cycle arrest",0.201,3.3665,0.719,0.532,"mRNA splicing, via spliceosome"),
c("GO:0006970","response to osmotic stress",0.203,1.3079,0.925,0.536,"mRNA splicing, via spliceosome"),
c("GO:0006271","DNA strand elongation involved in DNA replication",0.041,2.4660,0.756,0.555,"mRNA splicing, via spliceosome"),
c("GO:0046516","hypusine metabolic process",0.051,1.4451,0.828,0.556,"mRNA splicing, via spliceosome"),
c("GO:0022616","DNA strand elongation",0.044,2.9245,0.776,0.559,"mRNA splicing, via spliceosome"),
c("GO:0006312","mitotic recombination",0.049,1.9523,0.774,0.563,"mRNA splicing, via spliceosome"),
c("GO:0015074","DNA integration",0.063,1.9416,0.771,0.575,"mRNA splicing, via spliceosome"),
c("GO:0007051","spindle organization",0.229,1.8435,0.646,0.580,"mRNA splicing, via spliceosome"),
c("GO:0033554","cellular response to stress",3.483,1.4295,0.851,0.603,"mRNA splicing, via spliceosome"),
c("GO:0044786","cell cycle DNA replication",0.059,2.2916,0.628,0.609,"mRNA splicing, via spliceosome"),
c("GO:0033260","nuclear cell cycle DNA replication",0.043,2.2381,0.634,0.611,"mRNA splicing, via spliceosome"),
c("GO:0006297","nucleotide-excision repair, DNA gap filling",0.025,1.5348,0.715,0.614,"mRNA splicing, via spliceosome"),
c("GO:0009057","macromolecule catabolic process",2.264,2.5969,0.784,0.619,"mRNA splicing, via spliceosome"),
c("GO:0000723","telomere maintenance",0.152,2.0947,0.619,0.622,"mRNA splicing, via spliceosome"),
c("GO:0090304","nucleic acid metabolic process",15.268,2.9747,0.741,0.636,"mRNA splicing, via spliceosome"),
c("GO:0007020","microtubule nucleation",0.027,1.5348,0.791,0.638,"mRNA splicing, via spliceosome"),
c("GO:0000209","protein polyubiquitination",0.252,2.9172,0.763,0.649,"mRNA splicing, via spliceosome"),
c("GO:0006303","double-strand break repair via nonhomologous end joining",0.054,2.0044,0.702,0.653,"mRNA splicing, via spliceosome"),
c("GO:0000726","non-recombinational repair",0.057,1.8918,0.701,0.656,"mRNA splicing, via spliceosome"),
c("GO:0018963","phthalate metabolic process",0.023,1.9307,0.841,0.658,"mRNA splicing, via spliceosome"),
c("GO:0070646","protein modification by small protein removal",0.157,1.8300,0.773,0.660,"mRNA splicing, via spliceosome"),
c("GO:0006323","DNA packaging",0.361,2.1630,0.654,0.677,"mRNA splicing, via spliceosome"),
c("GO:0045948","positive regulation of translational initiation",0.018,1.4451,0.739,0.683,"mRNA splicing, via spliceosome"),
c("GO:0045786","negative regulation of cell cycle",0.700,2.6968,0.714,0.691,"mRNA splicing, via spliceosome"),
c("GO:0044772","mitotic cell cycle phase transition",0.830,4.0177,0.721,0.692,"mRNA splicing, via spliceosome"),
c("GO:0031123","RNA 3'-end processing",0.197,2.0424,0.762,0.692,"mRNA splicing, via spliceosome"),
c("GO:0006261","DNA-dependent DNA replication",0.272,1.9431,0.730,0.696,"mRNA splicing, via spliceosome"),
c("GO:0034641","cellular nitrogen compound metabolic process",25.263,2.8297,0.773,0.697,"mRNA splicing, via spliceosome"),
c("GO:0002479","antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-dependent",0.161,2.4672,0.975,0.000,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-dependent"),
c("GO:0019884","antigen processing and presentation of exogenous antigen",0.303,1.8130,0.985,0.172,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-dependent"),
c("GO:0002474","antigen processing and presentation of peptide antigen via MHC class I",19.037,2.4271,0.978,0.330,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-dependent"),
c("GO:0019882","antigen processing and presentation",24.721,1.7894,0.981,0.567,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-dependent"),
c("GO:0048002","antigen processing and presentation of peptide antigen",19.164,1.8564,0.980,0.635,"antigen processing and presentation of exogenous peptide antigen via MHC class I, TAP-dependent"),
c("GO:0035962","response to interleukin-13",0.007,1.9307,0.981,0.000,"response to interleukin-13"),
c("GO:0043902","positive regulation of multi-organism process",0.101,2.7670,0.913,0.000,"positive regulation of multi-organism process"),
c("GO:0016032","viral process",0.955,2.7570,0.878,0.516,"positive regulation of multi-organism process"),
c("GO:0039656","modulation by virus of host gene expression",0.006,2.3893,0.784,0.636,"positive regulation of multi-organism process"),
c("GO:0044419","interspecies interaction between organisms",1.105,2.8386,0.949,0.651,"positive regulation of multi-organism process"),
c("GO:0044764","multi-organism cellular process",0.977,2.6716,0.895,0.652,"positive regulation of multi-organism process"),
c("GO:0075713","establishment of integrated proviral latency",0.009,2.3468,0.907,0.657,"positive regulation of multi-organism process"),
c("GO:0019042","viral latency",0.014,1.7865,0.908,0.677,"positive regulation of multi-organism process"),
c("GO:0051668","localization within membrane",0.075,2.2284,0.969,0.000,"localization within membrane"),
c("GO:0031623","receptor internalization",0.112,2.0915,0.796,0.193,"localization within membrane"),
c("GO:0015874","norepinephrine transport",0.042,1.9416,0.958,0.237,"localization within membrane"),
c("GO:0000041","transition metal ion transport",0.287,1.9208,0.965,0.273,"localization within membrane"),
c("GO:0051205","protein insertion into membrane",0.066,1.9747,0.852,0.360,"localization within membrane"),
c("GO:0048193","Golgi vesicle transport",0.508,2.0283,0.944,0.548,"localization within membrane"),
c("GO:0001845","phagolysosome assembly",0.021,1.4451,0.810,0.548,"localization within membrane"),
c("GO:0015837","amine transport",0.162,1.7902,0.957,0.548,"localization within membrane"),
c("GO:0071816","tail-anchored membrane protein insertion into ER membrane",0.011,1.9307,0.817,0.639,"localization within membrane"),
c("GO:0046907","intracellular transport",3.541,1.4359,0.959,0.640,"localization within membrane"),
c("GO:0006898","receptor-mediated endocytosis",0.534,1.4504,0.965,0.696,"localization within membrane"),
c("GO:0051704","multi-organism process",4.431,2.1612,0.994,0.000,"multi-organism process"),
c("GO:0071840","cellular component organization or biogenesis",12.603,1.3266,0.994,0.000,"cellular component organization or biogenesis"),
c("GO:0010025","wax biosynthetic process",0.003,2.3893,0.939,0.035,"wax biosynthesis"),
c("GO:0006094","gluconeogenesis",0.180,1.9303,0.847,0.162,"wax biosynthesis"),
c("GO:0016052","carbohydrate catabolic process",0.480,1.4783,0.835,0.581,"wax biosynthesis"),
c("GO:0006096","glycolytic process",0.309,1.5441,0.771,0.636,"wax biosynthesis"),
c("GO:0010166","wax metabolic process",0.003,2.3893,0.958,0.035,"wax metabolism"),
c("GO:0051276","chromosome organization",2.327,4.7696,0.773,0.045,"chromosome organization"),
c("GO:0060155","platelet dense granule organization",0.013,1.4451,0.842,0.387,"chromosome organization"),
c("GO:0071824","protein-DNA complex subunit organization",0.357,4.0862,0.840,0.390,"chromosome organization"),
c("GO:0034389","lipid particle organization",0.017,1.4451,0.843,0.397,"chromosome organization"),
c("GO:0010256","endomembrane system organization",0.734,1.7828,0.864,0.422,"chromosome organization"),
c("GO:0070584","mitochondrion morphogenesis",0.046,1.3371,0.801,0.431,"chromosome organization"),
c("GO:0061024","membrane organization",1.629,1.4324,0.854,0.465,"chromosome organization"),
c("GO:0022618","ribonucleoprotein complex assembly",0.317,3.6021,0.821,0.489,"chromosome organization"),
c("GO:0071826","ribonucleoprotein complex subunit organization",0.332,3.2757,0.841,0.491,"chromosome organization"),
c("GO:0031032","actomyosin structure organization",0.206,1.9055,0.787,0.496,"chromosome organization"),
c("GO:0034728","nucleosome organization",0.259,4.4815,0.762,0.508,"chromosome organization"),
c("GO:2000251","positive regulation of actin cytoskeleton reorganization",0.014,1.4451,0.768,0.552,"chromosome organization"),
c("GO:0016578","histone deubiquitination",0.023,1.8918,0.661,0.553,"chromosome organization"),
c("GO:0006996","organelle organization",7.033,3.8539,0.779,0.571,"chromosome organization"),
c("GO:0070925","organelle assembly",0.934,1.6821,0.779,0.585,"chromosome organization"),
c("GO:0022613","ribonucleoprotein complex biogenesis",0.598,1.3880,0.852,0.587,"chromosome organization"),
c("GO:0032200","telomere organization",0.157,2.5901,0.795,0.592,"chromosome organization"),
c("GO:0007029","endoplasmic reticulum organization",0.071,1.3813,0.823,0.601,"chromosome organization"),
c("GO:0043044","ATP-dependent chromatin remodeling",0.079,1.9523,0.789,0.606,"chromosome organization"),
c("GO:0051568","histone H3-K4 methylation",0.085,1.4012,0.650,0.609,"chromosome organization"),
c("GO:0043933","macromolecular complex subunit organization",5.276,2.9957,0.837,0.654,"chromosome organization"),
c("GO:0031056","regulation of histone modification",0.236,2.0600,0.570,0.661,"chromosome organization"),
c("GO:0034622","cellular macromolecular complex assembly",1.656,3.0362,0.807,0.691,"chromosome organization"),
c("GO:0000354","cis assembly of pre-catalytic spliceosome",0.002,2.3893,0.720,0.692,"chromosome organization"),
c("GO:0007049","cell cycle",3.703,3.9208,0.895,0.059,"cell cycle"),
c("GO:0009056","catabolic process",7.851,2.4401,0.925,0.068,"catabolism"),
c("GO:0006044","N-acetylglucosamine metabolic process",0.040,1.6523,0.922,0.073,"N-acetylglucosamine metabolism"),
c("GO:0009404","toxin metabolic process",0.038,2.3468,0.875,0.077,"toxin metabolism"),
c("GO:0031424","keratinization",0.067,1.7902,0.901,0.082,"keratinization"),
c("GO:2000015","regulation of determination of dorsal identity",0.014,1.6482,0.932,0.240,"keratinization"),
c("GO:0006941","striated muscle contraction",0.336,1.4751,0.953,0.247,"keratinization"),
c("GO:0032909","regulation of transforming growth factor beta2 production",0.013,1.4451,0.935,0.306,"keratinization"),
c("GO:0045653","negative regulation of megakaryocyte differentiation",0.007,1.4451,0.843,0.351,"keratinization"),
c("GO:0008016","regulation of heart contraction",0.397,1.4167,0.919,0.539,"keratinization"),
c("GO:0032651","regulation of interleukin-1 beta production",0.082,1.3813,0.929,0.554,"keratinization"),
c("GO:0048262","determination of dorsal/ventral asymmetry",0.019,1.4451,0.958,0.693,"keratinization"),
c("GO:0072331","signal transduction by p53 class mediator",0.265,1.4695,0.839,0.094,"signal transduction by p53 class mediator"),
c("GO:0007059","chromosome segregation",0.438,1.5952,0.913,0.099,"chromosome segregation"));

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
