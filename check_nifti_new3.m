clear all
close all
addpath /usr/local/apps/psycapps/spm/spm12-r7487
%addpath /usr/local/fsl/
%addpath /home/elesage/QA/

% change these to select data

cd /MRIWork/MRIWork06/nr/michael_longley/eyeblink_fmri_1/EBC1005/data_EBC1005/EPI_EBC1005;

% get volumes
vols = spm_select;
M=nifti(vols);
[a,b]=size(M);

% !fslmerge -t 4Dimage fRHUL-0003*.img
% 
% !gunzip 4Dimage.nii.gz
% M=nifti('4Dimage.nii');
%slicemean(s,v) =[];

for v = 1:length(M);
    for s = 1:(M(v).dat.dim(3));
%          figure(99)
%          imagesc(M(v).dat(:,:,s));colormap('gray');
        slicemean(v,s) = mean(mean(M(v).dat(:,:,s)));

    end

end

slicemean_t = slicemean';

% mean centre over timeseries within each slice
for n = 1:s
    slicemean_norm(n,:) = slicemean_t(n,:) - mean(slicemean_t(n,:));
    
end
% imagesc(slicemean_corr)
% 
% % correct for mean value of timeseries in each slice
% slicemean_mean_row = mean(slicemean');
% slicemean_norm = slicemean - repmat([slicemean_mean_row'],1,length(slicemean));

% calculate mean for each volume...
slicemean_mean = mean(slicemean);
slicemean_norm_mean = mean(slicemean_norm);
slicemean_std = std(slicemean);
slicemean_norm_std = std(slicemean_norm);

% fast fourier transform
slicemean_fft = (abs(fft(slicemean_norm')))';

figure(5)

    subplot(5,1,1), imagesc(slicemean')
    subplot(5,1,1), title('signal intensity (raw)')
    subplot(5,1,1), xlabel('volume')
    subplot(5,1,1), ylabel('slice')
    colorbar
    %subplot(3,1,2), axis([1 length(A_norm) min(min(A_norm)) max(max(A_norm))])
    
    subplot(5,1,2), plot(slicemean_mean)
    subplot(5,1,2), title('mean across volumes')
    subplot(5,1,2), xlabel('slice')
    subplot(5,1,2), ylabel('mean')
    %subplot(5,1,1), axis([1 length(C) min(C) max(C)])
    colorbar
    
    subplot(5,1,3), plot(slicemean_std)
    subplot(5,1,3), title('standard deviation of each volume')
    subplot(5,1,3), xlabel('slice')
    subplot(5,1,3), ylabel('std')
    %subplot(5,1,2), axis([1 length(B) min(B) max(B)])    
    colorbar
    
    subplot(5,1,4), imagesc(slicemean_norm)
    subplot(5,1,4), title('signal intensity (slice mean corrected)')
    subplot(5,1,4), xlabel('volume')
    subplot(5,1,4), ylabel('slice')
    colorbar    
    %subplot(3,1,2), axis([1 length(A_norm) min(min(A_norm)) max(max(A_norm))])
    
    subplot(5,1,5), imagesc(slicemean_fft(:,2:(length(slicemean_fft)-1)))
    subplot(5,1,5), axis([1 50 1 size(slicemean_fft,1)]);
    subplot(5,1,5), title('Fast Fourier Transform of above')
    subplot(5,1,5), xlabel('Number of cycles in timecourse')
    subplot(5,1,5), ylabel('slice')
    colorbar
    
% figure - mean, standard deviation, SNR, etc.
    
%     mean_M = mean(M(:).dat(:,:,:));
%     std_M  =  std(M(:).dat(:,:,:));

% !fslmaths 4Dimage -Tmean 4Dimage_mean 
% gunzip 4Dimage_mean.nii.gz
% mean_vol = nifti('4Dimage_mean.nii')
% 
% !fslmaths 4Dimage -Tstd 4Dimage_std
% gunzip 4Dimage_std.nii.gz
% std_vol = nifti('4Dimage_std.nii')
% 
% !rm -r 4D*.nii.gz
% 
% !fslmaths 4Dimage_std -div 4Dimage_mean -mul 100 4Dimage_coeffvar
% gunzip 4Dimage_coeffvar.nii.gz
% coeffvar_vol = nifti('4Dimage_coeffvar.nii')
% 
% !fslmaths 4Dimage_mean -div 4Dimage_std 4Dimage_snr
% gunzip 4Dimage_snr.nii.gz
% snr_vol = nifti('4Dimage_snr.nii')
% 
% rowcol = ceil(mean_vol.dat.dim(3)/4);
% 
% figure(1)
% title('Mean')
%  for s = 1:(mean_vol.dat.dim(3));
%      subplot(rowcol,4,s),imagesc(mean_vol.dat(:,:,s)),colormap('gray')
%      axis square
%      colorbar
%  end
% 
% 
%  figure(2)
% title('Standard Deviation')
%  for s = 1:(mean_vol.dat.dim(3));
%      subplot(rowcol,4,s),imagesc(std_vol.dat(:,:,s)),colormap('gray')
%      axis square
%      colorbar
%  end
%  
% figure(3)
% title('Coefficient of variation (STD/Mean x 100)')
% clims = [0 100];
%  for s = 1:(coeffvar_vol.dat.dim(3));
%      subplot(rowcol,4,s),imagesc(coeffvar_vol.dat(:,:,s)),clims,colormap('jet')
%      axis square
%      caxis([0 100])
%      colorbar
%  end
% 
%  figure(4)
%  title('Signal-to_Noise (Mean/STD)')
%  for s = 1:(snr_vol.dat.dim(3));
%      subplot(rowcol,4,s),imagesc(snr_vol.dat(:,:,s)),colormap('jet')
%      axis square
%      colorbar
%  end
 



