rm(list=ls(all=TRUE))
setwd('/Users/Qihong/Dropbox/github/STAT310_MathematicalStatistics')
# load data
data = read.csv('data/ASCII Comma/Chapter 11/phonelines.txt')
n = dim(data)[1]

# a) plot diff against control 
diff = data$X.test. - data$X.control.
plot(diff~data$X.control., pch = 20, main = 'Difference against control rate')
# => if the control rate is high, then the difference become more negative, 
# the magnitude also increases

# b) mean diff, sd, CI
Xbar = mean(data$X.test.)
Ybar = mean(data$X.control.)
varX = sum((data$X.test. - Xbar)^2)/(n-1)
varY = sum((data$X.control. - Ybar)^2)/(n-1)
covXY = sum((data$X.test. - Xbar) * (data$X.control. - Ybar)) / (n-1)
SeX = sqrt(varX) 
SeY = sqrt(varY)
corrXY = covXY / (SeX*SeY)

Di = data$X.test. - data$X.control.
meanDiff = mean(Di)
varDiff = varX + varY - 2 * covXY
varMeanDiff = varDiff / n 
sdDiff = sqrt(varMeanDiff)

meanDiff
sdDiff

# CI = meanDiff +- sdDiff * T
CI_low = meanDiff - sdDiff * qt(0.95,n-1)
CI_high = meanDiff + sdDiff * qt(0.95,n-1)


#c) conduct a t test, since the variance is unknown
# under null: 
testStats = meanDiff / sdDiff
qt(0.95,n-1)

# test statistics > crit
# conclusion: reject 