# Vi har tre ulike datatyper i R -> VEKTORER, MATRISER og LISTER.

# 2.2.1 VEKTOR----
# En vektor er en serie med tall eller bokstaver som er lagret i et objekt, vi kan lage en vektor med concatenate kommandoen.
?c
c(1, 2, 3, 4)
parti <- c("Ap", "FrP", "H", "KrF", "MDG", "Sp", "SV", "V")
parti
hoyre <- c(3.75, 7.5, 7.25, 6, 2.25, 4, 1.5, 6.75)
hoyre
length(parti) #Hvert parti kalles en enhet/observasjon. I parti-vektoren har vi 8 observasjoner.


# 2.2.1.1 INDEKSERING
# Vi kan hente ut en eller flere spesifikke observasjoner fra en vektor ved å indeksere den.
parti[3]
# Hente ut observasjon 1 og 3
parti[c(1, 3)]
# Hente ut observasjon 1 til 3
parti[1:3]


# 2.2.1.2 REGNEOPERASJONER
?class
# For å finne ut hvordan vektoren vår er registrert tar vi i bruk class funksjonen
class(parti)
class(hoyre)

# Vi kan foreta matematiske operasjoner med numerical-vektoren vår, nå kan vi omkode variabelen
hoyre
hoyre+2
hoyre.omkodet <- hoyre+2
omfordeling <- c(5.33, 4, 3.33, 4, 5.33, 4.67, 5.33, 3.33)
# Vi kan summere vektorene slik at vi oppnår en tredje vektor hvor hver observasjon består av summen av de tilsvarende observasjonene i de foregående vektorene.
hoyre + omfordeling
# Man kan ikke gjøre slike operasjoner på vektorer som ikke er definert som numeriske
parti + 2


# 2.2.1.3 FUNSKJONER OG ARGUMENTER
# En funskjon er i praksis definerte oppgaver som R har lagret i minnet og gjort klar til bruk
# feks. lengden på parti-vektoren, length() er en funskjon

# Funksjoner som
# sum(), mean() og sd()
?mean
mean(x=hoyre)
# Behøver ikke å oppgi argumentnavnet
mean(hoyre)
# Funksjon for å opprette en vektor med en tallrekke
rep(x=1, times=8)
# R vil da repetere tallet "1", åtte ganger.
?rep
# Tilsvarende vil seq() gi deg en tallsekvens
seq(from=0, to=50, by=0.1)
?seq
# R skiller mellom obligatoriske argumenter og tillegsargumenter.
# Vi kan trimme vekk de mest ekstreme observasjonene (s.37) ved
mean(x=hoyre, trim=0.1)


# 2.2.1.4 SORTERE VEKTORER
?sort
# Sorterer tallverdier fra lave til høyre og bokstavverdier alfabetisk.
# Tilleggsargumentet decreasing=TRUE/FALSE avgjør om verdiene skal gå fra høye til lave eller omvendt. Default-verdien = FALSE
sort(hoyre)
sort(hoyre, decreasing = TRUE)
# Funksjonen order() ordner også observasjonene for oss. Da svarer R med observasjonsnumrene i vektoren (ikke observasjonsverdien).
hoyre
order(hoyre)


# 2.2.2 MATRISER----
# 2.2.2.1 OPPRETTE EN MATRISE
?cbind()
data <- cbind(parti, hoyre)
data
# Hvis vektoren ikke er like lang, må du være oppmerksom på at R resirkulerer informasjonen fra den korteste vektoren
kortvektor <- c(1,2) 
cbind(parti, kortvektor) #kort vektor eksempel
# Får en advarsel dersom dimensjonene til objektene ikke deles likt
littlengervektor <- c(1, 2, 3)
cbind(parti, littlengervektor) #advarsel siden nr. of rows of result is not a multiple of vector length

cbind(parti, hoyre, omfordeling)

# 2.2.2.2 OPPRETTE ET DATASETT
#Matrix (matrise)
  #Krever at alle kolonner har samme målenivå
#Data frame (datamatrise)
  #Mer liberal, klassifiserer kolonner automatisk som variabler og linjer som observasjoner. Foretrekker som regel data frames.
#cbind() klassifiserer R automatisk det nye objektet som en matrise.
class(data) #usikker på hva slags objekt? prøv denne funksjonen.
?class
data
data <- data.frame(data) #omdefinere matrisen til et datasett
#Alternativ
data <- data.frame(parti, hoyre)
class(data)
dim(data) #sjekke dimensjonene til datasettet
?dim
#se datasettet bedre? Mest hensiktmessig hvis datasettet har relativt få variabler
summary(data)
View(data)


