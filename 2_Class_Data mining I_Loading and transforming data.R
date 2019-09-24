############### CLASS 2

df <- read.table("2_Class_NEW_CogSciPersonalityTest2019.csv", header = TRUE, sep = ",")
##### We use this function instead of just clicking 'File - Import Dataset' because we try to use as much 
##### "programming" / writing and as little "clicking" as possible



########## PACKAGES

##### You install a package (only done once), use this function
#install.packages("packagename")

##### To load a package (which should be done every time you load a script) use this function
#library(packagename)
library(pacman)

##### The package 'pacman' includes a function where the loading of a library also downloads and installs it if it's 
##### not already in your Rstudio. The function is
#pacman::p_load(packagename) 

##### The package 'tidyverse' is made for data science and we use it in Experimential Methods
pacman::p_load(tidyverse)



########## FUNCTIONS FOR DATA TRANSFORMATION

##### The function 'filter()' extracts information from a dataframe. It becomes messy if you don't define it as a new vector
shoesize_40 <- filter(df, shoesize == 40)

##### To filter for several things use the filter command as well as Boolean operators (see slide 'Logic')
male_shoesize40 <- filter(df, shoesize >= 40 & gender == 'male')



########## Exercise 1

##### Find students, that

##### 1 Have shoesize 39 or bigger 
shoesize39_orbigger <- filter(df, shoesize >= 39)

##### 2 Were able to touch the floor
# First, check how people could answer that question by
levels(df$touch_floor)
able_to_touch_the_floor <- filter(df, touch_floor == "Yes" | touch_floor == "Yes, of course!!")

##### 3 Were able to hold their breath longer than average
hold_breath <- filter(df, breath_hold > mean(breath_hold))

##### 4 Could balance a balloon between 13 and 60 seconds
levels(df$balloon_balance)
balancing_balloon <- filter(df,balloon_balance >= 13.00 & balloon_balance <= 60.00)

##### 5 All of the above
all <- filter(df, (shoesize >= 39) & (balloon_balance >= 13.00 & balloon_balance <= 60.00) & (touch_floor == "Yes" | touch_floor == "Yes, of course!!") & (breath_hold > mean(breath_hold)))



########## Exercise 2

##### 1 Sort data so it starts with the student who was the slowest at tongue twister
slowest_tongue_twister <- arrange(df, desc(tongue_twist))

##### 2 Sort data by one argument to find the student who performed best in the Romberg task. You define 'best'.
best_romberg <- arrange(df, desc(romberg_open + romberg_closed))

##### 3 How could you improve your Romberg ranking table?
# idk


# Trying out the slides before Exercise 3
select(df, name, gender) #this includes name and gender
select(df, name:gender) #this one is from name to gender
select(df, -c(name:gender, vis_duck:taste_blind)) #-c means excluding what is inside that argument
select(df, gender, everything()) #This one puts gender as the first column



########## Exercise 3

##### What happens if you select the same column name multiple times?
select <- (df, gender, gender) # It just makes an error

##### Make the following vector 
vars = c("name", "shoesize", "touch_floor")
# What happens when you use this vector to select from the dataframe?
vars <- select(df, vars) # It then only uses these variables

##### Rearrange your dataframe with gender and shoesize first
rearranged_df <- select(df, gender, shoesize, everything())



########## Exercise 4

# 1 The tongue twister had 99 words. Make a new column called "word_per_sec" where you calculate how many words each 
# student said per second
words_per_sec <- mutate(df, word_per_sec = 99/tongue_twist)

# 2 Currently breath_hold is in seconds. Convert it to two new columns called "breath_min" and "breath_sec", 
# containing the number of whole minutes (achieved by dividing using %/%) and remaining seconds respectively
df <- mutate(df, breath_min = breath_hold %/% 60)
df <- mutate(df, breath_sec = breath_hold - (breath_hold %/% 60) * 60)

# 3 BONUS: Create a column where you calculate how far each student is from the average words per second
df <- mutate(df, difference_from_average_tongue_twist = tongue_twist - mean(tongue_twist))


# Trying out slides before exercise 5
mean_shoesize <- summarise(df, mean(shoesize)) #Collapses data into a single row

by_gender <- group_by(df, gender)
summarise(by_gender, mean(shoesize)) #This code (two previous lines) can be made easier by using pipes
df %>% group_by(gender) %>% summarise(mean(shoesize))


# Exercise 5

# 1 Is there a gender difference when it comes to balloon balancing?
balloon_balance_by_gender <- df %>% group_by(gender) %>% summarise(mean(balloon_balance))
# Yes, there is a significant difference

# 2 Is there a relation between sound level preference and which cola was chosen?
sound_and_cola <- df %>% group_by(taste_cola) %>% summarise(mean(sound_level_pref))
# No, there is no significant difference

# 3 Does handedness influence tongue twisting speed?
handedness_and_tongue_twist <- df %>% group_by(handedness) %>% summarise(mean(tongue_twist))
# No, there is no significant difference

##### Can you add a column to the summary which contains number of people in each group (e.g. number of right handed 
##### people), hint: look at the n() function
?n()
handednessanddf %>% group_by(handedness)
length(handedness)
summarise(df,df$)


