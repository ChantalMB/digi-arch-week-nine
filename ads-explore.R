# set up required libraries
library(curl)
library(stringr)
library(dplyr)

kennings <- read.csv(curl("https://archaeologydataservice.ac.uk/archiveDS/archiveDownload?t=arch-3432-1/dissemination/csv/DB3_Kennings.csv"), header = TRUE, row.names="ID")

# view the data
View(kennings)

swords <- kennings %>%
  filter(str_detect(Meaning, "Sword"))

View(swords)


# first we use the 'table' command to count up the number of times each site appears

meaning <- table(kennings$Meaning)

View(meaning)

# then we sort the list
meaning <- sort(meaning, decreasing=TRUE)

barplot(meaning, main="Kenning Meanings", xlab="Meaning", ylab="Mentions", ylim=range(pretty(c(0, meaning))), las=2, cex.names=.5)


warriors <- kennings %>%
  filter(str_detect(Meaning, "Warrior"))

View(warriors)


poems <- table(warriors$Poem)
poems <- sort(poems, decreasing=TRUE)
barplot(poems, main="Mention of Warriors", xlab="Poems", ylim=range(pretty(c(0, poems))), las=2, cex.names=.5, beside=TRUE)

