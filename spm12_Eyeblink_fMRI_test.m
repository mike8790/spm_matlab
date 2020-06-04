function makeSPMdesignmatrix_nr_switch(ons_somat)
% Template batch script for SPM5
% N.Ramnani, December 2013
% 
% Originally by N.Ramnani, 18th November 2004.
% Generates spm models for multiple subjects, estimates them and sets
% contrasts
%===========================================================================
% Load user-specified variables
%---------------------------------------------------------------------------
    clear all;
    cwd =  '/MRIWork/MRIWork06/nr/michael_longley/eyeblink_fmri_1/';
    cd(cwd); 
    addpath /usr/local/apps/psycapps/spm/spm12-r7487;
    addpath /MRIWork/MRIWork06/nr/michael_longley/eyeblink_fmri_1/;
    
    spm('defaults','FMRI')
    spm_defaults;
    %defaults.analyze.flip     = 1; % <<= Very important.  Relates to L/R
    defaults.stats.maxmem   = 2^38;
    cwd =  '/MRIWork/MRIWork06/nr/michael_longley/eyeblink_fmri_1/';
    cd(cwd);
    
    % Load timing information for different conditions
    load /MRIWork/MRIWork06/nr/michael_longley/eyeblink_fmri_1/EBC1005/EBC1005_trialtiming_100320.mat;
    load /MRIWork/MRIWork06/nr/michael_longley/eyeblink_fmri_1/EBC1006/analyses_EBC1006/EBC1006_trialtiming_120320.mat;
    load /MRIWork/MRIWork06/nr/michael_longley/eyeblink_fmri_1/EBC1007/analyses_EBC1007/EBC1007_trialtiming_120320.mat;
    load /MRIWork/MRIWork06/nr/michael_longley/eyeblink_fmri_1/EBC1008/analyses_EBC1008/EBC1008_trialtiming_120320.mat;

%==========================================================================
% Specify design
    
    %===========================================================================
    % number of scans and session, e.g. [128 128 128] for 3 sessions
    %---------------------------------------------------------------------------
   
    SPM.nscan       =   [724 1170 1170 1170];    
    %Add in other subjects above...

    % basis functions and timing parameters
    %---------------------------------------------------------------------------
    % OPTIONS:'hrf'
    %         'hrf (with time derivative)'
    %         'hrf (with time and dispersion derivatives)'
    %         'Fourier set'
    %         'Fourier set (Hanning)'
    %         'Gamma functions'
    %         'Finite Impulse Response'
    %---------------------------------------------------------------------------
    SPM.xBF.name       = 'hrf';
    SPM.xBF.length     = 32;                % length in seconds
    SPM.xBF.order      = 1;                 % order of basis set				
    SPM.xBF.T          = 16;                % number of time bins per scan (leave it as it is)
    SPM.xBF.T0         = 1;                 % first time bin (see slice timing, leave it as it is)
    SPM.xBF.UNITS      = 'secs';            % OPTIONS: 'scans'|'secs' for onsets
    SPM.xBF.Volterra   = 1;                 % OPTIONS: 1|2 = order of convolution; 2 creates regressors by multiplying the original one

    
    % Trial specification: Onsets, duration (UNITS) and parameters for modulation
    %---------------------------------------------------------------------------
     %for session 1    
%      param_x=[1:(1180*2)];
%      param=exp(0.0001*-param_x);
%      param_norm=param*(max(param)-min(param));
     

     
        SPM.Sess(1).U(1).name      = {'EBC1005_1_CSpP_CR'};
        SPM.Sess(1).U(1).ons       = EBC1005_1_CSpP_CR;
        SPM.Sess(1).U(1).dur       = 0;
       SPM.Sess(1).U(1).P(1).name = 'none';    % 'none', 'time' or 'other'
