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
                "This is a Supplementary figure for the paper...",
                div("\n"),
                "(read counts are normalized by library sizes)",
                plotOutput('plot')
        )
))
