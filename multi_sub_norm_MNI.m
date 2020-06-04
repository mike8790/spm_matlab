% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'/MRIWork/MRIWork06/nr/michael_longley/field_maps_test/multisub_SPM_dartel/multi_sub_norm_MNI_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
