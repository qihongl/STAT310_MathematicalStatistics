clear all; close all; clc
% hw 6,  CH13 -27
% col: death vs. not death
Oij = [33 251; 33 508; 29 587; 4 76];

% the degree of freedom are the same for all the tests
df = prod(size(Oij) - 1);

%% test: R1 vs. R2
% compute the expected counts 
Eij = (sum(Oij,2) * sum(Oij,1))/sum(Oij(:));
% compute the test stats
testStats = sum(sum(((Oij - Eij).^2) ./Eij));
% compute p value 
pval = 1 - chi2cdf(testStats, df);

%% display test stats and crit 
testStats
pval 