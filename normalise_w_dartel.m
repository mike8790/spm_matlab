% List of open inputs
% Normalise to MNI Space: Flow Field - cfg_files
% Normalise to MNI Space: Images - cfg_files
% Normalise to MNI Space: Flow Field - cfg_files
% Normalise to MNI Space: Images - cfg_files
% Normalise to MNI Space: Flow Field - cfg_files
% Normalise to MNI Space: Images - cfg_files

cd '/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/anat/'
c1_list = importdata('c1list.txt');
c2_list = importdata('c2list.txt');
flowfield = importdata('flowfield.txt');
template = importdata('template.txt'); %as this is only one file, could probably access directly but for consistency import the path via a .txt file 

cd '/MRIWork/MRIWork06/nr/michael_longley/CanCAM/raw_data/epi_rest/'
epi = importdata('epiunwarped.txt'); % this is a list of the unwarped(u*) epi files which have by this point been both unwarped and coreg with T1w

nrun = 10; % enter the number of runs here
jobfile = {'/MRIWork/MRIWork06/nr/michael_longley/10_sub_preproc_test/normalise_w_dartel_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(6, nrun);
for crun = 1:nrun
    inputs{1, crun} = flowfield(crun); % Normalise to MNI Space: Flow Field - cfg_files
    inputs{2, crun} = c1_list(crun); % Normalise to MNI Space: Images - cfg_files
    inputs{3, crun} = flowfield(crun); % Normalise to MNI Space: Flow Field - cfg_files
    inputs{4, crun} = c2_list(crun); % Normalise to MNI Space: Images - cfg_files
    inputs{5, crun} = flowfield(crun); % Normalise to MNI Space: Flow Field - cfg_files
    inputs{6, crun} = epi(crun); % Normalise to MNI Space: Images - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
