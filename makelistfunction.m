cd '/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/epi_rest'

subjlist = importdata('participants.tsv');
subjlist = (subjlist.textdata(2:end,1));

for i = 1:length(subjlist)
   T1wlist = fullfile(pwd, subjlist, 'anat/', subjlist, '_T1w.nii');
   epilist = fullfile(pwd, subjlist, 'epi_rest/', subjlist, 'epi_rest.nii.gz'); 
   phaselist = 
   maglist = 
end

%%
subj = 10;
test = dir('**/rc1sub*');
test = struct2cell(test);
rc1 = cell(1, subj);

for i = 1:length(rc1)
    rc1{i} = test{2,i}
end




