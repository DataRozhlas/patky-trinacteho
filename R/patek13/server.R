
shinyServer(function(input, output) {
                output$vysledek <- renderText({ 
                vybranePatky  <- patky13[patky13>=input$rozsah[1] & patky13<=input$rozsah[2]]
                length(vybranePatky)
        })
        
        output$graf <- renderPlot({ 
                vybranePatky  <- patky13[patky13>=input$rozsah[1] & patky13<=input$rozsah[2]]
                grafData  <- data.frame(table(year(vybranePatky)))
                p <- ggplot(data = grafData, aes(x = as.Date(paste0(Var1, "-01-01")), y = Freq))
                p <- p + geom_bar(fill = "#e41a1c", stat = "identity")
                p <-  p + ylab("Počet pátků třináctého")
                p <- p + xlab("")
                p
        })
        
        output$tabulka <- renderText({ 
                vybranePatky  <- patky13[patky13>=input$rozsah[1] & patky13<=input$rozsah[2]]
                prevod <- function(x) {
                        mesic <- month(x)
                        if (mesic == 1) {"leden"}
                        else if (mesic == 2) {"únor"}
                        else if (mesic == 3) {"březen"}
                        else if (mesic == 4) {"duben"}
                        else if (mesic == 5) {"květen"}
                        else if (mesic == 6) {"červen"}
                        else if (mesic == 7) {"červenec"}
                        else if (mesic == 8) {"srpen"}
                        else if (mesic == 9) {"září"}
                        else if (mesic == 10) {"říjen"}
                        else if (mesic == 11) {"listopad"}
                        else if (mesic == 12) {"prosinec"}
                }
                mesice <- sapply(vybranePatky, prevod)
                roky <- year(vybranePatky)
                roky <- paste0(as.character(roky), ", ")
                roky[length(roky)] <- substr(roky[length(roky)], 1, 4)
                paste(mesice, roky)
        })
})

