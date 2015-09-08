lambda = 2
x = 0

sum = 0
for(i in 0:x){
    sum = sum + dpois(i, lambda)
}
sum