%         SPM.Sess(1).U(1).P(1).P    = param_norm(round(SPM.Sess(1).U(1).ons(:))) % comment out if 'none' above
%         SPM.Sess(1).U(1). P(1).h   = 1;   % comment out if 'none' above
        
        SPM.Sess(1).U(2).name      = {'EBC1005_2_CSpP_noCR'};
        SPM.Sess(1).U(2).ons       = EBC1005_2_CSpP_noCR;
        SPM.Sess(1).U(2).dur       = 0;
       SPM.Sess(1).U(2).P(1).name = 'none';    % 'none', 'time' or 'other'
%         SPM.Sess(1).U(2).P(1).P    =  param_norm(round(SPM.Sess(1).U(2).ons(:))); % comment out if 'none' above
%         SPM.Sess(1).U(2). P(1).h   = 1;   % comment out if 'none' above
  
        SPM.Sess(1).U(3).name      = {'EBC1005_3_CSpUP_CR'};
        SPM.Sess(1).U(3).ons       = EBC1005_3_CSpUP_CR;
        SPM.Sess(1).U(3).dur       = 0;
         SPM.Sess(1).U(3).P(1).name = 'none';    % 'none', 'time' or 'other'
%         SPM.Sess(1).U(3).P(1).P    =  param_norm(round(SPM.Sess(1).U(3).ons(:))); % comment out if 'none' above
%         SPM.Sess(1).U(3). P(1).h   = 1;   % comment out if 'none' above
        
        SPM.Sess(1).U(4).name      = {'EBC1005_4_CSpUP_noCR'};
        SPM.Sess(1).U(4).ons       = EBC1005_4_CSpUP_noCR;
        SPM.Sess(1).U(4).dur       = 0;
         SPM.Sess(1).U(4).P(1).name = 'none';    % 'none', 'time' or 'other'
%         SPM.Sess(1).U(4).P(1).P    =  param_norm(round(SPM.Sess(1).U(4).ons(:))); % comment out if 'none' above
%         SPM.Sess(1).U(4). P(1).h   = 1;   % comment out if 'none' above

        SPM.Sess(1).U(5).name      = {'EBC1005_5_CSm_CR'};
        SPM.Sess(1).U(5).ons       = EBC1005_5_CSm_CR;
        SPM.Sess(1).U(5).dur       = 0;
         SPM.Sess(1).U(5).P(1).name = 'none';    % 'none', 'time' or 'other'
        %SPM.Sess(1).U(5).P(1).P    =  SPM.Sess(1).U(2).ons; % comment out if 'none' above
        %SPM.Sess(1).U(5). P(1).h   = 2;   % comment out if 'none' above
        
        SPM.Sess(1).U(6).name      = {'EBC1005_6_CSm_noCR'};
        SPM.Sess(1).U(6).ons       = EBC1005_6_CSm_noCR;
        SPM.Sess(1).U(6).dur       = 0;
        SPM.Sess(1).U(6).P(1).name = 'none';    % 'none', 'time' or 'other'
        %SPM.Sess(1).U(6).P(1).P    =  SPM.Sess(1).U(2).ons; % comment out if 'none' above
        %SPM.Sess(1).U(6). P(1).h   = 2;   % comment out if 'none' above
  
        SPM.Sess(1).U(7).name      = {'EBC1005_7_Junk'};
        SPM.Sess(1).U(7).ons       = EBC1005_7_Junk;
        SPM.Sess(1).U(7).dur       = 0;
        SPM.Sess(1).U(7).P(1).name = 'none';    % 'none', 'time' or 'other'
        %SPM.Sess(1).U(7).P(1).P    =  SPM.Sess(1).U(2).ons; % comment out if 'none' above
        %SPM.Sess(1).U(7). P(1).h   = 2;   % comment out if 'none' above
        
        SPM.Sess(1).U(8).name      = {'EBC1005_8_Beep'};
        SPM.Sess(1).U(8).ons       = EBC1005_8_Beep;
        SPM.Sess(1).U(8).dur       = 14;
        SPM.Sess(1).U(8).P(1).name = 'none';    % 'none', 'time' or 'other'
        %SPM.Sess(1).U(7).P(1).P    =  SPM.Sess(1).U(2).ons; % comment out if 'none' above
        %SPM.Sess(1).U(7). P(1).h   = 2;   % comment out if 'none' above
               
