#' title: "TSCI 5050 Processing a Data Set"
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
##HW try to read the data and play with it 
c()