library(gridExtra)
library(dplyr)
library(ggplot2)
library(zoo)
library(lubridate)
library(xtable)
library(car)
library(forcats)
library(tableHTML)
library(readr)

#Set Working Directory. This is the directory we saved the downloaded .txt files in. 
setwd("~/Documents/Faers")

#Define years we later use in loop for path. "Here, its only 1 year
years <- c("19")

#Define quarters we later use in loop for path
quarters <- c("1","2","3","4")

#Define generic path that we later use for loop
generic <- "faers_ascii_20"

#Here I create a generic data set schema that we can later populate
#I create a path where we can extract those datasets
demopath <- paste(generic, "19","q","4","/","ASCII","/","DEMO","19","q","4",".txt", sep="")
drugpath <- paste(generic, "19","q","4","/","ASCII","/","DRUG","19","q","4",".txt", sep="")
therpath <- paste(generic, "19","q","4","/","ASCII","/","THER","19","q","4",".txt", sep="")
reactpath <- paste(generic, "19","q","4","/","ASCII","/","REAC","19","q","4",".txt", sep="")

#Here we read in these data sets
demot <- read.csv(demopath, sep="$")
drugt <- read.csv(drugpath, sep="$")
thert <- read.csv(therpath, sep="$")
react <- read.csv(reactpath, sep="$")

demopath <- paste(generic, "19","q","1","/","ASCII","/","DEMO","19","q","1",".txt", sep="")
demot <- read.csv(demopath, sep="$")

#Here I check whether the merging with the frequency of comedications work. 
drugfreq <- as.data.frame(table(drugt$primaryid))
drugt <- merge(drugt,drugfreq,by = "drugKey", by.x="primaryid",by.y="Var1", all.x = TRUE)

#Define relevant columns that we later use after reading in the datasets
relevantDemoColumns <- c("primaryid","age","sex","wt","reporter_country", "event_dt","init_fda_dt")
relevantDrugColumns <- c("primaryid","drugname","drug_seq","Freq")
relevantTherColumns <- c("primaryid","dsg_drug_seq","start_dt","end_dt","dur")
relevantReactColumns <- c("primaryid","pt")

#Create empty master datasets with the right columns names
demoDF <- demot[,relevantDemoColumns][0,]
drugDF <- drugt[,relevantDrugColumns][0,]
drugDFAll <- drugt[,relevantDrugColumns][0,]
therDF <- thert[,relevantTherColumns][0,]
reactDF <- react[,relevantReactColumns][0,]

#Define all drug names we are looking for. There are drugs that are the same but with differnt names.
#In this case, we only focus on tramadol and lyrica. If you did it with other drugs too, that is totally fine!
drugnames <- c("tramal",
               "lyrica")

#Create loop, that goes over all folders/files to read in the data from all years and quarters and append them to each other
for (year in years){ #Loop Over Years
  for (quarter in quarters){ #Loop Over Quarters
    
    #Print both to check whether it is working
    print(year)
    print(quarter)
    
    #Create Paths depending on year and quarter
    pathdemo <- paste(generic, year,"q",quarter,"/","ASCII","/","DEMO",year,"q",quarter,".txt", sep="")
    pathdrug <- paste(generic, year,"q",quarter,"/","ASCII","/","DRUG",year,"q",quarter,".txt", sep="")
    pathther <- paste(generic, year,"q",quarter,"/","ASCII","/","THER",year,"q",quarter,".txt", sep="")
    pathreact <- paste(generic, year,"q",quarter,"/","ASCII","/","REAC",year,"q",quarter,".txt", sep="")
    
    #Read in the files
    demo <-read_delim(pathdemo, delim="$")
    drug <- read_delim(pathdrug, delim="$")
    ther <- read_delim(pathther, delim="$")
    react <- read_delim(pathreact, delim="$")
    
    
    #Change all column names of read in files to lower case
    colnames(demo) <- tolower(colnames(demo))
    colnames(drug) <- tolower(colnames(drug))
    colnames(ther) <- tolower(colnames(ther))
    colnames(react) <- tolower(colnames(react))
    
    
    #Check whether the column name "sex" does not appear in the column name of the demo DF. 
    #If no, change the column "gndr_cod" to "sex". This was an issue in the earlier data sets
    if(!"sex" %in% colnames(demo)){
      names(demo)[names(demo) == 'gndr_cod'] <- 'sex'
    }
    
    
    #If there is a column with the name "isr", then change it to "primaryid". 
    #Again, naming issue with earlier datasets
    if("isr" %in% colnames(demo)){
      names(demo)[names(demo) == 'isr'] <- 'primaryid'
      names(drug)[names(drug) == 'isr'] <- 'primaryid'
      names(ther)[names(ther) == 'isr'] <- 'primaryid'
      names(react)[names(react) == 'isr'] <- 'primaryid'
      
      
    
    #Same for drug_seq and dsg_drug_seq
    }
    if("drug_seq" %in% colnames(ther)){
      names(ther)[names(ther) == 'drug_seq'] <- 'dsg_drug_seq'


    }
    
    drugunique <- drug[!duplicated(drug[,c("primaryid","drugname")]),]
    
    #Create a data frame that shows how many unique medications there were per event
    drugfreq <- as.data.frame(table(drugunique$primaryid))
    
    #Merge this table with the drug table
    drug <- merge(drug,drugfreq, by.x="primaryid",by.y="Var1", all.x = TRUE)
    
    #This generates a new Variable Freq, that shows us how many medications there were per case
    names(drug)[names(drug) == 'Freq.x'] <- 'Freq'
    
    #Only select relevant columns from datasets
    demo <- demo[,relevantDemoColumns]
    drug <- drug[,relevantDrugColumns]
    ther <- ther[,relevantTherColumns]
    react <- react[,relevantReactColumns]
    
    #Change entries in drugname column to lower case, as otherwise there were issues with 
    #finding them with our druglist. 
    drug$drugname <- tolower(drug$drugname)
    
    drugAll <- drug
    
    #Only select entries that contain our drugs of interest
    drug <- drug[which(drug$drugname %in% drugnames),]
    
    #Create year and yearquarter columns 
    drug$datequarter <- as.yearqtr(2000+as.numeric(year)+(as.numeric(quarter)-1)*0.25)
    drug$dateyear <- as.factor(2000+as.numeric(year))
    
    #Append our dataset from the loop to our master datasets, we later use
    drugDF <- rbind(drugDF,drug)
    drugDFAll <- rbind(drugDFAll,drugAll)
    demoDF <- rbind(demoDF,demo)
    therDF <- rbind(therDF,ther)
    reactDF <- rbind(reactDF,react)
  }
}

