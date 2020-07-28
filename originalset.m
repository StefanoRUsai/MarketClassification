cd train_set
ds = tabularTextDatastore('train_set.txt')
T = readall(ds);
file =T.fileRGB;
label= T.class;

cd train_RGB

imds = imageDatastore(file);

imds.Labels= label;
imds.countEachLabel
cd ..
cd ..

cd test_set
dstest = tabularTextDatastore('test_set.txt')
Ttest = readall(dstest);
filetest = Ttest.fileRGB;
labeltest = Ttest.class;

cd test_RGB

test = imageDatastore(filetest);

test.Labels= labeltest;
test.countEachLabel;

cd ..
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