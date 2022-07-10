#Write a R program to create a vector which contains 10 random integer values 
#between -50 and +50

RandomNum <- sample(-50:50, 10, replace=F)
print(RandomNum)