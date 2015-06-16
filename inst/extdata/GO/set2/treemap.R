

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
revigo.data <- rbind(c("GO:0000184","nuclear-transcribed mRNA catabolic process, nonsense-mediated decay",0.142,11.5376,0.779,0.000,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0022904","respiratory electron transport chain",4.683,2.1107,0.811,0.104,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0032799","low-density lipoprotein receptor particle metabolic process",0.016,1.3721,0.897,0.132,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0007049","cell cycle",3.703,1.3315,0.900,0.136,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0018196","peptidyl-asparagine modification",0.114,2.1152,0.851,0.152,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0072528","pyrimidine-containing compound biosynthetic process",0.130,3.3372,0.786,0.159,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0006091","generation of precursor metabolites and energy",6.571,3.3768,0.877,0.173,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0009147","pyrimidine nucleoside triphosphate metabolic process",0.090,1.9602,0.824,0.194,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0019748","secondary metabolic process",0.100,1.4002,0.913,0.196,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0019538","protein metabolic process",17.009,2.9872,0.859,0.204,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0044237","cellular metabolic process",42.121,1.8668,0.891,0.207,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0006958","complement activation, classical pathway",0.215,1.4084,0.815,0.228,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0000724","double-strand break repair via homologous recombination",0.136,1.4535,0.766,0.242,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0006359","regulation of transcription from RNA polymerase III promoter",0.033,1.6979,0.794,0.246,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:1901564","organonitrogen compound metabolic process",11.844,1.4370,0.857,0.248,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0006521","regulation of cellular amino acid metabolic process",0.082,2.6003,0.762,0.274,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0019083","viral transcription",0.174,10.7696,0.796,0.277,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0042180","cellular ketone metabolic process",0.444,1.5078,0.832,0.278,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0009129","pyrimidine nucleoside monophosphate metabolic process",0.033,1.6710,0.835,0.286,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0072527","pyrimidine-containing compound metabolic process",0.235,1.8413,0.850,0.296,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0072524","pyridine-containing compound metabolic process",0.204,1.4535,0.851,0.307,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0016115","terpenoid catabolic process",0.007,1.5177,0.843,0.310,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0009208","pyrimidine ribonucleoside triphosphate metabolic process",0.065,1.5315,0.808,0.320,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0006518","peptide metabolic process",0.350,1.7082,0.845,0.321,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0016071","mRNA metabolic process",1.098,7.1675,0.818,0.329,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0055114","oxidation-reduction process",10.933,3.3979,0.868,0.370,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0072361","regulation of glycolytic process by regulation of transcription from RNA polymerase II promoter",0.002,1.9638,0.763,0.387,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0044281","small molecule metabolic process",13.539,1.3220,0.864,0.464,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0009057","macromolecule catabolic process",2.264,5.6021,0.818,0.468,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0044033","multi-organism metabolic process",0.213,9.4318,0.931,0.476,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0019359","nicotinamide nucleotide biosynthetic process",0.066,2.4815,0.773,0.490,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0009130","pyrimidine nucleoside monophosphate biosynthetic process",0.032,1.8306,0.806,0.492,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0006914","autophagy",0.414,3.0605,0.840,0.506,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0006183","GTP biosynthetic process",0.050,1.5418,0.779,0.508,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0009157","deoxyribonucleoside monophosphate biosynthetic process",0.024,1.5177,0.809,0.509,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0043648","dicarboxylic acid metabolic process",0.213,2.4647,0.837,0.519,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0006516","glycoprotein catabolic process",0.018,2.2336,0.801,0.522,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0044764","multi-organism cellular process",0.977,5.3468,0.920,0.553,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:1901070","guanosine-containing compound biosynthetic process",0.066,1.6710,0.783,0.560,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0031145","anaphase-promoting complex-dependent proteasomal ubiquitin-dependent protein catabolic process",0.103,3.9586,0.791,0.589,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0018279","protein N-linked glycosylation via asparagine",0.113,1.8119,0.771,0.603,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0006112","energy reserve metabolic process",0.325,1.5099,0.852,0.607,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0006401","RNA catabolic process",0.316,8.4685,0.768,0.643,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0044419","interspecies interaction between organisms",1.105,4.9208,0.967,0.652,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0044598","doxorubicin metabolic process",0.009,2.4976,0.828,0.657,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0032918","spermidine acetylation",0.005,1.9638,0.874,0.661,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0006520","cellular amino acid metabolic process",1.579,1.5496,0.782,0.669,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0009165","nucleotide biosynthetic process",2.080,1.6156,0.735,0.675,"nuclear-transcribed mRNA catabolism, nonsense-mediated decay"),
c("GO:0002478","antigen processing and presentation of exogenous peptide antigen",0.296,3.7447,0.966,0.000,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0002476","antigen processing and presentation of endogenous peptide antigen via MHC class Ib",0.005,1.9638,0.978,0.169,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0019884","antigen processing and presentation of exogenous antigen",0.303,3.6383,0.980,0.181,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0002495","antigen processing and presentation of peptide antigen via MHC class II",0.134,1.6094,0.978,0.215,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0002504","antigen processing and presentation of peptide or polysaccharide antigen via MHC class II",4.627,1.5621,0.975,0.237,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0002474","antigen processing and presentation of peptide antigen via MHC class I",19.037,4.0000,0.970,0.445,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0019882","antigen processing and presentation",24.721,2.8601,0.975,0.567,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0048002","antigen processing and presentation of peptide antigen",19.164,3.8239,0.972,0.635,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0006614","SRP-dependent cotranslational protein targeting to membrane",0.150,18.4559,0.759,0.000,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:2000251","positive regulation of actin cytoskeleton reorganization",0.014,2.0164,0.798,0.238,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0042274","ribosomal small subunit biogenesis",0.033,3.0969,0.888,0.249,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0060155","platelet dense granule organization",0.013,2.0164,0.864,0.276,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0006415","translational termination",0.130,16.0177,0.709,0.278,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0016192","vesicle-mediated transport",3.273,1.7572,0.898,0.305,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0072367","regulation of lipid transport by regulation of transcription from RNA polymerase II promoter",0.005,2.3788,0.752,0.329,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0006412","translation",1.984,7.2840,0.791,0.336,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0061024","membrane organization",1.629,7.3665,0.873,0.345,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:2000369","regulation of clathrin-mediated endocytosis",0.014,2.0164,0.780,0.352,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0043687","post-translational protein modification",0.259,2.7570,0.845,0.360,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0016050","vesicle organization",0.329,1.4291,0.840,0.372,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0051668","localization within membrane",0.075,1.6035,0.901,0.381,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0010621","negative regulation of transcription by transcription factor localization",0.003,1.5177,0.715,0.400,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0043044","ATP-dependent chromatin remodeling",0.079,2.2596,0.832,0.404,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0022411","cellular component disassembly",0.713,5.9208,0.819,0.404,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0006903","vesicle targeting",0.072,1.4303,0.826,0.410,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0070647","protein modification by small protein conjugation or removal",1.542,1.3685,0.820,0.439,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:1902600","hydrogen ion transmembrane transport",3.156,1.5539,0.811,0.441,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0070271","protein complex biogenesis",2.588,1.9252,0.850,0.493,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0044267","cellular protein metabolic process",12.981,5.0969,0.795,0.493,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:1902578","single-organism localization",14.013,7.5528,0.869,0.501,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0051784","negative regulation of nuclear division",0.112,1.4688,0.735,0.503,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0016973","poly(A)+ mRNA export from nucleus",0.017,1.3721,0.810,0.542,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0070836","caveola assembly",0.013,1.5177,0.872,0.546,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0071822","protein complex subunit organization",3.467,5.8861,0.838,0.557,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0033036","macromolecule localization",5.646,5.4089,0.899,0.558,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0071702","organic substance transport",5.810,4.0915,0.891,0.561,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0044085","cellular component biogenesis",4.871,1.3067,0.860,0.567,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0051641","cellular localization",6.184,4.7212,0.898,0.568,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0006610","ribosomal protein import into nucleus",0.011,1.5177,0.874,0.592,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0008053","mitochondrial fusion",0.043,1.9602,0.820,0.593,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0034728","nucleosome organization",0.259,1.5161,0.811,0.606,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0043933","macromolecular complex subunit organization",5.276,6.0506,0.858,0.607,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0072369","regulation of lipid transport by positive regulation of transcription from RNA polymerase II promoter",0.002,1.9638,0.756,0.618,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0030041","actin filament polymerization",0.348,2.6925,0.771,0.618,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0006414","translational elongation",0.313,15.6778,0.817,0.619,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0071824","protein-DNA complex subunit organization",0.357,1.4812,0.868,0.619,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:1902582","single-organism intracellular transport",2.514,8.7447,0.837,0.633,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:2000425","regulation of apoptotic cell clearance",0.017,1.5177,0.775,0.638,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0015031","protein transport",3.600,7.3372,0.858,0.641,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0043254","regulation of protein complex assembly",0.549,1.4488,0.806,0.655,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0006888","ER to Golgi vesicle-mediated transport",0.221,2.1739,0.853,0.658,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0006333","chromatin assembly or disassembly",0.277,1.3643,0.817,0.670,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:1902580","single-organism cellular localization",1.731,7.5528,0.854,0.675,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0070972","protein localization to endoplasmic reticulum",0.196,17.2596,0.873,0.677,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0000028","ribosomal small subunit assembly",0.016,2.2336,0.844,0.682,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0006413","translational initiation",0.465,11.7696,0.811,0.690,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:1902591","single-organism membrane budding",0.063,1.4807,0.755,0.696,"SRP-dependent cotranslational protein targeting to membrane"),
c("GO:0033762","response to glucagon",0.088,2.4168,0.941,0.000,"response to glucagon"),
c("GO:2001023","regulation of response to drug",0.007,1.5177,0.935,0.268,"response to glucagon"),
c("GO:1990267","response to transition metal nanoparticle",0.273,1.5123,0.949,0.345,"response to glucagon"),
c("GO:0010035","response to inorganic substance",1.004,1.3389,0.944,0.425,"response to glucagon"),
c("GO:0071395","cellular response to jasmonic acid stimulus",0.005,2.3788,0.897,0.432,"response to glucagon"),
c("GO:2001038","regulation of cellular response to drug",0.003,1.5177,0.882,0.442,"response to glucagon"),
c("GO:0042744","hydrogen peroxide catabolic process",0.034,1.9602,0.754,0.450,"response to glucagon"),
c("GO:0009753","response to jasmonic acid",0.005,2.3788,0.945,0.491,"response to glucagon"),
c("GO:0034694","response to prostaglandin",0.036,2.2857,0.934,0.548,"response to glucagon"),
c("GO:0071377","cellular response to glucagon stimulus",0.058,2.1421,0.886,0.634,"response to glucagon"),
c("GO:0010038","response to metal ion",0.636,1.5053,0.942,0.699,"response to glucagon"),
c("GO:0044699","single-organism process",71.655,1.6842,0.998,0.000,"single-organism process"),
c("GO:0051179","localization",18.927,2.7620,0.995,0.000,"localization"),
c("GO:0051704","multi-organism process",4.431,2.6676,0.994,0.000,"multi-organism process"),
c("GO:0071840","cellular component organization or biogenesis",12.603,3.6021,0.995,0.000,"cellular component organization or biogenesis"),
c("GO:0070488","neutrophil aggregation",0.002,1.9638,0.984,0.011,"neutrophil aggregation"),
c("GO:0009838","abscission",0.007,1.9638,0.978,0.012,"abscission"),
c("GO:0010988","regulation of low-density lipoprotein particle clearance",0.016,1.5177,0.958,0.175,"abscission"),
c("GO:0014904","myotube cell development",0.187,1.6035,0.918,0.224,"abscission"),
c("GO:0060011","Sertoli cell proliferation",0.018,1.5177,0.929,0.257,"abscission"),
c("GO:0048668","collateral sprouting",0.038,1.4084,0.850,0.407,"abscission"),
c("GO:0051340","regulation of ligase activity",0.133,4.4202,0.884,0.041,"regulation of ligase activity"),
c("GO:0031648","protein destabilization",0.034,2.3925,0.853,0.195,"regulation of ligase activity"),
c("GO:0033484","nitric oxide homeostasis",0.005,1.9638,0.953,0.269,"regulation of ligase activity"),
c("GO:0051881","regulation of mitochondrial membrane potential",0.095,1.5777,0.943,0.324,"regulation of ligase activity"),
c("GO:0050999","regulation of nitric-oxide synthase activity",0.060,1.5777,0.890,0.398,"regulation of ligase activity"),
c("GO:0051436","negative regulation of ubiquitin-protein ligase activity involved in mitotic cell cycle",0.076,4.4318,0.656,0.404,"regulation of ligase activity"),
c("GO:0045454","cell redox homeostasis",0.245,1.8729,0.860,0.415,"regulation of ligase activity"),
c("GO:0051341","regulation of oxidoreductase activity",0.137,1.5029,0.884,0.422,"regulation of ligase activity"),
c("GO:0006342","chromatin silencing",0.063,1.4002,0.741,0.438,"regulation of ligase activity"),
c("GO:0051235","maintenance of location",0.656,1.5038,0.868,0.439,"regulation of ligase activity"),
c("GO:0010507","negative regulation of autophagy",0.068,2.5575,0.756,0.440,"regulation of ligase activity"),
c("GO:2000104","negative regulation of DNA-dependent DNA replication",0.026,1.3721,0.765,0.466,"regulation of ligase activity"),
c("GO:0052548","regulation of endopeptidase activity",0.736,1.6929,0.791,0.493,"regulation of ligase activity"),
c("GO:0043666","regulation of phosphoprotein phosphatase activity",0.051,1.5667,0.826,0.541,"regulation of ligase activity"),
c("GO:0044770","cell cycle phase transition",0.847,2.5935,0.792,0.596,"regulation of ligase activity"),
c("GO:0051900","regulation of mitochondrial depolarization",0.028,1.5418,0.889,0.602,"regulation of ligase activity"),
c("GO:1902402","signal transduction involved in mitotic DNA damage checkpoint",0.111,2.5952,0.695,0.615,"regulation of ligase activity"),
c("GO:1902083","negative regulation of peptidyl-cysteine S-nitrosylation",0.063,1.5177,0.756,0.647,"regulation of ligase activity"),
c("GO:0071158","positive regulation of cell cycle arrest",0.133,1.7600,0.749,0.664,"regulation of ligase activity"),
c("GO:0043086","negative regulation of catalytic activity",1.481,1.7760,0.858,0.681,"regulation of ligase activity"),
c("GO:2000270","negative regulation of fibroblast apoptotic process",0.019,2.4976,0.852,0.046,"negative regulation of fibroblast apoptotic process"),
c("GO:0007191","adenylate cyclase-activating dopamine receptor signaling pathway",0.032,2.3788,0.864,0.106,"negative regulation of fibroblast apoptotic process"),
c("GO:0090092","regulation of transmembrane receptor protein serine/threonine kinase signaling pathway",0.472,2.3098,0.828,0.328,"negative regulation of fibroblast apoptotic process"),
c("GO:0032487","regulation of Rap protein signal transduction",0.043,1.8306,0.854,0.407,"negative regulation of fibroblast apoptotic process"),
c("GO:0007212","dopamine receptor signaling pathway",0.100,2.1062,0.856,0.437,"negative regulation of fibroblast apoptotic process"),
c("GO:0032486","Rap protein signal transduction",0.051,1.6979,0.859,0.535,"negative regulation of fibroblast apoptotic process"),
c("GO:0010332","response to gamma radiation",0.131,2.0057,0.974,0.058,"response to gamma radiation"),
c("GO:0071257","cellular response to electrical stimulus",0.024,1.5418,0.920,0.494,"response to gamma radiation"),
c("GO:0009056","catabolic process",7.851,4.8239,0.936,0.060,"catabolism"),
c("GO:0031667","response to nutrient levels",1.049,1.9987,0.946,0.071,"response to nutrient levels"),
c("GO:0050690","regulation of defense response to virus by virus",0.033,1.6592,0.890,0.473,"response to nutrient levels"),
c("GO:0009991","response to extracellular stimulus",1.114,1.5678,0.953,0.656,"response to nutrient levels"),
c("GO:0006040","amino sugar metabolic process",0.107,1.3249,0.907,0.072,"amino sugar metabolism"));

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