%       Replicate across subjects
     SPM.Sess(2)=SPM.Sess(1)
     SPM.Sess(3)=SPM.Sess(1)
     SPM.Sess(4)=SPM.Sess(1)
% %     SPM.Sess(5)=SPM.Sess(1)
% %     SPM.Sess(6)=SPM.Sess(1)
% %     SPM.Sess(7)=SPM.Sess(1)
% %     SPM.Sess(8)=SPM.Sess(1)
% %     SPM.Sess(9)=SPM.Sess(1)
% %     SPM.Sess(10)=SPM.Sess(1)
% %     SPM.Sess(11)=SPM.Sess(1)
% %     SPM.Sess(12)=SPM.Sess(1)
% %     SPM.Sess(13)=SPM.Sess(1)
% %     SPM.Sess(14)=SPM.Sess(1)
% %     SPM.Sess(15)=SPM.Sess(1)
    
% Change timings for different subjects

         SPM.Sess(2).U(1).ons       = EBC1006_1_CSpP_CR; 
         SPM.Sess(2).U(2).ons       = EBC1006_2_CSpP_noCR;
         SPM.Sess(2).U(3).ons       = EBC1006_3_CSpUP_CR;
         SPM.Sess(2).U(4).ons       = EBC1006_4_CSpUP_noCR;
         SPM.Sess(2).U(5).ons       = EBC1006_5_CSm_CR;
         SPM.Sess(2).U(6).ons       = EBC1006_6_CSm_noCR;
         SPM.Sess(2).U(7).ons       = EBC1006_7_Junk;
         SPM.Sess(2).U(8).ons       = EBC1006_8_Beep;
                  
         SPM.Sess(3).U(1).ons       = EBC1007_1_CSpP_CR; 
         SPM.Sess(3).U(2).ons       = EBC1007_2_CSpP_noCR;
         SPM.Sess(3).U(3).ons       = EBC1007_3_CSpUP_CR;
         SPM.Sess(3).U(4).ons       = EBC1007_4_CSpUP_noCR;
         SPM.Sess(3).U(5).ons       = EBC1007_5_CSm_CR;
         SPM.Sess(3).U(6).ons       = EBC1007_6_CSm_noCR;
         SPM.Sess(3).U(7).ons       = EBC1007_7_Junk;
         SPM.Sess(3).U(8).ons       = EBC1007_8_Beep;
         
         SPM.Sess(4).U(1).ons       = EBC1008_1_CSpP_CR; 
         SPM.Sess(4).U(2).ons       = EBC1008_2_CSpP_noCR;
         SPM.Sess(4).U(3).ons       = EBC1008_3_CSpUP_CR;
         SPM.Sess(4).U(4).ons       = EBC1008_4_CSpUP_noCR;
         SPM.Sess(4).U(5).ons       = EBC1008_5_CSm_CR;
         SPM.Sess(4).U(6).ons       = EBC1008_6_CSm_noCR;
         SPM.Sess(4).U(7).ons       = EBC1008_7_Junk;
         SPM.Sess(4).U(8).ons       = EBC1008_8_Beep;
