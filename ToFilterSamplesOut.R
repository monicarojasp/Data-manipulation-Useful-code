###Read the file 
rawdata <- read.csv("name.csv", header = TRUE, row.names = 1, sep = ",")
head( rawdata)

###To remove columns, Use the function subset (The '-' sign indicates dropping column names)
rawdata_subset = subset(rawdata, select = -c(Sample3, Sample15))
head(rawdata_subset)

#! sign method
subsetout <- c("Sample3", "Sample15")
rawdata_subset = rawdata[,!(names(rawdata) %in% subsetout)]
head(rawdata_subset)

#or
rawdata_subset = rawdata[,!(names(rawdata) %in% c("Sample3", "Sample15"))]
head(rawdata_subset)

###To keep column by name

#using the subset function
rawdata_subset = subset(rawdata, select = c(Sample3, Sample15))

#using []
keeps <- c("Sample3", "Sample15")
rawdata_subset = rawdata[keeps]
head(rawdata_subset)

#or 

rawdata = rawdata[c("Sample3", "Sample15")]

### Using dplyr package (one of the most popular package for data manipulation)

install.packages("dplyr")
library(dplyr)

rawdata = select(rawdata, -1, -3:-4) #to delete first, third and fourth column

#to delete columns with a specific name (it can be written in three ways)

rawdata_subset = select(rawdata, -Sample3, -Sample15)
rawdata_subset = select(rawdata, -c(Sample3, Sample15))
rawdata_subset = select(rawdata, -Sample3:-Sample15) #To delete a section of the data

#to keep columns with a specific name

rawdata_subset = select(rawdata, sample1, Sample3:Sample15) #specif sample and a section of the data

###To remove Columns by Name Pattern

#Keeping columns whose name starts with "BS"
rawdata_subset = rawdata[,grepl("^BS",names(rawdata))]

#Dropping columns whose name starts with "BS" (The '!' sign indicates negation)
rawdata_subset = rawdata[,!grepl("^BS",names(rawdata))]

#Keeping columns whose name contain "_S" (The "$" is used to search for the sub-strings at the end of string)
rawdata_subset = rawdata[,grepl("_S$",names(rawdata))]

#Dropping columns whose name contain "_S" at the end
rawdata_subset = rawdata[,!grepl("_S$",names(rawdata))]

#Keeping columns whose name contain the letter "S"
rawdata_subset = rawdata[,grepl("*S",names(rawdata))]


#keep columns where it contains B_S
rawdata_subset = rawdata[,grepl("*B_S",names(rawdata))]

#Remove columns whose name contain the letter "S"
rawdata_subset = rawdata[,!grepl("*S",names(rawdata))]

#Remove columns having more than 50% missing values (sapply function is an alternative of for loop)
#To have in account this code runs a user-defined function on each column of data frame, so you neen to tell which columns and rows are your data
rawdata_subset = rawdata[,!sapply(rawdata, function(x) mean(is.na(x)))>0.5] #It will remove columns that contains 50% or more missing values

###To write the results
write.csv(newdata, file = "name_subset.csv")
