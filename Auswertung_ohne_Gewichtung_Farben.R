#Verzeichnispfad zu dem Ordner, in dem die Daten liegen:
setwd("/PATH/")

dateiname = "gewichtung_14122018.csv"

#Hier das zu analysierende Geschlecht auswählen: 
geschlecht = "f"

#Daten aus der CSV-Datei einlesen:
daten <- read.csv(toString(dateiname), header = TRUE, sep = ",")

#Matrix Farbergebnisse erstellen, die später befüllt wird:
farbergebnisse = matrix(c(1:28),byrow=TRUE,nrow=14)

#Nur die Daten mit dem jeweiligen Geschlecht auswählen:
subset = daten[which(daten$geschlecht == geschlecht),]

#Schleife über alle Farbklassen
for(i in levels(subset$parent_name_de_2)){
  farbsumme = 0
  #Wenn parent_name_2 der jeweiligen Farbklasse entspricht, summiere eine Eins
  #Abgeleitet von dem Skript, das die Gewichtung berücksichtigt, wird der Gewichtungswert durch sich selbst geteilt, was jeweils 1 ergibt
  farbsumme = farbsumme + sum((subset$weight_parent_color[which(subset$parent_name_de_2 == i)])/(subset$weight_parent_color[which(subset$parent_name_de_2 == i)]))
  assign(paste("summe_",i,sep=""),farbsumme)
}

#Weise die Ergebnisse dem vektor farbergebnisse zu, um ihn dann zu plotten
farbergebnisse[,1] = c(levels(daten$parent_name_de_2))
farbergebnisse[,2] = c(summe_beige,summe_blau,summe_braun,summe_gelb,summe_grau,summe_gruen,summe_lila,summe_orange,summe_pink,summe_rosa,summe_rot,summe_schwarz,summe_tuerkis,summe_weiss)
colnames(farbergebnisse) <- c("Farbe","Wert")

#Anzahl gefundener Farben pro Farbklasse als Balkendiagramm plotten:
barplot(as.numeric(farbergebnisse[,2]),names.arg = farbergebnisse[,1],horiz=TRUE,cex.names=0.8,las=1)

#CSV-Datei mit den gefundenen aufaddierten Ergebnissen speichern, mit Name "farbe_m.csv" oder "farbe_f.csv"
filename = paste("farbe_",geschlecht,sep="")
write.csv(farbergebnisse, filename,row.names=FALSE)