save(drugDF, file="drugDFCase.Rda")
save(drugDFAll, file="drugDFAllCase.Rda")
save(demoDF, file="demoDFCase.Rda")
save(therDF, file="therDFCase.Rda")
save(reactDF, file="reactDFCase.Rda")

drugDFAll[drugDFAll$drugname=="tramal",]

#Merge
#Find all reactions per event and drug
#Find unique event/drug
drugUnique<- drugDF[!duplicated(drugDF[,c("primaryid","drugname")]),]


#Merge the adverse reactions with the drugs using the primary id as a key
reactdrug <- merge(reactDF,drugUnique,by = "primaryid", all.x = TRUE)
#Remove observations that contain NAs
reactdrug <- na.omit(reactdrug)
#Remove duplicate entries (adverse effects for each patient)
reactdrug <- reactdrug[!duplicated(reactdrug[,c("primaryid","pt")]),]
#Optional: Merge with demograhics of patients. This could be used later on for creating models 
reactdrugdemo <- merge(reactdrug,demoDF,by = "primaryid", all.x = TRUE)

#Optional: Create unique drugseq key, so we can identify the drug within an event. 
#Here, we create a unique key for the drug in the therapy dataset
therDF$drugKey <- paste(therDF$primaryid,therDF$dsg_drug_seq,sep="")

#The same we do for the already created dataset
reactdrugdemo$drugKey <-paste(reactdrugdemo$primaryid, reactdrugdemo$drug_seq,sep="")

#Now we can merge the therapy master dataset with previously merged dataset based on drugkey we defined earlier
drugdemotherreact <- merge(reactdrugdemo,therDF,by = "drugKey", all.x = TRUE)

#We make all adverse effects lower case
drugdemotherreact$pt <- tolower(drugdemotherreact$pt)

#Rename dataset for the sake of ease
tl <- drugdemotherreact

#Filter by tramadol
tramal_df <- tl[tl$drugname=="tramal",]
lyrica_df <- tl[tl$drugname=="lyrica",]


top5AdverseEffectsTramadol <- count(tramal_df,pt, sort=TRUE)[1:10,]
top5AdverseEffectsLyrica <- count(lyrica_df,pt, sort=TRUE)[1:10,]


t <- top5AdverseEffectsTramadol %>%
  ggplot(aes(x = reorder(pt, n), y = n)) +
  geom_bar(stat = "identity", aes(fill = n)) +
  coord_flip() +
  ggtitle("Tramal") + 
  theme(legend.position = "None")


l <- top5AdverseEffectsLyrica %>%
  ggplot(aes(x = reorder(pt, n), y = n)) +
  geom_bar(stat = "identity", aes(fill = n)) +
  coord_flip() +
  ggtitle("Lyrica") + 
  theme(legend.position = "None")

grid.arrange(t, l, ncol=2)


