

f = logspace(-2,8);
w = 2*pi.*f;
s = j*w;


%transfer = 2./(s+2);
%transfer = (s+6)./(s+60);
transfer = (s+1)./((s+10).*(s+60));
mag = 20*log10(abs(transfer));
phase = (180/pi)*angle(transfer);
figure(1)
semilogx(w,mag)
title('Magnitude Response')
%axis([10^0 10^5 -100 20])

figure(2)
semilogx(w,phase);
title('Phase Response')
 