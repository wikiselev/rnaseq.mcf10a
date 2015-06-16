

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
revigo.data <- rbind(c("GO:0007160","cell-matrix adhesion",0.605,2.7305,0.916,0.000,"cell-matrix adhesion"),
c("GO:0033629","negative regulation of cell adhesion mediated by integrin",0.013,1.4907,0.813,0.492,"cell-matrix adhesion"),
c("GO:0034113","heterotypic cell-cell adhesion",0.058,2.4609,0.902,0.552,"cell-matrix adhesion"),
c("GO:0070586","cell-cell adhesion involved in gastrulation",0.011,1.3180,0.725,0.600,"cell-matrix adhesion"),
c("GO:0034114","regulation of heterotypic cell-cell adhesion",0.019,2.6402,0.838,0.620,"cell-matrix adhesion"),
c("GO:2000097","regulation of smooth muscle cell-matrix adhesion",0.003,1.7881,0.865,0.623,"cell-matrix adhesion"),
c("GO:0060710","chorio-allantoic fusion",0.023,1.3180,0.691,0.626,"cell-matrix adhesion"),
c("GO:0007162","negative regulation of cell adhesion",0.202,1.6786,0.781,0.659,"cell-matrix adhesion"),
c("GO:1900625","positive regulation of monocyte aggregation",0.002,1.7881,0.833,0.667,"cell-matrix adhesion"),
c("GO:0008544","epidermis development",0.590,10.0809,0.669,0.000,"epidermis development"),
c("GO:0001300","chronological cell aging",0.005,1.7881,0.826,0.235,"epidermis development"),
c("GO:0021562","vestibulocochlear nerve development",0.009,2.0872,0.792,0.290,"epidermis development"),
c("GO:0007164","establishment of tissue polarity",0.075,1.6625,0.791,0.310,"epidermis development"),
c("GO:0060856","establishment of blood-brain barrier",0.079,1.3180,0.771,0.311,"epidermis development"),
c("GO:0021773","striatal medium spiny neuron differentiation",0.003,1.7881,0.766,0.313,"epidermis development"),
c("GO:0001503","ossification",0.817,2.9586,0.799,0.323,"epidermis development"),
c("GO:0048807","female genitalia morphogenesis",0.006,1.7881,0.766,0.324,"epidermis development"),
c("GO:0072012","glomerulus vasculature development",0.056,2.3840,0.668,0.382,"epidermis development"),
c("GO:2000381","negative regulation of mesoderm development",0.003,2.0872,0.739,0.394,"epidermis development"),
c("GO:0003008","system process",4.235,1.3931,0.770,0.403,"epidermis development"),
c("GO:0002088","lens development in camera-type eye",0.187,2.3478,0.724,0.423,"epidermis development"),
c("GO:0003223","ventricular compact myocardium morphogenesis",0.005,2.0872,0.743,0.424,"epidermis development"),
c("GO:0016332","establishment or maintenance of polarity of embryonic epithelium",0.002,2.0872,0.747,0.447,"epidermis development"),
c("GO:0009888","tissue development",4.199,6.3768,0.749,0.460,"epidermis development"),
c("GO:0043588","skin development",0.701,9.4318,0.708,0.478,"epidermis development"),
c("GO:0001655","urogenital system development",0.815,1.5766,0.722,0.479,"epidermis development"),
c("GO:0001501","skeletal system development",1.209,2.1580,0.713,0.504,"epidermis development"),
c("GO:0035313","wound healing, spreading of epidermal cells",0.018,1.3180,0.625,0.515,"epidermis development"),
c("GO:0022009","central nervous system vasculogenesis",0.013,1.4907,0.698,0.516,"epidermis development"),
c("GO:1902262","apoptotic process involved in patterning of blood vessels",0.018,1.3954,0.656,0.528,"epidermis development"),
c("GO:0007499","ectoderm and mesoderm interaction",0.001,2.0872,0.786,0.538,"epidermis development"),
c("GO:0072060","outer medullary collecting duct development",0.002,2.0872,0.741,0.549,"epidermis development"),
c("GO:0009887","organ morphogenesis",2.260,2.0223,0.665,0.552,"epidermis development"),
c("GO:0055014","atrial cardiac muscle cell development",0.008,1.7881,0.724,0.557,"epidermis development"),
c("GO:0042475","odontogenesis of dentin-containing tooth",0.342,1.9500,0.705,0.559,"epidermis development"),
c("GO:0050793","regulation of developmental process",4.431,2.1618,0.720,0.563,"epidermis development"),
c("GO:0060197","cloacal septation",0.008,1.7881,0.727,0.564,"epidermis development"),
c("GO:0060157","urinary bladder development",0.006,1.6139,0.736,0.573,"epidermis development"),
c("GO:0001736","establishment of planar polarity",0.075,1.6625,0.750,0.574,"epidermis development"),
c("GO:0002521","leukocyte differentiation",1.015,1.8595,0.657,0.576,"epidermis development"),
c("GO:0048806","genitalia development",0.128,1.5538,0.732,0.596,"epidermis development"),
c("GO:0007423","sensory organ development",1.365,1.5794,0.692,0.597,"epidermis development"),
c("GO:0072053","renal inner medulla development",0.010,1.7881,0.727,0.598,"epidermis development"),
c("GO:0072054","renal outer medulla development",0.010,1.7881,0.727,0.598,"epidermis development"),
c("GO:0060428","lung epithelium development",0.146,1.7562,0.695,0.607,"epidermis development"),
c("GO:0033153","T cell receptor V(D)J recombination",0.017,1.3954,0.714,0.608,"epidermis development"),
c("GO:0044707","single-multicellular organism process",15.092,7.2757,0.745,0.619,"epidermis development"),
c("GO:0001738","morphogenesis of a polarized epithelium",0.093,1.5047,0.748,0.627,"epidermis development"),
c("GO:2000380","regulation of mesoderm development",0.027,1.3954,0.760,0.630,"epidermis development"),
c("GO:0030154","cell differentiation",8.015,2.0066,0.683,0.632,"epidermis development"),
c("GO:0072044","collecting duct development",0.028,1.3954,0.706,0.637,"epidermis development"),
c("GO:0090102","cochlea development",0.091,1.9020,0.736,0.638,"epidermis development"),
c("GO:0055011","atrial cardiac muscle cell differentiation",0.008,1.7881,0.724,0.640,"epidermis development"),
c("GO:0048598","embryonic morphogenesis",1.501,1.6684,0.694,0.662,"epidermis development"),
c("GO:0042476","odontogenesis",0.418,1.5458,0.701,0.664,"epidermis development"),
c("GO:0061437","renal system vasculature development",0.064,2.3134,0.695,0.666,"epidermis development"),
c("GO:0060534","trachea cartilage development",0.023,1.3954,0.733,0.671,"epidermis development"),
c("GO:0045617","negative regulation of keratinocyte differentiation",0.008,1.4907,0.646,0.676,"epidermis development"),
c("GO:0002064","epithelial cell development",0.488,2.0320,0.695,0.677,"epidermis development"),
c("GO:0060482","lobar bronchus development",0.019,1.4907,0.756,0.678,"epidermis development"),
c("GO:0060433","bronchus development",0.025,1.3180,0.753,0.690,"epidermis development"),
c("GO:0060429","epithelium development",2.640,3.8861,0.719,0.693,"epidermis development"),
c("GO:0035844","cloaca development",0.009,1.7881,0.725,0.693,"epidermis development"),
c("GO:0048513","organ development",7.380,6.4685,0.662,0.695,"epidermis development"),
c("GO:0010165","response to X-ray",0.096,1.9020,0.915,0.000,"response to X-ray"),
c("GO:0071455","cellular response to hyperoxia",0.008,1.6139,0.842,0.452,"response to X-ray"),
c("GO:0047484","regulation of response to osmotic stress",0.013,1.3954,0.851,0.465,"response to X-ray"),
c("GO:0043153","entrainment of circadian clock by photoperiod",0.046,1.4907,0.854,0.635,"response to X-ray"),
c("GO:0009314","response to radiation",0.915,1.6338,0.909,0.636,"response to X-ray"),
c("GO:0006970","response to osmotic stress",0.203,1.3369,0.881,0.680,"response to X-ray"),
c("GO:0022610","biological adhesion",2.826,2.3526,0.994,0.000,"biological adhesion"),
c("GO:0032501","multicellular organismal process",15.657,7.3468,0.995,0.000,"multicellular organismal process"),
c("GO:0032502","developmental process",13.055,5.1024,0.995,0.000,"developmental process"),
c("GO:0040011","locomotion",3.285,2.1979,0.994,0.000,"locomotion"),
c("GO:0044699","single-organism process",71.655,2.2596,0.998,0.000,"single-organism process"),
c("GO:0014912","negative regulation of smooth muscle cell migration",0.026,4.2147,0.760,0.014,"negative regulation of smooth muscle cell migration"),
c("GO:0048660","regulation of smooth muscle cell proliferation",0.201,3.1805,0.866,0.122,"negative regulation of smooth muscle cell migration"),
c("GO:0072332","intrinsic apoptotic signaling pathway by p53 class mediator",0.130,3.0177,0.796,0.137,"negative regulation of smooth muscle cell migration"),
c("GO:0015864","pyrimidine nucleoside transport",0.005,2.0872,0.934,0.148,"negative regulation of smooth muscle cell migration"),
c("GO:1902414","protein localization to cell junction",0.018,1.6139,0.953,0.160,"negative regulation of smooth muscle cell migration"),
c("GO:0070498","interleukin-1-mediated signaling pathway",0.031,2.4609,0.829,0.208,"negative regulation of smooth muscle cell migration"),
c("GO:0051674","localization of cell",2.570,2.4559,0.937,0.227,"negative regulation of smooth muscle cell migration"),
c("GO:0051918","negative regulation of fibrinolysis",0.013,3.1871,0.659,0.260,"negative regulation of smooth muscle cell migration"),
c("GO:0032536","regulation of cell projection size",0.009,1.6139,0.908,0.265,"negative regulation of smooth muscle cell migration"),
c("GO:0016480","negative regulation of transcription from RNA polymerase III promoter",0.008,1.6139,0.841,0.265,"negative regulation of smooth muscle cell migration"),
c("GO:0032364","oxygen homeostasis",0.010,1.3954,0.948,0.266,"negative regulation of smooth muscle cell migration"),
c("GO:0030705","cytoskeleton-dependent intracellular transport",0.248,1.7964,0.922,0.279,"negative regulation of smooth muscle cell migration"),
c("GO:0007267","cell-cell signaling",2.522,1.4802,0.895,0.281,"negative regulation of smooth muscle cell migration"),
c("GO:0060005","vestibular reflex",0.003,1.7881,0.939,0.308,"negative regulation of smooth muscle cell migration"),
c("GO:0035898","parathyroid hormone secretion",0.001,1.7881,0.786,0.318,"negative regulation of smooth muscle cell migration"),
c("GO:0071896","protein localization to adherens junction",0.008,1.6139,0.955,0.321,"negative regulation of smooth muscle cell migration"),
c("GO:0072709","cellular response to sorbitol",0.007,1.7881,0.899,0.333,"negative regulation of smooth muscle cell migration"),
c("GO:0071317","cellular response to isoquinoline alkaloid",0.014,1.7881,0.896,0.347,"negative regulation of smooth muscle cell migration"),
c("GO:0071678","olfactory bulb axon guidance",0.002,2.0872,0.669,0.349,"negative regulation of smooth muscle cell migration"),
c("GO:0045669","positive regulation of osteoblast differentiation",0.126,2.3188,0.655,0.350,"negative regulation of smooth muscle cell migration"),
c("GO:0034465","response to carbon monoxide",0.008,1.7881,0.935,0.355,"negative regulation of smooth muscle cell migration"),
c("GO:0060047","heart contraction",0.483,1.3706,0.804,0.362,"negative regulation of smooth muscle cell migration"),
c("GO:0050829","defense response to Gram-negative bacterium",0.074,2.3134,0.885,0.367,"negative regulation of smooth muscle cell migration"),
c("GO:2000271","positive regulation of fibroblast apoptotic process",0.009,1.3954,0.850,0.386,"negative regulation of smooth muscle cell migration"),
c("GO:0032677","regulation of interleukin-8 production",0.062,1.6625,0.780,0.390,"negative regulation of smooth muscle cell migration"),
c("GO:0072331","signal transduction by p53 class mediator",0.265,1.6866,0.832,0.401,"negative regulation of smooth muscle cell migration"),
c("GO:0014050","negative regulation of glutamate secretion",0.009,1.7881,0.801,0.403,"negative regulation of smooth muscle cell migration"),
c("GO:0009611","response to wounding",2.056,1.8438,0.906,0.414,"negative regulation of smooth muscle cell migration"),
c("GO:0071372","cellular response to follicle-stimulating hormone stimulus",0.031,1.3180,0.894,0.420,"negative regulation of smooth muscle cell migration"),
c("GO:0071873","response to norepinephrine",0.008,1.6139,0.933,0.421,"negative regulation of smooth muscle cell migration"),
c("GO:0071503","response to heparin",0.009,1.3954,0.933,0.425,"negative regulation of smooth muscle cell migration"),
c("GO:0002439","chronic inflammatory response to antigenic stimulus",0.019,1.7881,0.914,0.427,"negative regulation of smooth muscle cell migration"),
c("GO:0043616","keratinocyte proliferation",0.052,1.8256,0.951,0.446,"negative regulation of smooth muscle cell migration"),
c("GO:0035491","positive regulation of leukotriene production involved in inflammatory response",0.001,2.0872,0.735,0.467,"negative regulation of smooth muscle cell migration"),
c("GO:0046717","acid secretion",0.178,1.3558,0.925,0.472,"negative regulation of smooth muscle cell migration"),
c("GO:0071504","cellular response to heparin",0.008,1.3954,0.897,0.484,"negative regulation of smooth muscle cell migration"),
c("GO:0071506","cellular response to mycophenolic acid",0.009,1.7881,0.896,0.487,"negative regulation of smooth muscle cell migration"),
c("GO:0002246","wound healing involved in inflammatory response",0.015,1.3954,0.907,0.487,"negative regulation of smooth muscle cell migration"),
c("GO:0032966","negative regulation of collagen biosynthetic process",0.005,1.6139,0.735,0.500,"negative regulation of smooth muscle cell migration"),
c("GO:0051549","positive regulation of keratinocyte migration",0.007,1.6139,0.688,0.501,"negative regulation of smooth muscle cell migration"),
c("GO:0033002","muscle cell proliferation",0.345,2.5100,0.945,0.517,"negative regulation of smooth muscle cell migration"),
c("GO:0070120","ciliary neurotrophic factor-mediated signaling pathway",0.008,1.6139,0.846,0.526,"negative regulation of smooth muscle cell migration"),
c("GO:0071505","response to mycophenolic acid",0.009,1.7881,0.933,0.528,"negative regulation of smooth muscle cell migration"),
c("GO:0006953","acute-phase response",0.088,1.6625,0.914,0.542,"negative regulation of smooth muscle cell migration"),
c("GO:0072708","response to sorbitol",0.007,1.7881,0.934,0.551,"negative regulation of smooth muscle cell migration"),
c("GO:0072384","organelle transport along microtubule",0.097,1.7235,0.855,0.555,"negative regulation of smooth muscle cell migration"),
c("GO:0031665","negative regulation of lipopolysaccharide-mediated signaling pathway",0.013,1.3180,0.756,0.561,"negative regulation of smooth muscle cell migration"),
c("GO:0032637","interleukin-8 production",0.067,1.6061,0.828,0.587,"negative regulation of smooth muscle cell migration"),
c("GO:2000026","regulation of multicellular organismal development",3.472,1.4225,0.638,0.594,"negative regulation of smooth muscle cell migration"),
c("GO:0061044","negative regulation of vascular wound healing",0.001,2.0872,0.642,0.595,"negative regulation of smooth muscle cell migration"),
c("GO:0006954","inflammatory response",1.375,1.4466,0.901,0.595,"negative regulation of smooth muscle cell migration"),
c("GO:0016477","cell migration",2.372,2.6716,0.806,0.595,"negative regulation of smooth muscle cell migration"),
c("GO:0051546","keratinocyte migration",0.014,1.3954,0.749,0.605,"negative regulation of smooth muscle cell migration"),
c("GO:0002548","monocyte chemotaxis",0.042,2.0325,0.766,0.620,"negative regulation of smooth muscle cell migration"),
c("GO:0006915","apoptotic process",4.058,1.8450,0.862,0.622,"negative regulation of smooth muscle cell migration"),
c("GO:0016525","negative regulation of angiogenesis",0.139,1.5289,0.623,0.623,"negative regulation of smooth muscle cell migration"),
c("GO:0001957","intramembranous ossification",0.019,1.3180,0.835,0.626,"negative regulation of smooth muscle cell migration"),
c("GO:0036072","direct ossification",0.019,1.3180,0.835,0.626,"negative regulation of smooth muscle cell migration"),
c("GO:0061041","regulation of wound healing",0.231,1.7612,0.854,0.632,"negative regulation of smooth muscle cell migration"),
c("GO:1990127","intrinsic apoptotic signaling pathway in response to osmotic stress by p53 class mediator",0.001,2.0872,0.785,0.656,"negative regulation of smooth muscle cell migration"),
c("GO:0002538","arachidonic acid metabolite production involved in inflammatory response",0.003,1.7881,0.804,0.666,"negative regulation of smooth muscle cell migration"),
c("GO:0051271","negative regulation of cellular component movement",0.368,1.8404,0.735,0.671,"negative regulation of smooth muscle cell migration"),
c("GO:0019221","cytokine-mediated signaling pathway",0.956,1.3531,0.791,0.683,"negative regulation of smooth muscle cell migration"),
c("GO:0014812","muscle cell migration",0.136,2.7399,0.844,0.690,"negative regulation of smooth muscle cell migration"),
c("GO:0009617","response to bacterium",1.019,1.5147,0.910,0.698,"negative regulation of smooth muscle cell migration"),
c("GO:0072385","minus-end-directed organelle transport along microtubule",0.003,1.6139,0.881,0.700,"negative regulation of smooth muscle cell migration"),
c("GO:0016265","death",4.501,1.6554,0.968,0.023,"death"),
c("GO:1900106","positive regulation of hyaluranon cable assembly",0.003,2.0872,0.933,0.038,"positive regulation of hyaluranon cable assembly"),
c("GO:0008057","eye pigment granule organization",0.001,2.0872,0.933,0.169,"positive regulation of hyaluranon cable assembly"),
c("GO:0045104","intermediate filament cytoskeleton organization",0.072,1.9431,0.924,0.265,"positive regulation of hyaluranon cable assembly"),
c("GO:0036118","hyaluranon cable assembly",0.003,2.0872,0.979,0.286,"positive regulation of hyaluranon cable assembly"),
c("GO:0030198","extracellular matrix organization",0.708,1.8351,0.910,0.300,"positive regulation of hyaluranon cable assembly"),
c("GO:0016264","gap junction assembly",0.035,1.3180,0.927,0.323,"positive regulation of hyaluranon cable assembly"),
c("GO:0043062","extracellular structure organization",0.709,1.8351,0.913,0.370,"positive regulation of hyaluranon cable assembly"),
c("GO:0072393","microtubule anchoring at microtubule organizing center",0.018,1.3180,0.867,0.445,"positive regulation of hyaluranon cable assembly"),
c("GO:0043482","cellular pigment accumulation",0.013,1.3180,0.871,0.670,"positive regulation of hyaluranon cable assembly"),
c("GO:0043476","pigment accumulation",0.013,1.3180,0.917,0.678,"positive regulation of hyaluranon cable assembly"),
c("GO:0002384","hepatic immune response",0.002,1.7881,0.968,0.045,"hepatic immune response"),
c("GO:0010481","epidermal cell division",0.003,2.0872,0.948,0.047,"epidermal cell division"),
c("GO:0010951","negative regulation of endopeptidase activity",0.499,3.7696,0.872,0.052,"negative regulation of endopeptidase activity"),
c("GO:0045226","extracellular polysaccharide biosynthetic process",0.011,1.6139,0.913,0.118,"negative regulation of endopeptidase activity"),
c("GO:0030212","hyaluronan metabolic process",0.083,1.8256,0.964,0.137,"negative regulation of endopeptidase activity"),
c("GO:0018149","peptide cross-linking",0.099,1.9863,0.930,0.241,"negative regulation of endopeptidase activity"),
c("GO:0018153","isopeptide cross-linking via N6-(L-isoglutamyl)-L-lysine",0.008,1.7881,0.933,0.256,"negative regulation of endopeptidase activity"),
c("GO:0006975","DNA damage induced protein phosphorylation",0.018,1.3954,0.836,0.270,"negative regulation of endopeptidase activity"),
c("GO:0045329","carnitine biosynthetic process",0.007,1.4907,0.921,0.310,"negative regulation of endopeptidase activity"),
c("GO:0051545","negative regulation of elastin biosynthetic process",0.002,2.0872,0.833,0.373,"negative regulation of endopeptidase activity"),
c("GO:0018199","peptidyl-glutamine modification",0.010,1.4907,0.935,0.388,"negative regulation of endopeptidase activity"),
c("GO:0010536","positive regulation of activation of Janus kinase activity",0.008,2.0872,0.789,0.404,"negative regulation of endopeptidase activity"),
c("GO:0010628","positive regulation of gene expression",2.987,1.8533,0.868,0.442,"negative regulation of endopeptidase activity"),
c("GO:0051541","elastin metabolic process",0.009,1.4907,0.936,0.464,"negative regulation of endopeptidase activity"),
c("GO:0006366","transcription from RNA polymerase II promoter",3.963,1.4881,0.904,0.470,"negative regulation of endopeptidase activity"),
c("GO:0010955","negative regulation of protein processing",0.140,2.2612,0.827,0.502,"negative regulation of endopeptidase activity"),
c("GO:0044092","negative regulation of molecular function",1.921,1.4030,0.924,0.563,"negative regulation of endopeptidase activity"),
c("GO:0010605","negative regulation of macromolecule metabolic process",3.670,1.7258,0.809,0.626,"negative regulation of endopeptidase activity"),
c("GO:0046379","extracellular polysaccharide metabolic process",0.011,1.6139,0.945,0.652,"negative regulation of endopeptidase activity"),
c("GO:0043410","positive regulation of MAPK cascade",0.842,1.3999,0.751,0.666,"negative regulation of endopeptidase activity"),
c("GO:0009892","negative regulation of metabolic process",3.994,1.4883,0.826,0.688,"negative regulation of endopeptidase activity"),
c("GO:0006928","cellular component movement",3.830,3.2676,0.917,0.075,"cellular component movement"),
c("GO:0044763","single-organism cellular process",45.302,1.5032,0.929,0.103,"cellular component movement"),
c("GO:0045103","intermediate filament-based process",0.075,1.9020,0.938,0.083,"intermediate filament-based process"),
c("GO:0051239","regulation of multicellular organismal process",5.506,1.8817,0.938,0.086,"regulation of multicellular organismal process"),
c("GO:0048519","negative regulation of biological process",8.588,1.6576,0.936,0.131,"regulation of multicellular organismal process"),
c("GO:0007163","establishment or maintenance of cell polarity",0.358,1.3592,0.931,0.097,"establishment or maintenance of cell polarity"));

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
