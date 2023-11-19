clear all
clc
close all
step_size_of_t=0.005;
t=-5:step_size_of_t:5;
length_t=length(t);
mid_point_t=(length_t-1)/2;
x_t=zeros(1, length_t);
y_t=zeros(1, length_t);
for ii=1:length(t)
    if(t(ii)<0)
        x_t(1,ii)=0;
    else
        x_t(1, ii)=exp(-2*t(ii));
    end
end

for ii=1:length(t)
    if(t(ii)<=0)
        h_t(1,ii)=exp(4*t(ii));
    else
        h_t(1, ii)=0;
    end
end

h_t_fliped=flip_the_signal(h_t, length(t));

for ii=1:1:length_t
    signal_delayed=delay_signal(h_t_fliped, t(ii), length_t, mid_point_t, t);
    subplot(2,1,1),plot(t, x_t)
    hold on
    plot(t, signal_delayed, 'r' )
    hold off
    pause(0.05)
    temp1=signal_delayed.*x_t;
    y_t(ii)=my_int_fun(temp1, step_size_of_t);
    subplot(2,1,2), plot(t,y_t );
end
hold on

for ii=1:1:length_t
    if(t(ii)<0)
        y_t_th(1,ii)=exp(4*t(ii))/6; 
    else
        y_t_th(1, ii)=exp(-2*t(ii))/6;
    end
end
subplot(2,1,2), plot(t, y_t_th, '--k' );

hold off


% plot(t, signal_delayed )
% plot(t, [x_t; h_t; h_t_fliped ] )


        
