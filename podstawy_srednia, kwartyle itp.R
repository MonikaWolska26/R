#liczba nowych kont zarejestrowanym w ciagu 10 dni
dane <- c(43, 37, 50, 51, 58, 105, 52, 45, 45, 10)

#srednia
srednia <- mean(dane)
print(srednia) #srednio w ciagu 1 dnia przybywalo 49,5 kont

#mediana
mediana <- median(dane)
print(mediana) #wartosc srodkowa to 47,5, tzn ze przez 50% dni ilosc nowych kont byla nie wieksza niz 47,5

#kwartyle
kwar1 <- quantile(dane,0.25,type=2)
kwar2 <- mediana
kwar3 <- quantile(dane,0.75,type=2)
print(kwar1)
print(kwar2)
print(kwar3)

#odchylenie standardowe
odchyleniestan <- sd(dane)
print(odchyleniestan) #srednio rzecz ujmujac obserwacje sa rozrzucone wokól sredniej o +/- 23,4767

#czy sa obecne obserwacje odstajace - zgodnie z regula 1,5*IQR
x <- kwar1 - 1.5*IQR(dane)
y <- kwar3 + 1.5*IQR(dane)
  
#usunac obserwacje odstajace i przeliczyæ jeszcze raz powyzsze dane
dane2 <- dane[dane >= x & dane <= y]
print(dane2) #byly dwie obserwacje odstajace w danych
srednia2 <- mean(dane2)
mediana2 <- median(dane2)
kwar1_2 <- quantile(dane2,0.25,type=2)
kwar2_2 <- mediana2
kwar3_2 <- quantile(dane2,0.75,type=2)
odchyleniestan2 <- sd(dane2)

cat('Srednia: dane1: ', srednia, 'dane2: ', srednia2)
cat("Mediana: dane1: ", mediana, "dane2: ", mediana2)
cat("Pierwszy kwartyl: dane1: ", kwar1, "dane2: ", kwar1_2)
cat("Drugi kwartyl: dane1: ", kwar2, "dane2: ", kwar2_2)
cat("Trzeci kwartyl: dane1: ", kwar3, "dane2: ", kwar3_2)
cat("Odchylenie standardowe : dane1: ", odchyleniestan, "dane2: ", odchyleniestan2)
