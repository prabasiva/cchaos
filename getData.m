function [index,year]= getData(flag)
if flag == 1
    dat=readtable('/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program/fspcom.dat');
    [maxx,maxy]=size(dat);
    index=table2array(dat(1:maxx,5));
    year=(table2array(dat(1:maxx,2)));
    month=(table2array(dat(1:maxx,3)));
    index=log(index);
    year=year+month/12;
else
    dat=csvread('/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program/nasdaq_mat.csv');
    year=dat(:,1);
    month=dat(:,2);
    index=dat(:,3);
    index=log(index);
    year=year+month/12;
end
