#Den Pfad zur den Daten angeben:
setwd("/PATH")
library(ggplot2)
dateiname = "gewichtung_14122018.csv"

#CSV-Datei einlesen:
daten <- read.csv(toString(dateiname), header = TRUE, sep = ",")

#Geschlecht für Analyse festlegen:
geschlecht = "f"

#Matrix für Ergebnisse anlegen, die dann befüllt wird:
farbergebnisse = matrix(1, nrow = length(levels(daten$parent_name_de_2)), ncol = 2)

#Schleife über alle 14 Farbklassen:
for(i in levels(daten$parent_name_de_2)){
  farbsumme = 0
  farbsumme = farbsumme + sum(daten$weight_parent_color[which(daten$parent_name_de_2 == i & daten$geschlecht == geschlecht)])
  assign(paste("summe_",i,sep=""),farbsumme)
}

#Die Ergebnisse zum Plotten in eine Matrix schreiben:
farbergebnisse[,1] = c(levels(daten$parent_name_de_2))
farbergebnisse[,2] = c(summe_beige,summe_blau,summe_braun,summe_gelb,summe_grau,summe_gruen,summe_lila,summe_orange,summe_pink,summe_rosa,summe_rot,summe_schwarz,summe_tuerkis,summe_weiss)
#Spaltennamen vergeben:
colnames(farbergebnisse) <- c("Farbe","Wert")
#Das Ganze als Dataframe umwandeln, damit das mit dem Plotten funktioniert:
farbergebnisse = data.frame(farbergebnisse)

#Ergebnisse plotten und als PDF ausgeben:
library(ggplot2)
barplot = ggplot(as.data.frame(farbergebnisse[,2]), aes(x=farbergebnisse[,1], y=as.numeric(as.character(farbergebnisse[,2])))) + geom_bar(stat="identity") + 
  labs(x="Farben", y="Gewichtete Haeufigkeit")

ggsave(plot = barplot, width = 8, height = 3, dpi = 300, filename = paste("barplot_" , toString(geschlecht) , ".pdf"))
