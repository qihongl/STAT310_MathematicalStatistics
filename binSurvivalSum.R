# This calculates the "survival sum" of the binomal random variable 

# set the parameters
n = 7
p = .4
# set the starting point 
lowerBound = 4

# compute the sum 
sum = 0; 
for (i in lowerBound:n ) {
    sum = sum+dbinom(i, size=n, prob=p)    
}

# display the sum 
sum