%         
%         SPM.Sess(3).U(1).ons       = ep_cue_fra_true; 
%         SPM.Sess(3).U(2).ons       = ep_cue_frb_true;
%         SPM.Sess(3).U(3).ons       = ep_cue_pr_true;
%         SPM.Sess(3).U(4).ons       = ep_cue_ctr_true;
%         SPM.Sess(3).U(5).ons       = ep_cue_fra_false;
%         SPM.Sess(3).U(6).ons       = ep_go;
%         SPM.Sess(3).U(7).ons       = ep_feed;
%         SPM.Sess(3).U(8).ons       = ep_cal_ons;
%         SPM.Sess(3).U(8).dur       = ep_cal_dur;
%         SPM.Sess(3).U(9).ons       = ep_error_message;
% 
%         
%         SPM.Sess(4).U(1).ons       = fp_cue_fra_true; 
%         SPM.Sess(4).U(2).ons       = fp_cue_frb_true;
%         SPM.Sess(4).U(3).ons       = fp_cue_pr_true;
%         SPM.Sess(4).U(4).ons       = fp_cue_ctr_true;
%         SPM.Sess(4).U(5).ons       = fp_cue_fra_false;
%         SPM.Sess(4).U(6).ons       = fp_go;
%         SPM.Sess(4).U(7).ons       = fp_feed;
%         SPM.Sess(4).U(8).ons       = fp_cal_ons;
%         SPM.Sess(4).U(8).dur       = fp_cal_dur;
%         SPM.Sess(4).U(9).ons       = fp_error_message;
% 
%         
%         SPM.Sess(5).U(1).ons       = hm_cue_fra_true; 
%         SPM.Sess(5).U(2).ons       = hm_cue_frb_true;
%         SPM.Sess(5).U(3).ons       = hm_cue_pr_true;
%         SPM.Sess(5).U(4).ons       = hm_cue_ctr_true;
%         SPM.Sess(5).U(5).ons       = hm_cue_fra_false;
%         SPM.Sess(5).U(6).ons       = hm_go;
%         SPM.Sess(5).U(7).ons       = hm_feed;
%         SPM.Sess(5).U(8).ons       = hm_cal_ons;
%         SPM.Sess(5).U(8).dur       = hm_cal_dur;
%         SPM.Sess(5).U(9).ons       = hm_error_message;
% 
%         
%         SPM.Sess(6).U(1).ons       = jh_cue_fra_true; 
%         SPM.Sess(6).U(2).ons       = jh_cue_frb_true;
%         SPM.Sess(6).U(3).ons       = jh_cue_pr_true;
%         SPM.Sess(6).U(4).ons       = jh_cue_ctr_true;
%         SPM.Sess(6).U(5).ons       = jh_cue_fra_false;
%         SPM.Sess(6).U(6).ons       = jh_go;
%         SPM.Sess(6).U(7).ons       = jh_feed;
%         SPM.Sess(6).U(8).ons       = jh_cal_ons;
%         SPM.Sess(6).U(8).dur       = jh_cal_dur;
%         SPM.Sess(6).U(9).ons       = jh_error_message;
% 
%         
%         SPM.Sess(7).U(1).ons       = jp_cue_fra_true; 
%         SPM.Sess(7).U(2).ons       = jp_cue_frb_true;
%         SPM.Sess(7).U(3).ons       = jp_cue_pr_true;
%         SPM.Sess(7).U(4).ons       = jp_cue_ctr_true;
%         SPM.Sess(7).U(5).ons       = jp_cue_fra_false;
%         SPM.Sess(7).U(6).ons       = jp_go;
%         SPM.Sess(7).U(7).ons       = jp_feed;
%         SPM.Sess(7).U(8).ons       = jp_cal_ons;
%         SPM.Sess(7).U(8).dur       = jp_cal_dur;
%         SPM.Sess(7).U(9).ons       = jp_error_message;
% 
%         
%         SPM.Sess(8).U(1).ons       = lt_cue_fra_true; 
%         SPM.Sess(8).U(2).ons       = lt_cue_frb_true;
%         SPM.Sess(8).U(3).ons       = lt_cue_pr_true;
%         SPM.Sess(8).U(4).ons       = lt_cue_ctr_true;
%         SPM.Sess(8).U(5).ons       = lt_cue_fra_false;
%         SPM.Sess(8).U(6).ons       = lt_go;
%         SPM.Sess(8).U(7).ons       = lt_feed;
%         SPM.Sess(8).U(8).ons       = lt_cal_ons;
%         SPM.Sess(8).U(8).dur       = lt_cal_dur;
%         SPM.Sess(8).U(9).ons       = lt_error_message;
% 
%         
%         SPM.Sess(9).U(1).ons       = mj_cue_fra_true; 
%         SPM.Sess(9).U(2).ons       = mj_cue_frb_true;
%         SPM.Sess(9).U(3).ons       = mj_cue_pr_true;
%         SPM.Sess(9).U(4).ons       = mj_cue_ctr_true;
%         SPM.Sess(9).U(5).ons       = mj_cue_fra_false;
%         SPM.Sess(9).U(6).ons       = mj_go;
%         SPM.Sess(9).U(7).ons       = mj_feed;
%         SPM.Sess(9).U(8).ons       = mj_cal_ons;
%         SPM.Sess(9).U(8).dur       = mj_cal_dur;
%         SPM.Sess(9).U(9).ons       = mj_message_error;
%         
%         SPM.Sess(10).U(1).ons       = mk_cue_fra_true; 
%         SPM.Sess(10).U(2).ons       = mk_cue_frb_true;
%         SPM.Sess(10).U(3).ons       = mk_cue_pr_true;
%         SPM.Sess(10).U(4).ons       = mk_cue_ctr_true;
%         SPM.Sess(10).U(5).ons       = mk_cue_fra_false;
%         SPM.Sess(10).U(6).ons       = mk_go;
%         SPM.Sess(10).U(7).ons       = mk_feed;
%         SPM.Sess(10).U(8).ons       = mk_cal_ons;
%         SPM.Sess(10).U(8).dur       = mk_cal_dur;
%         SPM.Sess(10).U(9).ons       = mk_message_error;
%         
%         SPM.Sess(11).U(1).ons       = pr_cue_fra_true; 
%         SPM.Sess(11).U(2).ons       = pr_cue_frb_true;
%         SPM.Sess(11).U(3).ons       = pr_cue_pr_true;
%         SPM.Sess(11).U(4).ons       = pr_cue_ctr_true;
%         SPM.Sess(11).U(5).ons       = pr_cue_fra_false;
%         SPM.Sess(11).U(6).ons       = pr_go;
%         SPM.Sess(11).U(7).ons       = pr_feed;
%         SPM.Sess(11).U(8).ons       = pr_cal_ons;
%         SPM.Sess(11).U(8).dur       = pr_cal_dur;
%         SPM.Sess(11).U(9).ons       = pr_message_error;
%        
%         SPM.Sess(12).U(1).ons       = ra_cue_fra_true; 
%         SPM.Sess(12).U(2).ons       = ra_cue_frb_true;
%         SPM.Sess(12).U(3).ons       = ra_cue_pr_true;
%         SPM.Sess(12).U(4).ons       = ra_cue_ctr_true;
%         SPM.Sess(12).U(5).ons       = ra_cue_fra_false;
%         SPM.Sess(12).U(6).ons       = ra_go;
%         SPM.Sess(12).U(7).ons       = ra_feed;
%         SPM.Sess(12).U(8).ons       = ra_cal_ons;
%         SPM.Sess(12).U(8).dur       = ra_cal_dur;
%         SPM.Sess(12).U(9).ons       = ra_error_message;     
%         
%         SPM.Sess(13).U(1).ons       = sd_cue_fra_true; 
%         SPM.Sess(13).U(2).ons       = sd_cue_frb_true;
%         SPM.Sess(13).U(3).ons       = sd_cue_pr_true;
%         SPM.Sess(13).U(4).ons       = sd_cue_ctr_true;
%         SPM.Sess(13).U(5).ons       = sd_cue_fra_false;
%         SPM.Sess(13).U(6).ons       = sd_go;
%         SPM.Sess(13).U(7).ons       = sd_feed;
%         SPM.Sess(13).U(8).ons       = sd_cal_ons;
%         SPM.Sess(13).U(8).dur       = sd_cal_dur;
%         SPM.Sess(13).U(9).ons       = sd_error_message;   
% 
%         SPM.Sess(14).U(1).ons       = vm_cue_fra_true; 
%         SPM.Sess(14).U(2).ons       = vm_cue_frb_true;
%         SPM.Sess(14).U(3).ons       = vm_cue_pr_true;
%         SPM.Sess(14).U(4).ons       = vm_cue_ctr_true;
%         SPM.Sess(14).U(5).ons       = vm_cue_fra_false;
%         SPM.Sess(14).U(6).ons       = vm_go;
%         SPM.Sess(14).U(7).ons       = vm_feed;
%         SPM.Sess(14).U(8).ons       = vm_cal_ons;
%         SPM.Sess(14).U(8).dur       = vm_cal_dur;
%         SPM.Sess(14).U(9).ons       = vm_error_message;   
%         
%         SPM.Sess(15).U(1).ons       = ww_cue_fra_true; 
%         SPM.Sess(15).U(2).ons       = ww_cue_frb_true;
%         SPM.Sess(15).U(3).ons       = ww_cue_pr_true;
%         SPM.Sess(15).U(4).ons       = ww_cue_ctr_true;
%         SPM.Sess(15).U(5).ons       = ww_cue_fra_false;
%         SPM.Sess(15).U(6).ons       = ww_go;
%         SPM.Sess(15).U(7).ons       = ww_feed;
%         SPM.Sess(15).U(8).ons       = ww_cal_ons;
%         SPM.Sess(15).U(8).dur       = ww_cal_dur;
%         SPM.Sess(15).U(9).ons       = ww_error_message;
    
        % parametric
