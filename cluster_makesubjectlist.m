cd ('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/epi_rest')

subject_number = importdata('participants.tsv');
subject_number = (subject_number.textdata(11:15,1));
subject_number = subject_number.';

cd('/MRIWork/MRIWork06/nr/michael_longley/10_sub_preproc_test')
%writecell(subject_number, 'subject_number.dat')
writecell(subject_number, 'subject_number.txt');