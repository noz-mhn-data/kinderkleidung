# Working Directory setzen
setwd("/PATH")

dateiname = "gewichtung_14122018.csv"

#CSV-Datei einlesen
daten <- read.csv(toString(dateiname), header = TRUE, sep = ",")

#Nach den IDs gruppieren
motivanteil =  group_by(daten, id)
#Erstellt Matrix mit Anzahl Einträge von "has motiv" pro Gruppe, also pro ID:
zaehler = count(motivanteil, vars = has_motiv)
#Filtert aus der zaehler-tabelle jene Zeilen heraus, bei denen "has motiv" ungleich Null ist, die also ein Motiv haben:
motivzaehler = zaehler[which(zaehler$vars != 0),]
#Anzahl Zeilen von motivzaehler ergibt die Anzahl von Shirts mit Motiv: 2140