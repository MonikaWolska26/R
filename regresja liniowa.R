# Mamy dziesieciu losowych mezczyzn - WIEK (x) i ich poziom cholesterolu (y)
# wyznaczyc prosta regresji

x <- c(58,69,43,39,63,52,47,31,74,36)
y <- c(189,235,193,177,154,191,213,175,198,181)

plot(x,y)

# modelem bedzie wzor na prosta y = a + bx
model <- lm(y~x)
summary(model)

abline(model)

#y = a + bx
#H0: b=0
#H1: b!=0
#p-value = 0.2511 > alfa

# => H0 
#nie ma zale¿nocni midzy y i x

#Multiple R-squared wynosi 0.1273 tzn. ¿e tylko ok 12% obserwacji mo¿na wytlumaczyæ zmienna x