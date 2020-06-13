function [Exp,sampleNames,normIdx]=qPCRreader(filename,normby,sampleMatrix,controlMatrix)

% This function will read the output CSV files from the qPCR that are the
% 'QuantificationCqResults'. It will output the raw values for the
% technical replicates. Biological replicates should be compiled with the
% qPCRbioreps.m function.

% INPUTS    - filename:        Data file that is csv formatted
%           - normby:          Sample you want to normalize by, normally
%                               use wildtype expression
%           - sampleMatrix:    Well positions of samples, you should have
%                               technical replicates as strings in different
%                               columns and different samples as a new row
%           - controlMatrix:   Same as sampleMatrix, but just specifying
%                               the technical replicate wells for controls
%
% Note: You MUST import the matrices for your wells as cells {}, otherwise
% it will not run properly!

% SAMPLE CALL:
%
% sampleMatrix={'F01','G01','H01';'F02','G02','H02'};
% controlMatrix={'C01','D01','E01';'C02','D02','E02'};
% normby='BW';
% filename='samplefile.csv';
% NormExp=qPCRreader(filename,normby,sampleMatrix,controlMatrix);

% Created by: A.M. Langevin, 11/1/2017

warning('OFF', 'MATLAB:table:ModifiedAndSavedVarnames')

fileExt=readtable(filename);

wells=table2array(fileExt(:,2));
rawCq=table2array(fileExt(:,8));
names=table2array(fileExt(:,6));

dimSamps=size(sampleMatrix);
dimCtrls=size(controlMatrix);

sampleCq=zeros(dimSamps);
controlCq=zeros(dimCtrls);
sampleNames={};

for i=1:dimSamps(1)
    for j=1:dimSamps(2)
        wellcell=sampleMatrix(i,j);
        idx=find(contains(wells,wellcell));
        sampleCq(i,j)=rawCq(idx);
    end
    sampleNames(i)=names(idx);
end

for i=1:dimCtrls(1)
    for j=1:dimCtrls(2)
        wellcell=controlMatrix(i,j);
        idx=find(contains(wells,wellcell));
        controlCq(i,j)=rawCq(idx);
    end
end

normIdx=find(contains(sampleNames,normby));

dCq=nanmean(sampleCq')-nanmean(controlCq');

Exp=2.^(-dCq);






