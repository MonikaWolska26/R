#Write a R program to create a list of random numbers in normal 
#distribution and count occurrences of each value

#rnorm(m, mean, sd)
#n - amount of numbers, mean - mean value - 0 is default
#sd - standard deviation - 1 is default

#print 10 numbers with default values
a <- rnorm(10)
print(a)
plot(a)

#print 10 numbers with default values using floor value
b <- floor(rnorm(10))
print(b)
plot(b)

#print 100 numbers with own values in function
c <- floor(rnorm(100, 10, 5))
print(c)
plot(c)
hist(c)

#counting occurrences of each value
t <- table(c)
print(t)
