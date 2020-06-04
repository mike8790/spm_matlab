function cluster_vdm_segment_batch(subject_number);

    disp('inside the main matlab function');
    disp('Processing Subject');
    disp(subject_number);
    

% set path
addpath /usr/local/apps/psycapps/spm/spm12-r7487

jobfile = {'/MRIWork/MRIWork06/nr/michael_longley/10_sub_preproc_test/vdm_segment_batch_job.m'};
jobs = repmat(jobfile, 1, 1);
inputs = cell(6, 1);

% cd ('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/fmap_rest/')
phase_subj = strcat(subject_number, '_fmap.nii')
phase = strcat('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/fmap_rest/sub-', subject_number, '/fmap/sub-', phase_subj)
phase = cellstr(phase);
mag_subj = strcat(subject_number, '_run-01_fmap.nii')
mag = strcat('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/fmap_rest/sub-', subject_number, '/fmap/sub-', mag_subj)
mag = cellstr(mag);
% cd ('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/anat/')
T1w_subj = strcat(subject_number, '_T1w.nii')
T1w = strcat('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/anat/sub-', subject_number, '/anat/sub-', T1w_subj)
T1w = cellstr(T1w);
% cd ('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/epi_rest/')
epi_subj = strcat(subject_number, '_epi_rest.nii')
epi = strcat('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/epi_rest/sub-', subject_number, '/epi_rest/sub-', epi_subj) 
epi = cellstr(epi);

    inputs{1, 1} = phase; % Calculate VDM: Phase Image - cfg_files
    inputs{2, 1} = mag; % Calculate VDM: Magnitude Image - cfg_files
    inputs{3, 1} = epi; % Calculate VDM: Select EPI to Unwarp - cfg_files
    inputs{4, 1} = epi; % Realign & Unwarp: Images - cfg_files
    inputs{5, 1} = T1w; % Coregister: Estimate: Source Image - cfg_files
    inputs{6, 1} = T1w; % Segment: Volumes - cfg_files

spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});

end





% function cluster_vdm_segment_batch(subject_number);
% 
%     disp('inside the main matlab function');
%     disp('Processing Subject');
%     disp(subject_number);
    

% set path
% addpath /usr/local/apps/psycapps/spm/spm12-r7487
% 
% jobfile = {'/MRIWork/MRIWork06/nr/michael_longley/10_sub_preproc_test/vdm_segment_base_batch_job.m'};
% jobs = repmat(jobfile, 1, 1);
% inputs = cell(6, 1);
% 
% % cd ('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/fmap_rest/')
% phase_subj = strcat(subject_number, '_fmap.nii')
% phase = strcat('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/fmap_rest/sub-', subject_number, '/fmap/sub-', phase_subj)
% phase = cellstr(phase);
% mag_subj = strcat(subject_number, '_run-01_fmap.nii')
% mag = strcat('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/fmap_rest/sub-', subject_number, '/fmap/sub-', mag_subj)
% mag = cellstr(mag);
% % cd ('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/anat/')
% T1w_subj = strcat(subject_number, '_T1w.nii')
% T1w = strcat('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/anat/sub-', subject_number, '/anat/sub-', T1w_subj)
% T1w = cellstr(T1w);
% % cd ('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/epi_rest/')
% epi_subj = strcat(subject_number, '_epi_rest.nii')
% epi = strcat('/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/anat/sub-', subject_number, '/epi_rest/sub-', epi_subj) 
% epi = cellstr(epi);
% 
%     inputs{1, 1} = phase; % Calculate VDM: Phase Image - cfg_files
%     inputs{2, 1} = mag; % Calculate VDM: Magnitude Image - cfg_files
%     inputs{3, 1} = epi; % Calculate VDM: Select EPI to Unwarp - cfg_files
%     inputs{4, 1} = epi; % Realign & Unwarp: Images - cfg_files
%     inputs{5, 1} = T1w; % Coregister: Estimate: Source Image - cfg_files
%     inputs{6, 1} = T1w; % Segment: Volumes - cfg_files
% 
% spm('defaults', 'FMRI');
% spm_jobman('run', jobs, inputs{:});

% end
