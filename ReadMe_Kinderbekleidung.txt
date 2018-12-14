Erläuterung zu den Datensätzen und Skripten zu dem Artikel "In der Rosa-Falle: Wie stereotype Kleidung Kinder prägt" 
erschienen am 13.12.2018 auf noz.de, shz.de und svz.de:

https://www.noz.de/deutschland-welt/familie/artikel/1580749/in-der-rosa-falle-wie-stereotype-kleidung-kinder-praegt
https://www.shz.de/tipps-trends/familie-und-kind/In-der-Rosa-Falle-Wie-stereotype-Kleidung-Kinder-praegt-id21601687.html
https://www.svz.de/ratgeber/familie/In-der-Rosa-Falle-Wie-stereotype-Kleidung-Kinder-praegt-id21601707.html

Feedback erwünscht an a.behrend@noz.de

##########################################################

Inhalt:
* Beschreibung des Datensatzes gewichtung_14122018.csv
* Beschreibung des Datensatzes produkte_14122018.csv
* Beschreibung des R-Skripts Auswertung_ohne_Gewichtung_Farben.R
* Beschreibung des R-Skripts Auswertung_Gewichtung_Farben.R
* Beschreibung des R-Skripts RosaPinkAnteil.R
* Beschreibung des R-Skripts Anteile_Glitzer.R
* Beschreibung des R-Skripts Anteil_Motive.R 

################ gewichtung_14122018.csv ##################

* CSV-Datei mit 27 Spalten und 7734 Zeilen
* Zeichenkodierung ist UTF8
* Dezimalseparator ist Komma
* Umlaute wurden durch "ue" usw. ersetzt

