function [categoryClassifier, confMat, knownLabelIdx, predictedLabelIdx, score, svmPrecision, svmRecall] = createSVM(imdsTrain, bag)

    categoryClassifier = trainImageCategoryClassifier(imdsTrain,bag);
    [confMat, knownLabelIdx, predictedLabelIdx, score] = evaluate(categoryClassifier, imdsTest);
    
    
    for i =1:size(confMat,1)
        svmprecision(i)=confMat(i,i)/sum(confMat(i,:));
    end
    for i =1:size(confMat,1)
        svmrecall(i)=confMat(i,i)/sum(confMat(:,i));
    end
    svmPrecision=sum(precision)/size(confMat,1);
    svmRecall=sum(recall)/size(confMat,1);
    
end