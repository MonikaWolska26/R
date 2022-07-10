#Write a R program to read the .csv file and display the content

#read.csv() - file with separators: , for columns and .for numbers
#read.csv2() - file with separators: ; for columns and , for numbers

myfile = read.csv("C:/Users/Monika Wolska/Pulpit/Arkusz.csv", encoding = "UTF-8", header=TRUE, sep=",")
print(myfile)

