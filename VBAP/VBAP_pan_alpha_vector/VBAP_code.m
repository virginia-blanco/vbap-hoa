[l_noise, Fs] = audioread('/Users/virginiablancoravena/Desktop/Universidad/2021-2022/2_cuatri/MEDS/Lab3/archivos_test_MEDS_P3/l_noise.wav');
[rows, cols] = size(l_noise);
alpha_positives = linspace(0,180,(rows/2));
alpha_negatives = linspace(-180,0,(rows/2));
alpha_vector = [alpha_positives alpha_negatives];
Y = VBAP_pan(l_noise, alpha_vector);
Y_7 = nat6to71(Y);
%audiowrite('/Users/virginiablancoravena/Desktop/Universidad/2021-2022/2_cuatri/MEDS/Lab3/VBAP_pan.wav',Y_7, Fs);

plot(Y_7);
