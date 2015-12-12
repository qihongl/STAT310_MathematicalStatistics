rm(list=ls(all=TRUE))
setwd('/Users/Qihong/Dropbox/github/STAT310_MathematicalStatistics')
# load data
data = read.csv('data/ASCII Comma/Chapter 9/Geissler.txt')


# compute CHISQ statistics
# (Oi - Ei)^2 / Ei  <=> (Xi - nPi)^2 / nPi
# n = total counts 
# Assume the bite rate is constant: P(boys at ith numberCategory) ~ bin(n,p)

totalBoys = sum(data$X.frequency.)


# Expected counts for diff # follows bin(n,p)
# n = totalBoys
# we need to estimate what p is 
Xbar = sum(data$X.number. * data$X.frequency.) / sum(data$X.frequency.)
pMLE = Xbar / 12

Pi = dbinom(seq(0,12), 12, pMLE)
# Ei = nPi
Ei = totalBoys * Pi

# Oi - Ei 
barplot(data$X.frequency. - Ei, main = 'Deviation: observed vs. actual counts')


# CHISQ stats
stats = sum((((data$X.frequency. - Ei))^2) / Ei)

# df = N - 1 - dim(parameter) = 13 - 1 - 1 = 11 
N = dim(data)[1]
crit = qchisq(.999, N-1-1)

# 
stats > crit
# conclusion: we reject the H0 => exists lunar effect