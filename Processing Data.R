#' title: "TSCI 5050 Processing a Data Set"
#' Author: Ana Pineda
##Copy over the init section
debug <- 0;nrows <-200;seed <-22;

knitr::opts_chunk$set(echo=debug>-1, warning=debug>0, message=debug>0, class.output="scroll-20", attr.output='style="max-height: 150px; overflow-y: auto;"');

library(ggplot2); # visualisation
library(GGally);
library(rio);# simple command for importing and exporting
library(pander); # format tables
#library(printr); # set limit on number of lines printed
library(broom); # allows to give clean dataset
library(dplyr); #add dplyr library
#init----
options(max.print=500);
panderOptions('table.split.table',Inf); panderOptions('table.split.cells',Inf);
probmissing=c(0.99,0.01)
whatisthis <- function(xx){
  list(class=class(xx),info=c(mode=mode(xx),storage.mode=storage.mode(xx)
                              ,typeof=typeof(xx)))};
##Read in the data from Simulated Data set

#%>% is pipe operator used to pass the result of one expression to the next expression as an argument, which can make your code more readable and concise. 

# Import Data ----
datafile<- "data/Simulated Data.xlsx"
SimData<- import(datafile) %>%mutate(train=sample(TRUE,FALSE,n(),replace=TRUE))
#SimData<- mutate(SimData, train=sample(TRUE,FALSE,n(),replace=TRUE))

#Scatter Plot Matrix---- 
select(SimData, !any_of(c("ID", "PIN", "VISIT", "Specimen ID")))[,50:52] %>% ggpairs()
#' NOTES:Use to create a scatter plt from the data available. The number of the columns that you want to plot are inside the brackets
c()
