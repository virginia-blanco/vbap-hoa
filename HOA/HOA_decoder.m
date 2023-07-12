function Y = HOA_decoder(X)

W_ = zeros(1,6);
X_ = zeros(1,6);
Y_ = zeros(1,6);
U_ = zeros(1,6);
V_ = zeros(1,6);
P_ = zeros(1,6);
Q_ = zeros(1,6);

for i = 1:6
    if (i==1)
        angle = 30;
    elseif (i==2)
        angle = 90;
    elseif (i==3)
        angle = 150;
    elseif (i==4)
        angle = -150;
    elseif (i==5)
        angle = -90;
    elseif (i==6)
        angle = -30;
    end
    
    W_(1,i) = (1/6);
    X_(1,i) = (1/6)*2*cos(deg2rad(angle));
    Y_(1,i) = (1/6)*2*sin(deg2rad(angle));
    U_(1,i) = (1/6)*2*cos(2*deg2rad(angle));
    V_(1,i) = (1/6)*2*sin(2*deg2rad(angle));
    P_(1,i) = (1/6)*cos(3*deg2rad(angle));
    Q_(1,i) = (1/6)*sin(3*deg2rad(angle));
    
end

A = [W_;X_;Y_;U_;V_;P_;Q_];
Y = X * A;

end