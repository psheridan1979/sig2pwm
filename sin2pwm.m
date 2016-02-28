time = 1;
freq = 5;
samples_per = 100;
pwm_res = 100;

total_samples = samples_per * time;
downsample = 100* freq / samples_per;

t = linspace(0,time,100 * freq);
s = sin(freq * 2 * pi * t)/2 + 0.5;

s_samp = decimate(s,downsample);
t_samp = decimate(t,downsample);
plot(t,s,t_samp,s_samp,'.')

T = time / size(t_samp,2);
PWM = zeros(1,pwm_res * size(s_samp,2));
t_PWM = 1:size(PWM,2);
start_index = 0;
end_index = 0;
for i = 1:total_samples
   width =  uint32(s_samp(i)*100) ;
   start_index = i * samples_per - 99;
   end_index = start_index + width - 1;
   PWM(1,start_index:end_index) = 1;
end
plot(t_PWM(1,1:500), PWM(1,1:500));