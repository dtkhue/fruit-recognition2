format long;

class= {'BERY','DRAGON','GRAPE'};
trn_features=[];
tst_features=[];
chk_features=[];

%Calculate Hog Feature Vector for Train DATA
for i=1:3
    inputs_folder=strcat('./DATA/TRAIN/',class{i},'/')
    fprintf(strcat('processing...'),inputs_folder);
    list=dir(inputs_folder);
    filenames={list(~[list.isdir]).name};
    for j=1:length(filenames)
        image_path=strcat(inputs_folder,filenames{j}); 
        I=imread(image_path);
        I = rgb2gray(I);
        trn_features=[trn_features;extractHOGFeatures(I)];
    end
end
trn_features = double(trn_features);
save('trn_features.mat','trn_features');

%Calculate Hog Feature Vector for Test DATA
for i=1:3
    inputs_folder=strcat('./DATA/TEST/',class{i},'/')
    fprintf(strcat('processing...'),inputs_folder);
    list=dir(inputs_folder);
    filenames={list(~[list.isdir]).name};
    for j=1:length(filenames)
        image_path=strcat(inputs_folder,filenames{j}); 
        I=imread(image_path);
        I = rgb2gray(I);
        tst_features=[tst_features;extractHOGFeatures(I)];
    end
end
tst_features = double(tst_features);
save('tst_features.mat','tst_features');

%Calculate Hog Feature Vector for CHECKING IMAGE 
for i=1
    inputs_folder=strcat('./DATA/CHECK/')
    fprintf(strcat('processing...'),inputs_folder);
    list=dir(inputs_folder);
    filenames={list(~[list.isdir]).name};
    for j=1:length(filenames)
        image_path=strcat(inputs_folder,filenames{j}); 
        I=imread(image_path);
        I = rgb2gray(I);
        chk_features=[chk_features;extractHOGFeatures(I)]; 
    end
    i=2;
end
chk_features = double(chk_features);
save('chk_features.mat','chk_features');

