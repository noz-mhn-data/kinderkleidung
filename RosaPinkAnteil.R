#Pfad zu den Daten anegeben:
setwd("/PATH")

dateiname = "gewichtung_14122018.csv"

# CSV-Datei einlesen
daten <- read.csv(toString(dateiname), header = TRUE, sep = ",")

#Daten unterteilen in Subsets mit rosa und pinken Einträgen jeweils für Jungen und Mädchen
maedchendaten = daten[which(daten$geschlecht == "f" & (daten$parent_name_de_2 == "rosa" | daten$parent_name_de_2 == "pink")),]
jungendaten = daten[which(daten$geschlecht == "m" & (daten$parent_name_de_2 == "rosa" | daten$parent_name_de_2 == "pink")),]

#Nach den IDs gruppieren, denn wir wollen jedes Shirt mit Rosa oder Pink nur einmal zählen, also nur einmal pro ID
rosapinkanteilf =  group_by(maedchendaten, id)
rosapinkanteilm =  group_by(jungendaten, id)

#Erstellt Matrix mit Anzahl Einträge von Rosa und Pink pro Gruppe, also pro ID:
zaehlerf = count(rosapinkanteilf, vars = parent_name_de_2)
zaehlerm = count(rosapinkanteilm, vars = parent_name_de_2)

#Muss die IDs rausfiltern, die mit Pink und mit Rosa vorkommen (z.B. ID 123 in zaehlerf)
rosapinkanzahlf = count(zaehlerf, vars = id)
rosapinkanzahlm = count(zaehlerm, vars = id)

#Die Anzahl der Zeilen von rosapinkanzahlf (678) bzw. rosapinkanzahlm (122) ergibt die Anzahl der Oberteile, in denen entweder Pink oder Rosa vorkommt.