%         for s = 1:15
%         SPM.Sess(s).U(1).P(1).P    = [param_norm(round(SPM.Sess(s).U(1).ons(:)))]';
%         SPM.Sess(s).U(2).P(1).P    = [param_norm(round(SPM.Sess(s).U(2).ons(:)))]';
%         SPM.Sess(s).U(3).P(1).P    = [param_norm(round(SPM.Sess(s).U(3).ons(:)))]';
%         SPM.Sess(s).U(4).P(1).P    = [param_norm(round(SPM.Sess(s).U(4).ons(:)))]';    
%         end;
    % global normalization: OPTIONS:'Scaling'|'None'
    %---------------------------------------------------------------------------
    SPM.xGX.iGXcalc    = 'None';
    
    
    % low frequency confound: high-pass cutoff (secs) [Inf = no filtering]
    %---------------------------------------------------------------------------
    SPM.xX.K.HParam    = 128;  
    
    
    % intrinsic autocorrelations: OPTIONS: 'none'|'AR(1) + w' (do use AR
    % correction)
    %-----------------------------------------------------------------------
    SPM.xVi.form       = 'AR(1) + w';
    
    
    % specify data: matrix of filenames and TR (tell him where to get
    % smoothed files for each suject)
    %===========================================================================
 
    % manually select files
    
    %   for a = 1:length(SPM.nscan)
    %    files{a}          = spm_select
    %   end

    % prespecify file locations     

    files{1} = spm_select('ExtFPList','/MRIWork/MRIWork06/nr/michael_longley/eyeblink_fmri_1/EBC1005/data_EBC1005/EPI_EBC1005','swrf*');
    files{1} = spm_select('ExtFPList','/MRIWork/MRIWork06/nr/michael_longley/eyeblink_fmri_1/EBC1006/data_EBC1005/EPI_EBC1005','swrf*');
    files{1} = spm_select('ExtFPList','/MRIWork/MRIWork06/nr/michael_longley/eyeblink_fmri_1/EBC1007/data_EBC1005/EPI_EBC1005','swrf*');
    files{1} = spm_select('ExtFPList','/MRIWork/MRIWork06/nr/michael_longley/eyeblink_fmri_1/EBC1008/data_EBC1005/EPI_EBC1005','swrf*');

    %     files{2} = spm_select('ExtFPList','/home/elesage/georgios_eyetrack_exp/scans/em_scans','swrf*');
