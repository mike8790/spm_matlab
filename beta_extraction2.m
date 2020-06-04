beta_ROI1 = niftiread('/MRIWork/MRIWork06/nr/michael_longley/canCAM_first_analysis/conn_project_cC_first_analysis/results/secondlevel/S2V_corrBi_frontalROI2/AllSubjects/rest/AP_frontal_ROI2.cluster001(1).AP_frontal_ROI2.ROI1/beta_0001.nii');
beta_ROI2 = niftiread('/MRIWork/MRIWork06/nr/michael_longley/canCAM_first_analysis/conn_project_cC_first_analysis/results/secondlevel/S2V_corrBi_frontalROI2/AllSubjects/rest/AP_frontal_ROI2.cluster001(0).AP_frontal_ROI2.ROI2/beta_0001.nii');
beta_ROI3 = niftiread('/MRIWork/MRIWork06/nr/michael_longley/canCAM_first_analysis/conn_project_cC_first_analysis/results/secondlevel/S2V_corrBi_frontalROI2/AllSubjects/rest/AP_frontal_ROI2.cluster001(0).AP_frontal_ROI2.ROI3/beta_0001.nii');
beta_ROI4 = niftiread('/MRIWork/MRIWork06/nr/michael_longley/canCAM_first_analysis/conn_project_cC_first_analysis/results/secondlevel/S2V_corrBi_frontalROI2/AllSubjects/rest/AP_frontal_ROI2.cluster001(0).AP_frontal_ROI2.ROI4/beta_0001.nii');
beta_ROI5 = niftiread('/MRIWork/MRIWork06/nr/michael_longley/canCAM_first_analysis/conn_project_cC_first_analysis/results/secondlevel/S2V_corrBi_frontalROI2/AllSubjects/rest/AP_frontal_ROI2.cluster001(0).AP_frontal_ROI2.ROI5/beta_0001.nii');
beta_ROI6 = niftiread('/MRIWork/MRIWork06/nr/michael_longley/canCAM_first_analysis/conn_project_cC_first_analysis/results/secondlevel/S2V_corrBi_frontalROI2/AllSubjects/rest/AP_frontal_ROI2.cluster001(0).AP_frontal_ROI2.ROI6/beta_0001.nii');


beta_ROI1_all = reshape(beta_ROI1,1,902629);
beta_ROI2_all = reshape(beta_ROI2,1,902629);
beta_ROI3_all = reshape(beta_ROI3,1,902629);
beta_ROI4_all = reshape(beta_ROI4,1,902629);
beta_ROI5_all = reshape(beta_ROI5,1,902629);
beta_ROI6_all = reshape(beta_ROI6,1,902629);

beta_all_ROI = [beta_ROI1_all;beta_ROI2_all;beta_ROI3_all;beta_ROI4_all;beta_ROI5_all;beta_ROI6_all];
  
