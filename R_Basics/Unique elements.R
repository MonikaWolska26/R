#Write a R program to get the unique elements of a given string 
#and unique numbers of vector.

str = "I dream about great job and great team"
print("Unique elements of str: ")
print(unique(tolower(str)))

numb = c(1, 2, 3, 4, 2, 4, 2, 2, 1, 3)
print("Unique numbers of numb: ")
print(unique(numb))