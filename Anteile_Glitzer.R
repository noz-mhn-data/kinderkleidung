
# Working Directory setzen
setwd("/PATH")

dateiname = "gewichtung_14122018.csv"

# CSV-Datei einlesen
daten <- read.csv(toString(dateiname), header = TRUE, sep = ",")

#Daten in Subsets für Jungen und Mädchen unterteilen:
maedchendaten = daten[which(daten$geschlecht == "f"),]
jungendaten = daten[which(daten$geschlecht == "m"),]

#Nach den IDs gruppieren
glitzeranteilf =  group_by(maedchendaten, id)
glitzeranteilm =  group_by(jungendaten, id)

#Erstellt Matrix mit Anzahl Einträge von "has glitzer" pro Gruppe, also pro ID:
zaehlerf = count(glitzeranteilf, vars = has_glitzer)
zaehlerm = count(glitzeranteilm, vars = has_glitzer)

#Filtert aus der zaehler-tabelle jene Zeilen heraus, bei denen "has glitzer" ungleich Null ist, die also glitzern:
glitzerzaehlerm = zaehlerm[which(zaehlerm$vars != 0),]
glitzerzaehlerf = zaehlerf[which(zaehlerf$vars != 0),]


