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
# Import Data ----
datafile0 <- "Data/R test data.xlsx"
Dat0 <- import(datafile0)
Dat0[1,] #Take the 1st row of the data set
Dat0[1,2] #Row 1, Col 2
Dat0[1,2:5] #Row 1, Cols 2 through 5
Dat0[1,c(2,5)] #Row 1, Cols 2 and 5 #C command is helpful for non-sequential data
Dat0[c(1,1),]#Row 1 twice, All Cols
Dat0[rep(1,6),] #Row 1, repeated 6 times, All Cols 
#Rep command is helpful for repeating large amounts of data as the c command must be manually input

set.seed(seed) #Use this func to replicate the same vector of random numbers; seed was defined on line 25
rnorm(nrows, mean=900, sd=250) #Create a single column vector of random values; nrows was defined on line 25

#Create a new variable from Dat 0 with row 1 repeated nrows times for all columns
#mutate(Dat1, `CD4 ABS`=12) #Modify Data 1 by replacing all values in column CD4 ABS with '12'
#Dat1 <-mutate(Dat1, `CD4 ABS`=rnorm(n(), mean=900, sd=250)); #Redefine Dat1 by replacing the values in CD4 ABS with random values
#n() represents the number of rows in the current block of data

Dat1 <-Dat0[rep(1,nrows),]%>%
      mutate(across(where(is.numeric),~rnorm(n(),mean=.x,sd=1+.x/12)) 
            #Across performs a specific action given a condition, across(condition, action)
            #.x is a placeholder for column name. This syntax only works within mutate, transmute and sumarize
               , ID= sprintf("EX-%04d",sample(1:1000,n())) # Zero pad to 4 places with prefix 'EX-'
              ,`Specimen ID`=sprintf("%03d-%03d-%04d-%d",
                                      sample(1:100,n(), replace = TRUE),
                                      sample(1:100,n(),replace = TRUE),
                                      sample(1:1000,n(),replace = TRUE),
                                      sample(1:9,n(),replace = TRUE))
              , PIN=seq_len(n())
              , `CD4 ABS`=round(rnorm(n(), mean=900, sd=250))
              , `CD8 ABS`=round(rnorm(n(), mean=500, sd=20))
              , `CD4/8 Ratio`=(`CD4 ABS`/`CD8 ABS`) #backcode use when there is spaces in the name
              , WBC=rnorm(n(), mean=4.9, sd=.26)
              , RBC=rnorm(n(), mean=8.7, sd=.24)
             , across(everything(),~ifelse(sample(1:0,n,replace=TRUE,prob =probmissing ),.x,NA))
            , Date=as.Date(Date,"%m%d%Y")-sample(0:2,n(),replace=TRUE)
)
SummaryDat1 <-summarize(group_by(Dat1,Date),`CD4 ABS`=mean(`CD4 ABS`),`CD8 ABS`=mean (`CD8 ABS`))
#summarize agregates the data, and help yo see specific data
#as. is used to convert between characters 
#To convert the format if the date use the command below
as.Date("11/30/2024","%m%d%y")
#Universal way to test if something is in the right format use is(x,y) where x&Y are what are you testing
is(as.Date("11/30/2024","%M%D%Y"),"Date") #see comment on top
# Write Data----
export(Dat1,"data/Simulated Data.xlsx")
#if you want to pull out specific data from your data set
