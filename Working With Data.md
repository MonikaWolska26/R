# R



# DATA FRAMES

	library(readr)
	library(dplyr)

#### reading

	read_csv('name.csv')

#### writing

	write_csv(df,'new_csv_file.csv')

#### limiting view

	head(df,8)

#### summary

	summary()
	
#### inspecting data frame with pipe

	artists  %>%
		head()
 
#### selecting columns

	df %>%
  		select(column,column)
		
#### excluding columns

	df %>%
  		select(-column,-column)

#### Filtering Rows with Logic I

	df %>%
  		filter(column == '...')
		
#### Filtering Rows with Logic II

	df %>%
  		filter(column == 'clogs' | price < 20)
	df %>%
  		filter(!(column == red))
  
#### Arranging Rows
asc by default 
desc:

	df %>%
		arrange(desc(column))

#### Adding a Column

	df %>%
  		mutate(column = column * 0.075)

#### Adding Multiple Columns

	df %>%
  		mutate(column = column - column, column = TRUE)
	
#### Transmute Columns - zostawia tylko nowe utworzone kolumny

	df %>%
  		transmute(column = column * 0.075, column = column - column)
							
#### Rename Columns

	df %>%
  		rename(old_name = new_name, old_name = new_name)
         
         
#### take a data frame as an argument and return a vector containing the column names
 
 	name()
 	colnames()
 
 
# DATA CLEANING IN R
 
#### Diagnose the Data

	head()
	colnames()
	summary()
	nrow() - liczba wierszy

#### Dealing with Multiple Files

	files <- list.files(pattern = "file_.*csv")
	df_list <- lapply(files,read_csv)
	df <- bind_rows(df_list)
	
- The first line uses list.files() and a regular expression, a sequence of characters describing a pattern of text that should be matched, to find any file in the current directory that starts with 'file_' and has an extension of csv, storing the name of each file in a vector files
- The second line uses lapply() to read each file in files into a data frame with read_csv(), storing the data frames in df_list
- The third line then concatenates all of those data frames together with dplyr’s bind_rows() function

#### Reshaping your Data

	df %>%
		gather('Checking','Savings',key='Account Type',value='Amount')
	
The arguments you provide are:

- df: the data frame you want to gather, which can be piped into gather()
- Checking and Savings: the columns of the old data frame that you want to turn into variables
- key: what to call the column of the new data frame that stores the variables
- value: what to call the column of the new data frame that stores the values

#### Dealing with Duplicates

	duplicated() - spr czy mamy duplikaty
		df %>% duplicated() 
	df %>%
  		distinct(item,.keep_all=TRUE)
		
#### Splitting By Index

	df %>%
		mutate(column = str_sub(othercoulumn,3,4))
	3 i 4 are indexes od string

#### Splitting By Character

	df %>%
  		separate(col_to_separate, c('new_col_name_1','new_col_name_2'), 'character_to_split_on', extra ='merge')

- type is the column to split
- c('user_type','country') is a vector with the names of the two new columns
- '_' is the character to split on

#### Looking at Data Types

structure 

		str()
	
### String Parsing
#### Deleting character

	df %>%
		mutate(column=gsub('\\%','',column))

### Converting column as numeric

	df %>%
		mutate(column = as.numeric(column))
		
# AGGREGATES IN R

#### Calculating Column Statistics

	df %>%
		summarize(var_name = command(column_name))
		
- df is the data frame you are working with
- summarize is a dplyr function that reduces multiple values to a single value
- var_name is the name you assign to the column that stores the results of the summary function in the returned data frame
- command is the summary function that is applied to the column by summarize()
- column_name is the name of the column of df that is being summarized

#### Calculating Aggregate Functions

In general, we use the following syntax to calculate aggregates:

	df %>%
		group_by(column_1) %>%
		summarize(aggregate_name = command(column_2))
		
- column_1 is the column that we want to group_by()
- column_2 is the column that we want to apply command(), a summary function, to using summarize()
- aggregate_name is the name assigned to the calculated aggregate

### AGGREGATES IN R
#### Combining Grouping with Filter

	enrollments %>%
		group_by(course) %>%
		filter(mean(quiz_score) < 80)
		
#### Combining Grouping with Mutate

	enrollments %>% 
		group_by(course) %>% 
		mutate(diff_from_course_mean = 	quiz_score - mean(quiz_score))

- group_by() groups the data frame by course into two groups: learn-r and learn-python
- mutate() will add a new column diff_from_course_mean which is calculated as the difference between a row’s individual quiz_score and the mean(quiz_score) for that row’s group (course)
