install.packages("shiny")

library(lubridate)
library(ggplot2)
library(shiny)


# vygenerovat dny
startDate  <-  as.Date("1500-01-01")
endDate  <- as.Date("2500-12-31")
allDays  <- startDate:endDate
allDays  <- as.Date(allDays, origin=as.Date("1970-01-01"))
friday13  <- wday(allDays)==6 & day(allDays)==13

pocetPatku  <- table(year(allDays[friday13]))
pocetPatku  <- as.data.frame(pocetPatku)
names(pocetPatku)  <- (c("rok", "pocet"))

pocetPatku

patky13  <- allDays[friday13]

write.csv(patky13, file="data/patky13.csv")

length(patky13)


vybranePatky  <- patky13[patky13>=as.Date("1978-06-29") & patky13<=as.Date("2014-06-16")]
grafData  <- data.frame(table(year(vybranePatky)))
p  <- qplot(Var1,
            Freq,
            data=grafData,
            geom="bar",
            stat="identity",
            ylab="Počet pátků třináctého",
            xlab="Rok",
            asp=0.2,
            ylim=c(0,3))
p + theme(axis.text.x = element_text(angle = 90, vjust=0.5))


qplot(rnorm(100))

selectDays  <- allDays[allDays>as.Date("1984-03-28") & allDays<as.Date("2014-06-14")]
sum(wday(selectDays)==6 & day(selectDays)==13)



data.frame(den=format(vybranePatky, "%A %d. %B %Y"))



# shiny




runExample("01_hello")

runApp("patek_app", display.mode="showcase")

system.file("examples", package="shiny")

runExample("01_hello") # a histogram
runExample("02_text") # tables and data frames
runExample("03_reactivity") # a reactive expression
runExample("04_mpg") # global variables
runExample("05_sliders") # slider bars
runExample("06_tabsets") # tabbed panels
runExample("07_widgets") # help text and submit buttons
runExample("08_html") # shiny app built from HTML
runExample("09_upload") # file upload wizard
runExample("10_download") # file download wizard
runExample("11_timer") # an automated timer

update.packages()
