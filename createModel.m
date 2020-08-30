function [bag, feature, featurestest, model] = createModel(imdsTrain, imdsTest, size, extractorFcn)
    %extractorFcn corrisponde a una stringa, 'GridStep' , 'Detector', o custom extactor''
    %size dimensione del bag of visual words 
    
    
    if isequal(extractorFcn,'GridStep')
        bag = bagOfFeatures(imdsTrain,'GridStep', [32 32], 'BlockWidth', [64 96], 'StrongestFeatures', 1, 'Verbose', true, 'VocabularySize', size   );
    elseif isequal(extractorFcn,'Detector')
        bag = bagOfFeatures(imdsTrain, 'StrongestFeatures', 1,'PointSelection', 'Detector','Verbose', true, 'VocabularySize', size );
    elseif isequal(extractorFcn,'Custom')
        extractor = @MSEFFEature;
        bag = bagOfFeatures(imdsTrain,'CustomExtractor',extractor, 'Verbose', true, 'VocabularySize', size)
    end
    
    feature = encode(bag,imdsTrain);
    featurestest = encode(bag,imdsTest);
    label = imdsTrain.Labels;

    model = fitcknn(feature, label,'OptimizeHyperparameters','auto', 'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName','expected-improvement-plus'))
end