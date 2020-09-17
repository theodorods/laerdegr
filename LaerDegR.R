rm(list = ls())

#Kap 2 - R som kalkulator ----

parti <- c("Ap", "FrP", "H", "KrF", "MDG", "Sp", "SV", "V")
hoyre <- c(3.75, 7.5, 7.25, 6, 2.25, 4, 1.5, 6.75)
#Hoyre vektoren er symmetrisk med parti vektoren.

length(parti)
length(hoyre) #Begge vektorene inneholder 8 observasjoner.

parti[c(1,2,5)] #indeksering
parti[c(1,2:5)]

class(parti) #finne datatype
class(hoyre)

hoyre.omkodet <- hoyre + 2 #omkoder hoyre vektoren, legger til to og oppretter en ny vektor.

omfordeling <- c(5.33, 4, 3.33, 4, 5.33, 4.67, 5.33, 3.33)
hoyre + omfordeling

mean(hoyre, trim = 0.1)

sort(hoyre)
sort(hoyre, decreasing = TRUE)
order(hoyre)
order(hoyre, decreasing = TRUE)

data <- cbind(parti, hoyre) #binde sammen vektorene til en matrise
class(data)

data <- as.data.frame(data) #omdefinere matrisen til en datamatrise
class(data)
dim(data)
str(data)
view(data)

data[data$hoyre >= 4,] #indeksere observasjoner som skaarer 4 eller hoyere paa hoyreorientering.
data[data$parti == "KrF", "hoyre"] #matriseindeksering
data$hoyre[data$parti == "KrF"] #indekserer variabelen som en vektor

liste <- list(hoyre = c('FrP', 'H', 'V'), 
              sentrum = c('Sp', 'KrF', 'MDG'),
              venstre = c('Ap', 'SV'))

liste
liste$hoyre[2]
View(liste)

nyliste <- list(datamatrise = data,
                orientering = c('hoyre', 'sentrum', 'venstre'))

nyliste

nyliste$datamatrise[,1]
str(nyliste)

#Oppgaver til kap 2. s.48 ----
median(hoyre)
data[data$parti == 5,]

data
?cbind
viktighet <- c(6.67, 5.67, 7.33, 4.33, 3.33, 5.33, 5.67, 5.67)
data  <- cbind(data, viktighet)

# Oppgave 2.4 Opprett en ny variabel kalt hoyre.kat. Omkod saa variabelen til 3 kategorier
# paa grunnlag av hoyre: 'Venstre', 'Sentrum' og 'Hoyre'. Gjor variabelen om til en faktor.
# Hvilke partier befinner seg paa hoyresiden? Bruk indeksering aktivt i denne oppgaven!




#kap 3 - R som tegneprogram ----

plot(x = 0, y = 0)
plot(x = c(0, 1), y = c(0, 1))
plot(x = c(0, 1), y = c(0, 1), type = "l")
plot(x = c(0, 0, 1, 0), y = c(0, 1, 1, 0), type = "l")

?plot
par(bg = 'white')
plot(x = 0, y = 0, type = "n", 
     xlim = c(0, 2), 
     ylim = c(0, 2), 
      main = "Vanlig plot",
      xlab = "x-aksen",
      ylab = "y-aksen",
        bty = 'n')

  points(x = c(0, 1),
       y = c(0, 1),
       pch = 16)
  
  lines(x = c(0, 1, 2),
        y = c(0, 1, 1),
        lty = 2)
  
  text(x = c(0, 1, 2),
       y = c(0, 1, 1),
       labels = c('Lav', 'Hoy', 'Ogsaa hoy'),
       pos = 4)  

plot(x = 0, y = 0, cex = 2)

?colors()
colors()
plot(x = 0, y = 0, col = 'blue')
plot(x = c(0, 1, 2, 3, 4),
     y = c(0, 0, 0, 0, 0),
     col = c('blue', 'red'))

legend(x = 'topright',
       legend = c('Blaa', 'Rod'),
       pch = 1,
       col = c("blue", "red"))

#Oppgaver til kap 3. ----

