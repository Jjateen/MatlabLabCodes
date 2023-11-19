function [final_signal] = delay_signal...
    (signala, To, lenght_of_signal, mid_point_t, t)
%This function is used to delay the signal

delayed_signal=zeros(1, lenght_of_signal);
indexx=0;
for ii=1:lenght_of_signal
    if(t(ii)<=To)
        indexx=indexx+1;
    else
        break;
    end 
end

if(To<0)
    newx_index=mid_point_t-indexx;
    count_a=0;
    for ii=1:lenght_of_signal
        if(ii-newx_index>0)
            delayed_signal(ii-newx_index)=signala(1,ii);
        end
    end
else
   newx_index=indexx-mid_point_t; 
   count_a=0;
   for ii=1:lenght_of_signal
        if(ii+newx_index<lenght_of_signal)
            delayed_signal(ii+newx_index)=signala(1,ii);        
        end
    end
end


% figure,plot(t, delayed_signal)
% pause
% append_zeros=zeros(1, count_a);
final_signal=[delayed_signal];

