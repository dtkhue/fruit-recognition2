clc
close all
% Load Hog Feature Vector and Label 
load('trn_features.mat');
load('tst_features.mat');
load('chk_features.mat');

%PCA
trn_means = mean(trn_features);

trn_mean_cent = trn_features - trn_means;
tst_mean_cent = tst_features - trn_means;

chk_mean_cent = chk_features - trn_means;

trn_mean_cent(isnan(trn_mean_cent))=0;
tst_mean_cent(isnan(tst_mean_cent))=0;
chk_mean_cent(isnan(chk_mean_cent))=0;

[U, S, V] = svd(trn_mean_cent);

for i=1:243
    disp(i + " " + S(i,i));
end

num_feats = 100;
trn_proj = trn_mean_cent/V';
tst_proj = tst_mean_cent/V';
chk_proj = chk_mean_cent/V';
trn_proj = trn_proj(:,1:num_feats);
tst_proj = tst_proj(:,1:num_feats);
chk_proj = chk_proj(:,1:num_feats);

% Save Hog Feature Vector with PCA
save('trn_features_PCA.mat','trn_proj');
save('tst_features_PCA.mat','tst_proj');
save('chk_features_PCA.mat','chk_proj');


