function [train, test, imdsTrain, imdsTest] = createImds(rootPath)
%%rootpath: path della cartella di root del dataset egocart 
    cd(rootPath)
    cd train_set
    ds = tabularTextDatastore('train_set.txt')
    train = readall(ds);
    file = train.fileRGB;
    label= train.class;

    cd train_RGB

    imdsTrain = imageDatastore(file);

    imdsTrain.Labels= label;
    imdsTrain.countEachLabel;
    cd ..
    cd ..

    cd test_set
    dstest = tabularTextDatastore('test_set.txt')
    test = readall(dstest);
    filetest = test.fileRGB;
    labeltest = test.class;

    cd test_RGB

    imdsTest = imageDatastore(filetest);

    imdsTest.Labels= labeltest;
    imdsTest.countEachLabel;

    cd ..
    cd ..
end