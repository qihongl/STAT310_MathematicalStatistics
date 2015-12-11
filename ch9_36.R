rm(list=ls(all=TRUE))
setwd('/Users/Qihong/Dropbox/github/STAT310_MathematicalStatistics')
# load data
data = read.csv('data/ASCII Comma/Chapter 9/suicides1970.txt')

# compute CHISQ statistics
# (Oi - Ei)^2 / Ei  <=> (Xi - nPi)^2 / nPi
# n = total counts 
# Assume the rate is constant: P(suicide at ith day) = 1/365
# Then sucide rate at Jan = totalSuicides * 31 /365 
totalSucides = sum(data$X.Number.)

# expected counts are the same for all months 
Ei = totalSucides * data$X.Days. / 365

# Oi - Ei 
data$X.Number. - Ei
barplot(data$X.Number. - Ei, main = 'Deviation between expected and actual suicide counts')

# CHISQ stats
stats = sum((((data$X.Number. - Ei))^2) / Ei)

# df = N - 1 - dim(parameter) = 12 - 1 - 0 = 11 
N = dim(data)[1]
crit = qchisq(.99, N-1)

# 
stats > crit
# conclusion: we reject the H0 that "no seasonal pattern for ss" 