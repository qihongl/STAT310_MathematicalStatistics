clear all; close all; clc
% hw 6,  CH13 -3 data 
ABO = [7 5 3 13; 27 32 8 18; 55 50 7 24];
MN = [21 6 1 ; 54 27 5; 74 51 11];

%% conduct tests
% compute chisq stats for ABO type
df.ABO = prod(size(ABO) - 1);
Eij.ABO = (sum(ABO,2) * sum(ABO,1))/sum(ABO(:));
testStats.ABO = sum(sum(((ABO - Eij.ABO).^2) ./Eij.ABO));
pval.ABO = 1 - chi2cdf(testStats.ABO,df.ABO);

% compute chisq stats for MN type 
df.MN = prod(size(MN) - 1);
Eij.MN = (sum(MN,2) * sum(MN,1))/sum(MN(:));
testStats.MN = sum(sum(((MN - Eij.MN).^2) ./Eij.MN));
pval.MN = 1 - chi2cdf(testStats.MN,df.MN);

%% display test stats and crit 
testStats
pval
chi2inv(0.95,df.ABO)
chi2inv(0.95,df.MN)