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

df = rawdata[c("Sample3", "Sample15")]

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

###To write the results
write.csv(rawdata_subset, file = "name_subset.csv")
