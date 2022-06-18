clc;
clear;
close all;
TR_sample=load("Xtrain.mat");
TE_sample=load("Xtest.mat");
Y_train=load("Ytrain.mat");
Y_test=load("Ytest.mat");

TR_sample=TR_sample.Xtrain;
TE_sample=TE_sample.Xtest;
Y_train=Y_train.Ytrain;
Y_test=Y_test.Yest;

K = 10;
si = 1;
TR_sample=double(TR_sample);
TE_sample=double(TE_sample);
TR_sample=TR_sample';
TE_sample=TE_sample';

Train_W = creatLap(TR_sample, K, si);
Train_D = (sum(Train_W, 2)).^(-1/2);
Train_D = diag(Train_D);
L_temp = Train_W * Train_D;
Train_L = Train_D * L_temp;
% for i=1:size(Train_L)
%     Train_L(i,i)=Train_L(i,i)+1;
% end

Train_L = Train_L + eye(size(Train_L));


Test_W = creatLap(TE_sample, K, si); 
Test_D = (sum(Test_W, 2)).^(-1/2);
Test_D = diag(Test_D);
L_temp = Test_W * Test_D;
Test_L = Test_D * L_temp;
% for i=1:size(Test_L)
%     Test_L(i,i)=Test_L(i,i)+1;
% end
Test_L = Test_L + eye(size(Test_L));
disp(size(Train_L));
disp(size(Test_L));

Train_X = TR_sample';
Test_X = TE_sample';
TrLabel = Y_train';
TeLabel = Y_test';
disp(class(TrLabel));
disp(class(TeLabel));
disp(class(Train_X));
disp(class(Test_X));


% disp(size(TR_sample));
% disp(size(TE_sample));
% disp(size(Y_train));
% disp(size(Y_test));


%% Please replace the following route with your own one
save('/Users/the_ash19/Desktop/BTP/IEEE_TGRS_GCN-master/HSI_GCN/Train_X.mat','Train_X');
save('/Users/the_ash19/Desktop/BTP/IEEE_TGRS_GCN-master/HSI_GCN/Test_X.mat','Test_X');
save('/Users/the_ash19/Desktop/BTP/IEEE_TGRS_GCN-master/HSI_GCN/TrLabel.mat','TrLabel');
save('/Users/the_ash19/Desktop/BTP/IEEE_TGRS_GCN-master/HSI_GCN/TeLabel.mat','TeLabel');
save('/Users/the_ash19/Desktop/BTP/IEEE_TGRS_GCN-master/HSI_GCN/Train_L.mat','Train_L');
save('/Users/the_ash19/Desktop/BTP/IEEE_TGRS_GCN-master/HSI_GCN/Test_L.mat','Test_L');
