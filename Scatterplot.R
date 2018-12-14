#Pfad zu den Daten angeben
setwd("/PATH")

dateiname = "gewichtung_14122018.csv"

# CSV-Datei einlesen
daten <- read.csv(toString(dateiname), header = TRUE, sep = ",")

library(ggplot2)

#Daten-Subset ohne Schwarz, Grau und Weiß erstellen, da sich diese Farben im HSV-Farbraum nicht sinnvoll darstellen lassen:
newdata <- daten[ which(daten$geschlecht=='m' & daten$parent_name_de_2!='grau' & daten$parent_name_de_2!='schwarz', daten$parent_name_de_2!='weiß'), ]

#Die Hex-Werte der Daten in der Variablen newFarben speichern:
newFarben = newdata[1:nrow(newdata),17]

#Den Scatterplot erstellen:
scatter = ggplot(newdata, aes(x = H, y = V)) + #Die Spalten H und V aus dem HSV-Farbraum auftragen
      geom_point(size=1, colour =  newFarben,position=position_jitter(width=5, height=5)) + # den Punkten den jeweilige HEX-Code zuweisen & leichtes Rauschen gegen sich überdeckende Punkte hinzufügen
      labs(x = "Position der Farbe im Spektrum", y = "Helligkeit") + 
      ggtitle("Jungen") + 
      theme_classic() +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) + #Aussehen des Plots stylen
      xlim(0,360) +
      ylim(20,100)
#Plot als PDF speichern
ggsave(plot = scatter, width = 5, height = 3, dpi = 300, filename = paste("scatterplot_" , toString(newdata$geschlecht[1]) , ".pdf"))
