rm(list=ls(all=TRUE))
setwd('/Users/Qihong/Dropbox/github/STAT310_MathematicalStatistics')
# load data


# a) plot diff against control 
diff = data$X.test. - data$X.control.
plot(diff~data$X.control.)
# => if the control rate is high, then the difference become more negative, 
# the magnitude also increases

# b) mean diff, sd, CI
Xbar = mean(data$X.test.)
Ybar = mean(data$X.control.)
varX = sum((data$X.test. - Xbar)^2)/(n-1)
varY = sum((data$X.control. - Ybar)^2)/(n-1)
SeX = sqrt(varX/n) 
SeY = sqrt(varY/n)

meanDiff = mean(data$X.test.) - mean(data$X.control.)
varDiff = (varX + varY - cor(data$X.test.,data$X.control.) * sqrt(varX*varY))/n
sdDiff = sqrt(varDiff)

meanDiff
sdDiff

# CI = meanDiff +- sdDiff * T
CI_low = meanDiff - sdDiff * qt(0.95,n-1)
CI_high = meanDiff + sdDiff * qt(0.95,n-1)


#c) conduct a t test, since the variance is unknown
# under null: 
testStats = meanDiff / (sdDiff / sqrt(n))
qt(0.999,n-1)

# test statistics > crit
# conclusion: reject 