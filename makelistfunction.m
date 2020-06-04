cd '/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/epi_rest'

subjlist = importdata('participants.tsv');
subjlist = (subjlist.textdata(2:end,1));

subj = 10;
rc1 = cell(1, subj);

for i = 1:length(rc1)
    rc1{i} = test{2,i}
end




