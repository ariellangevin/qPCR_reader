function []=qPCRbioreps(DataSets,target,names,normIdx)

% This function will take in data for different biological replicates and
% output plots of expresison (of mean and std if they are biological
% replicates.

% INPUTS    - DataSets:       Matrix of data sets for biological reps
%           - target:         Gene you were working to target in qPCR
%                               experiment, CASE matters
%           - names:          What the sample names are for plotting
%           - normIdx:        Which sample to normalize by

% See example of a sample call in SampleRun_qPCRreader.m

% Created by A.M. Langevin, 11/1/2017

dim=size(DataSets);

titlename=[target,' Knockdown'];
yname=['\Delta Cq Expression of ', target];
x = 1:length(names); 

if dim(1)==1
    
    NormData=DataSets/DataSets(normIdx);
    
    figure
    bar(x,NormData)
    title(titlename)
    ylabel(yname)
    set(gca,'XTick', x,'xticklabel',names)
    set(gca,'FontSize',14)
    axis([min(x)-0.5 max(x)+0.5 0 1.1])
    box on
    
    
else
    
    meanData=nanmean(DataSets);
    stdData=nanstd(DataSets);
    
    NormData=meanData/meanData(normIdx);
    stdNormData=stdData/meanData(normIdx);
    
    figure
    hold on
    bar(x,NormData)
    errorbar(x,NormData,stdNormData,'.')
    title(titlename)
    ylabel(yname)
    axis([min(x)-0.5 max(x)+0.5 0 1.1])
    set(gca,'XTick', x,'xticklabel',names)
    set(gca,'FontSize',14)
    box on
    
end

