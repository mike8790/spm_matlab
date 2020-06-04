function cluster_dartel_template_batch(subject_number);

    disp('inside the main matlab function');
    disp('Processing Subject');
    disp(subject_number);
    
% set path
addpath /usr/local/apps/psycapps/spm/spm12-r7487

cd '/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/anat/'
rc1_list = importdata('rc1list.txt');
rc2_list = importdata('rc2list.txt');
rc3_list = importdata('rc3list.txt');

rc1_list = rc1_list.';
rc1_list = cellstr(rc1_list);
rc2_list = rc2_list.';
rc2_list = cellstr(rc2_list);
rc3_list = rc3_list.';
rc3_list = cellstr(rc3_list);

jobs = repmat(jobfile, 1, 1);
inputs = cell(3, 1);

% images = 3;
jobfile = {'/MRIWork/MRIWork06/nr/michael_longley/10_sub_preproc_test/dartel_template_base_batch_complete_job.m'};

    inputs{1,1} = rc1_list(:); % Run Dartel (create Templates): Images - cfg_files
    inputs{2,1} = rc2_list(:); % Run Dartel (create Templates): Images - cfg_files
    inputs{3,1} = rc3_list(:); % Run Dartel (create Templates): Images - cfg_files

spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
