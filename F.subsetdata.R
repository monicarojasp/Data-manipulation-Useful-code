Subset_data = function(data=rawdata,cols="var",newdata=rawdata_subset,drop=1) {
  # Double Quote Output Dataset Name
  t = deparse(substitute(newdata))
  # Drop Columns
  if(drop == 1){
    newdata = data [ , !(names(data) %in% scan(textConnection(cols), what="", sep=" "))]}
  # Keep Columns
  else {
    newdata = data [ , names(data) %in% scan(textConnection(cols), what="", sep=" ")]}
  assign(t, newdata, .GlobalEnv)
}

###How to use the function - parameters: 

#drop: value can be 0 or 1 (keeping = 0, drop(remove) = 1) the variables that are specified in the parameter "cols". 
#data: input data frame. 
#cols: variables you want to keep/remove. 
#newdata: refers to the output/results/subset data frame.