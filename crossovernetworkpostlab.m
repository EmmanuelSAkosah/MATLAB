% Emmanuel S Akosah     ENGS22
% ENGS 22 Black-box lab Feb 27, 2017

%Que 1
r = 6;
c = 4.42 * 10^-6;
l = 6.37 * 10^-4;
 
f = logspace(0,5,10000);
w = 2*pi.*f;
 
s = j*w;
 
 %Transfer Functions
TtransferO = s.^2./(s.^2+(s./(c.*r))+(1./(c.*l)));
WtransferO = (1./(c.*l))./(s.^2+(s./(c.*r))+(1./(c.*l)));
 
freq = [750; 1500; 3000; 6000; 12000];
WM = [1.135; 0.745; 0.484; 0.202; 0.0732];
WP = [-26; -50.9; -85; -188; -145];
TM = [0.049; 0.17; 0.474; 0.787; 0.87];
TP = [132; 121; 83; 55; 30];
 

 
% magnitude response 
a = abs(TtransferO);
b = abs(WtransferO);
 
% phase response
d = radtodeg(angle(TtransferO));
e = radtodeg(angle(WtransferO));
 
 
phaseWth = [-28.07; -53.12; -90; -126.9; -152]; 
phaseTth = [152; 126.8; 90; 53.15; 28.05];
magTth = [0.0589; 0.2002; 0.5003; 0.8002; 0.9412];
magWth = [0.9411; 0.7998; 0.4997; 0.1998; 0.0588];
 
err1 = rms(phaseWth,WP)
 
err2 = rms(phaseTth,TP)
 
err3 = rms(magTth, TM)
 
err4 = rms(magWth, WM)


%Que 2
f = logspace(0,8,10000);
w = 2*pi.*f;
s = j*w;
 
R2 = [4.896; 5.508; 6.12; 6.732; 7.344];
R1 = [4.872; 5.481; 6.09; 6.699; 7.308];
C1 = [1.7264*10^(-6); 1.9422*10^(-6); 2.158*10^(-6); 2.3848*10^(-6); 2.5896*10^(-6)];
C2 = [1.7944*10^(-6); 2.0187*10^(-6); 2.243*10^(-6); 2.4673*10^(-6); 2.6916*10^(-6)];
L1 = [509.76*10^(-6); 573.48*10^(-6); 637.2*10^(-6); 700.92*10^(-6); 764.64*10^(-6)];
L2 = [509.6*10^(-6); 573.3*10^(-6); 637*10^(-6); 700.7*10^(-6); 764.4*10^(-6)];
 
for i=1:5;
    Ttransfer = s.^2./(s.^2+(s./(C2(i).*R2(i)))+(1./(C2(i).*L2(i))));
    Wtransfer = (1./(C1(i).*L1(i)))./(s.^2+(s./(C1(i).*R1(i)))+(1./(C1(i).*L1(i))));
    Diff = Wtransfer - Ttransfer;
    
    x = 20*log10(abs(Ttransfer));
    y = 20*log10(abs(Wtransfer));
    z = 20*log10(abs(Diff));
    
    g = radtodeg(angle(Ttransfer));
    h = radtodeg(angle(Wtransfer));
    k = radtodeg(angle(Diff));
    
    figure(1)
    semilogx(f, x, 'LineWidth', 1.6)
    hold on
    semilogx(f, y, 'LineWidth', 1.6)
    hold on
    semilogx(f, z, 'LineWidth', 1.6)
    hold on
    grid on
    xlabel('Frequency (Hz)')
    ylabel('20*log(Magnitude) (dB)')
    title('Magnitude Response')
    
    figure(2)
    semilogx(f, g,'LineWidth', 1.6)
    hold on
    semilogx(f, h, 'g', 'LineWidth', 2)
    hold on
    semilogx(f, k, '--', 'LineWidth', 2)
    hold on
 
% Add a title, grid, labels, and legend
    grid on
    xlabel('Frequency (Hz)')
    ylabel('Phase Shift (Degrees)')
    title('Phase Response')
    
end

%Que 3
% The total response of my system measured with the DSA is similar to 
% the manufacturer's crossover total system response.


