# The Homework1_Bonds.csv is imported as "Bonds"
Bonds <- read.csv("Homework1_Bond.csv")

# --- Problem 1 --- #

# Calculates the total results for the bond
table(Bonds$Result)

# Creates a table that gives the ratio of approved bonds
x <- table(Bonds$Result == "Carried", Bonds$Gov_Type)
prop.table(x, 2)

# --- Problem 2 --- #

# Total_votes holds the value of the sum of votes for each bond

# Creating new variable in dataframe "Total_votes"
votessum <- (Bonds$Votes_For + Bonds$Votes_Against)
Bonds$Total_votes <- votessum

# Finding Max votes
max(Bonds$Total_votes)
min(Bonds$Total_votes)

# Finding which county had the most votes and for what purpose
Bonds[Bonds$Total_votes == max(Bonds$Total_votes),]


# --- Problem 3 --- #

# Variable that contains bonds that passed with a voter turnout
# of greater than 10
passHighVoterTurnout <- Bonds[Bonds$Result == "Carried" & 
                        (Bonds$Votes_For + Bonds$Votes_Against) >= 10,]

# "ratioForBond" contains percentage of votes that were for
# the bond

ratioForBond <- (passHighVoterTurnout$Votes_For/
                   passHighVoterTurnout$Total_votes)

passHighVoterTurnout$Ratio <- ratioForBond

# Creates a histogram
hist(passHighVoterTurnout$Ratio,
     main = "Percentage of Votes for the Bond",
     xlab = "Ratio of votes for the bond",
     col = c("aquamarine","lavender", "grey"),
     )

# Information about the data
mean(passHighVoterTurnout$Ratio)
median(passHighVoterTurnout$Ratio)
sd(passHighVoterTurnout$Ratio)
fivenum(passHighVoterTurnout$Ratio)

# --- Problem 4 --- #

cor(passHighVoterTurnout$Amount, passHighVoterTurnout$Ratio)

# Plots the ratio of approved votes and the cost of the bond
plot(passHighVoterTurnout$Amount, passHighVoterTurnout$Ratio,
     
     main = "Bond Margin Versus Cost",
     xlab = "Cost",
     ylab = "Margin",
     pch = 20
     )











