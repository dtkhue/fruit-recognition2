%SVM with PCA
clear
close all
% Load Hog Feature Vector ð? ðý?c x? l? PCA
load('trn_features_PCA.mat'); %Vector Train
load('tst_features_PCA.mat'); %Vector Test
load('chk_features_PCA.mat'); %Vector Check
load('trnLabel.mat'); %Label Train
load('tstLabel.mat'); %Label Test
load('chkLabel.mat'); %Label Check

% Create an SVM template
tempSVM = templateSVM('KernelFunction','polynomial','PolynomialOrder',5);

% Create MultiClass SVM with Vector Train + Label Train
Mdl = fitcecoc(trn_proj,trnLabel,'Learners',tempSVM);

% Test MultiClass SVM with testing data
tst_predict = predict(Mdl,tst_proj);
chk_predict = predict(Mdl,chk_proj);


% Accuracy + confusion matrix
accuracy = mean(tst_predict==tstLabel) * 100;
disp("Accuracy with PCA: " + accuracy + "%");
size(ind2vec(tstLabel'))
size(ind2vec(tst_predict'))
plotconfusion(ind2vec(tstLabel'),ind2vec(tst_predict'),'SVM With PCA ');

% Check new image
inputs_folder=strcat('./DATA/CHECK/')
fprintf(strcat('processing...'),inputs_folder);
list=dir(inputs_folder);
filenames={list(~[list.isdir]).name};
R=cell(1:length(filenames));
Y=cell(1:length(filenames));
for i=1:length(filenames)
        image_path=strcat(inputs_folder,filenames{i}); 
        I=imread(image_path);
        Y{i}=I;
        R{i}=chk_predict(i);
    if R{i}==1
        R{i}='Bery';
    elseif R{i}==2
        R{i}='Dragon';
    elseif R{i}==3
        R{i}='Grape';
    end
end

figure
for i=1:length(filenames)
subplot(3,3,i)
imshow(Y{i});
title(R{i});
end





