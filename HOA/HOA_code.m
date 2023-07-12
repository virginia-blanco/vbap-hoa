[matrix_bformat_0, Fs_0] = audioread('/Users/virginiablancoravena/Desktop/Universidad/2021-2022/2_cuatri/MEDS/Lab3/archivos_test_MEDS_P3/bformat_noise_0.wav');
[matrix_bformat_30, Fs_30] = audioread('/Users/virginiablancoravena/Desktop/Universidad/2021-2022/2_cuatri/MEDS/Lab3/archivos_test_MEDS_P3/bformat_noise_30.wav');
[matrix_bformat_45, Fs_45] = audioread('/Users/virginiablancoravena/Desktop/Universidad/2021-2022/2_cuatri/MEDS/Lab3/archivos_test_MEDS_P3/bformat_noise_45.wav');
[matrix_bformat_scan, Fs_scan] = audioread('/Users/virginiablancoravena/Desktop/Universidad/2021-2022/2_cuatri/MEDS/Lab3/archivos_test_MEDS_P3/bformat_noise_scan.wav');

Y_30 = HOA_decoder(matrix_bformat_30);
Y_45 = HOA_decoder(matrix_bformat_45);
Y_0 = HOA_decoder(matrix_bformat_0);

Y_scan = HOA_decoder(matrix_bformat_scan);

Y_scan_7 = nat6to71(Y_scan);

%audiowrite('/Users/virginiablancoravena/Desktop/Universidad/2021-2022/2_cuatri/MEDS/Lab3/HOA_decoder.wav',Y_scan_7, Fs_scan);

%Y_45_rotated = HOA_rotate(matrix_bformat_0,45);

b = HOA_rotate(matrix_bformat_0,-45);
y = HOA_decoder(b);
audiowrite('/Users/virginiablancoravena/Desktop/Universidad/2021-2022/2_cuatri/MEDS/Lab3/HOA/HOA_rotated.wav', y, Fs_0);
