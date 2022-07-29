# R
DATA FRAMES

	library(readr)
	library(dplyr)

#reading
	read_csv('name.csv')
#writing
	write_csv(df,'new_csv_file.csv')
#limiting view
	head(df,8)
#summary
	summary()
# inspecting data frame with pipe
	artists  %>%
	head()
 
#selecting columns
	df %>%
  	select(column,column)
#excluding columns
	df %>%
  	select(-column,-column)

#Filtering Rows with Logic I
	df %>%
  	filter(column == '...')
#Filtering Rows with Logic II
	df %>%
  	filter(column == 'clogs' | price < 20)
	df %>%
  	filter(!(column == red))
  
Arranging Rows
asc by default 
desc:
	df %>%
		arrange(desc(column))

#Adding a Column
df %>%
  mutate(column = column * 0.075)
#Adding Multiple Columns
df %>%
  mutate(column = column - column, column = TRUE)
#Transmute Columns - zostawia tylko nowe utworzone kolumny
df %>%
  transmute(column = column * 0.075,
            column = column - column)
#Rename Columns
df %>%
  rename(old_name = new_name,
         old_name = new_name)
         
         
 #take a data frame as an argument and return a vector containing the column names
 name()
 colnames()
 
 
 DATA CLEANING IN R
 
#Diagnose the Data
head()
colnames()
summary()
nrow() - liczba wierszy

#Dealing with Multiple Files
	files <- list.files(pattern = "file_.*csv")
	df_list <- lapply(files,read_csv)
	df <- bind_rows(df_list)
The first line uses list.files() and a regular expression, a sequence of characters describing a pattern of text that should be matched, to find any file in the current directory that starts with 'file_' and has an extension of csv, storing the name of each file in a vector files
The second line uses lapply() to read each file in files into a data frame with read_csv(), storing the data frames in df_list
The third line then concatenates all of those data frames together with dplyr’s bind_rows() function

Reshaping your Data
	df %>%
	gather('Checking','Savings',key='Account Type',value='Amount')
The arguments you provide are:

df: the data frame you want to gather, which can be piped into gather()
Checking and Savings: the columns of the old data frame that you want to turn into variables
key: what to call the column of the new data frame that stores the variables
value: what to call the column of the new data frame that stores the values

Dealing with Duplicates
df %>% duplicated() - spr czy mamy duplikaty
df %>%
  distinct(item,.keep_all=TRUE)
