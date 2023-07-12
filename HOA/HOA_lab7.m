violin_video = VideoReader('/Users/virginiablancoravena/Desktop/Universidad/2021-2022/2_cuatri/MEDS/Lab3/VBAP/violin/string_quartet.mp4');
video_duration = violin_video.Duration;
video_framerate = violin_video.FrameRate;
[matrix_quartet, quartet_fs] = audioread('/Users/virginiablancoravena/Desktop/Universidad/2021-2022/2_cuatri/MEDS/Lab3/HOA/cuarteto/QUARTET_(trad_3).wav');
[samples, channels] = size(matrix_quartet);

t0= 0;
t1 =  2 + (6/video_framerate);
t2 =  4 + (1/video_framerate);
t3 =  5 + (21/video_framerate);
t4 =  10 + (1/video_framerate);
t5 =  17 + (15/video_framerate);
t6 =  23 + (5/video_framerate);

period1 = t1-t0;
period2 = t2-t1;
period3 = t3-t2;
period4 = t4-t3;
period5 = t5-t4;
period6 = video_duration-(period1+period2+period3+period4+period5);
%POR PROBLEMAS DE REDONDEO DE MATLAB SALEN 3 SAMPLES MENOS DE LOS QUE
%DEBERIAN, EL 1, EL 4 Y EL 5 SUS DECIMALES SON ENTRE 6 Y 5 CON LO QUE SE
%REDONDEA A LA ALTA
num_samples1 = (period1/video_duration) *samples;
num_samples2 = (period2/video_duration) *samples;
num_samples3 = (period3/video_duration) *samples;
num_samples4 = (period4/video_duration) *samples;
num_samples5 = (period5/video_duration) *samples;
num_samples6 = (period6/video_duration) *samples;

alpha1 = linspace(0,75,num_samples1+1);
alpha2 = linspace(75,25,num_samples2+1);
alpha3 = linspace(25,-25,num_samples3+1);
alpha4 = linspace(-25,-75,num_samples4+2);
alpha5 = linspace(-75,0,num_samples5+2);
alpha6 = linspace(0,0,num_samples6+1);

alpha_vector = [alpha1 alpha2(1,2:length(alpha2)) alpha3(1,2:length(alpha3)) alpha4(1,2:length(alpha4)) alpha5(1,2:length(alpha5)) alpha6(1,2:length(alpha6))];
Z = zeros(samples,channels);

for i = 1:samples
    Z(i,:)=HOA_rotate(matrix_quartet(i,:),alpha_vector(1,i));
end

Y = HOA_decoder(Z);
Y_7 = nat6to71(Y);
%audiowrite('/Users/virginiablancoravena/Desktop/Universidad/2021-2022/2_cuatri/MEDS/Lab3/HOA/result/HOA_quartet_soundtrack.wav',Y_7, quartet_fs);