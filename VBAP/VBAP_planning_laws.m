function [g1,g2] = VBAP_planning_laws(alpha)

    if (alpha >= 0) && (alpha < 30)
        g1 = (sin(deg2rad(30-abs(alpha)))/sin(deg2rad(120)))/sqrt((sin(deg2rad(30-abs(alpha)))/sin(deg2rad(120)))^(2)+(sin(deg2rad(30+abs(alpha)))/sin(deg2rad(120)))^(2));
        g2 = (sin(deg2rad(30+abs(alpha)))/sin(deg2rad(120)))/sqrt((sin(deg2rad(30-abs(alpha)))/sin(deg2rad(120)))^(2)+(sin(deg2rad(30+abs(alpha)))/sin(deg2rad(120)))^(2));
    elseif (alpha >= 30) && (alpha < 90)
        g1 = (sin(deg2rad(90-abs(alpha)))/sin(deg2rad(120)))/sqrt((sin(deg2rad(90-abs(alpha)))/sin(deg2rad(120)))^(2)+(sin(deg2rad(abs(alpha)-30))/sin(deg2rad(120)))^(2));
        g2 = (sin(deg2rad(abs(alpha)-30))/sin(deg2rad(120)))/sqrt((sin(deg2rad(90-abs(alpha)))/sin(deg2rad(120)))^(2)+(sin(deg2rad(abs(alpha)-30))/sin(deg2rad(120)))^(2));
   elseif (alpha >= 90) && (alpha < 150)
        g1 = (sin(deg2rad(150-abs(alpha)))/sin(deg2rad(120)))/sqrt((sin(deg2rad(150-abs(alpha)))/sin(deg2rad(120)))^(2)+(sin(deg2rad(abs(alpha)-90))/sin(deg2rad(120)))^(2));
        g2 = (sin(deg2rad(abs(alpha)-90))/sin(deg2rad(120)))/sqrt((sin(deg2rad(150-abs(alpha)))/sin(deg2rad(120)))^(2)+(sin(deg2rad(abs(alpha)-90))/sin(deg2rad(120)))^(2));
    elseif (alpha >= 150) && (alpha <= 180)
        g1 = (sin(deg2rad(210-abs(alpha)))/sin(deg2rad(120)))/sqrt((sin(deg2rad(210-abs(alpha)))/sin(deg2rad(120)))^(2)+(sin(deg2rad(abs(alpha)-150))/sin(deg2rad(120)))^(2));
        g2 = (sin(deg2rad(abs(alpha)-150))/sin(deg2rad(120)))/sqrt((sin(deg2rad(210-abs(alpha)))/sin(deg2rad(120)))^(2)+(sin(deg2rad(abs(alpha)-150))/sin(deg2rad(120)))^(2));
   elseif (alpha >= -180) && (alpha < -150)
        g1 = (sin(deg2rad(abs(alpha)-150))/sin(deg2rad(120)))/sqrt((sin(deg2rad(210-abs(alpha)))/sin(deg2rad(120)))^(2)+(sin(deg2rad(abs(alpha)-150))/sin(deg2rad(120)))^(2));
        g2 = (sin(deg2rad(210-abs(alpha)))/sin(deg2rad(120)))/sqrt((sin(deg2rad(210-abs(alpha)))/sin(deg2rad(120)))^(2)+(sin(deg2rad(abs(alpha)-150))/sin(deg2rad(120)))^(2));
    elseif (alpha >= -150) && (alpha < -90)
        g1 = (sin(deg2rad(abs(alpha)-90))/sin(deg2rad(120)))/sqrt((sin(deg2rad(150-abs(alpha)))/sin(deg2rad(120)))^(2)+(sin(deg2rad(abs(alpha)-90))/sin(deg2rad(120)))^(2));
        g2 = (sin(deg2rad(150-abs(alpha)))/sin(deg2rad(120)))/sqrt((sin(deg2rad(150-abs(alpha)))/sin(deg2rad(120)))^(2)+(sin(deg2rad(abs(alpha)-90))/sin(deg2rad(120)))^(2));
    elseif (alpha >= -90) && (alpha < -30)
        g1 = (sin(deg2rad(abs(alpha)-30))/sin(deg2rad(120)))/sqrt((sin(deg2rad(90-abs(alpha)))/sin(deg2rad(120)))^(2)+(sin(deg2rad(abs(alpha)-30))/sin(deg2rad(120)))^(2));
        g2 = (sin(deg2rad(90-abs(alpha)))/sin(deg2rad(120)))/sqrt((sin(deg2rad(90-abs(alpha)))/sin(deg2rad(120)))^(2)+(sin(deg2rad(abs(alpha)-30))/sin(deg2rad(120)))^(2));
    elseif (alpha >= -30) && (alpha < 0)
        g1 = (sin(deg2rad(30+abs(alpha)))/sin(deg2rad(120)))/sqrt((sin(deg2rad(30-abs(alpha)))/sin(deg2rad(120)))^(2)+(sin(deg2rad(30+abs(alpha)))/sin(deg2rad(120)))^(2));
        g2 = (sin(deg2rad(30-abs(alpha)))/sin(deg2rad(120)))/sqrt((sin(deg2rad(30-abs(alpha)))/sin(deg2rad(120)))^(2)+(sin(deg2rad(30+abs(alpha)))/sin(deg2rad(120)))^(2)); 
    else
        fprintf('Error with angle');
    end 
    
   

end 