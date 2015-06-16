

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
revigo.data <- rbind(c("GO:0002544","chronic inflammatory response",0.068,1.4504,0.966,0.000,"chronic inflammatory response"),
c("GO:0008283","cell proliferation",4.075,2.4660,0.968,0.000,"cell proliferation"),
c("GO:0019083","viral transcription",0.174,3.2076,0.806,0.000,"viral transcription"),
c("GO:0006551","leucine metabolic process",0.014,1.7476,0.865,0.128,"viral transcription"),
c("GO:0036092","phosphatidylinositol-3-phosphate biosynthetic process",0.038,1.5735,0.874,0.194,"viral transcription"),
c("GO:0044265","cellular macromolecule catabolic process",1.775,2.7305,0.802,0.195,"viral transcription"),
c("GO:0044029","hypomethylation of CpG island",0.006,2.5229,0.797,0.198,"viral transcription"),
c("GO:0006415","translational termination",0.130,2.7352,0.776,0.251,"viral transcription"),
c("GO:0000413","protein peptidyl-prolyl isomerization",0.163,1.3554,0.883,0.272,"viral transcription"),
c("GO:0006368","transcription elongation from RNA polymerase II promoter",0.145,1.7932,0.845,0.306,"viral transcription"),
c("GO:0006354","DNA-templated transcription, elongation",0.203,1.4772,0.855,0.314,"viral transcription"),
c("GO:0061024","membrane organization",1.629,2.1831,0.911,0.340,"viral transcription"),
c("GO:0009313","oligosaccharide catabolic process",0.011,1.8262,0.888,0.369,"viral transcription"),
c("GO:0022411","cellular component disassembly",0.713,1.8225,0.858,0.404,"viral transcription"),
c("GO:0048268","clathrin coat assembly",0.051,1.4504,0.788,0.456,"viral transcription"),
c("GO:0044033","multi-organism metabolic process",0.213,3.0655,0.920,0.476,"viral transcription"),
c("GO:0006750","glutathione biosynthetic process",0.040,1.4876,0.844,0.488,"viral transcription"),
c("GO:0048294","negative regulation of isotype switching to IgE isotypes",0.006,2.2226,0.675,0.522,"viral transcription"),
c("GO:0006914","autophagy",0.414,1.3212,0.862,0.525,"viral transcription"),
c("GO:0044764","multi-organism cellular process",0.977,1.6684,0.898,0.553,"viral transcription"),
c("GO:0002829","negative regulation of type 2 immune response",0.021,2.0467,0.851,0.569,"viral transcription"),
c("GO:0019371","cyclooxygenase pathway",0.025,1.4876,0.866,0.594,"viral transcription"),
c("GO:0043162","ubiquitin-dependent protein catabolic process via the multivesicular body sorting pathway",0.032,1.5283,0.842,0.613,"viral transcription"),
c("GO:0006032","chitin catabolic process",0.033,1.8262,0.831,0.615,"viral transcription"),
c("GO:0009057","macromolecule catabolic process",2.264,2.9172,0.851,0.619,"viral transcription"),
c("GO:0006414","translational elongation",0.313,2.5406,0.859,0.619,"viral transcription"),
c("GO:0044419","interspecies interaction between organisms",1.105,1.5815,0.938,0.652,"viral transcription"),
c("GO:0002712","regulation of B cell mediated immunity",0.113,1.3022,0.857,0.655,"viral transcription"),
c("GO:0006413","translational initiation",0.465,2.1267,0.855,0.690,"viral transcription"),
c("GO:0003163","sinoatrial node development",0.008,2.2226,0.895,0.015,"sinoatrial node development"),
c("GO:0048839","inner ear development",0.387,1.4607,0.869,0.322,"sinoatrial node development"),
c("GO:0003161","cardiac conduction system development",0.027,1.6240,0.888,0.613,"sinoatrial node development"),
c("GO:1902582","single-organism intracellular transport",2.514,2.4498,0.777,0.027,"single-organism intracellular transport"),
c("GO:0006907","pinocytosis",0.034,1.4162,0.885,0.260,"single-organism intracellular transport"),
c("GO:0051654","establishment of mitochondrion localization",0.025,1.6240,0.844,0.461,"single-organism intracellular transport"),
c("GO:2000643","positive regulation of early endosome to late endosome transport",0.006,2.2226,0.741,0.479,"single-organism intracellular transport"),
c("GO:1902445","regulation of mitochondrial membrane permeability involved in programmed necrotic cell death",0.008,2.5229,0.732,0.491,"single-organism intracellular transport"),
c("GO:2000370","positive regulation of clathrin-mediated endocytosis",0.003,2.2226,0.781,0.497,"single-organism intracellular transport"),
c("GO:0006810","transport",16.357,1.3510,0.842,0.545,"single-organism intracellular transport"),
c("GO:0072583","clathrin-mediated endocytosis",0.036,1.5283,0.882,0.572,"single-organism intracellular transport"),
c("GO:0051641","cellular localization",6.184,1.3213,0.867,0.588,"single-organism intracellular transport"),
c("GO:0051646","mitochondrion localization",0.057,1.3280,0.849,0.595,"single-organism intracellular transport"),
c("GO:0060391","positive regulation of SMAD protein import into nucleus",0.026,1.6240,0.648,0.619,"single-organism intracellular transport"),
c("GO:0006614","SRP-dependent cotranslational protein targeting to membrane",0.150,2.5528,0.727,0.633,"single-organism intracellular transport"),
c("GO:0015031","protein transport",3.600,1.5672,0.804,0.641,"single-organism intracellular transport"),
c("GO:0007184","SMAD protein import into nucleus",0.041,1.3554,0.683,0.650,"single-organism intracellular transport"),
c("GO:0070972","protein localization to endoplasmic reticulum",0.196,2.3851,0.809,0.677,"single-organism intracellular transport"),
c("GO:0030033","microvillus assembly",0.021,1.9226,0.883,0.028,"microvillus assembly"),
c("GO:0032528","microvillus organization",0.023,1.8262,0.884,0.414,"microvillus assembly"),
c("GO:0042127","regulation of cell proliferation",3.148,2.6326,0.811,0.043,"regulation of cell proliferation"),
c("GO:0046588","negative regulation of calcium-dependent cell-cell adhesion",0.001,2.5229,0.846,0.119,"regulation of cell proliferation"),
c("GO:2000653","regulation of genetic imprinting",0.007,2.5229,0.850,0.135,"regulation of cell proliferation"),
c("GO:0071514","genetic imprinting",0.081,1.3280,0.866,0.195,"regulation of cell proliferation"),
c("GO:0060829","negative regulation of canonical Wnt signaling pathway involved in neural plate anterior/posterior pattern formation",0.001,2.5229,0.721,0.206,"regulation of cell proliferation"),
c("GO:0038028","insulin receptor signaling pathway via phosphatidylinositol 3-kinase",0.010,1.9226,0.836,0.214,"regulation of cell proliferation"),
c("GO:2000270","negative regulation of fibroblast apoptotic process",0.019,1.6813,0.823,0.235,"regulation of cell proliferation"),
c("GO:0032713","negative regulation of interleukin-4 production",0.007,2.0467,0.840,0.261,"regulation of cell proliferation"),
c("GO:2001046","positive regulation of integrin-mediated signaling pathway",0.017,2.0467,0.806,0.266,"regulation of cell proliferation"),
c("GO:0001919","regulation of receptor recycling",0.041,1.4504,0.785,0.309,"regulation of cell proliferation"),
c("GO:0060766","negative regulation of androgen receptor signaling pathway",0.018,1.6240,0.789,0.379,"regulation of cell proliferation"),
c("GO:0051414","response to cortisol",0.009,1.9226,0.955,0.398,"regulation of cell proliferation"),
c("GO:0048523","negative regulation of cellular process",7.863,1.3146,0.794,0.405,"regulation of cell proliferation"),
c("GO:0060896","neural plate pattern specification",0.021,1.6240,0.889,0.445,"regulation of cell proliferation"),
c("GO:0045746","negative regulation of Notch signaling pathway",0.052,1.3554,0.784,0.469,"regulation of cell proliferation"),
c("GO:2000811","negative regulation of anoikis",0.021,1.4162,0.824,0.470,"regulation of cell proliferation"),
c("GO:0032526","response to retinoic acid",0.239,1.7442,0.950,0.492,"regulation of cell proliferation"),
c("GO:0072198","mesenchymal cell proliferation involved in ureter development",0.013,2.0467,0.856,0.493,"regulation of cell proliferation"),
c("GO:0032633","interleukin-4 production",0.068,1.3280,0.906,0.512,"regulation of cell proliferation"),
c("GO:2000096","positive regulation of Wnt signaling pathway, planar cell polarity pathway",0.010,1.9226,0.713,0.516,"regulation of cell proliferation"),
c("GO:0044346","fibroblast apoptotic process",0.033,1.3847,0.905,0.536,"regulation of cell proliferation"),
c("GO:0022407","regulation of cell-cell adhesion",0.162,1.8321,0.841,0.557,"regulation of cell proliferation"),
c("GO:0072189","ureter development",0.034,1.6240,0.883,0.583,"regulation of cell proliferation"),
c("GO:0030155","regulation of cell adhesion",0.746,1.6017,0.841,0.612,"regulation of cell proliferation"),
c("GO:2001044","regulation of integrin-mediated signaling pathway",0.056,1.6813,0.812,0.675,"regulation of cell proliferation"),
c("GO:1900026","positive regulation of substrate adhesion-dependent cell spreading",0.042,1.4876,0.717,0.685,"regulation of cell proliferation"),
c("GO:0090090","negative regulation of canonical Wnt signaling pathway",0.188,1.8456,0.734,0.687,"regulation of cell proliferation"),
c("GO:0046586","regulation of calcium-dependent cell-cell adhesion",0.003,2.2226,0.868,0.691,"regulation of cell proliferation"),
c("GO:0042092","type 2 immune response",0.083,1.3022,0.955,0.055,"type 2 immune response"),
c("GO:0009056","catabolic process",7.851,1.6451,0.955,0.061,"catabolism"),
c("GO:0006879","cellular iron ion homeostasis",0.185,2.0630,0.868,0.067,"cellular iron ion homeostasis"));

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
