clear all; clc

Vol = spm_vol('test.nii');
[mask, XYZ] = spm_read_vols(Vol);

mask_ones = find(mask); % this is the Y value
XYZ_ones = XYZ(:,mask_ones);

% mask = mask(0:91,:,:)*.0; % limits to a single hemsiphere

% 92-182

mask_z = mask;
mask_z(92:94,:,:) = mask_z(92:94,:,:)*.0;
mask_a  = mask_z;
mask_a(96:105,:,:) = mask_a(96:105,:,:)*.0;
mask_b = mask_a;
mask_b(107:116,:,:) = mask_b(107:116,:,:)*.0;
mask_c = mask_b;
mask_c(118:127,:,:) = mask_c(118:127,:,:)*.0;
mask_d = mask_c;
mask_d(129:138,:,:) = mask_d(129:138,:,:)*.0;
mask_e = mask_d;
mask_e(140:149,:,:) = mask_e(140:149,:,:)*.0;
mask_f = mask_e;
mask_f(151:160,:,:) = mask_f(151:160,:,:)*.0;
mask_g = mask_f;
mask_g(162:171,:,:) = mask_g(162:171,:,:)*.0;
mask_h = mask_g;
mask_h(173:182,:,:) = mask_h(173:182,:,:)*.0;

% 80-199

mask_aa = mask_h;
mask_aa(:,80:84,:) = mask_aa(:,80:84,:)*.0;
mask_ab = mask_aa;
mask_ab(:,86:95,:) = mask_ab(:,86:95,:)*.0;
mask_ac = mask_ab;
mask_ac(:,97:106,:) = mask_ac(:,97:106,:)*.0;
mask_ad = mask_ac;
mask_ad(:,108:117,:) = mask_ad(:,108:117,:)*.0;
mask_ae = mask_ad;
mask_ae(:,119:128,:) = mask_ae(:,119:128,:)*.0;
mask_af = mask_ae;
mask_af(:,130:139,:) = mask_af(:,130:139,:)*.0;
mask_ag = mask_af;
mask_ag(:,141:150,:) = mask_ag(:,141:150,:)*.0;
mask_ah = mask_ag;
mask_ah(:,152:161,:) = mask_ah(:,152:161,:)*.0;
mask_ai = mask_ah;
mask_ai(:,163:172,:) = mask_ai(:,163:172,:)*.0;
mask_aj = mask_ai;
mask_aj(:,174:183,:) = mask_aj(:,174:183,:)*.0;
mask_ak = mask_aj;
mask_ak(:,185:194,:) = mask_ak(:,185:194,:)*.0;
mask_al = mask_ak;
mask_al(:,196:199,:) = mask_al(:,196:199,:)*.0;

%41-155

mask_ba = mask_al;
mask_ba(:,:,41:46) = mask_ba(:,:,41:46)*.0;
mask_bb = mask_ba;
mask_bb(:,:,48:57) = mask_bb(:,:,48:57)*.0;
mask_bc = mask_bb;
mask_bc(:,:,59:68) = mask_bc(:,:,59:68)*.0;
mask_bd = mask_bc;
mask_bd(:,:,70:79) = mask_bd(:,:,70:79)*.0;
mask_be = mask_bd;
mask_be(:,:,81:90) = mask_be(:,:,81:90)*.0;
mask_bf = mask_be;
mask_bf(:,:,92:101) = mask_bf(:,:,92:101)*.0;
mask_bg = mask_bf;
mask_bg(:,:,103:112) = mask_bg(:,:,103:112)*.0;
mask_bh = mask_bg;
mask_bh(:,:,114:123) = mask_bh(:,:,114:123)*.0;
mask_bi = mask_bh;
mask_bi(:,:,125:134) = mask_bi(:,:,125:134)*.0;
mask_bj = mask_bi;
mask_bj(:,:,136:145) = mask_bj(:,:,136:145)*.0;
mask_bk = mask_bj;
mask_bk(:,:,147:155) = mask_bk(:,:,147:155)*.0;

mask_grid_ones = find(mask_bk); 
XYZ_grid_ones = XYZ(:,mask_grid_ones);

% XYZ_grid_line = reshape(XYZ_grid_ones, 1, 561);

formatSpec = '%i %i %i;\n';
fileID = fopen('XYZ.txt','w');
fprintf(fileID,formatSpec,XYZ_grid_ones);

% niftiwrite(mask_again,'mask_again.nii');