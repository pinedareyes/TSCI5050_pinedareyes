debug <- 0;nrows <-200;seed <-11022025; #' seed is to create a random number, that is evently distributed.(you make something random but yet reproducible)
#To replicate the same vector of random number, set the set seed function
# Import Data ----
DataFile0 <-"data/R test data.xlsx"
Dat0 <- import(DataFile0)
# This creates data
rnorm(200, mean = 900, sd = 250)
View(data0)
# Mutates create different columns of data.
Dat0[1,] # takes the 1st row if the data set
Dat0[1,2] #take data from first row, second column
Dat0[1,2:5] #takes data from first row, column 2 to 5
Dat0[1, c(2,2)] #first row, column 2 twice. C use when number are not sequential
Dat0[c(1,1)]#row 1 twice, all columns
Dat0[rep(1,6),] #rep is to replicate. coma means to take all the columns
Dat0[rep(1,nrows),]
Dat1 <- Dat0[rep(1,nrows),]
#mutate(Dat1, `CD4 ABS` =12)
#mutate(Dat1, `CD4 ABS` =rnorm(200, mean = 900, sd = 250)) 
#Dat1 <- mutate(Dat1, `CD4 ABS` =rnorm(n(), mean = 900, sd = 250)) #n() is the number of rows in the current block of data. when you start summ. is the numb of rows in a group
#arguments are separated by comas, exept when their is an another argument. in the script below the second argument starts after the coma and ends after sd parentesis
#how to add variables step by step # Dat1 <- mutate(Dat1, `CD4 ABS` =rnorm(n(), mean = 900, sd = 250),  `WBC` =rnorm(n(), mean = 4.9, sd = .6))
Dat1 <- mutate(Dat1
              , ID= sprintf("EX-%04d",sample(1:1000,n())) 
              #use = inside a function to assign value <- is to assign a value outside a function
               , `CD4 ABS`=round(rnorm(n(), mean = 900, sd = 250)) #round is to round a number, backcodes (``) is to not confuse names that might give you an error
               , `WBC`=rnorm(n(), mean = 4.9, sd = .6)
               ,`RBC`=rnorm(n(), mean = 8.7, sd = .24))
sprintf("name=%s, last name=%s age%d, percentil=%% %f","Ana","Pineda",30, 98.5)