# 2.2.2.3 INDEKSERING
data[1, 1] #inspirere første observasjon i første kolonne
data[1] #inspirere all informasjon på denne linjen
#behandle hver kolonne som en vektor, gripe fatt i variablene ved
data[,1] 
data[, "parti"]
data$parti #foretrukket. Raskere, enklere og åpner for færre skrivefeil
#Trekke frem én eller flere observasjoner basert på verdiene til en gitt variabelverdi
data[data$hoyre==6,] #se all informasjon om partier som skårer seks på høyreorienteringen
data[data$hoyre>=6,] #oversikt over alle stortingspartiene på høyresiden i Norge
#Se på høyreorienteringen til alle observasjoner med benevnelsen "KrF"
data[data$parti=="KrF", "hoyre"] #matriseindeksering
data$hoyre[data$parti=="KrF"] #indekserte variabelen som en vektor
data[order(data$hoyre),] #sorterer datasettet fra lave til høye verdeir av høyreorientering
data[order(data$parti, data$hoyre),] #sorterer datasettet i forhold til flere variabler, her sorterer jeg først alfabetisk etter partinavn, så - internt i ett parti - etter høyreorientering
nydata <- data[order(data$parti, data$hoyre),] #blir ikke lagret før vi oppretter et nytt dataobjekt eller omdefinerer det gamle

#Hvorfor er indeksering nyttig? (s. 42)

# 2.2.2.4 MÅLENIVÅ
#en variabeli en dataframe kan være klassifisert som characters, numerics og factors(kategorier).
class(data$hoyre)

#2 Gylne regler om omkoding
    #1 Sjekk alltid omkodingen før du overskrider den orginale variabelen.
    #2 Definer alltid en variabel som bokstaver før du omkoder den til numre eller kategorier. Dette er fordi R leser kategoriske variabler annerledes enn vi ser dem, så det er lett å ta feil.
# s.43
as.numeric(data$hoyre)
?as.numeric
as.character(data$hoyre)
as.factor(data$parti)
#standardløsningen til R er å lagre variablene som nominale (ikke-rangerte) kategorier
#vi kan omrokere nivåene.
factor(data$parti,
       levels = c("FrP", "H", "V", "KrF", "Sp", "Ap", "MDG", "SV"))
#vi kan opprette ordinale variabler slik at nivåene blir rangert, vi må oppgi rekkefølgen fra lav til høy verdi
ordered(data$parti,
        levels = c("SV", "MDG", "Ap", "Sp", "KrF", "V", "H", "FrP"))
#OBS skifte målenivå fra faktor til tall
as.factor(data$hoyre) #R keser de interne registreringsnumrene og rapporterer disse fremfor kategorinavnene(levels).
#er ikke det samme som
as.numeric(as.factor(data$hoyre)) #dette blir feil, R vil heller ikke gi deg en advarsel
as.numeric(as.character(as.factor(data$hoyre))) #gjennom dette blir tallverdiene i kategorinavnene lest, og ikke det interne registreringsnummeret.
#mer på side 45

# 2.2.3 LISTER----
?list
#lister ligner på trær eller handlelister (asymmetriske)
#praktiske når man skal sammenstille og lagre data siden man kan lime ymse informasjon sammen

# 2.2.3.1 OPPRETTE EN LISTE
liste <- list(hoyre=c("FrP", "H", "V"),
              sentrum=c("Sp", "KrF", "MDF"),
              venstre=c("Ap", "Sv"))
liste
# 2.2.3.2 INDEKSERING
#flere forskjellige måter, men prinsippet er det samme som tidligere. Bare at denne gangen kan flere objekttyper være limt sammen
#feks består denne listen av tre vektorer med navn høyre
liste[[1]]
liste$hoyre
#observasjonene er partier
liste[[1]][1]
liste$hoyre[1]
#det er til og med mulig å lime sammen en datamatrise med en vektor
nyliste <- list(datamatrise = data,
                orientering = c("hoyre", "sentrum", "venstre"))
nyliste
nyliste$datamatrise[1,1]
nyliste$datamatrise[,1]


# OPPGAVER----
false <- 10 > 20
false
true <- 10 > 5
true
true > false

emma <- c(23, 2, 1200, 2, 204, 1, 0)
emma.true <- emma > false
emma.true


median(hoyre)
hoyre