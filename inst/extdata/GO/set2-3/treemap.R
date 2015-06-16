

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
revigo.data <- rbind(c("GO:0006415","translational termination",0.130,19.6778,0.745,0.000,"translational termination"),
c("GO:0000184","nuclear-transcribed mRNA catabolic process, nonsense-mediated decay",0.142,16.3372,0.806,0.153,"translational termination"),
c("GO:0019359","nicotinamide nucleotide biosynthetic process",0.066,2.3197,0.809,0.198,"translational termination"),
c("GO:0006307","DNA dealkylation involved in DNA repair",0.010,1.8286,0.824,0.202,"translational termination"),
c("GO:0019538","protein metabolic process",17.009,3.0223,0.877,0.204,"translational termination"),
c("GO:1900063","regulation of peroxisome organization",0.005,1.4827,0.855,0.220,"translational termination"),
c("GO:0018032","protein amidation",0.008,1.4827,0.893,0.221,"translational termination"),
c("GO:0001519","peptide amidation",0.009,1.4827,0.894,0.226,"translational termination"),
c("GO:0006956","complement activation",0.276,2.4353,0.796,0.234,"translational termination"),
c("GO:0032185","septin cytoskeleton organization",0.002,1.4827,0.890,0.239,"translational termination"),
c("GO:0006359","regulation of transcription from RNA polymerase III promoter",0.033,2.8153,0.827,0.246,"translational termination"),
c("GO:0018410","C-terminal protein amino acid modification",0.043,1.3677,0.878,0.247,"translational termination"),
c("GO:0042274","ribosomal small subunit biogenesis",0.033,3.3098,0.876,0.247,"translational termination"),
c("GO:0072376","protein activation cascade",0.335,1.8986,0.850,0.254,"translational termination"),
c("GO:0010951","negative regulation of endopeptidase activity",0.499,1.7440,0.823,0.267,"translational termination"),
c("GO:0019083","viral transcription",0.174,13.7959,0.766,0.277,"translational termination"),
c("GO:0072524","pyridine-containing compound metabolic process",0.204,1.8477,0.873,0.278,"translational termination"),
c("GO:0006614","SRP-dependent cotranslational protein targeting to membrane",0.150,18.9208,0.747,0.278,"translational termination"),
c("GO:0042558","pteridine-containing compound metabolic process",0.154,1.3677,0.875,0.297,"translational termination"),
c("GO:0006383","transcription from RNA polymerase III promoter",0.105,1.8080,0.852,0.298,"translational termination"),
c("GO:1901962","S-adenosyl-L-methionine transmembrane transport",0.001,1.4827,0.879,0.300,"translational termination"),
c("GO:0016192","vesicle-mediated transport",3.273,1.5952,0.872,0.305,"translational termination"),
c("GO:0022411","cellular component disassembly",0.713,10.6198,0.838,0.320,"translational termination"),
c("GO:0016071","mRNA metabolic process",1.098,5.0809,0.843,0.329,"translational termination"),
c("GO:0006979","response to oxidative stress",0.874,1.6851,0.928,0.330,"translational termination"),
c("GO:0006575","cellular modified amino acid metabolic process",0.583,1.7667,0.820,0.332,"translational termination"),
c("GO:0006412","translation",1.984,8.8539,0.829,0.336,"translational termination"),
c("GO:0043687","post-translational protein modification",0.259,1.5634,0.867,0.360,"translational termination"),
c("GO:0000921","septin ring assembly",0.001,1.4827,0.873,0.360,"translational termination"),
c("GO:0030198","extracellular matrix organization",0.708,2.5421,0.834,0.370,"translational termination"),
c("GO:0043062","extracellular structure organization",0.709,2.5421,0.838,0.370,"translational termination"),
c("GO:0061024","membrane organization",1.629,6.8539,0.869,0.404,"translational termination"),
c("GO:1902544","regulation of DNA N-glycosylase activity",0.001,1.4827,0.923,0.405,"translational termination"),
c("GO:1902546","positive regulation of DNA N-glycosylase activity",0.001,1.4827,0.923,0.405,"translational termination"),
c("GO:0006797","polyphosphate metabolic process",0.001,1.4827,0.894,0.408,"translational termination"),
c("GO:0031532","actin cytoskeleton reorganization",0.144,1.3154,0.845,0.409,"translational termination"),
c("GO:0072362","regulation of glycolytic process by negative regulation of transcription from RNA polymerase II promoter",0.001,1.4827,0.783,0.417,"translational termination"),
c("GO:0022613","ribonucleoprotein complex biogenesis",0.598,2.7721,0.868,0.438,"translational termination"),
c("GO:0006655","phosphatidylglycerol biosynthetic process",0.015,1.4768,0.874,0.439,"translational termination"),
c("GO:0044705","multi-organism reproductive behavior",0.091,2.0083,0.881,0.446,"translational termination"),
c("GO:0000302","response to reactive oxygen species",0.419,1.8410,0.851,0.450,"translational termination"),
c("GO:1901624","negative regulation of lymphocyte chemotaxis",0.002,1.4827,0.751,0.466,"translational termination"),
c("GO:1901070","guanosine-containing compound biosynthetic process",0.066,1.3115,0.823,0.467,"translational termination"),
c("GO:0009057","macromolecule catabolic process",2.264,4.3188,0.831,0.468,"translational termination"),
c("GO:0044033","multi-organism metabolic process",0.213,12.8239,0.888,0.476,"translational termination"),
c("GO:0044267","cellular protein metabolic process",12.981,3.3768,0.824,0.493,"translational termination"),
c("GO:1902580","single-organism cellular localization",1.731,6.9208,0.833,0.495,"translational termination"),
c("GO:0042270","protection from natural killer cell mediated cytotoxicity",0.003,1.4827,0.893,0.495,"translational termination"),
c("GO:0042713","sperm ejaculation",0.030,1.4827,0.883,0.496,"translational termination"),
c("GO:0019372","lipoxygenase pathway",0.017,1.5764,0.873,0.498,"translational termination"),
c("GO:1902578","single-organism localization",14.013,6.9208,0.845,0.501,"translational termination"),
c("GO:0006914","autophagy",0.414,1.4090,0.860,0.506,"translational termination"),
c("GO:0006516","glycoprotein catabolic process",0.018,2.7570,0.824,0.522,"translational termination"),
c("GO:0036414","histone citrullination",0.003,1.4827,0.752,0.529,"translational termination"),
c("GO:0070613","regulation of protein processing",0.357,1.3240,0.833,0.545,"translational termination"),
c("GO:0007618","mating",0.139,1.6354,0.912,0.552,"translational termination"),
c("GO:0071822","protein complex subunit organization",3.467,6.2147,0.847,0.557,"translational termination"),
c("GO:0033036","macromolecule localization",5.646,2.4908,0.872,0.558,"translational termination"),
c("GO:0044419","interspecies interaction between organisms",1.105,5.7212,0.909,0.559,"translational termination"),
c("GO:0006952","defense response",3.096,1.3971,0.922,0.559,"translational termination"),
c("GO:0071702","organic substance transport",5.810,3.9208,0.863,0.561,"translational termination"),
c("GO:0006241","CTP biosynthetic process",0.059,1.3115,0.817,0.561,"translational termination"),
c("GO:0010559","regulation of glycoprotein biosynthetic process",0.042,1.5754,0.801,0.567,"translational termination"),
c("GO:0044085","cellular component biogenesis",4.871,1.4634,0.857,0.567,"translational termination"),
c("GO:0051641","cellular localization",6.184,2.0453,0.871,0.568,"translational termination"),
c("GO:1901668","regulation of superoxide dismutase activity",0.002,1.4827,0.776,0.581,"translational termination"),
c("GO:0070925","organelle assembly",0.934,1.4051,0.832,0.587,"translational termination"),
c("GO:0019098","reproductive behavior",0.099,1.8422,0.942,0.593,"translational termination"),
c("GO:0031179","peptide modification",0.009,1.4827,0.894,0.606,"translational termination"),
c("GO:0043933","macromolecular complex subunit organization",5.276,5.6383,0.854,0.607,"translational termination"),
c("GO:0000052","citrulline metabolic process",0.025,1.5764,0.858,0.608,"translational termination"),
c("GO:0010848","regulation of chromatin disassembly",0.001,1.4827,0.839,0.612,"translational termination"),
c("GO:0006414","translational elongation",0.313,17.6778,0.846,0.619,"translational termination"),
c("GO:0033962","cytoplasmic mRNA processing body assembly",0.026,2.0083,0.848,0.626,"translational termination"),
c("GO:0006401","RNA catabolic process",0.316,13.0315,0.799,0.643,"translational termination"),
c("GO:0002779","antibacterial peptide secretion",0.002,1.4827,0.772,0.647,"translational termination"),
c("GO:0009074","aromatic amino acid family catabolic process",0.057,1.6921,0.794,0.647,"translational termination"),
c("GO:0044764","multi-organism cellular process",0.977,5.4815,0.879,0.652,"translational termination"),
c("GO:0030490","maturation of SSU-rRNA",0.014,2.4473,0.782,0.676,"translational termination"),
c("GO:0070972","protein localization to endoplasmic reticulum",0.196,17.1549,0.851,0.677,"translational termination"),
c("GO:0006605","protein targeting",1.102,8.0223,0.807,0.678,"translational termination"),
c("GO:0006481","C-terminal protein methylation",0.006,1.4827,0.891,0.678,"translational termination"),
c("GO:0044765","single-organism transport",13.545,3.6778,0.829,0.681,"translational termination"),
c("GO:0006413","translational initiation",0.465,13.6198,0.842,0.690,"translational termination"),
c("GO:0009072","aromatic amino acid family metabolic process",0.140,1.3892,0.833,0.697,"translational termination"),
c("GO:0042744","hydrogen peroxide catabolic process",0.034,2.0083,0.736,0.698,"translational termination"),
c("GO:0033273","response to vitamin",0.267,2.7852,0.852,0.000,"response to vitamin"),
c("GO:0072707","cellular response to sodium dodecyl sulfate",0.001,1.4827,0.885,0.258,"response to vitamin"),
c("GO:0071275","cellular response to aluminum ion",0.003,1.4827,0.880,0.275,"response to vitamin"),
c("GO:2001023","regulation of response to drug",0.007,2.4989,0.893,0.288,"response to vitamin"),
c("GO:0072706","response to sodium dodecyl sulfate",0.001,1.4827,0.911,0.297,"response to vitamin"),
c("GO:0016198","axon choice point recognition",0.011,1.9952,0.753,0.396,"response to vitamin"),
c("GO:0010035","response to inorganic substance",1.004,2.5607,0.885,0.424,"response to vitamin"),
c("GO:2001038","regulation of cellular response to drug",0.003,2.4989,0.855,0.442,"response to vitamin"),
c("GO:0042493","response to drug",1.179,1.8422,0.883,0.494,"response to vitamin"),
c("GO:0048545","response to steroid hormone",1.316,1.3490,0.868,0.509,"response to vitamin"),
c("GO:0009991","response to extracellular stimulus",1.114,1.3547,0.910,0.570,"response to vitamin"),
c("GO:0043402","glucocorticoid mediated signaling pathway",0.017,1.4827,0.836,0.581,"response to vitamin"),
c("GO:0000435","positive regulation of transcription from RNA polymerase II promoter by galactose",0.001,1.4827,0.756,0.598,"response to vitamin"),
c("GO:0034516","response to vitamin B6",0.001,1.4827,0.881,0.598,"response to vitamin"),
c("GO:0051179","localization",18.927,2.4271,0.993,0.000,"localization"),
c("GO:0051704","multi-organism process",4.431,5.5850,0.992,0.000,"multi-organism process"),
c("GO:0071840","cellular component organization or biogenesis",12.603,3.7212,0.993,0.000,"cellular component organization or biogenesis"),
c("GO:0035726","common myeloid progenitor cell proliferation",0.006,1.4827,0.982,0.012,"common myeloid progenitor cell proliferation"),
c("GO:0071985","multivesicular body sorting pathway",0.006,2.2076,0.903,0.012,"multivesicular body sorting pathway"),
c("GO:0030100","regulation of endocytosis",0.359,1.4554,0.739,0.429,"multivesicular body sorting pathway"),
c("GO:0052066","entry of symbiont into host cell by promotion of host phagocytosis",0.001,1.4827,0.743,0.585,"multivesicular body sorting pathway"),
c("GO:0052231","modulation of phagocytosis in other organism involved in symbiotic interaction",0.001,1.4827,0.762,0.608,"multivesicular body sorting pathway"),
c("GO:2000536","negative regulation of entry of bacterium into host cell",0.001,1.4827,0.877,0.665,"multivesicular body sorting pathway"),
c("GO:0009056","catabolic process",7.851,2.9547,0.946,0.059,"catabolism"),
c("GO:0006959","humoral immune response",0.457,2.2882,0.949,0.070,"humoral immune response"),
c("GO:0042221","response to chemical",8.684,1.4185,0.955,0.101,"humoral immune response"),
c("GO:0045066","regulatory T cell differentiation",0.033,1.9952,0.893,0.129,"humoral immune response"),
c("GO:0060785","regulation of apoptosis involved in tissue homeostasis",0.001,1.4827,0.895,0.166,"humoral immune response"),
c("GO:0032728","positive regulation of interferon-beta production",0.030,1.5754,0.917,0.199,"humoral immune response"),
c("GO:0048002","antigen processing and presentation of peptide antigen",19.164,1.4334,0.968,0.246,"humoral immune response"),
c("GO:0035732","nitric oxide storage",0.001,1.4827,0.913,0.292,"humoral immune response"),
c("GO:0010710","regulation of collagen catabolic process",0.003,1.4827,0.822,0.298,"humoral immune response"),
c("GO:0010612","regulation of cardiac muscle adaptation",0.005,1.4827,0.910,0.302,"humoral immune response"),
c("GO:0060312","regulation of blood vessel remodeling",0.007,1.4827,0.917,0.309,"humoral immune response"),
c("GO:0016271","tissue death",4.485,1.4827,0.955,0.409,"humoral immune response"),
c("GO:0034239","regulation of macrophage fusion",0.009,1.4827,0.817,0.418,"humoral immune response"),
c("GO:0060055","angiogenesis involved in wound healing",0.050,1.3892,0.888,0.422,"humoral immune response"),
c("GO:0071660","positive regulation of IP-10 production",0.001,1.4827,0.921,0.525,"humoral immune response"),
c("GO:0002252","immune effector process",20.305,1.3618,0.968,0.533,"humoral immune response"),
c("GO:0045576","mast cell activation",0.114,1.6354,0.921,0.551,"humoral immune response"),
c("GO:0071612","IP-10 production",0.001,1.4827,0.951,0.582,"humoral immune response"),
c("GO:0002361","CD4-positive, CD25-positive, alpha-beta regulatory T cell differentiation",0.008,1.4827,0.898,0.600,"humoral immune response"),
c("GO:0010702","regulation of histolysis",0.122,1.4827,0.898,0.604,"humoral immune response"),
c("GO:0060313","negative regulation of blood vessel remodeling",0.001,1.4827,0.906,0.649,"humoral immune response"),
c("GO:0010711","negative regulation of collagen catabolic process",0.001,1.4827,0.817,0.687,"humoral immune response"),
c("GO:0007559","histolysis",0.407,1.4827,0.940,0.688,"humoral immune response"),
c("GO:0007229","integrin-mediated signaling pathway",0.418,2.0057,0.878,0.073,"integrin-mediated signaling pathway"),
c("GO:1901976","regulation of cell cycle checkpoint",0.057,1.7683,0.910,0.136,"integrin-mediated signaling pathway"),
c("GO:0007096","regulation of exit from mitosis",0.019,1.3892,0.828,0.556,"integrin-mediated signaling pathway"),
c("GO:0090231","regulation of spindle checkpoint",0.034,1.4768,0.912,0.689,"integrin-mediated signaling pathway"),
c("GO:0072593","reactive oxygen species metabolic process",0.387,1.4772,0.924,0.082,"reactive oxygen species metabolism"));

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