Bedeutung der Spalten:
id = Von uns vergebene ID des Oberteils; mehrere Zeilen mit derselben ID bedeuten, dass dem Oberteil mehr als eine Farbe zugeordnet wurden (maximal vier)
deeplink = Link zum Artikel im Online-Shop (zum Zeitpunkt der Erhebung im August 2018)
thumbnail_img_src = Link zu Bild des Artikels (zum Zeitpunkt der Erhebung im August 2018)
title = Titel des Artikels laut Website 
has_motiv = 1 wenn Motiv vorhanden, sonst 0
has_glitzer = 1 wenn Oberteil Glitzer enthält, sonst 0
geschlecht = "f" wenn Artikel in Mädchenabteilung des Online-Shops, "m" wenn Artikel in Jungenabteilung des Online-Shops
shop = Welcher der drei untersuchten Anbieter (Otto, H&M, C&A) bietet dieses Produkt an
colors_palette_id = Alle ermittelten Farben wurden einer Farbe aus einer Referenztabelle zugeordnet (https://wiki.selfhtml.org/wiki/Grafik/Farbpaletten#Farbnamen). Jede der Farben aus der Referenzpalette hat von uns eine ID bekommen.
is_primary = 1 wenn Hintergrundfarbe, 0 wenn Motivfarbe
R = R-Komponente des RGB-Werts der ursprünglich ermittelten Farbe
G = G-Komponente des RGB-Werts der ursprünglich ermittelten Farbe
B = B-Komponente des RGB-Werts der ursprünglich ermittelten Farbe
H = H-Komponente der ursprünglich ermittelten Farbe im HSV-Farbraum
S = S-Komponente der ursprünglich ermittelten Farbe im HSV-Farbraum
V = V-Komponente der ursprünglich ermittelten Farbe im HSV-Farbraum
HEX = HEX-Code der ursprünglich ermittelten Farbe
name_de = Deutscher Name der Farbe aus der Referenztabelle (https://wiki.selfhtml.org/wiki/Grafik/Farbpaletten#Farbnamen) zugeordneten Farbe
name_en  = Englischer Name der Farbe aus der Referenztabelle (https://wiki.selfhtml.org/wiki/Grafik/Farbpaletten#Farbnamen) zugeordneten Farbe
parent_name_de_2 = Deutscher Name der übergeordneten Farbe. Die Farben der Referenztabelle wurden von uns zu 14 übergeordneten Farbklassen zusammengefasst (Beige, Braun, Schwarz, Weiß, Grau, Rosa, Pink, Grün, Orange, Rot, Blau, Gelb, Lila, Türkis)
R_palette = R-Komponente des RGB-Werts der aus der Referenztabelle ermittelten Farbe
G_palette = G-Komponente des RGB-Werts der aus der Referenztabelle ermittelten Farbe
B_palette = B-Komponente des RGB-Werts der aus der Referenztabelle ermittelten Farbe
H_palette = H-Komponente der aus der Referenztabelle ermittelten Farbe im HSV-Farbraum
S_palette = S-Komponente der aus der Referenztabelle ermittelten Farbe im HSV-Farbraum
V_palette = V-Komponente der aus der Referenztabelle ermittelten Farbe im HSV-Farbraum
weight_parent_color = Gewichtungsfaktor 0.25, 0.5 oder 1, s. auch Erläuterung

Erläuterung zum Gewichtungsfaktor: Der Gewichtungsfaktor gewichtet eine Farbe stärker, wenn das Oberteil wenige Farben hat (er ist 1, wenn das Shirt nur eine Farbe hat) und schwächer, wenn es mehrere Farben hat (Faktor 0.25 für jede Farbe wenn die maximale Anzahl von 4 Farben für ein Shirt gefunden wurde). Für jedes Oberteil wurden maximal vier dominante Farben ermittelt, zwei für den Hintergrund und zwei für das Motiv. Da die Gewichtung keinen maßgeblichen Einfluss auf die zentralen Ergebnisse der Datenauswertung hatte, wurde sie im Artikel letztlich nicht berücksichtigt, bzw. jede Farbe wurde mit dem Faktor 1 gewichtet.


################ motive_14122018.csv ##################


* CSV-Datei mit 6 Spalten und 2140 Zeilen 
* Zeichenkodierung ist UTF8
* Dezimalseparator ist Komma

Bedeutung der Spalten:
id = Von uns vergebene ID des Oberteils
deeplink = Link zum Artikel im Online-Shop (zum Zeitpunkt der Erhebung im August 2018)
thumbnail_img_src = Link zu Bild des Artikels (zum Zeitpunkt der Erhebung im August 2018)
has_motiv = 1 wenn Motiv vorhanden, sonst 0 (in diesem Datensatz immer 1)
motiv = Ermitteltes Motiv
motivkategorie = Dem ermittelten Motiv zugeordnete Motivkategorie

Anmerkungen: 
* In der Auswertung für den Artikel wurde das Motiv "Feder" nicht wie in diesen Rohdaten zur Kategorie Tier gezählt.
* Die Motive "Teddybär" und "Bärchen" wurden bei der Auswertung für den Artikel zu "Bär" zusammengefasst. In diesen Rohdaten tauchen noch beide Kategorien auf.
* Da die Motive nur durch eine Person kodiert wurden, ist dieser Datensatz zwangsläufig fehlerbehaftet. Stichproben lassen jedoch darauf schließen, dass uneindeutige Zuordnungen vor allem bei nicht scharf abgrenzbaren Motiven wie "Kritzelei" eine Rolle spielen, weniger bei meist klar erkennbaren Motiven wie bestimmten Tieren.

################ Auswertung_ohne_Gewichtung_Farben.R ##################

Skript, das aus gewichtung_14122018.csv die zur jeweiligen Farbkategorie gehörenden Farbtöne aufsummiert, plottet und als CSV-Datei ausgibt. Diese Auswertung ist Basis der Treemaps im Artikel.

################ Auswertung_Gewichtung_Farben.R ##################

Skript, das aus gewichtung_14122018.csv die zur jeweiligen Farbkategorie gehörenden Farbtöne mit Gewichtungsfaktor aufsummiert und ein Balkendiagramm als PDF ausgibt.

################ RosaPinkAnteil.R ##################

Skript, das berechnet, in wie vielen der Shirts für Jungen bzw. Mädchen mindestens ein Farbton der Klasse Rosa oder Pink vorkommt.

################ Anteile_Glitzer.R ##################

Skript, das berechnet, wie viele Oberteile für Jungen bzw. Mädchen glitzernde Elemente haben.

################ Anteil_Motive.R ##################

Skript, das berechnet, wie viele Oberteile Motive zeigen.