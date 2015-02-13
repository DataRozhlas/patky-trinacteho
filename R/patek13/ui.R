library(ggplot2)
library(lubridate)

shinyUI(fluidPage(
        
        title = "Kolik pátků třináctého jste už zažili?",
        
        titlePanel("Kolik pátků třináctého jste už zažili?"),
        
        h4("Vyberte si začátek a konec období, například datum svého narození a dnešní den:"),
        
        dateRangeInput(inputId= "rozsah",
                       label="Zvolte datum",
                       start="1980-01-01",
                       end=Sys.Date(),
                       min=as.Date("1500-01-01"),
                       max=as.Date("2500-12-31"),
                       format="dd.mm.yyyy",
                       language="cs",
                       weekstart=1,
                       separator="do"),        
        
        hr(),
        
        h4("Ve vybraném období se vyskytlo"),
        
        h1(textOutput("vysledek")),
        
        h4("pátků třináctého."),
        
        hr(),
        
        h4("Kolik jich bylo v jednotlivých letech?"),
        
        plotOutput("graf"),
        
        hr(),
        
        h4("Všechny pátky třináctého ve vybraném období"),
        
        textOutput("tabulka")
        
        
))
