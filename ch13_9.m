clear all; close all; clc
% hw 6,  CH13-9
data.full = [14 16 8 2 ; 133 180 93 81 ; 12 14 12 1 ; 241 285 139 153; 11 6 8 17; 259 265 221 204];
% columns represents: R1, R2, I1, I2
% R = real, I = imitation 

% the degree of freedom are the same for some of the the tests
df.twoCol = (size(data.full,1) - 1) * (2-1);
df.threeCol = (size(data.full,1) - 1) * (3-1);

%% test: R1 vs. R2
data.R1R2 = data.full(:,1:2);
% compute the expected counts 
Eij.R1R2 = (sum(data.R1R2,2) * sum(data.R1R2,1))/sum(data.R1R2(:));
% compute the test stats
testStats.R1R2 = sum(sum(((data.R1R2 - Eij.R1R2).^2) ./Eij.R1R2));
% compute p value 
pval.R1R2 = 1 - chi2cdf(testStats.R1R2, df.twoCol);


%% test I1 vs. I2
data.I1I2 = data.full(:,3:4);
% compute the expected counts 
Eij.I1I2 = (sum(data.I1I2,2) * sum(data.I1I2,1))/sum(data.I1I2(:));
% compute the test stats
testStats.I1I2 = sum(sum(((data.I1I2 - Eij.I1I2).^2) ./Eij.I1I2));
% compute p value 
pval.I1I2 = 1 - chi2cdf(testStats.I1I2, df.twoCol);

%% test R1R2 vs. I1
data.RI1 = data.full(:,1:3);
% compute the expected counts 
Eij.RI1 = (sum(data.RI1,2) * sum(data.RI1,1))/sum(data.RI1(:));
% compute the test stats
testStats.RI1 = sum(sum(((data.RI1  - Eij.RI1 ).^2) ./Eij.RI1 ));
% compute p value 
pval.RI1 = 1 - chi2cdf(testStats.RI1 , df.threeCol);

%% test R1R2 vs. I2
data.RI2 = data.full(:,[1 2 4]);
% compute the expected counts 
Eij.RI2 = (sum(data.RI2,2) * sum(data.RI2,1))/sum(data.RI2(:));
% compute the test stats
testStats.RI2 = sum(sum(((data.RI2 - Eij.RI2 ).^2) ./Eij.RI2 ));
% compute p value 
pval.RI2 = 1 - chi2cdf(testStats.RI2 , df.threeCol);


%% display test stats and crit 
testStats
pval 