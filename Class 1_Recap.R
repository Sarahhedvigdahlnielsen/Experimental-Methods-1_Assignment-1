##### Class 1, Exercise 1

#1 Create a vector with 5 names
names <- c("Kristian","Lærke","Martine","Kristine","Elisabet")

#2 Create a vector with number of siblings (guess)
siblings <- c(3,2,2,3,1)

#3 Add 2 to both vectors. What happens and why?
names <- names+2
siblings <- siblings+2
# R is unable to add 2 to the vector 'names' as this is one containing characters

#4 Check class of both vectors
class(names)
class(siblings)
# names' class is "character" whereas siblings' class is "numeric"

#5 How many siblings do people have in total?
siblings <- siblings-2
sum(siblings)
# Based on the guess people have 11 siblings in total

#6 What is the product of person 1 and 2's number of siblings?
siblings[1]*siblings[2]
# The product is 6

#Extra
# Why does the following code result in error?
name <- Peter
# This is because Peter has to be in quotation marks

# Add one new element to the vector with the number of siblings. The new element has to be a word.
siblings <- c(siblings, "pop")

# What happens if we try to multiply this vector by 2 now? Why?
siblings*2
# R reads error, as it cannot multiply a non-numerical value

# Remove the new word from the vector and try again
siblings <- siblings[-6]
siblings*2
# It still reads error, due to the class still being "character"
siblings <- as.numeric(siblings)
siblings*2




##### Class 1, Exercise 2

#1 Create a dataframe with the previous vectors
df <- data.frame(Name=names,Siblings=siblings)

#2 Add gender to the dataframe
df$Gender <- c("m","f","f","f","f")

#3 Add a new person to the dataframe
df$Name <- as.character(df$Name)
df <- rbind(df,c("Sarah",1,"f"))

#4 What is the mean number of siblings?
mean(df$Siblings)
df$Siblings <- as.numeric(df$Siblings)
# The mean is 2

#5 Ask people how many siblings they have and put the actual numbers as a separate column in your dataframe
df$Actual <- c(2,2,3,1,2,1)

#6 Make a column with numbers showing how much you were off

df$Difference <- df$Siblings-df$Actual




##### Class 1, Exercise 3

#1 Who has 3 siblings?
df[df$Actual == 3,1]

#2 How many people have more than 2 siblings?
df[df$Actual > 2,1]

#3 Create a subset of the data containing only people you guessed right
subset.data.frame() <- subset(df[df$Siblings == df$Actual,1])
subset
subdf <- subset(df,df$Siblings == df$Actual)

#Use '?' to find what these functions do

?round()
# 'round' rounds the values in its first argument to the specified number of decimal places
round(mean(siblings),0)

?length()
# 'length' is used to get or set the length of an object
length(names)

?unique()