%     files{3} = spm_select('ExtFPList','/home/elesage/georgios_eyetrack_exp/scans/ep_scans','swrf*');
%     files{4} = spm_select('ExtFPList','/home/elesage/georgios_eyetrack_exp/scans/fp_scans','swrf*');
%     files{5} = spm_select('ExtFPList','/home/elesage/georgios_eyetrack_exp/scans/hm_scans','swrf*');
%     files{6} = spm_select('ExtFPList','/home/elesage/georgios_eyetrack_exp/scans/jh_scans','swrf*');
%     files{7} = spm_select('ExtFPList','/home/elesage/georgios_eyetrack_exp/scans/jp_scans','swrf*');
%     files{8} = spm_select('ExtFPList','/home/elesage/georgios_eyetrack_exp/scans/lt_scans','swrf*');
%     files{9} = spm_select('ExtFPList','/home/elesage/georgios_eyetrack_exp/scans/mj_scans','swrf*');
%     files{10} = spm_select('ExtFPList','/home/elesage/georgios_eyetrack_exp/scans/mk_scans','swrf*');
%     files{11} = spm_select('ExtFPList','/home/elesage/georgios_eyetrack_exp/scans/pr_scans','swrf*');
%     files{12} = spm_select('ExtFPList','/home/elesage/georgios_eyetrack_exp/scans/ra_scans','swrf*');
%     files{13} = spm_select('ExtFPList','/home/elesage/georgios_eyetrack_exp/scans/sd_scans','swrf*');
%     files{14} = spm_select('ExtFPList','/home/elesage/georgios_eyetrack_exp/scans/vm_scans','swrf*');
%     files{15} = spm_select('ExtFPList','/home/elesage/georgios_eyetrack_exp/scans/ww_scans','swrf*');
    
    %SPM.xY.P        = [files{1}];
    SPM.xY.P        = [files{1}; files{2}; files{3}; files{4}];
    
    
    SPM.xY.RT       = 2;                              % specify TR in seconds

   % design (user specified covariates: e.g. movement parameters)
   %---------------------------------------------------------------------------

    datadir{1} = '/MRIWork/MRIWork06/nr/michael_longley/eyeblink_fmri_1/EBC1005/data_EBC1005/EPI_EBC1005';
