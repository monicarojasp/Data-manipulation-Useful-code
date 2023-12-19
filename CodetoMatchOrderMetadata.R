#Read the data
rawdata <- read.csv("name.csv", header = TRUE, row.names = 1, sep = ",")
head( rawdata)

metadata <- read.csv("name.csv", row.names = "Sample_ID", sep = ",")
head(metadata)

# Check row names of the metadata
rownames(metadata)

# Check the column names of the counts data
colnames(rawdata)

#Use the function match to generate the index of the overlap
idx <- match(rownames(metadata), colnames(rawdata))
idx


#Order the war values using matched output
raw_ordered  <- rawdata[ , idx]
raw_ordered

##Verify the new column names matches the metadata row names
all(rownames(metadata) == colnames(raw_ordered))

colnames(rawdata) %in% rownames(metadata)

#write the output in csv 

library(tibble)
raw_ordered <- tibble::rownames_to_column(raw_ordered, "Symbol") #This like is to convert the gene names to a column and to add the header "Symbol" to the gene names column
raw_ordered

write.csv(raw_ordered, file = "outputfile_name.csv", row.names = FALSE) #row.names = FALSE prevents for writing the first column that contains numbers enumerating the rows
