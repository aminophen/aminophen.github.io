set size ratio 0.6
set samples 2048
set xrange [0:16]
set yrange [-2.4:2.4]
set noxtics
set noytics
set nokey

if (exist("n")==0 || n<0) n=0

t = 1.0/32 * n
plot 2 * sin(pi*(x - 4*t))

if (n<15)  n=n+1; reread