%     datadir{2} = '/home/elesage/georgios_eyetrack_exp/scans/em_scans';
%     datadir{3} = '/home/elesage/georgios_eyetrack_exp/scans/ep_scans';
%     datadir{4} = '/home/elesage/georgios_eyetrack_exp/scans/fp_scans';
%     datadir{5} = '/home/elesage/georgios_eyetrack_exp/scans/hm_scans';
%     datadir{6} = '/home/elesage/georgios_eyetrack_exp/scans/jh_scans';
%     datadir{7} = '/home/elesage/georgios_eyetrack_exp/scans/jp_scans';
%     datadir{8} = '/home/elesage/georgios_eyetrack_exp/scans/lt_scans';
%     datadir{9} = '/home/elesage/georgios_eyetrack_exp/scans/mj_scans';
%     datadir{10} = '/home/elesage/georgios_eyetrack_exp/scans/mk_scans';
%     datadir{11} = '/home/elesage/georgios_eyetrack_exp/scans/pr_scans';
%     datadir{12} = '/home/elesage/georgios_eyetrack_exp/scans/ra_scans';
%     datadir{13} = '/home/elesage/georgios_eyetrack_exp/scans/sd_scans';
%     datadir{14} = '/home/elesage/georgios_eyetrack_exp/scans/vm_scans';
%     datadir{15} = '/home/elesage/georgios_eyetrack_exp/scans/ww_scans';
    
% realignment parameters

rnam = {'X','Y','Z','x','y','z'};

