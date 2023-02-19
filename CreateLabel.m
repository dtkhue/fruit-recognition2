trnLabel=zeros(420,1);
tstLabel=zeros(180,1);
chkLabel=zeros(9,1);
%1=Bery
%2=dragon
%3=grape
for i=1:140
        trnLabel(i,1)=1;
        trnLabel(i+140,1)=2;
        trnLabel(i+280,1)=3;
end
for i=1:60
        tstLabel(i,1)=1;
        tstLabel(i+60,1)=2;
        tstLabel(i+120,1)=3;
end  
for i=1:3
        chkLabel(i,1)=1;
        chkLabel(i+3,1)=2;
        chkLabel(i+6,1)=3;
end  
save('trnLabel.mat','trnLabel');
save('tstLabel.mat','tstLabel');
save('chkLabel.mat','chkLabel');


