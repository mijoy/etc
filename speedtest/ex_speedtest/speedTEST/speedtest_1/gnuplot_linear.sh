#!/usr/bin/gnuplot


set term pdfcairo size 10,10 
set output 's4sx.pdf' 



fname = '/home/mijoy0909/speedtest/result/s4sx_1_100.txt'



set key right box
set style line 100 lt 1 lc rgb "gray" lw 2
set style line 101 lt 1 lc rgb "gray" lw 1
set grid xtics ytics ls 100
set grid mxtics mytics ls 101
set xtics 10
set xrange [-10:110]
set xlabel 'length'
set ylabel 'time'

###  multiplot (2 by 2 layout)
set multiplot layout 2,2 rowsfirst title "switch4 / sleep x" font "DeJaVu Sans Mono,30"  


# ---GRAPH 1
set title "v1"
f(x)=(a*x)+b
fit f(x) fname u 1:2 via a,b
x1=25
y1=f(x1)
x2=50
y2=f(x2)
set ytics auto

p f(x) lc rgb "#4c4c4c" , '+' u ($0 == 0 ? x1 : NaN):(f(x1)):(sprintf('f1(%.0f,%.8f)', x1,y1)) w labels offset char 1,-0.2 left point linestyle 57 pointsize 1 notitle, '+' u ($0 == 0 ? x2 : NaN):(f(x2)):(sprintf('f2(%.0f,%.8f)', x2,y2)) w labels offset char 1,-0.2 left point linestyle 46 pointsize 1 notitle




# ---GRAPH 2
set title "v2c"
f(x)=(a*x)+b
fit f(x) fname u 1:3 via a,b
x1=25
y1=f(x1)
x2=50
y2=f(x2)
#set ytics 0.0001
set ytics auto

p f(x) lc rgb "#4c4c4c" , '+' u ($0 == 0 ? x1 : NaN):(f(x1)):(sprintf('f1(%.0f,%.8f)', x1,y1)) w labels offset char 1,-0.2 left point linestyle 57 pointsize 1 notitle, '+' u ($0 == 0 ? x2 : NaN):(f(x2)):(sprintf('f2(%.0f,%.8f)', x2,y2)) w labels offset char 1,-0.2 left point linestyle 46 pointsize 1 notitle

# ---GRAPH 3
set title "v3r"
f(x)=(a*x)+b
fit f(x) fname u 1:4 via a,b
x1=25
y1=f(x1)
x2=50
y2=f(x2)
#set ytics 0.0005
set ytics auto

p f(x) lc rgb "#4c4c4c" , '+' u ($0 == 0 ? x1 : NaN):(f(x1)):(sprintf('f1(%.0f,%.8f)', x1,y1)) w labels offset char 1,-0.2 left point linestyle 57 pointsize 1 notitle, '+' u ($0 == 0 ? x2 : NaN):(f(x2)):(sprintf('f2(%.0f,%.8f)', x2,y2)) w labels offset char 1,-0.2 left point linestyle 46 pointsize 1 notitle

# ---GRAPH 4
set title "v3w"
f(x)=(a*x)+b
fit f(x) fname u 1:5 via a,b
x1=25
y1=f(x1)
x2=50
y2=f(x2)
set ytics auto
#set ytics 0.0005


p f(x) lc rgb "#4c4c4c" , '+' u ($0 == 0 ? x1 : NaN):(f(x1)):(sprintf('f1(%.0f,%.8f)', x1,y1)) w labels offset char 1,-0.2 left point linestyle 57 pointsize 1 notitle, '+' u ($0 == 0 ? x2 : NaN):(f(x2)):(sprintf('f2(%.0f,%.8f)', x2,y2)) w labels offset char 1,-0.2 left point linestyle 46 pointsize 1 notitle













































# #!/usr/bin/gnuplot


# set term pdfcairo size 10, 10 
# set output 'test.pdf' 



# fname = '/home/mijoy0909/users/mijoy0909/snmp_speedtests_2/gggggg.txt'


# set multiplot layout 1,4 title "test" font "DeJaVu Sans Mono,20"  

# set key right box
# set style line 100 lt 1 lc rgb "gray" lw 2
# set style line 101 lt 1 lc rgb "gray" lw 1
# set grid xtics ytics ls 100
# set grid mxtics mytics ls 101
# set xtics 0,25,100
# set xrang [-1:101]


# set title "v1"
# f(x)=(a*x)+b
# fit f(x) fname u 1:2 via a,b
# x1=25
# y1=f(x1)
# x2=50
# y2=f(x2)
# p f(x) lc rgb "#4c4c4c" , '+' u ($0 == 0 ? x1 : NaN):(f(x1)):(sprintf('f1(%.0f,%.8f)', x1,y1)) w labels offset char 1,-0.2 left point linestyle 57 pointsize 1.5 notitle, '+' u ($0 == 0 ? x2 : NaN):(f(x2)):(sprintf('f2(%.0f,%.8f)', x2,y2)) w labels offset char 1,-0.2 left point linestyle 46 pointsize 1.5 notitle

# set title "v2c"
# f(x)=(a*x)+b
# fit f(x) fname u 1:3 via a,b
# x1=25
# y1=f(x1)
# x2=50
# y2=f(x2)
# p f(x) lc rgb "#4c4c4c" , '+' u ($0 == 0 ? x1 : NaN):(f(x1)):(sprintf('f1(%.0f,%.8f)', x1,y1)) w labels offset char 1,-0.2 left point linestyle 57 pointsize 1.5 notitle, '+' u ($0 == 0 ? x2 : NaN):(f(x2)):(sprintf('f2(%.0f,%.8f)', x2,y2)) w labels offset char 1,-0.2 left point linestyle 46 pointsize 1.5 notitle

# set title "v3r"
# f(x)=(a*x)+b
# fit f(x) fname u 1:4 via a,b
# x1=25
# y1=f(x1)
# x2=50
# y2=f(x2)
# p f(x) lc rgb "#4c4c4c" , '+' u ($0 == 0 ? x1 : NaN):(f(x1)):(sprintf('f1(%.0f,%.8f)', x1,y1)) w labels offset char 1,-0.2 left point linestyle 57 pointsize 1.5 notitle, '+' u ($0 == 0 ? x2 : NaN):(f(x2)):(sprintf('f2(%.0f,%.8f)', x2,y2)) w labels offset char 1,-0.2 left point linestyle 46 pointsize 1.5 notitle

# set title "v3w"
# f(x)=(a*x)+b
# fit f(x) fname u 1:5 via a,b
# x1=25
# y1=f(x1)
# x2=50
# y2=f(x2)
# p f(x) lc rgb "#4c4c4c" , '+' u ($0 == 0 ? x1 : NaN):(f(x1)):(sprintf('f1(%.0f,%.8f)', x1,y1)) w labels offset char 1,-0.2 left point linestyle 57 pointsize 1.5 notitle, '+' u ($0 == 0 ? x2 : NaN):(f(x2)):(sprintf('f2(%.0f,%.8f)', x2,y2)) w labels offset char 1,-0.2 left point linestyle 46 pointsize 1.5 notitle

