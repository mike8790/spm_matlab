% List of open inputs
% Calculate VDM: Phase Image - cfg_files
% Calculate VDM: Magnitude Image - cfg_files
% Calculate VDM: Select EPI to Unwarp - cfg_files
% Realign & Unwarp: Images - cfg_files
% Coregister: Estimate: Source Image - cfg_files
% Segment: Volumes - cfg_files
clear all
subject_number = 'sub-CC110033'
% set path
addpath /home/ugjt015/spm12
cd ('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/fmap_rest/')
phase_subj = strcat(subject_number, '_fmap.nii');
phase = fullfile(pwd, subject_number, 'fmap', phase_subj);
mag_subj = strcat(subject_number, '_run-01_fmap.nii');
mag = fullfile(pwd, subject_number, 'fmap', mag_subj);
cd ('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/anat/')
T1w_subj = strcat(subject_number, '_T1w.nii');
T1w = fullfile(pwd, subject_number, 'anat', T1w_subj);
cd ('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/epi_rest/')
epi_subj = strcat(subject_number, '_epi_rest.nii');
epi = fullfile(pwd, subject_number, 'epi_rest', epi_subj); 
clear *_subj
nrun = 1; % enter the number of runs here
jobfile = {'/MRIWork/MRIWork06/nr/michael_longley/10_sub_preproc_test/vdm_segment_base_batch_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(6, nrun);
for crun = 1:nrun
    inputs{1} = phase; % Calculate VDM: Phase Image - cfg_files
    inputs{2} = mag; % Calculate VDM: Magnitude Image - cfg_files
    inputs{3} = epi; % Calculate VDM: Select EPI to Unwarp - cfg_files
    inputs{4} = epi; % Realign & Unwarp: Images - cfg_files
    inputs{5} = T1w; % Coregister: Estimate: Source Image - cfg_files
    inputs{6} = T1w; % Segment: Volumes - cfg_files
end
% spm('defaults', 'FMRI');
% spm_jobman('run', jobs, inputs{:})