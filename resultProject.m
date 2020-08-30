function [crossValidationKnn, classError, y_predict, C, order, correctPredictions, acc, cm, precision, recall] = resultProject(model, imdsTest, featuretest)
    rng (1); % Per riproducibilità

    crossValidationKnn = crossval (model);
    
    classError = kfoldLoss(crossValidationKnn);
    
    labeltest = imdsTest.Labels;
    
    y_predict = predict(model,featuretest);
    
    [C,order] = confusionmat(labeltest,y_predict);
    
    correctPredictions = (y_predict == labeltest);
    
    acc = sum(correctPredictions)/length(correctPredictions);
    
    cm = confusionchart(labeltest,y_predict);

    for i =1:size(C,1)
        precision(i)=C(i,i)/sum(C(i,:));
    end
    
    for i =1:size(C,1)
        recall(i)=C(i,i)/sum(C(:,i));
    end
    
    precision=sum(precision)/size(C,1);
    recall=sum(recall)/size(C,1);
    
end
