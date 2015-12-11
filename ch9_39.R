rm(list=ls(all=TRUE))
setwd('/Users/Qihong/Dropbox/github/STAT310_MathematicalStatistics')
# load data
data = read.csv('data/ASCII Comma/Chapter 9/bites.txt')
data = cbind(data, c(rep(3,9), 2))
colnames(data)[3] <- 'numDays'

# compute CHISQ statistics
# (Oi - Ei)^2 / Ei  <=> (Xi - nPi)^2 / nPi
# n = total counts 
# Assume the bite rate is constant: P(bite at ith day) = #days / 29
# e.g. Then sucide rate at 16,17,18 = 3 /29

totalBites = sum(data$X.bites.)


# expected counts are the same for all months 
# Ei = nPi
Pi = data$numDays / 29 
Ei = totalBites * Pi
    
# Oi - Ei 
data$X.bites. - Ei
barplot(data$X.bites. - Ei, main = 'Deviation: observed vs. actual bite counts')
barplot(data$X.bites., main = 'observed bites')


# CHISQ stats
stats = sum((((data$X.bites. - Ei))^2) / Ei)

# df = N - 1 - dim(parameter) = 12 - 1 - 0 = 11 
N = dim(data)[1]
crit = qchisq(.99, N-1)

# 
stats > crit
# conclusion: we reject the H0 => exists lunar effect