fn = [];
for ses=1:length(SPM.Sess)
    clear fn;
    cd(datadir{ses});
    fn = load('rp_fRH-0002-00001-000001-01.txt');
	SPM.Sess(ses).C.C = fn;
	SPM.Sess(ses).C.name = rnam;    
end
    
    % specify destination directories
    
    dest{1} = 'EBC1005_test_script_analysis';
%     dest{2} = 'em_analysis_hrf_polynomials';
%     dest{3} = 'ep_analysis_hrf_polynomials';
%     dest{4} = 'fp_analysis_hrf_polynomials';
%     dest{5} = 'hm_analysis_hrf_polynomials';
%     dest{6} = 'jh_analysis_hrf_polynomials';
%     dest{7} = 'jp_analysis_hrf_polynomials';
%     dest{8} = 'lt_analysis_hrf_polynomials';
%     dest{9} = 'mj_analysis_hrf_polynomials';
%     dest{10} = 'mk_analysis_hrf_polynomials';
%     dest{11} = 'pr_analysis_hrf_polynomials';
%     dest{12} = 'ra_analysis_hrf_polynomials';
%     dest{13} = 'sd_analysis_hrf_polynomials';
%     dest{14} = 'vm_analysis_hrf_polynomials';
%     dest{15} = 'ww_analysis_hrf_polynomials';
   
    ORIGspm=SPM;
    
   % Loop through subjects and configure subject-specific design matrices
   
    for subj = 1:length(ORIGspm.Sess) % loop through subjects
    
        % remove information unrelated to session/subject 'subj'
        
        SPM.Sess  = ORIGspm.Sess(subj);  % update session/subject information
        SPM.nscan = ORIGspm.nscan(subj); % update number of scans
        SPM.xY.P  = files{subj};         % update scan directory paths
        
        % Create and cd subject-specific results directory
	
        cd '/MRIWork/MRIWork06/nr/michael_longley/eyeblink_fmri_1/EBC1005/';
        mkdir(dest{subj});
        cd(dest{subj}); 
        pwd;
        SPM.swd=pwd; % tell SPM that this is the current analysis working directory
        
        % Configure design matrix
        % ====================================================================
        SPM = spm_fmri_spm_ui(SPM);
            
        % Estimate parameters
        % ====================================================================
        SPM = spm_spm(SPM);
    
        % Contrasts
        % ====================================================================
        
        % Set contrasts
        % Length of contrast must exactly match the number of columns in
        % design matrix
        % 5 basis functions, one contrast image generated per basis
        % function to take to second level
        %
        % contrast space, 3+3+6+1=13 columns

% not including time, with temporal and dispersion derivatives

cons{1}    = [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ]; 
cons{2}    = [0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ];        
cons{3}    = [0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 ];        
cons{4}    = [0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 ];
cons{5}    = [0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 ];        
cons{6}    = [0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 ];        
cons{7}    = [0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 ];
cons{8}    = [0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 ];


        
cname{1}  = '1';
cname{2}  = '2';
cname{3}  = '3';
cname{4}  = '4';
cname{5}  = '5';
cname{6}  = '6';
cname{7}  = '7';
cname{8}  = '8';


        
        for i = 1:length(cons)
            
           if length(SPM.xCon)==0
        
              SPM.xCon = struct('name',{{'init'}},'STAT',[1],'c',[1],'X0',[1],'iX0',{{'init'}},'X1o',[1],'eidf',[],'Vcon',[],'Vspm',[]);
              SPM.xCon = spm_FcUtil('Set',cname{i},'T','c',cons{i}',SPM.xX.xKXs);
        
           else

        SPM.xCon(end+1) = spm_FcUtil('Set',cname{i},'T','c',cons{i}',SPM.xX.xKXs);
        
            end
        end

    % Evaluate contrasts
    spm_contrasts(SPM)  
   
    save SPM.mat
       
    end

SPM.Sess = []	 
end
