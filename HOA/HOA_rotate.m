%function Z = HOA_rotate(X,ang)
function Z = HOA_rotate(X,ang)
%[samples,cols] = size(alpha_vector);
%W_ = zeros(1,7);
%X_ = zeros(1,7);
%Y_ = zeros(1,7);
%U_ = zeros(1,7);
%V_ = zeros(1,7);
%P_ = zeros(1,7);
%Q_ = zeros(1,7);

W_ = X(:,1);
X_ = X(:,2);
Y_ = X(:,3);
%U_ = X(:,4);
%V_ = X(:,5);
%P_ = X(:,6);
%Q_ = X(:,7);


[samples,channels]=size(X);
Z = zeros(samples,channels);

for i = 1:samples
    
    tan_phi = Y_(i)/X_(i);
    x_i = atan(deg2rad(tan_phi));

    Z(i,1) = W_(i);
    Z(i,2) = W_(i)*cos(deg2rad(x_i - ang));
    Z(i,3) = W_(i)*sin(deg2rad(x_i - ang));
    Z(i,4) = W_(i)*cos(deg2rad(2*(x_i - ang)));
    Z(i,5) = W_(i)*sin(deg2rad(2*(x_i - ang)));
    Z(i,6) = W_(i)*cos(deg2rad(3*(x_i - ang)));
    Z(i,7) = W_(i)*sin(deg2rad(3*(x_i - ang)));
end 

%for i=1:samples
    %Z(i,1) = W_(i,1);
    %Z(i,2) = W_(i,1)*cos(deg2rad(x_i - alpha_vector(1,i)));
    %Z(i,3) = W_(i,1)*sin(deg2rad(x_i - alpha_vector(1,i)));
    %Z(i,4) = W_(i,1)*cos(deg2rad(2*(x_i - alpha_vector(1,i))));
    %Z(i,5) = W_(i,1)*sin(deg2rad(2*(x_i - alpha_vector(1,i))));
    %Z(i,6) = W_(i,1)*cos(deg2rad(3*(x_i - alpha_vector(1,i))));
    %Z(i,7) = W_(i,1)*sin(deg2rad(3*(x_i - alpha_vector(1,i))));
%end

end