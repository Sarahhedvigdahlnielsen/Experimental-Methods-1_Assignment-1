box<-9
box2<-"car"
box3<-"3"
box4<-c(2,4)
box4+2
boxes<-c(2,3,4)
boxes+3

class(boxes)
class(box3)


boxes<-null


rm(boxes)


a_vector<-c("Lærke","Kristian","Martine","Kristine","Cecilie")

a_vector<-c(a_vector, "Markus")

a_vector[2]

new_vector<-a_vector[-1]

length(new_vector)

vector_numbers<-c(1,55,89,100)
sum(vector_numbers)

rm(vector_numbes)


#Remember to comment your code!



#Exercise 1

#Create a vector of the names of 5 people sitting near you
vector_names<-c("Lærke","Kristian","Martine","Kristine","Anders")

#Create a vector with a guess of number of simlings they each have
vector_number_of_siblings_of_names<-c(1,0,2,3,2)

#Add 2 to both vectors
vector_names+2
vector_number_of_siblings_of_names+2
#The first one reads error as it is not possible to add 2 to a non-numerical variable

#Check the class of both vectors
class(vector_names)
class(vector_number_of_siblings_of_names)

#How many siblings do people have in total?
sum(vector_number_of_siblings_of_names)

#What is the product of person 1 and 2's number of siblings?
vector_number_of_siblings_of_names[1]*vector_number_of_siblings_of_names[2]

#Add one new element to the vector with the no. of siblings, the new element has to be a word
vector_number_of_siblings_of_names<-c(vector_number_of_siblings_of_names,"Lærke")

#Try to multiply the vector by 2 now
vector_number_of_siblings_of_names*2
#Reads error due to a nonnumerical value

#Remove the new word from the vector and try again
vector_number_of_siblings_of_names<-c(1,0,2,3,2)






df<-data.frame(Name=vector_names,Siblings=vector_number_of_siblings_of_names)
View(df)

df$Name<-as.character(df$Name)


df$Age<-c(18,20,21,22,21)

df$Gender<-c("female","male","female","female","male")

df<-rbind(df,"Fabio",1,33,"male")


#Exercise 2
