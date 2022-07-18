auta <- read.csv2('http://www.ibspan.waw.pl/~pgrzeg/stat_lab/samochody.csv') 

#podsumowanie zbioru danych
summary(auta)
sapply(auta, typeof)

#zmiana typu z wektora liczbowego na czynnik odpowiadajcy zmiennej jakociowej
auta$producent <- factor(auta$producent)
levels(auta$producent) <- c('amerykañskie', 'europejskie', 'japoñskie') 


#zliczenie aut poszczególnych elementów
table(auta$producent) 

#zliczanie odsetkowe
prop.table(table(auta$producent))

#udzial procentowy
round(100* prop.table(table(auta$producent)), 1)

#wykres slupkowy
barplot(table(auta$producent), col=2:4) 

#wykres kolowy
pie(table(auta$producent), col=2:4)

#usuniecie obserwacji z NA
auta <- na.omit(auta)

#stworzenie zmiennej opisujacej zuzycie paliwa 
# mpg [mil] - 1 [galon]
# mpg*1.609 [km] - 3.785 [l]
# 100 [km] - zp [l]
# zp = (100*3.785)/(mpg*1.609)
auta$zp <-(100*3.785)/(auta$mpg*1.609) # zu¿ycie paliwa w l/100km 


#przedstawienie rozk³adu zmiennej zp na histogramie i wykresie ³odygowo-liœciowym:
# histogram
hist(auta$zp) 
hist(auta$zp, col='yellow', xlab='zu¿ycie paliwa w l/100km', ylim=c(0,40),
     labels=TRUE, ylab='Liczebnoœci', main = '')
# ta sama zmienna, a ró¿ne histogramy
par(mfrow=c(2,2)) # podzia³ okna graficznego na 4 czêœci
hist(auta$zp, breaks=3, col=2, xlim=c(0,20))
hist(auta$zp, breaks=5, col=3, xlim=c(0,20))
hist(auta$zp, breaks=11, col=4, xlim=c(0,20))
hist(auta$zp, breaks=20, col=5, xlim=c(0,20))
par(mfrow=c(1,1)) # powrót do jednego okna graficznego
# wykres ³odygowo-liœciowy
stem(auta$zp) 


#narysowanie wykresu skrzynkowego
boxplot(auta$zp) #wykres skrzynkowy (pudekowy, ramkowy)
boxplot(auta$zp, horizontal = TRUE, col='yellow', xlab='zu¿ycie paliwa w 1/100 km')
points(auta$zp, rnorm(length(auta$zp), 1, 0.02))
