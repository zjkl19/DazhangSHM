% FIR filter,window = kaiser 
% fcuts is a vector of band edge frequencies in Hz, in ascending order between 0 and half the sampling frequency Fs.
% e.g. fcuts = [0.05 0.1]
% Sampling frequency

function [outdata]=firhighpass(indata,fcuts,Fs)
mags = [0 1];                     %[1 0]lowpass  [0 1]highpass [0 1 0]bandpass
devs = [0.05 10^(-2.5)];   
[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,Fs);     
b = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale'); 
outdata = filtfilt(b,1,indata);