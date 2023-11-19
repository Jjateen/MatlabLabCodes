function [x_t] = signal_gen...
(t, type_of_sgn, amp, alpha, M, N, step_size_t, len_t)
%The function will retrun the time signal
%type_of_sgn =1 for impulse
%type_of_sgn =2 for unit step
%type_of_sgn =3 for unit sgn
%type_of_sgn =4 for signal sided exponential decay
%type_of_sgn =5 for double sided exponential decay
%type_of_sgn =6 for sin
%type_of_sgn =7 for cos
%type_of_sgn =8 for sinc
%type_of_sgn =9 for gate



if(type_of_sgn==1)
    for ii=1:len_t
        if(t(ii)==0)
            x_t(ii)=1/step_size_t;
        else
            x_t(ii)=0;
        end
    end
    
elseif(type_of_sgn==2)
    for ii=1:len_t
        if(t(ii)<0)
            x_t(ii)=0;
        else
            x_t(ii)=1;
        end
    end
    
elseif(type_of_sgn==3)
    for ii=1:len_t
        if(t(ii)<0)
            x_t(ii)=-amp;
        else
            x_t(ii)=+amp;
        end
    end
    
elseif(type_of_sgn==4)
    for ii=1:len_t
        if(t(ii)<0)
            x_t(ii)=0;
        else
            x_t(ii)=amp*exp(-alpha*t(ii));
        end
    end
    
elseif(type_of_sgn==5)
    for ii=1:len_t
        if(t(ii)<0)
            x_t(ii)=amp*exp(alpha*t(ii));
        else
            x_t(ii)=amp*exp(-alpha*t(ii));
        end
    end
    
elseif(type_of_sgn==6)
    x_t=amp*sin(2*pi*(1/(2*step_size_t))*M.*t);

elseif(type_of_sgn==7)
    x_t=amp*cos(2*pi*(1/(2*step_size_t))*M.*t);
    
elseif(type_of_sgn==8)
    for ii=1:len_t
        if(t(ii)==0)
           x_t(ii)=1; 
        else
          x_t(ii)=(amp*M)*sin((2*pi*(1/(2*step_size_t)))*t(ii))...
              /((2*pi*(1/(2*step_size_t)))*t(ii));
        end
    end
    
elseif(type_of_sgn==9)
    for ii=1:len_t
        if(t(ii)<-N/2)
           x_t(ii)=0; 
        elseif(t(ii)>=-N/2 && t(ii)<=N/2)
          x_t(ii)=amp;
        else
          x_t(ii)=0;
        end
    end
end

end

