function array = coordCreation(train, correctPredictions, imdsTest, test, y_predict)

T=train;
Ttest= test;
labeltest = imdsTest.Labels;
yhat= y_predict;
x_position = Ttest.x_position;
y_position = Ttest.y_position;
array = [];
s=0;

for i=1: size(correctPredictions)
if correctPredictions(i) == 0
s=s+1;
array(s,1) = i;
array(s,2) = labeltest(i);
array(s,3) = yhat(i);
array(s,4) = abs(labeltest(i)-yhat(i));
array(s,5) = x_position(i);
array(s,6) = y_position(i);
end
end
difference = table(array);
difference = array2table(array,'VariableNames',{'Index','CorrectLabel','PredictLabel', 'Difference', 'x_position', 'y_position'});



x_prima=[]
y_prima=[]
s=0
for i=1: size(T.class)
    if T.class(i) == 1
        s=s+1;
        x_prima(s,1) = T.x_position(i);
        y_prima(s,1) = T.y_position(i);
    end
end
x_seconda=[]
y_seconda=[]
s=0
for i=1: size(T.class)
    if T.class(i) == 2
        s=s+1;
        x_seconda(s,1) = T.x_position(i);
        y_seconda(s,1) = T.y_position(i);
    end
end
x_terza=[]
y_terza=[]
s=0
for i=1: size(T.class)
    if T.class(i) == 3
        s=s+1;
        x_terza(s,1) = T.x_position(i);
        y_terza(s,1) = T.y_position(i);
    end
end
x_quarta=[]
y_quarta=[]
s=0
for i=1: size(T.class)
    if T.class(i) == 4
        s=s+1;
        x_quarta(s,1) = T.x_position(i);
        y_quarta(s,1) = T.y_position(i);
    end
end
x_quinta=[]
y_quinta=[]
s=0
for i=1: size(T.class)
    if T.class(i) == 5
        s=s+1;
        x_quinta(s,1) = T.x_position(i);
        y_quinta(s,1) = T.y_position(i);
    end
end
x_sesta=[]
y_sesta=[]
s=0
for i=1: size(T.class)
    if T.class(i) == 6
        s=s+1;
        x_sesta(s,1) = T.x_position(i);
        y_sesta(s,1) = T.y_position(i);
    end
end
x_settima=[]
y_settima=[]
s=0
for i=1: size(T.class)
    if T.class(i) == 7
        s=s+1;
        x_settima(s,1) = T.x_position(i);
        y_settima(s,1) = T.y_position(i);
    end
end
x_ottava=[]
y_ottava=[]
s=0
for i=1: size(T.class)
    if T.class(i) == 8
        s=s+1;
        x_ottava(s,1) = T.x_position(i);
        y_ottava(s,1) = T.y_position(i);
    end
end
x_nona=[]
y_nona=[]
s=0
for i=1: size(T.class)
    if T.class(i) == 9
        s=s+1;
        x_nona(s,1) = T.x_position(i);
        y_nona(s,1) = T.y_position(i);
    end
end
x_decima=[]
y_decima=[]
s=0
for i=1: size(T.class)
    if T.class(i) == 10
        s=s+1;
        x_decima(s,1) = T.x_position(i);
        y_decima(s,1) = T.y_position(i);
    end
end

x_undicesima=[]
y_undicesima=[]
s=0
for i=1: size(T.class)
    if T.class(i) == 11
        s=s+1;
        x_undicesima(s,1) = T.x_position(i);
        y_undicesima(s,1) = T.y_position(i);
    end
end
x_dodicesima=[]
y_dodicesima=[]
s=0
for i=1: size(T.class)
    if T.class(i) == 12
        s=s+1;
        x_dodicesima(s,1) = T.x_position(i);
        y_dodicesima(s,1) = T.y_position(i);
    end
end
x_tredicesima=[]
y_tredicesima=[]
s=0
for i=1: size(T.class)
    if T.class(i) == 13
        s=s+1;
        x_tredicesima(s,1) = T.x_position(i);
        y_tredicesima(s,1) = T.y_position(i);
    end
end
x_quattordicesima=[]
y_quattordicesima=[]
s=0
for i=1: size(T.class)
    if T.class(i) == 14
        s=s+1;
        x_quattordicesima(s,1) = T.x_position(i);
        y_quattordicesima(s,1) = T.y_position(i);
    end
end
x_quindicesima=[]
y_quindicesima=[]
s=0
for i=1: size(T.class)
    if T.class(i) == 15
        s=s+1;
        x_quindicesima(s,1) = T.x_position(i);
        y_quindicesima(s,1) = T.y_position(i);
    end
end
x_sedicesima=[]
y_sedicesima=[]
s=0
for i=1: size(T.class)
    if T.class(i) == 16
        s=s+1;
        x_sedicesima(s,1) = T.x_position(i);
        y_sedicesima(s,1) = T.y_position(i);
    end
end



figure()
scatter(x_prima, y_prima, 'MarkerEdgeColor',[0 .20 .20], 'MarkerEdgeAlpha', 1)
hold on
scatter(x_seconda, y_seconda, 'MarkerEdgeColor',[0 .40 .40], 'MarkerEdgeAlpha', 1)
scatter(x_terza, y_terza, 'MarkerEdgeColor',[0 .60 .60], 'MarkerEdgeAlpha', 1)
scatter(x_quarta, y_quarta, 'MarkerEdgeColor',[0 .80 .80], 'MarkerEdgeAlpha', 1)
scatter(x_quinta, y_quinta, 'MarkerEdgeColor',[0 0.4 0.6], 'MarkerEdgeAlpha', 1)
scatter(x_sesta, y_sesta, 'MarkerEdgeColor',[1 0.6 0.6], 'MarkerEdgeAlpha', 1)
scatter(x_settima, y_settima, 'MarkerEdgeColor',[1 1 0.6], 'MarkerEdgeAlpha', 1)
scatter(x_ottava, y_ottava, 'MarkerEdgeColor',[1 0.4 1], 'MarkerEdgeAlpha', 1)
scatter(x_nona, y_nona, 'MarkerEdgeColor',[0 0.2 1], 'MarkerEdgeAlpha', 1)
scatter(x_decima, y_decima, 'MarkerEdgeColor',[0.7 1 0], 'MarkerEdgeAlpha', 1)
scatter(x_undicesima, y_undicesima, 'MarkerEdgeColor',[0.5 0.5 0], 'MarkerEdgeAlpha', 1)
scatter(x_dodicesima, y_dodicesima, 'MarkerEdgeColor',[1 1 0.6], 'MarkerEdgeAlpha', 1)
scatter(x_tredicesima, y_tredicesima, 'MarkerEdgeColor',[0.3 0.1 0.1], 'MarkerEdgeAlpha', 1)
scatter(x_quattordicesima, y_quattordicesima, 'MarkerEdgeColor',[0.4 0.9 0.2], 'MarkerEdgeAlpha', 1)
scatter(x_quindicesima, y_quindicesima, 'MarkerEdgeColor',[0.2 0.6 0.3], 'MarkerEdgeAlpha', 1)
scatter(x_sedicesima, y_sedicesima, 'MarkerEdgeColor',[0.3 0.9 0.1], 'MarkerEdgeAlpha', 1)
hold off
alpha(1)
%hold on
%scatter(difference.x_position, difference.y_position, 'MarkerEdgeColor',[1 0 0])
