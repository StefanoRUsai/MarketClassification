ds = tabularTextDatastore('training_list.csv')
T = readall(ds);
file =T.Var1;
label= T.Var6;

cd images

imds = imageDatastore(file);

imds.Labels= label;
imds.countEachLabel
cd ..

dstest = tabularTextDatastore('validation_list.csv')
Ttest = readall(dstest);
filetest = Ttest.Var1;
labeltest = Ttest.Var6;

cd images

test = imageDatastore(filetest);

test.Labels= labeltest;
test.countEachLabel;
cd ..

%bag = bagOfFeatures(imds,'GridStep', [32 32], 'BlockWidth', [64 96], 'StrongestFeatures', 1, 'Verbose', true );
extractorFcn = @MSEFFEature;
bag = bagOfFeatures(imds,'CustomExtractor',extractorFcn, 'Verbose', true, 'VocabularySize', 100)

feature = encode(bag,imds);

featuretest = encode(bag,test);

Mdl = fitcknn(feature,label,'OptimizeHyperparameters','auto', 'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName','expected-improvement-plus'))
rng (1); % Per riproducibilità

CVKNNMdl = crossval (Mdl);
classError = kfoldLoss(CVKNNMdl);
acc1 = 1 - classError;

yhat = predict(Mdl,featuretest);
[C,order] = confusionmat(labeltest,yhat)
correctPredictions = (yhat == labeltest);
acc = sum(correctPredictions)/length(correctPredictions);
cm = confusionchart(labeltest,yhat);

categoryClassifier = trainImageCategoryClassifier(test,bag);
[confMat, knownLabelIdx, predictedLabelIdx, score] = evaluate(categoryClassifier, test);

for i =1:size(C,1)
    precision(i)=C(i,i)/sum(C(i,:));
end
precision
for i =1:size(C,1)
    recall(i)=C(i,i)/sum(C(:,i));
end
recall
Precision=sum(precision)/size(C,1);
Precision
F_score=2*recall*Precision/(Precision+recall); %%F_score=2*1/((1/Precision)+(1/Recall));
F_score;