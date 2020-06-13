% Test qPCR reader

% Created by A.M. Langevin, 11/1/2017

% If your biological replicates are in the same data file as your technical
% replicates, just call the file with the different wells multiple times.

% Note: You MUST import the matrices for your wells as cells {}, otherwise
% it will not run properly!

% Also note, the specification of samples is case sensitive, you will need
% to use the same case that you specified on the qPCR or you will run into
% errors.

clc, clear, close all

% Data for Biological Rep 1

filename='samplefile_QuantificationCqResults.csv';
sampleMatrix={'F01','G01','H01';'F02','G02','H02'};
controlMatrix={'C01','D01','E01';'C02','D02','E02'};
normby='BW';
targetname='acrB';

[Data1,Names1,normI]=qPCRreader(filename,normby,sampleMatrix,controlMatrix);

% Repeat for more biological replicates
% DataSets=[Data1; Data2; Data3];

DataSets=[Data1];

% Comparing & plotting biological samples

qPCRbioreps(DataSets,targetname,Names1,normI);