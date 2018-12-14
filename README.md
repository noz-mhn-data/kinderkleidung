# kinderkleidung
Daten und R-Skripte zum Artikel "In der Rosa-Falle: Wie stereotype Kleidung Kinder prägt",
erschienen am 13.12.2018 auf noz.de, shz.de und svz.de:

https://www.noz.de/deutschland-welt/familie/artikel/1580749/in-der-rosa-falle-wie-stereotype-kleidung-kinder-praegt
https://www.shz.de/tipps-trends/familie-und-kind/In-der-Rosa-Falle-Wie-stereotype-Kleidung-Kinder-praegt-id21601687.html
https://www.svz.de/ratgeber/familie/In-der-Rosa-Falle-Wie-stereotype-Kleidung-Kinder-praegt-id21601707.html

Feedback erwünscht an a.behrend (ÄT) noz.de

##########################################################

## Inhalt:
* Allgemeine Hinweise zu Datenerhebung und -analyse
* Beschreibung des Datensatzes gewichtung_14122018.csv
* Beschreibung des Datensatzes produkte_14122018.csv
* Beschreibung des R-Skripts Auswertung_ohne_Gewichtung_Farben.R
* Beschreibung des R-Skripts Auswertung_Gewichtung_Farben.R
* Beschreibung des R-Skripts RosaPinkAnteil.R
* Beschreibung des R-Skripts Anteile_Glitzer.R
* Beschreibung des R-Skripts Anteil_Motive.R 

## Allgemeine Hinweise zu Datenerhebung und -analyse

### Erhebung der Daten
Insgesamt wurden im Zeitraum 7. bis 15. August 2018 in den Onlineshops der Textilhändler Otto, C&A und H&M die Daten von 3.097 Oberteilen in den Größen 62 bis 182 erhoben (meist Größe 92-140). Wird ein Oberteil in verschiedenen Farben angeboten, wurde für das Oberteil in jeder Farbe ein Datensatz angelegt. Die Shops wurden ausgewählt, da es sich um [die drei führenden Unternehmen im Textileinzelhandel in Deutschland](https://www.textilwirtschaft.de/news/media/10/Rangliste-2016-95371.pdf) handelt.

Die dominanten Farben wurden halbautomatisiert ermittelt: Mit Hilfe einer eigens dafür programmierten Oberfläche wurden die mit zwei Javascript-Bibliotheken ([Color Thief](https://lokeshdhakar.com/projects/color-thief/) und [Vibrant.js](https://jariz.github.io/vibrant.js/)) ermittelten Farben händisch überprüft und gegebenenfalls angepasst. Es wurden jeweils bis zu zwei dominante Farben für das Motiv und den T-Shirt-Hintergrund ermittelt. Im gleichen Arbeitsschritt wurde gegebenenfalls das Motiv notiert, sowie ein Vermerk für glitzernde Oberteile hinzugefügt. Die Daten wurden anschließend mit Trifacta bereinigt und vereinheitlicht.

### Analyse der Daten

Die ermittelten Farben wurden mit dem CIEDE2000-Farbunterschied-Algorithmus der jeweils ähnlichsten Farbe aus den [HTML-definierten Farben](https://wiki.selfhtml.org/wiki/Grafik/Farbpaletten#Farbnamen) zugeordnet. Diese wurden als Referenzfarben ausgewählt, da die 216 Farben einen für unsere Zwecke ausreichend breiten und zugleich übersichtlichen Überblick über das gesamte Farbspektrum bieten. Die HTML-definierten Farben wurden händisch 14 Farbklassen zugeordnet.

In den Belegungsdiagrammen (Treemaps) werden diese 14 Farbklassen mit Farben dargestellt, die [im Rahmen einer großen Umfrage](https://blog.xkcd.com/2010/05/03/color-survey-results/) als möglichst eindeutig erkennbar ermittelt wurden. Bei dieser Darstellung verbergen sich hinter den gezeigten Farben, viele unterschiedliche Farbnuancen die zusammengefasst wurden, um einen besseren Überblick über die Hauptfarben zu geben. So beinhaltet die Farbe Pink in dieser Darstellung auch Farbtöne, die hohe Rotanteile haben, wie es bei [manchen Jungenoberteilen](https://www.otto.de/p/nike-laufshirt-dry-miler-655714553/#variationId=655714554) der Fall ist. Und hinter der Farbe Lila können auch [Grenzfälle](https://www.c-and-a.com/de/de/shop/kurzarmshirt-bio-baumwolle-2025499/1?categoryId=15437) stecken, die sehr stark ins Dunkelblaue gehen. 

Die genauen Farbtöne sind in den Streudiagrammen dargestellt. Diese wurden mit R erstellt. Dabei wurde ein leichtes [Rauschen](https://stackoverflow.com/questions/17547699/what-does-the-jitter-function-do-in-r) hinzugefügt, um dicht beieinander liegende Punkte besser sichtbar zu machen.

### Verlässlichkeit der Daten

Die Erhebung der Daten genügt nicht wissenschaftlichen Standards. Dass jeweils nur eine Person die dominanten Farben und die Motive der Oberteile ermittelt hat, birgt einen systematischen Fehler. Die Endergebnisse sind zudem von der Einteilung der zugeordneten Farben zu den verschiedenen Farbklassen abhängig. So liegen etwa ein sehr helles Blau und ein bläuliches Weiß sehr nah beieinander. Hier ließe sich sicherlich für eine etwas andere Einteilung argumentieren, was die Ergebnisse geringfügig – jedoch nicht im Kern – verändern würde.

## gewichtung_14122018.csv

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


## motive_14122018.csv


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

## Auswertung_ohne_Gewichtung_Farben.R 

Skript, das aus gewichtung_14122018.csv die zur jeweiligen Farbkategorie gehörenden Farbtöne aufsummiert, plottet und als CSV-Datei ausgibt. Diese Auswertung ist Basis der Treemaps im Artikel.

## Auswertung_Gewichtung_Farben.R 

Skript, das aus gewichtung_14122018.csv die zur jeweiligen Farbkategorie gehörenden Farbtöne mit Gewichtungsfaktor aufsummiert und ein Balkendiagramm als PDF ausgibt.

## RosaPinkAnteil.R

Skript, das berechnet, in wie vielen der Shirts für Jungen bzw. Mädchen mindestens ein Farbton der Klasse Rosa oder Pink vorkommt.

## Anteile_Glitzer.R

Skript, das berechnet, wie viele Oberteile für Jungen bzw. Mädchen glitzernde Elemente haben.

## Anteil_Motive.R

Skript, das berechnet, wie viele Oberteile Motive zeigen.
