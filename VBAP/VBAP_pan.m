function Y = VBAP_pan(x, ang)

[samples,cols] = size(x);
y_R = zeros(1,samples);
y_Rs = zeros(1,samples);
y_Rb = zeros(1,samples);
y_Lb = zeros(1,samples);
y_Ls = zeros(1,samples);
y_L = zeros(1,samples);

Y = zeros(samples,6);

for i=1:samples
    L = 0;
    R = 0;
    Rs = 0;
    Rb = 0;
    Lb = 0;
    Ls = 0;
    %if((ang >= 0) && (ang < 30))
    if((ang >= -30) && (ang < 30))
        [L,R] = VBAP_planning_laws(ang);
    elseif((ang >= 30) && (ang < 90))
        [R,Rs] = VBAP_planning_laws(ang);
    elseif((ang >= 90) && (ang < 150))
        [Rs,Rb] = VBAP_planning_laws(ang);
    elseif((ang >= 150) && (ang <= 180))
        [Rb,Lb] = VBAP_planning_laws(ang);
    elseif((ang >= -180) && (ang < -150))
        %[Lb,Rb] = VBAP_planning_laws(ang);
        [Rb,Lb] = VBAP_planning_laws(ang);
    elseif((ang >= -150) && (ang < -90))
        %[Ls,Lb] = VBAP_planning_laws(ang);
        [Lb,Ls] = VBAP_planning_laws(ang);
    elseif((ang >= -90) && (ang < -30))
        %[L,Ls] = VBAP_planning_laws(ang);
        [Ls,L] = VBAP_planning_laws(ang);
    %elseif((ang >= -30) && (ang < 0))
        %[R,L] = VBAP_planning_laws(ang);
    else 
        %fprintf('Error with angle');
    end

    y_L(1,i) = L;
    y_R(1,i) = R;
    y_Rs(1,i) = Rs;
    y_Rb(1,i) = Rb;
    y_Lb(1,i) = Lb;
    y_Ls(1,i) = Ls;
end

Y(:,1) = transpose(y_R) .* x;
Y(:,2) = transpose(y_Rs) .* x;
Y(:,3) = transpose(y_Rb) .* x;
Y(:,4) = transpose(y_Lb) .* x;
Y(:,5) = transpose(y_Ls) .* x;
Y(:,6) = transpose(y_L) .* x;

end 