% List of open inputs
% Run Dartel (create Templates): Images - cfg_files
% Run Dartel (create Templates): Images - cfg_files


cd '/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/anat/'
rc1_list = importdata('rc1list.txt');
rc2_list = importdata('rc2list.txt');

rc1_list = rc1_list.';
rc1_list = cellstr(rc1_list);
rc2_list = rc2_list.';
rc2_list = cellstr(rc2_list);

nrun = 1; % enter the number of runs here
% images = 3;
jobfile = {'/MRIWork/MRIWork06/nr/michael_longley/10_sub_preproc_test/dartel_template_base_batch_complete_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);
for crun = 1:nrun
    inputs{1,crun} = rc1_list(:); % Run Dartel (create Templates): Images - cfg_files
    inputs{2,crun} = rc2_list(:); % Run Dartel (create Templates): Images - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
