

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
revigo.data <- rbind(c("GO:0002485","antigen processing and presentation of endogenous peptide antigen via MHC class I via ER pathway, TAP-dependent",0.003,1.5735,0.973,0.000,"antigen processing and presentation of endogenous peptide antigen via MHC class I via ER pathway, TAP-dependent"),
c("GO:0002589","regulation of antigen processing and presentation of peptide antigen via MHC class I",0.005,1.5735,0.951,0.132,"antigen processing and presentation of endogenous peptide antigen via MHC class I via ER pathway, TAP-dependent"),
c("GO:0007049","cell cycle",3.703,3.7696,0.894,0.000,"cell cycle"),
c("GO:0000280","nuclear division",1.116,3.1612,0.748,0.111,"cell cycle"),
c("GO:0051301","cell division",1.708,3.3468,0.901,0.118,"cell cycle"),
c("GO:0000278","mitotic cell cycle",1.725,2.9666,0.783,0.118,"cell cycle"),
c("GO:0070836","caveola assembly",0.013,2.6799,0.876,0.272,"cell cycle"),
c("GO:1900225","regulation of NLRP3 inflammasome complex assembly",0.005,1.5735,0.841,0.310,"cell cycle"),
c("GO:0071824","protein-DNA complex subunit organization",0.357,2.4486,0.862,0.361,"cell cycle"),
c("GO:0070072","vacuolar proton-transporting V-type ATPase complex assembly",0.002,1.5735,0.879,0.435,"cell cycle"),
c("GO:1901880","negative regulation of protein depolymerization",0.130,1.6702,0.720,0.454,"cell cycle"),
c("GO:0051131","chaperone-mediated protein complex assembly",0.025,1.3407,0.865,0.492,"cell cycle"),
c("GO:0031579","membrane raft organization",0.032,1.6461,0.887,0.496,"cell cycle"),
c("GO:0048698","negative regulation of collateral sprouting in absence of injury",0.001,1.5735,0.748,0.510,"cell cycle"),
c("GO:0006996","organelle organization",7.033,1.6821,0.811,0.512,"cell cycle"),
c("GO:2000426","negative regulation of apoptotic cell clearance",0.002,1.5735,0.773,0.531,"cell cycle"),
c("GO:0048285","organelle fission",1.175,3.2596,0.819,0.552,"cell cycle"),
c("GO:0071173","spindle assembly checkpoint",0.068,2.3307,0.810,0.559,"cell cycle"),
c("GO:2000142","regulation of DNA-templated transcription, initiation",0.031,1.4056,0.688,0.572,"cell cycle"),
c("GO:0051276","chromosome organization",2.327,1.4864,0.808,0.602,"cell cycle"),
c("GO:0065003","macromolecular complex assembly",2.983,1.7303,0.830,0.609,"cell cycle"),
c("GO:0065004","protein-DNA complex assembly",0.318,1.8030,0.839,0.636,"cell cycle"),
c("GO:0000075","cell cycle checkpoint",0.476,1.7557,0.799,0.675,"cell cycle"),
c("GO:0001189","RNA polymerase I transcriptional preinitiation complex assembly at the promoter for the nuclear large rRNA transcript",0.002,1.5735,0.766,0.683,"cell cycle"),
c("GO:0051321","meiotic cell cycle",0.540,1.4607,0.803,0.684,"cell cycle"),
c("GO:0032465","regulation of cytokinesis",0.088,1.5519,0.754,0.694,"cell cycle"),
c("GO:0050999","regulation of nitric-oxide synthase activity",0.060,3.0362,0.885,0.000,"regulation of nitric-oxide synthase activity"),
c("GO:0031648","protein destabilization",0.034,2.0894,0.844,0.185,"regulation of nitric-oxide synthase activity"),
c("GO:0035303","regulation of dephosphorylation",0.210,1.5014,0.803,0.209,"regulation of nitric-oxide synthase activity"),
c("GO:1901385","regulation of voltage-gated calcium channel activity",0.081,1.4056,0.801,0.359,"regulation of nitric-oxide synthase activity"),
c("GO:0009914","hormone transport",0.622,1.6218,0.848,0.371,"regulation of nitric-oxide synthase activity"),
c("GO:0051341","regulation of oxidoreductase activity",0.137,1.9834,0.883,0.398,"regulation of nitric-oxide synthase activity"),
c("GO:0046716","muscle cell cellular homeostasis",0.112,1.4056,0.879,0.408,"regulation of nitric-oxide synthase activity"),
c("GO:0051340","regulation of ligase activity",0.133,1.8831,0.883,0.422,"regulation of nitric-oxide synthase activity"),
c("GO:0043086","negative regulation of catalytic activity",1.481,1.8623,0.856,0.516,"regulation of nitric-oxide synthase activity"),
c("GO:0006448","regulation of translational elongation",0.060,1.4056,0.779,0.616,"regulation of nitric-oxide synthase activity"),
c("GO:0043666","regulation of phosphoprotein phosphatase activity",0.051,1.6486,0.802,0.619,"regulation of nitric-oxide synthase activity"),
c("GO:0051592","response to calcium ion",0.224,2.0580,0.975,0.000,"response to calcium ion"),
c("GO:0097338","response to clozapine",0.001,1.5735,0.979,0.255,"response to calcium ion"),
c("GO:0033762","response to glucagon",0.088,1.5071,0.975,0.420,"response to calcium ion"),
c("GO:0071377","cellular response to glucagon stimulus",0.058,1.6486,0.934,0.634,"response to calcium ion"),
c("GO:0048532","anatomical structure arrangement",0.092,1.8649,0.938,0.018,"anatomical structure arrangement"),
c("GO:0021998","neural plate mediolateral regionalization",0.001,1.5735,0.942,0.193,"anatomical structure arrangement"),
c("GO:0061017","hepatoblast differentiation",0.005,1.5735,0.880,0.225,"anatomical structure arrangement"),
c("GO:0048840","otolith development",0.013,1.5735,0.931,0.254,"anatomical structure arrangement"),
c("GO:0016476","regulation of embryonic cell shape",0.002,1.5735,0.770,0.299,"anatomical structure arrangement"),
c("GO:1902033","regulation of hematopoietic stem cell proliferation",0.006,1.5735,0.859,0.317,"anatomical structure arrangement"),
c("GO:0048853","forebrain morphogenesis",0.042,1.6461,0.920,0.358,"anatomical structure arrangement"),
c("GO:0021629","olfactory nerve structural organization",0.059,1.5735,0.909,0.376,"anatomical structure arrangement"),
c("GO:0060857","establishment of glial blood-brain barrier",0.060,1.5735,0.870,0.386,"anatomical structure arrangement"),
c("GO:0035922","foramen ovale closure",0.002,1.5735,0.931,0.401,"anatomical structure arrangement"),
c("GO:0003193","pulmonary valve formation",0.009,1.5735,0.927,0.433,"anatomical structure arrangement"),
c("GO:0003158","endothelium development",0.229,1.3311,0.949,0.440,"anatomical structure arrangement"),
c("GO:1902036","regulation of hematopoietic stem cell differentiation",0.006,1.5735,0.843,0.479,"anatomical structure arrangement"),
c("GO:0061011","hepatic duct development",0.002,1.5735,0.935,0.547,"anatomical structure arrangement"),
c("GO:0001885","endothelial cell development",0.125,1.4645,0.876,0.555,"anatomical structure arrangement"),
c("GO:0015833","peptide transport",0.612,2.3507,0.876,0.023,"peptide transport"),
c("GO:0006833","water transport",0.117,1.7009,0.922,0.292,"peptide transport"),
c("GO:0042044","fluid transport",0.132,1.5519,0.921,0.295,"peptide transport"),
c("GO:0016482","cytoplasmic transport",1.537,2.1290,0.895,0.327,"peptide transport"),
c("GO:0008104","protein localization",4.788,1.8554,0.913,0.374,"peptide transport"),
c("GO:0034629","cellular protein complex localization",0.016,1.7476,0.921,0.460,"peptide transport"),
c("GO:0051641","cellular localization",6.184,1.5016,0.924,0.464,"peptide transport"),
c("GO:0006892","post-Golgi vesicle-mediated transport",0.138,1.8292,0.893,0.599,"peptide transport"),
c("GO:0046968","peptide antigen transport",0.003,1.5735,0.902,0.645,"peptide transport"),
c("GO:0060341","regulation of cellular localization",2.083,1.3744,0.788,0.649,"peptide transport"),
c("GO:0048193","Golgi vesicle transport",0.508,2.0857,0.883,0.681,"peptide transport"),
c("GO:0014883","transition between fast and slow fiber",0.007,1.5735,0.897,0.050,"transition between fast and slow fiber"),
c("GO:0002368","B cell cytokine production",0.002,1.5735,0.938,0.158,"transition between fast and slow fiber"),
c("GO:1990029","vasomotion",0.001,1.5735,0.889,0.289,"transition between fast and slow fiber"),
c("GO:0045907","positive regulation of vasoconstriction",0.092,1.4773,0.849,0.597,"transition between fast and slow fiber"),
c("GO:0010332","response to gamma radiation",0.131,1.3472,0.986,0.062,"response to gamma radiation"),
c("GO:0006213","pyrimidine nucleoside metabolic process",0.133,3.6021,0.729,0.087,"pyrimidine nucleoside metabolism"),
c("GO:0046209","nitric oxide metabolic process",0.147,2.0195,0.916,0.148,"pyrimidine nucleoside metabolism"),
c("GO:0006112","energy reserve metabolic process",0.325,2.4191,0.857,0.158,"pyrimidine nucleoside metabolism"),
c("GO:0006310","DNA recombination",0.532,1.7716,0.839,0.181,"pyrimidine nucleoside metabolism"),
c("GO:0006043","glucosamine catabolic process",0.001,1.5735,0.900,0.223,"pyrimidine nucleoside metabolism"),
c("GO:0018904","ether metabolic process",0.043,2.0894,0.869,0.241,"pyrimidine nucleoside metabolism"),
c("GO:0006465","signal peptide processing",0.030,3.2147,0.826,0.255,"pyrimidine nucleoside metabolism"),
c("GO:0006596","polyamine biosynthetic process",0.034,1.6461,0.830,0.258,"pyrimidine nucleoside metabolism"),
c("GO:0070647","protein modification by small protein conjugation or removal",1.542,3.0132,0.828,0.289,"pyrimidine nucleoside metabolism"),
c("GO:0019692","deoxyribose phosphate metabolic process",0.071,1.5991,0.850,0.290,"pyrimidine nucleoside metabolism"),
c("GO:0009130","pyrimidine nucleoside monophosphate biosynthetic process",0.032,2.7077,0.754,0.291,"pyrimidine nucleoside metabolism"),
c("GO:0042026","protein refolding",0.038,1.3407,0.874,0.295,"pyrimidine nucleoside metabolism"),
c("GO:0072527","pyrimidine-containing compound metabolic process",0.235,2.6478,0.853,0.297,"pyrimidine nucleoside metabolism"),
c("GO:0009200","deoxyribonucleoside triphosphate metabolic process",0.047,1.4056,0.811,0.298,"pyrimidine nucleoside metabolism"),
c("GO:0009262","deoxyribonucleotide metabolic process",0.099,1.5071,0.801,0.315,"pyrimidine nucleoside metabolism"),
c("GO:0006397","mRNA processing",0.818,1.3203,0.835,0.317,"pyrimidine nucleoside metabolism"),
c("GO:0009162","deoxyribonucleoside monophosphate metabolic process",0.028,2.0035,0.813,0.334,"pyrimidine nucleoside metabolism"),
c("GO:0008611","ether lipid biosynthetic process",0.010,2.3862,0.797,0.336,"pyrimidine nucleoside metabolism"),
c("GO:0009129","pyrimidine nucleoside monophosphate metabolic process",0.033,2.5768,0.811,0.337,"pyrimidine nucleoside metabolism"),
c("GO:0030163","protein catabolic process",1.538,2.8539,0.836,0.352,"pyrimidine nucleoside metabolism"),
c("GO:1902083","negative regulation of peptidyl-cysteine S-nitrosylation",0.063,2.6799,0.765,0.363,"pyrimidine nucleoside metabolism"),
c("GO:0019478","D-amino acid catabolic process",0.011,1.5735,0.814,0.365,"pyrimidine nucleoside metabolism"),
c("GO:0017014","protein nitrosylation",0.072,2.1720,0.863,0.367,"pyrimidine nucleoside metabolism"),
c("GO:0043538","regulation of actin phosphorylation",0.001,1.5735,0.717,0.372,"pyrimidine nucleoside metabolism"),
c("GO:0043687","post-translational protein modification",0.259,1.7033,0.850,0.413,"pyrimidine nucleoside metabolism"),
c("GO:0034199","activation of protein kinase A activity",0.019,1.4773,0.769,0.438,"pyrimidine nucleoside metabolism"),
c("GO:0009123","nucleoside monophosphate metabolic process",5.669,1.8536,0.734,0.449,"pyrimidine nucleoside metabolism"),
c("GO:0097384","cellular lipid biosynthetic process",0.010,2.3862,0.827,0.462,"pyrimidine nucleoside metabolism"),
c("GO:0042759","long-chain fatty acid biosynthetic process",0.028,2.0035,0.797,0.489,"pyrimidine nucleoside metabolism"),
c("GO:0016567","protein ubiquitination",1.323,2.3840,0.802,0.493,"pyrimidine nucleoside metabolism"),
c("GO:0018198","peptidyl-cysteine modification",0.089,2.1707,0.856,0.502,"pyrimidine nucleoside metabolism"),
c("GO:0006780","uroporphyrinogen III biosynthetic process",0.002,1.5735,0.809,0.508,"pyrimidine nucleoside metabolism"),
c("GO:0009157","deoxyribonucleoside monophosphate biosynthetic process",0.024,2.6799,0.771,0.509,"pyrimidine nucleoside metabolism"),
c("GO:0006646","phosphatidylethanolamine biosynthetic process",0.021,1.4773,0.788,0.510,"pyrimidine nucleoside metabolism"),
c("GO:0033151","V(D)J recombination",0.049,1.4056,0.806,0.520,"pyrimidine nucleoside metabolism"),
c("GO:0046486","glycerolipid metabolic process",0.810,1.3873,0.832,0.576,"pyrimidine nucleoside metabolism"),
c("GO:0046337","phosphatidylethanolamine metabolic process",0.022,1.4056,0.828,0.594,"pyrimidine nucleoside metabolism"),
c("GO:0015980","energy derivation by oxidation of organic compounds",5.874,1.4683,0.820,0.594,"pyrimidine nucleoside metabolism"),
c("GO:0009057","macromolecule catabolic process",2.264,1.3824,0.868,0.608,"pyrimidine nucleoside metabolism"),
c("GO:0009124","nucleoside monophosphate biosynthetic process",1.453,1.5064,0.711,0.616,"pyrimidine nucleoside metabolism"),
c("GO:0046502","uroporphyrinogen III metabolic process",0.002,1.5735,0.845,0.619,"pyrimidine nucleoside metabolism"),
c("GO:0016578","histone deubiquitination",0.023,2.1707,0.710,0.646,"pyrimidine nucleoside metabolism"),
c("GO:0071103","DNA conformation change",0.615,1.3019,0.838,0.648,"pyrimidine nucleoside metabolism"),
c("GO:0031145","anaphase-promoting complex-dependent proteasomal ubiquitin-dependent protein catabolic process",0.103,1.6370,0.831,0.670,"pyrimidine nucleoside metabolism"),
c("GO:0051983","regulation of chromosome segregation",0.148,2.1707,0.839,0.088,"regulation of chromosome segregation"),
c("GO:0090101","negative regulation of transmembrane receptor protein serine/threonine kinase signaling pathway",0.206,1.9678,0.814,0.139,"regulation of chromosome segregation"),
c("GO:2000270","negative regulation of fibroblast apoptotic process",0.019,1.8649,0.853,0.318,"regulation of chromosome segregation"),
c("GO:1901224","positive regulation of NIK/NF-kappaB signaling",0.009,1.5735,0.877,0.344,"regulation of chromosome segregation"),
c("GO:0010659","cardiac muscle cell apoptotic process",0.072,1.3407,0.914,0.562,"regulation of chromosome segregation"),
c("GO:0002842","positive regulation of T cell mediated immune response to tumor cell",0.001,1.5735,0.930,0.093,"positive regulation of T cell mediated immune response to tumor cell"),
c("GO:0030683","evasion or tolerance by virus of host immune response",0.001,1.5735,0.846,0.556,"positive regulation of T cell mediated immune response to tumor cell"));

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
