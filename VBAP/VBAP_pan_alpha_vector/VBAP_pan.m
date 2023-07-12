function [Y] = VBAP_pan(audio_vector, alpha_vector)

dim = size(audio_vector);
y_R = zeros(1,dim(1));
y_Rs = zeros(1,dim(1));
y_Rb = zeros(1,dim(1));
y_Lb = zeros(1,dim(1));
y_Ls = zeros(1,dim(1));
y_L = zeros(1,dim(1));
Y = zeros(dim(1),6);
position = 1;

for alpha=alpha_vector
    L = 0;
    R = 0;
    Rs = 0;
    Rb = 0;
    Lb = 0;
    Ls = 0;
    
    if((alpha >= 0) && (alpha < 30))
        [L,R] = VBAP_planning_laws(alpha);
    %elseif((alpha >= -30) && (alpha < 30))
        %[L,R] = VBAP_planning_laws(alpha);
    elseif((alpha >= 30) && (alpha < 90))
        [R,Rs] = VBAP_planning_laws(alpha);
    elseif((alpha >= 90) && (alpha < 150))
        [Rs,Rb] = VBAP_planning_laws(alpha);
    %elseif(((alpha >= 150) && (alpha <= 180)) || ((alpha >= -180) && (alpha < -150)))
    elseif((alpha >= 150) && (alpha <= 180))
        [Rb,Lb] = VBAP_planning_laws(alpha);
    elseif((alpha >= -180) && (alpha < -150))
        %[Rb,Lb] = VBAP_planning_laws(alpha);
        [Lb,Rb] = VBAP_planning_laws(alpha);
    elseif((alpha >= -150) && (alpha < -90))
        %[Lb,Ls] = VBAP_planning_laws(alpha);
        [Ls,Lb] = VBAP_planning_laws(alpha);
    elseif((alpha >= -90) && (alpha < -30))
        %[Ls,L] = VBAP_planning_laws(alpha);
        [L,Ls] = VBAP_planning_laws(alpha);
    elseif((alpha >= -30) && (alpha < 0))
        [R,L] = VBAP_planning_laws(alpha);
    else 
        %fprintf('Error with angle');
    end
    
    y_L(1,position) = L;
    y_R(1,position) = R;
    y_Rs(1,position) = Rs;
    y_Rb(1,position) = Rb;
    y_Lb(1,position) = Lb;
    y_Ls(1,position) = Ls;
    position = position + 1;
end

Y(:,1) = transpose(y_R) .* audio_vector;
Y(:,2) = transpose(y_Rs) .* audio_vector;
Y(:,3) = transpose(y_Rb) .* audio_vector;
Y(:,4) = transpose(y_Lb) .* audio_vector;
Y(:,5) = transpose(y_Ls) .* audio_vector;
Y(:,6) = transpose(y_L) .* audio_vector;

end 