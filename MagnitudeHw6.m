% Emmanuel S Akosah     ENGS22
% ENGS 22 HW 7 Feb 21, 2017


%Transfer function
w = logspace(-3,2);
s = j.*w;

Tfunction =( 2.*s ./ (s.^2 + 3.*s + 10) );
Magnitude = 20*log(abs(Tfunction));
Phase = angle(Tfunction);
Phase = Phase * (180/pi);

%plotting
figure(1)
semilogx(w,Magnitude);
title('Magnitude Response')
xlabel('frequency(Hz)')
ylabel('Magnitude (dB)')

figure(2)
semilogx(w,Phase);
title('Phase Response')
xlabel('frequency(Hz)')
ylabel('Phase Response(degrees)')



