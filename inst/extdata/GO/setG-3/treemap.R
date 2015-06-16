

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
revigo.data <- rbind(c("GO:0002376","immune system process",29.354,2.3605,0.996,0.000,"immune system process"),
c("GO:0007623","circadian rhythm",0.440,2.4989,0.994,0.000,"circadian rhythm"),
c("GO:0016265","death",4.501,2.4134,0.969,0.000,"death"),
c("GO:0023052","signaling",17.329,4.2076,0.995,0.000,"signaling"),
c("GO:0032501","multicellular organismal process",15.657,1.9539,0.995,0.000,"multicellular organismal process"),
c("GO:0032502","developmental process",13.055,2.8153,0.995,0.000,"developmental process"),
c("GO:0048511","rhythmic process",0.724,2.2644,0.994,0.000,"rhythmic process"),
c("GO:0050896","response to stimulus",47.248,2.3028,0.997,0.000,"response to stimulus"),
c("GO:0065007","biological regulation",51.216,5.8239,0.997,0.000,"biological regulation"),
c("GO:0071840","cellular component organization or biogenesis",12.603,1.7525,0.995,0.000,"cellular component organization or biogenesis"),
c("GO:0080135","regulation of cellular response to stress",0.758,6.5086,0.673,0.000,"regulation of cellular response to stress"),
c("GO:0050789","regulation of biological process",49.744,8.1192,0.853,0.117,"regulation of cellular response to stress"),
c("GO:1900118","negative regulation of execution phase of apoptosis",0.006,2.1656,0.806,0.120,"regulation of cellular response to stress"),
c("GO:0051716","cellular response to stimulus",19.092,2.9788,0.866,0.121,"regulation of cellular response to stress"),
c("GO:2000401","regulation of lymphocyte migration",0.042,2.2034,0.808,0.139,"regulation of cellular response to stress"),
c("GO:0051239","regulation of multicellular organismal process",5.506,2.9318,0.889,0.181,"regulation of cellular response to stress"),
c("GO:0002253","activation of immune response",1.043,2.1232,0.812,0.207,"regulation of cellular response to stress"),
c("GO:0048519","negative regulation of biological process",8.588,3.3872,0.882,0.207,"regulation of cellular response to stress"),
c("GO:0007213","G-protein coupled acetylcholine receptor signaling pathway",0.035,2.4634,0.782,0.209,"regulation of cellular response to stress"),
c("GO:0045595","regulation of cell differentiation",3.246,5.3468,0.649,0.212,"regulation of cellular response to stress"),
c("GO:0006897","endocytosis",1.430,2.1296,0.983,0.225,"regulation of cellular response to stress"),
c("GO:0030518","intracellular steroid hormone receptor signaling pathway",0.228,2.9747,0.749,0.244,"regulation of cellular response to stress"),
c("GO:0019222","regulation of metabolic process",17.756,6.4949,0.833,0.269,"regulation of cellular response to stress"),
c("GO:0048319","axial mesoderm morphogenesis",0.013,3.3565,0.897,0.286,"regulation of cellular response to stress"),
c("GO:0006955","immune response",27.347,2.1439,0.875,0.296,"regulation of cellular response to stress"),
c("GO:0048522","positive regulation of cellular process",8.548,4.0862,0.731,0.299,"regulation of cellular response to stress"),
c("GO:0048583","regulation of response to stimulus",26.518,2.9914,0.844,0.322,"regulation of cellular response to stress"),
c("GO:1902531","regulation of intracellular signal transduction",3.702,4.2676,0.612,0.328,"regulation of cellular response to stress"),
c("GO:0048518","positive regulation of biological process",28.712,3.9208,0.858,0.335,"regulation of cellular response to stress"),
c("GO:0050794","regulation of cellular process",28.971,8.8861,0.818,0.337,"regulation of cellular response to stress"),
c("GO:0048536","spleen development",0.083,2.6517,0.840,0.338,"regulation of cellular response to stress"),
c("GO:0071363","cellular response to growth factor stimulus",1.395,2.2277,0.802,0.354,"regulation of cellular response to stress"),
c("GO:0030522","intracellular receptor signaling pathway",0.684,3.1024,0.729,0.371,"regulation of cellular response to stress"),
c("GO:0097194","execution phase of apoptosis",0.139,1.6944,0.877,0.376,"regulation of cellular response to stress"),
c("GO:0035412","regulation of catenin import into nucleus",0.032,2.1040,0.833,0.380,"regulation of cellular response to stress"),
c("GO:0016055","Wnt signaling pathway",0.887,1.8019,0.716,0.383,"regulation of cellular response to stress"),
c("GO:0060021","palate development",0.311,1.8265,0.897,0.385,"regulation of cellular response to stress"),
c("GO:0002764","immune response-regulating signaling pathway",1.064,1.9776,0.696,0.392,"regulation of cellular response to stress"),
c("GO:0071225","cellular response to muramyl dipeptide",0.003,2.1656,0.876,0.405,"regulation of cellular response to stress"),
c("GO:0002068","glandular epithelial cell development",0.067,1.8539,0.827,0.433,"regulation of cellular response to stress"),
c("GO:0048584","positive regulation of response to stimulus",22.389,2.9031,0.763,0.450,"regulation of cellular response to stress"),
c("GO:0048663","neuron fate commitment",0.153,2.2832,0.794,0.468,"regulation of cellular response to stress"),
c("GO:0035329","hippo signaling",0.068,2.8962,0.748,0.476,"regulation of cellular response to stress"),
c("GO:0043567","regulation of insulin-like growth factor receptor signaling pathway",0.039,3.0410,0.734,0.478,"regulation of cellular response to stress"),
c("GO:0002520","immune system development",1.845,2.6126,0.800,0.479,"regulation of cellular response to stress"),
c("GO:0038061","NIK/NF-kappaB signaling",0.080,2.7595,0.745,0.483,"regulation of cellular response to stress"),
c("GO:0043009","chordate embryonic development",1.774,1.7192,0.833,0.484,"regulation of cellular response to stress"),
c("GO:0032862","activation of Rho GTPase activity",0.050,3.1308,0.620,0.489,"regulation of cellular response to stress"),
c("GO:0048469","cell maturation",0.359,1.8554,0.805,0.513,"regulation of cellular response to stress"),
c("GO:0016197","endosomal transport",0.316,1.7921,0.958,0.520,"regulation of cellular response to stress"),
c("GO:0045444","fat cell differentiation",0.409,2.4622,0.810,0.520,"regulation of cellular response to stress"),
c("GO:0080134","regulation of response to stress",1.961,3.2147,0.788,0.521,"regulation of cellular response to stress"),
c("GO:0071219","cellular response to molecule of bacterial origin",0.348,1.9598,0.827,0.528,"regulation of cellular response to stress"),
c("GO:0044707","single-multicellular organism process",15.092,1.9574,0.882,0.532,"regulation of cellular response to stress"),
c("GO:0050793","regulation of developmental process",4.431,4.1549,0.784,0.541,"regulation of cellular response to stress"),
c("GO:0044380","protein localization to cytoskeleton",0.046,1.8539,0.978,0.547,"regulation of cellular response to stress"),
c("GO:0048864","stem cell development",0.713,2.9281,0.786,0.555,"regulation of cellular response to stress"),
c("GO:0007165","signal transduction",16.054,5.0506,0.621,0.565,"regulation of cellular response to stress"),
c("GO:0048863","stem cell differentiation",0.847,3.0458,0.796,0.566,"regulation of cellular response to stress"),
c("GO:0045087","innate immune response",1.572,2.1891,0.823,0.568,"regulation of cellular response to stress"),
c("GO:0043123","positive regulation of I-kappaB kinase/NF-kappaB signaling",0.276,1.8441,0.656,0.580,"regulation of cellular response to stress"),
c("GO:0002449","lymphocyte mediated immunity",19.493,1.9245,0.929,0.591,"regulation of cellular response to stress"),
c("GO:0097193","intrinsic apoptotic signaling pathway",0.550,3.8239,0.673,0.593,"regulation of cellular response to stress"),
c("GO:0007169","transmembrane receptor protein tyrosine kinase signaling pathway",1.599,2.0975,0.694,0.610,"regulation of cellular response to stress"),
c("GO:0070848","response to growth factor",1.438,2.3089,0.929,0.616,"regulation of cellular response to stress"),
c("GO:0045598","regulation of fat cell differentiation",0.201,2.0937,0.727,0.618,"regulation of cellular response to stress"),
c("GO:0032856","activation of Ras GTPase activity",0.080,2.7595,0.610,0.625,"regulation of cellular response to stress"),
c("GO:0031098","stress-activated protein kinase signaling cascade",0.435,3.3188,0.675,0.628,"regulation of cellular response to stress"),
c("GO:0050778","positive regulation of immune response",20.108,1.9420,0.730,0.629,"regulation of cellular response to stress"),
c("GO:0033554","cellular response to stress",3.483,1.7978,0.750,0.630,"regulation of cellular response to stress"),
c("GO:0010646","regulation of cell communication",6.570,3.2596,0.685,0.631,"regulation of cellular response to stress"),
c("GO:0048869","cellular developmental process",8.570,4.5086,0.759,0.635,"regulation of cellular response to stress"),
c("GO:0023051","regulation of signaling",6.570,3.2757,0.760,0.637,"regulation of cellular response to stress"),
c("GO:0035556","intracellular signal transduction",6.704,4.9208,0.655,0.640,"regulation of cellular response to stress"),
c("GO:0097190","apoptotic signaling pathway",1.253,3.1487,0.687,0.642,"regulation of cellular response to stress"),
c("GO:0032989","cellular component morphogenesis",2.952,1.8904,0.729,0.646,"regulation of cellular response to stress"),
c("GO:1902532","negative regulation of intracellular signal transduction",0.734,2.8069,0.620,0.649,"regulation of cellular response to stress"),
c("GO:0035411","catenin import into nucleus",0.038,2.0114,0.960,0.655,"regulation of cellular response to stress"),
c("GO:0034138","toll-like receptor 3 signaling pathway",0.103,4.6576,0.657,0.655,"regulation of cellular response to stress"),
c("GO:0048318","axial mesoderm development",0.017,2.6904,0.911,0.660,"regulation of cellular response to stress"),
c("GO:0043507","positive regulation of JUN kinase activity",0.116,3.8539,0.515,0.662,"regulation of cellular response to stress"),
c("GO:0048013","ephrin receptor signaling pathway",0.101,1.8450,0.759,0.664,"regulation of cellular response to stress"),
c("GO:0043516","regulation of DNA damage response, signal transduction by p53 class mediator",0.040,3.4318,0.667,0.664,"regulation of cellular response to stress"),
c("GO:0071396","cellular response to lipid",1.069,1.7825,0.810,0.668,"regulation of cellular response to stress"),
c("GO:0051534","negative regulation of NFAT protein import into nucleus",0.011,1.8788,0.810,0.678,"regulation of cellular response to stress"),
c("GO:0007166","cell surface receptor signaling pathway",8.919,1.9893,0.642,0.683,"regulation of cellular response to stress"),
c("GO:0021877","forebrain neuron fate commitment",0.031,1.8788,0.816,0.693,"regulation of cellular response to stress"),
c("GO:0042113","B cell activation",0.487,2.9586,0.863,0.041,"B cell activation"),
c("GO:0006366","transcription from RNA polymerase II promoter",3.963,6.1805,0.729,0.052,"transcription from RNA polymerase II promoter"),
c("GO:0009058","biosynthetic process",19.017,3.6778,0.916,0.112,"transcription from RNA polymerase II promoter"),
c("GO:0031293","membrane protein intracellular domain proteolysis",0.023,1.9763,0.907,0.146,"transcription from RNA polymerase II promoter"),
c("GO:0070933","histone H4 deacetylation",0.034,3.7696,0.783,0.181,"transcription from RNA polymerase II promoter"),
c("GO:0006807","nitrogen compound metabolic process",26.566,2.5243,0.910,0.183,"transcription from RNA polymerase II promoter"),
c("GO:1901360","organic cyclic compound metabolic process",25.430,2.3063,0.871,0.211,"transcription from RNA polymerase II promoter"),
c("GO:0006725","cellular aromatic compound metabolic process",24.907,2.4535,0.819,0.217,"transcription from RNA polymerase II promoter"),
c("GO:0044238","primary metabolic process",41.881,2.2111,0.901,0.248,"transcription from RNA polymerase II promoter"),
c("GO:0034330","cell junction organization",0.493,2.7670,0.859,0.275,"transcription from RNA polymerase II promoter"),
c("GO:0010894","negative regulation of steroid biosynthetic process",0.033,3.2757,0.738,0.303,"transcription from RNA polymerase II promoter"),
c("GO:0018105","peptidyl-serine phosphorylation",0.389,3.1938,0.793,0.310,"transcription from RNA polymerase II promoter"),
c("GO:0071704","organic substance metabolic process",42.826,2.0074,0.900,0.318,"transcription from RNA polymerase II promoter"),
c("GO:0044237","cellular metabolic process",42.121,1.8060,0.845,0.319,"transcription from RNA polymerase II promoter"),
c("GO:0006793","phosphorus metabolic process",17.457,1.7086,0.830,0.319,"transcription from RNA polymerase II promoter"),
c("GO:0045216","cell-cell junction organization",0.424,2.4935,0.855,0.340,"transcription from RNA polymerase II promoter"),
c("GO:0046137","negative regulation of vitamin metabolic process",0.006,2.9747,0.796,0.348,"transcription from RNA polymerase II promoter"),
c("GO:0046483","heterocycle metabolic process",24.799,2.4237,0.819,0.359,"transcription from RNA polymerase II promoter"),
c("GO:0018146","keratan sulfate biosynthetic process",0.032,3.0000,0.798,0.361,"transcription from RNA polymerase II promoter"),
c("GO:0043484","regulation of RNA splicing",0.131,3.6383,0.721,0.363,"transcription from RNA polymerase II promoter"),
c("GO:0031122","cytoplasmic microtubule organization",0.062,2.0114,0.870,0.364,"transcription from RNA polymerase II promoter"),
c("GO:0031344","regulation of cell projection organization",0.882,2.2403,0.747,0.365,"transcription from RNA polymerase II promoter"),
c("GO:0044260","cellular macromolecule metabolic process",25.627,4.6778,0.760,0.369,"transcription from RNA polymerase II promoter"),
c("GO:0008214","protein dealkylation",0.365,1.8450,0.827,0.375,"transcription from RNA polymerase II promoter"),
c("GO:0043170","macromolecule metabolic process",29.866,4.3279,0.866,0.377,"transcription from RNA polymerase II promoter"),
c("GO:0048585","negative regulation of response to stimulus",2.501,1.8514,0.779,0.383,"transcription from RNA polymerase II promoter"),
c("GO:0046165","alcohol biosynthetic process",0.276,2.0155,0.829,0.416,"transcription from RNA polymerase II promoter"),
c("GO:0051092","positive regulation of NF-kappaB transcription factor activity",0.194,3.6990,0.682,0.423,"transcription from RNA polymerase II promoter"),
c("GO:0023014","signal transduction by phosphorylation",1.554,2.1726,0.655,0.423,"transcription from RNA polymerase II promoter"),
c("GO:0016310","phosphorylation",10.160,3.5528,0.806,0.449,"transcription from RNA polymerase II promoter"),
c("GO:0060052","neurofilament cytoskeleton organization",0.026,1.8788,0.881,0.451,"transcription from RNA polymerase II promoter"),
c("GO:0051128","regulation of cellular component organization",3.835,2.0173,0.833,0.458,"transcription from RNA polymerase II promoter"),
c("GO:0043412","macromolecule modification",10.189,3.1675,0.849,0.465,"transcription from RNA polymerase II promoter"),
c("GO:0010557","positive regulation of macromolecule biosynthetic process",3.143,4.2757,0.644,0.487,"transcription from RNA polymerase II promoter"),
c("GO:0008090","retrograde axon cargo transport",0.023,1.8788,0.903,0.497,"transcription from RNA polymerase II promoter"),
c("GO:0051338","regulation of transferase activity",1.829,2.1759,0.751,0.509,"transcription from RNA polymerase II promoter"),
c("GO:0070544","histone H3-K36 demethylation",0.013,1.8788,0.794,0.510,"transcription from RNA polymerase II promoter"),
c("GO:0051276","chromosome organization",2.327,1.8611,0.867,0.521,"transcription from RNA polymerase II promoter"),
c("GO:0010467","gene expression",15.379,4.4559,0.838,0.524,"transcription from RNA polymerase II promoter"),
c("GO:0019438","aromatic compound biosynthetic process",13.512,6.0915,0.746,0.529,"transcription from RNA polymerase II promoter"),
c("GO:0060255","regulation of macromolecule metabolic process",14.730,6.8861,0.677,0.529,"transcription from RNA polymerase II promoter"),
c("GO:0006464","cellular protein modification process",9.809,3.3468,0.747,0.532,"transcription from RNA polymerase II promoter"),
c("GO:0090304","nucleic acid metabolic process",15.268,3.7696,0.746,0.538,"transcription from RNA polymerase II promoter"),
c("GO:0009893","positive regulation of metabolic process",5.415,2.7721,0.725,0.588,"transcription from RNA polymerase II promoter"),
c("GO:0018107","peptidyl-threonine phosphorylation",0.120,2.6459,0.812,0.589,"transcription from RNA polymerase II promoter"),
c("GO:0018210","peptidyl-threonine modification",0.124,2.4260,0.837,0.591,"transcription from RNA polymerase II promoter"),
c("GO:1902679","negative regulation of RNA biosynthetic process",2.216,2.5287,0.580,0.600,"transcription from RNA polymerase II promoter"),
c("GO:0006357","regulation of transcription from RNA polymerase II promoter",3.684,4.5686,0.601,0.613,"transcription from RNA polymerase II promoter"),
c("GO:0006139","nucleobase-containing compound metabolic process",24.258,2.9586,0.752,0.636,"transcription from RNA polymerase II promoter"),
c("GO:0048813","dendrite morphogenesis",0.242,1.8897,0.748,0.650,"transcription from RNA polymerase II promoter"),
c("GO:0016568","chromatin modification",1.536,2.7212,0.861,0.653,"transcription from RNA polymerase II promoter"),
c("GO:0018209","peptidyl-serine modification",0.418,2.9208,0.819,0.656,"transcription from RNA polymerase II promoter"),
c("GO:0030656","regulation of vitamin metabolic process",0.021,2.1152,0.820,0.675,"transcription from RNA polymerase II promoter"),
c("GO:0016043","cellular component organization",12.380,1.8798,0.919,0.677,"transcription from RNA polymerase II promoter"),
c("GO:0009059","macromolecule biosynthetic process",14.776,6.0000,0.779,0.687,"transcription from RNA polymerase II promoter"),
c("GO:0018130","heterocycle biosynthetic process",13.553,6.0269,0.746,0.691,"transcription from RNA polymerase II promoter"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",13.670,5.7212,0.741,0.693,"transcription from RNA polymerase II promoter"),
c("GO:0034641","cellular nitrogen compound metabolic process",25.263,2.1113,0.777,0.697,"transcription from RNA polymerase II promoter"),
c("GO:0009889","regulation of biosynthetic process",11.561,5.6990,0.686,0.698,"transcription from RNA polymerase II promoter"),
c("GO:0032743","positive regulation of interleukin-2 production",0.019,4.2676,0.829,0.052,"positive regulation of interleukin-2 production"),
c("GO:0001816","cytokine production",1.263,2.9355,0.908,0.249,"positive regulation of interleukin-2 production"),
c("GO:0032754","positive regulation of interleukin-5 production",0.008,1.8788,0.840,0.569,"positive regulation of interleukin-2 production"),
c("GO:0001817","regulation of cytokine production",1.106,2.7352,0.803,0.661,"positive regulation of interleukin-2 production"),
c("GO:0002724","regulation of T cell cytokine production",0.035,2.4634,0.796,0.693,"positive regulation of interleukin-2 production"),
c("GO:0017145","stem cell division",0.089,2.2832,0.913,0.070,"stem cell division"),
c("GO:0042355","L-fucose catabolic process",0.011,1.8788,0.901,0.082,"L-fucose catabolism"),
c("GO:0001775","cell activation",2.008,2.0580,0.885,0.094,"cell activation"),
c("GO:0007154","cell communication",17.535,4.5086,0.849,0.153,"cell activation"));

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
