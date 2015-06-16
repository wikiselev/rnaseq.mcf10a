library(shiny)
library(ggplot2)
library(data.table)

shinyServer(
        function(input, output) {
                # this will load the data only once when the webpage is open
                d <- readRDS("data/plot-data.rds")
                glens <- read.csv("data/exon-map-lengths.csv")
                mean.lib.size <- 21890091
                validateFunction <- function() {
                        validate(
                                need(input$geneName != "",
                                     "Please type in your Gene")
                        )
                        validate(
                                need((toupper(input$geneName) %in% d$id) | (toupper(input$geneName) %in% d$hgnc_symbol),
                                     "Your gene is not in our list. We only accept HGNC symbols and Ensembl IDs. Please check that your gene name is either of the above...")
                        )
                }
                plotFunction <- function(dat) {
                        ylabel <- "Read counts"
                        if(input$checkbox) {
                                ylabel <- "RPKM"
                        }
                        limits <- aes(ymax = value + sd, ymin = value - sd)
                        ggplot(dat, aes(time, value, group = Condition, color = Condition)) +
                                geom_line(size = 1) +
                                geom_point(size = 3) +
                                geom_errorbar(limits, size = 0.5, width = 5) +
                                facet_grid(. ~ hgnc_symbol) +
                                labs(x = "Time, min", y = ylabel) +
                                theme_bw()
                }
                data <- reactive({
                        if(input$checkbox) {
                                validateFunction()
                                t <- d[(d$id %in% toupper(input$geneName)) | (d$hgnc_symbol %in% toupper(input$geneName))]
                                length <- unique(glens[glens$ensembl_gene_id == unique(t$id),]$exon_map_length)
                                t$value <- t$value / length * 1e9 / mean.lib.size
                                t$sd <- t$sd / length * 1e9 / mean.lib.size
                                t
                        } else {
                                validateFunction()
                                d[(d$id %in% toupper(input$geneName)) | (d$hgnc_symbol %in% toupper(input$geneName))]
                        }
                })
                output$plot <- renderPlot({
                        plotFunction(data())
                }, height=400, width = 700)
                output$pdflink <- downloadHandler(
                        filename <- function() {
                                paste0(toupper(input$geneName), "-rna-seq-profile.pdf")
                        },
                        content <- function(file) {
                                pdf(file, width = 7, height = 4)
                                print(plotFunction(data()))
                                dev.off()
                        }
                )
                output$datalink <- downloadHandler(
                        filename <- function() {
                                paste0(toupper(input$geneName), "-rna-seq-data.csv")
                        },
                        content <- function(file) {
                                write.csv(data(), file = file, row.names = FALSE, quote = FALSE)
                        }
                )
        }
)
