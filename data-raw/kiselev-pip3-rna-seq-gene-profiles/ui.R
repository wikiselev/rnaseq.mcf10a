library(shiny)
library(ggplot2)

shinyUI(pageWithSidebar(
    headerPanel(
        "Gene expression profiles in MCF10A cells upon EGF stimulation"
    ),
    sidebarPanel(
        textInput('geneName', 'Gene HGNC symbol / Ensembl ID'),
        checkboxInput("checkbox", label = "RPKM", value = FALSE),
        # checkboxInput('savePlot', "Save the plot as PDF"),
        # actionButton("goButton", "Plot!"),
        div("Please click on links below only after the plot appears on the right.", style = "color:black"),
        downloadLink('pdflink', label = "Download Plot"),
        div("\n"),
        downloadLink('datalink', label = "Download Data")
    ),

    mainPanel(
        "This is a Supplementary figure of the corresponding",
        HTML("<a href = \"http://nar.oxfordjournals.org/content/early/2015/10/11/nar.gkv1015.full\">paper</a>."),
        div("\n"),
        "Read counts are normalized by library sizes.",
        plotOutput('plot')
    )
))
