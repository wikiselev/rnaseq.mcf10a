

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
revigo.data <- rbind(c("GO:0002478","antigen processing and presentation of exogenous peptide antigen",0.296,2.4237,0.973,0.000,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0019884","antigen processing and presentation of exogenous antigen",0.303,2.6635,0.979,0.181,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0002495","antigen processing and presentation of peptide antigen via MHC class II",0.134,1.6706,0.977,0.215,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0002504","antigen processing and presentation of peptide or polysaccharide antigen via MHC class II",4.627,1.6225,0.975,0.237,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0019882","antigen processing and presentation",24.721,2.6778,0.974,0.387,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0048002","antigen processing and presentation of peptide antigen",19.164,2.2255,0.972,0.568,"antigen processing and presentation of exogenous peptide antigen"),
c("GO:0006396","RNA processing",1.631,11.3372,0.679,0.000,"RNA processing"),
c("GO:0044238","primary metabolic process",41.881,4.4685,0.865,0.109,"RNA processing"),
c("GO:1901135","carbohydrate derivative metabolic process",10.573,1.3551,0.829,0.175,"RNA processing"),
c("GO:0032069","regulation of nuclease activity",0.083,4.2147,0.752,0.191,"RNA processing"),
c("GO:0006457","protein folding",0.724,4.7959,0.773,0.224,"RNA processing"),
c("GO:0006807","nitrogen compound metabolic process",26.566,4.4685,0.876,0.248,"RNA processing"),
c("GO:0035247","peptidyl-arginine omega-N-methylation",0.009,2.5287,0.796,0.250,"RNA processing"),
c("GO:0006265","DNA topological change",0.076,1.5638,0.760,0.282,"RNA processing"),
c("GO:0009207","purine ribonucleoside triphosphate catabolic process",3.700,2.7011,0.570,0.289,"RNA processing"),
c("GO:0008334","histone mRNA metabolic process",0.034,2.5686,0.753,0.296,"RNA processing"),
c("GO:0061077","chaperone-mediated protein folding",0.109,3.1308,0.799,0.302,"RNA processing"),
c("GO:0006369","termination of RNA polymerase II transcription",0.054,3.9586,0.738,0.307,"RNA processing"),
c("GO:0044260","cellular macromolecule metabolic process",25.627,6.9586,0.719,0.309,"RNA processing"),
c("GO:0006662","glycerol ether metabolic process",0.042,1.7310,0.829,0.312,"RNA processing"),
c("GO:0018904","ether metabolic process",0.043,1.7310,0.829,0.313,"RNA processing"),
c("GO:0006360","transcription from RNA polymerase I promoter",0.067,1.8791,0.743,0.313,"RNA processing"),
c("GO:0044237","cellular metabolic process",42.121,3.9586,0.851,0.314,"RNA processing"),
c("GO:1900121","negative regulation of receptor binding",0.008,1.5337,0.954,0.315,"RNA processing"),
c("GO:0046782","regulation of viral transcription",0.079,3.7959,0.685,0.318,"RNA processing"),
c("GO:0071704","organic substance metabolic process",42.826,3.7959,0.864,0.319,"RNA processing"),
c("GO:0006353","DNA-templated transcription, termination",0.101,5.8861,0.735,0.325,"RNA processing"),
c("GO:0006354","DNA-templated transcription, elongation",0.203,3.6576,0.721,0.347,"RNA processing"),
c("GO:1901360","organic cyclic compound metabolic process",25.430,5.7959,0.803,0.355,"RNA processing"),
c("GO:0010608","posttranscriptional regulation of gene expression",0.840,1.7111,0.759,0.356,"RNA processing"),
c("GO:0009451","RNA modification",0.295,3.0088,0.712,0.360,"RNA processing"),
c("GO:0006207","'de novo' pyrimidine nucleobase biosynthetic process",0.021,1.5337,0.728,0.362,"RNA processing"),
c("GO:0009405","pathogenesis",0.009,1.5337,0.967,0.362,"RNA processing"),
c("GO:0046483","heterocycle metabolic process",24.799,6.4685,0.791,0.363,"RNA processing"),
c("GO:0006725","cellular aromatic compound metabolic process",24.907,6.2441,0.791,0.364,"RNA processing"),
c("GO:0043170","macromolecule metabolic process",29.866,5.4089,0.798,0.377,"RNA processing"),
c("GO:0043038","amino acid activation",0.286,1.3351,0.743,0.378,"RNA processing"),
c("GO:0034470","ncRNA processing",0.554,8.5686,0.645,0.384,"RNA processing"),
c("GO:0006412","translation",1.984,2.4535,0.709,0.402,"RNA processing"),
c("GO:0034660","ncRNA metabolic process",0.917,10.5229,0.704,0.406,"RNA processing"),
c("GO:0016071","mRNA metabolic process",1.098,5.2366,0.699,0.415,"RNA processing"),
c("GO:0006259","DNA metabolic process",3.159,1.7153,0.676,0.421,"RNA processing"),
c("GO:0009209","pyrimidine ribonucleoside triphosphate biosynthetic process",0.064,1.5589,0.708,0.432,"RNA processing"),
c("GO:0006368","transcription elongation from RNA polymerase II promoter",0.145,2.2757,0.720,0.441,"RNA processing"),
c("GO:0006139","nucleobase-containing compound metabolic process",24.258,6.7447,0.659,0.445,"RNA processing"),
c("GO:0009147","pyrimidine nucleoside triphosphate metabolic process",0.090,1.3245,0.735,0.445,"RNA processing"),
c("GO:0032801","receptor catabolic process",0.036,2.1487,0.776,0.446,"RNA processing"),
c("GO:0018279","protein N-linked glycosylation via asparagine",0.113,2.2480,0.698,0.450,"RNA processing"),
c("GO:0006488","dolichol-linked oligosaccharide biosynthetic process",0.039,1.6994,0.824,0.466,"RNA processing"),
c("GO:0045860","positive regulation of protein kinase activity",0.938,2.2741,0.647,0.474,"RNA processing"),
c("GO:0018195","peptidyl-arginine modification",0.026,1.6990,0.806,0.481,"RNA processing"),
c("GO:0030433","ER-associated ubiquitin-dependent protein catabolic process",0.058,1.5418,0.749,0.482,"RNA processing"),
c("GO:0018193","peptidyl-amino acid modification",2.453,1.4966,0.732,0.500,"RNA processing"),
c("GO:0044267","cellular protein metabolic process",12.981,1.6332,0.703,0.511,"RNA processing"),
c("GO:0010467","gene expression",15.379,4.3565,0.759,0.524,"RNA processing"),
c("GO:0018196","peptidyl-asparagine modification",0.114,2.1938,0.785,0.533,"RNA processing"),
c("GO:0034970","histone H3-R2 methylation",0.002,1.9801,0.763,0.539,"RNA processing"),
c("GO:0052312","modulation of transcription in other organism involved in symbiotic interaction",0.011,1.3245,0.721,0.549,"RNA processing"),
c("GO:0034645","cellular macromolecule biosynthetic process",14.343,1.9136,0.687,0.556,"RNA processing"),
c("GO:0018208","peptidyl-proline modification",0.207,1.5166,0.775,0.558,"RNA processing"),
c("GO:0033119","negative regulation of RNA splicing",0.023,1.5127,0.693,0.596,"RNA processing"),
c("GO:0006379","mRNA cleavage",0.025,1.8592,0.722,0.600,"RNA processing"),
c("GO:0016070","RNA metabolic process",12.843,4.2366,0.616,0.605,"RNA processing"),
c("GO:0034969","histone arginine methylation",0.021,2.2636,0.731,0.605,"RNA processing"),
c("GO:0030259","lipid glycosylation",0.011,1.5337,0.858,0.615,"RNA processing"),
c("GO:1901068","guanosine-containing compound metabolic process",2.687,1.9957,0.633,0.617,"RNA processing"),
c("GO:0009452","7-methylguanosine RNA capping",0.052,2.3054,0.711,0.635,"RNA processing"),
c("GO:0036260","RNA capping",0.052,2.3054,0.714,0.635,"RNA processing"),
c("GO:0090304","nucleic acid metabolic process",15.268,4.7696,0.655,0.636,"RNA processing"),
c("GO:2000645","negative regulation of receptor catabolic process",0.003,1.9801,0.774,0.640,"RNA processing"),
c("GO:0051338","regulation of transferase activity",1.829,1.4893,0.842,0.643,"RNA processing"),
c("GO:1901657","glycosyl compound metabolic process",8.489,1.6503,0.719,0.661,"RNA processing"),
c("GO:0043414","macromolecule methylation",0.645,1.3852,0.759,0.667,"RNA processing"),
c("GO:0031124","mRNA 3'-end processing",0.147,2.3045,0.685,0.691,"RNA processing"),
c("GO:0034641","cellular nitrogen compound metabolic process",25.263,5.0362,0.685,0.697,"RNA processing"),
c("GO:0006986","response to unfolded protein",0.189,4.4949,0.929,0.000,"response to unfolded protein"),
c("GO:0032057","negative regulation of translational initiation in response to stress",0.008,3.3010,0.724,0.293,"response to unfolded protein"),
c("GO:0009408","response to heat",0.148,1.8595,0.944,0.359,"response to unfolded protein"),
c("GO:0034976","response to endoplasmic reticulum stress",0.253,3.2366,0.883,0.420,"response to unfolded protein"),
c("GO:0035966","response to topologically incorrect protein",0.209,4.0177,0.944,0.422,"response to unfolded protein"),
c("GO:0033554","cellular response to stress",3.483,2.0022,0.869,0.492,"response to unfolded protein"),
c("GO:0070934","CRD-mediated mRNA stabilization",0.006,1.5337,0.808,0.493,"response to unfolded protein"),
c("GO:0050910","detection of mechanical stimulus involved in sensory perception of sound",0.027,1.5337,0.958,0.503,"response to unfolded protein"),
c("GO:0006284","base-excision repair",0.125,1.8791,0.702,0.512,"response to unfolded protein"),
c("GO:0006287","base-excision repair, gap-filling",0.011,1.5337,0.747,0.533,"response to unfolded protein"),
c("GO:0006446","regulation of translational initiation",0.145,2.5918,0.717,0.669,"response to unfolded protein"),
c("GO:0008152","metabolic process",54.733,3.0269,0.997,0.000,"metabolism"),
c("GO:0022613","ribonucleoprotein complex biogenesis",0.598,8.8239,0.913,0.000,"ribonucleoprotein complex biogenesis"),
c("GO:0097581","lamellipodium organization",0.122,1.7934,0.876,0.306,"ribonucleoprotein complex biogenesis"),
c("GO:0071826","ribonucleoprotein complex subunit organization",0.332,2.7077,0.926,0.334,"ribonucleoprotein complex biogenesis"),
c("GO:0007005","mitochondrion organization",0.649,2.3788,0.879,0.356,"ribonucleoprotein complex biogenesis"),
c("GO:0031247","actin rod assembly",0.002,1.9801,0.882,0.364,"ribonucleoprotein complex biogenesis"),
c("GO:0007029","endoplasmic reticulum organization",0.071,1.7964,0.894,0.402,"ribonucleoprotein complex biogenesis"),
c("GO:0043248","proteasome assembly",0.010,2.0400,0.921,0.402,"ribonucleoprotein complex biogenesis"),
c("GO:0097033","mitochondrial respiratory chain complex III biogenesis",0.016,1.9801,0.928,0.415,"ribonucleoprotein complex biogenesis"),
c("GO:0034551","mitochondrial respiratory chain complex III assembly",0.016,1.9801,0.871,0.502,"ribonucleoprotein complex biogenesis"),
c("GO:0030032","lamellipodium assembly",0.106,1.3303,0.858,0.516,"ribonucleoprotein complex biogenesis"),
c("GO:0042254","ribosome biogenesis",0.322,8.2147,0.890,0.530,"ribonucleoprotein complex biogenesis"),
c("GO:0090151","establishment of protein localization to mitochondrial membrane",0.010,1.5638,0.807,0.558,"ribonucleoprotein complex biogenesis"),
c("GO:0032543","mitochondrial translation",0.031,1.5127,0.708,0.595,"ribonucleoprotein complex biogenesis"),
c("GO:0007077","mitotic nuclear envelope disassembly",0.042,1.3592,0.877,0.649,"ribonucleoprotein complex biogenesis"),
c("GO:0000463","maturation of LSU-rRNA from tricistronic rRNA transcript (SSU-rRNA, 5.8S rRNA, LSU-rRNA)",0.013,1.5337,0.681,0.691,"ribonucleoprotein complex biogenesis"),
c("GO:0051028","mRNA transport",0.204,5.6198,0.886,0.000,"mRNA transport"),
c("GO:0010764","negative regulation of fibroblast migration",0.021,2.9706,0.843,0.184,"mRNA transport"),
c("GO:0051168","nuclear export",0.246,4.2518,0.883,0.248,"mRNA transport"),
c("GO:0071705","nitrogen compound transport",1.894,1.8989,0.916,0.304,"mRNA transport"),
c("GO:0043314","negative regulation of neutrophil degranulation",0.008,1.9801,0.808,0.357,"mRNA transport"),
c("GO:0072655","establishment of protein localization to mitochondrion",0.141,2.5719,0.887,0.425,"mRNA transport"),
c("GO:0071702","organic substance transport",5.810,1.4807,0.907,0.445,"mRNA transport"),
c("GO:0006403","RNA localization",0.263,5.8539,0.915,0.447,"mRNA transport"),
c("GO:0047496","vesicle transport along microtubule",0.059,1.8564,0.834,0.480,"mRNA transport"),
c("GO:0035437","maintenance of protein localization in endoplasmic reticulum",0.017,1.3936,0.834,0.565,"mRNA transport"),
c("GO:0032066","nucleolus to nucleoplasm transport",0.003,1.9801,0.904,0.583,"mRNA transport"),
c("GO:0045022","early endosome to late endosome transport",0.041,1.4171,0.889,0.596,"mRNA transport"),
c("GO:0016482","cytoplasmic transport",1.537,3.3872,0.876,0.633,"mRNA transport"),
c("GO:0015031","protein transport",3.600,1.3609,0.882,0.637,"mRNA transport"),
c("GO:0015931","nucleobase-containing compound transport",0.319,4.6990,0.908,0.652,"mRNA transport"),
c("GO:0010761","fibroblast migration",0.073,1.5127,0.869,0.657,"mRNA transport"),
c("GO:0070585","protein localization to mitochondrion",0.147,2.5719,0.891,0.658,"mRNA transport"),
c("GO:0006888","ER to Golgi vesicle-mediated transport",0.221,1.3303,0.875,0.678,"mRNA transport"),
c("GO:0015785","UDP-galactose transport",0.003,1.9801,0.914,0.695,"mRNA transport"),
c("GO:0060717","chorion development",0.011,2.0400,0.967,0.000,"chorion development"),
c("GO:0060718","chorionic trophoblast cell differentiation",0.010,1.5337,0.919,0.209,"chorion development"),
c("GO:0021796","cerebral cortex regionalization",0.014,1.9801,0.961,0.213,"chorion development"),
c("GO:0060033","anatomical structure regression",0.032,1.5638,0.966,0.225,"chorion development"),
c("GO:0048066","developmental pigmentation",0.124,1.3592,0.964,0.241,"chorion development"),
c("GO:0060711","labyrinthine layer development",0.120,1.6482,0.947,0.309,"chorion development"),
c("GO:0007538","primary sex determination",0.006,1.5337,0.960,0.485,"chorion development"),
c("GO:0048709","oligodendrocyte differentiation",0.234,1.4427,0.895,0.497,"chorion development"),
c("GO:0001833","inner cell mass cell proliferation",0.038,1.3936,0.955,0.603,"chorion development"),
c("GO:0006882","cellular zinc ion homeostasis",0.028,1.5589,0.908,0.034,"cellular zinc ion homeostasis"),
c("GO:0003056","regulation of vascular smooth muscle contraction",0.014,1.5337,0.943,0.284,"cellular zinc ion homeostasis"),
c("GO:0055069","zinc ion homeostasis",0.031,1.4350,0.960,0.699,"cellular zinc ion homeostasis"),
c("GO:0006984","ER-nucleus signaling pathway",0.141,3.8539,0.878,0.062,"ER-nucleus signaling pathway"),
c("GO:0042921","glucocorticoid receptor signaling pathway",0.044,1.5638,0.887,0.215,"ER-nucleus signaling pathway"),
c("GO:2001044","regulation of integrin-mediated signaling pathway",0.056,1.5638,0.882,0.219,"ER-nucleus signaling pathway"),
c("GO:0042058","regulation of epidermal growth factor receptor signaling pathway",0.131,1.5555,0.871,0.377,"ER-nucleus signaling pathway"),
c("GO:0032259","methylation",1.044,1.3545,0.919,0.063,"methylation"));

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
