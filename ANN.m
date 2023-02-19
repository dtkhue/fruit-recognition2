close all
clc
% Load Hog Feature Vector ð? ðý?c x? l? PCA
load('trn_features_PCA.mat');
load('tst_features_PCA.mat');
load('trnLabel.mat');
load('tstLabel.mat');

% Fix size
trn_proj = trn_proj';
tst_proj = tst_proj';
trnLabel = trnLabel';
tstLabel = tstLabel';

numClasses = 3; % s? Clas
numFeatures = 100; %S? ð?u vào týõng ?ng v?i s? giá tr? trong vector Hog
layers = [
    sequenceInputLayer(numFeatures)  
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];

options = trainingOptions(...
    'sgdm', ...
    'MaxEpochs', 160, ...
    'Plots','training-progress', ...
    'InitialLearnRate',0.01, ...
    'LearnRateSchedule', 'piecewise', ...
    'LearnRateDropPeriod',50, ...
    'LearnRateDropFactor',0.1);

% Train
net = trainNetwork(trn_proj,categorical(trnLabel),layers,options);
tst_predict = classify(net,tst_proj);
tst_predict = grp2idx(tst_predict)';

% Accuracy + confusion matrix
accuracy = mean(tst_predict==tstLabel) * 100;
disp("Accuracy with PCA: " + accuracy + "%");
plotconfusion(ind2vec(tstLabel),ind2vec(tst_predict),'Neural Network');
