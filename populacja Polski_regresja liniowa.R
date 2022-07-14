#próba wyznaczenia modelu prognozujacego ludnosc Polski 

rok <- c(2000,2005,2009,2010,2011,2013,2015,2017,2018,2019,2021)
populacja <- c(38654000,38191000,38167000,38530000,38538000,38496000,38437000,38434000,38411000,38383000,38100000)

par(mfrow=c(2,2))
plot(x,y)
plot(x,log(y))
plot(x,1/y)
plot(1/x,y)
par(mfrow=c(1,1))


model1 <- lm(y~x) #y=a+bx
model2 <- lm(log(y)~x) #log(y)=a+bx
model3 <- lm(y~x) #1/y=a+bx
model4 <- lm(y~x) # y=a+b(1/x)

#wspolczynnik determinacji dla modeli
summary(model1)$r.squared
summary(model2)$r.squared
summary(model3)$r.squared
summary(model4)$r.squared

#zaden z tych modeli nie objasnia y przez x w stopniu wystarczajcym
#sprawdzmy hipoteze na modelu 2
#H0: b=0
#H1: b!=0

summary(model2)
#pvalue jest wieksze od alfa => H0

