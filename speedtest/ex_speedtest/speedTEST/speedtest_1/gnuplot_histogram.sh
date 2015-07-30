#!/usr/bin/gnuplot


# 속도 값 하나 받을 때

set term pdfcairo size 10, 10 
set output 'test_histogram.pdf' 

set key right box

fname = '/home/mijoy0909/speedtest/log_result/snmp_speedtest_2014.05.14.09.26_43.txt'

p fname u 1:2
min = GPVAL_DATA_Y_MIN
max = GPVAL_DATA_Y_MAX
f(x) = mean_y
fit f(x) fname u 1:2 via mean_y
stddev_y = sqrt(FIT_WSSR / (FIT_NDF + 1 ))
n = 1000


gauss(x)= n*exp(-(x-b)*(x-b)/c/c)


b = mean_y
c = stddev_y


width = (max-min)/n
hist(x,width)=width*floor(x/width) + width/2.0
set style fill pattern 4 border -1
set style line 100 lt 1 lc rgb "gray" lw 2
set style line 101 lt 1 lc rgb "gray" lw 1
set grid xtics ytics ls 100
set grid mxtics mytics ls 101
set autoscale
set xrange [min-0.01:max+0.01]
set yrange [1:1010]

p fname u (hist($2,width)):(1.0) smooth freq w boxes lc rgb "green" title "histogram", gauss(x) lt 4 lw 2 lc rgb "blue"














# ---------------------------------------------------------------------------------------------------------------


# 속도값 세개 받을 때

# set term pdfcairo size 10, 10 
# set output 'test_histogram2.pdf' 

# set key right box

# fname = '/home/mijoy0909/users/mijoy0909/snmp_speedtests_2/log_result/snmp_speedtest_2014.02.03.18.03_11.txt'

# p fname u 0:1
# min = GPVAL_DATA_Y_MIN
# max = GPVAL_DATA_Y_MAX
# f(x) = mean_y
# fit f(x) fname u 0:1 via mean_y
# stddev_y = sqrt(FIT_WSSR / (FIT_NDF + 1 ))

# n = 1000


# gauss(x)= n*exp(-(x-b)*(x-b)/c/c)







# b = mean_y
# c = stddev_y


# width = (max-min)/n
# hist(x,width)=width*floor(x/width) + width/2.0
# set style fill pattern 4 border -1
# set style line 100 lt 1 lc rgb "gray" lw 2
# set style line 101 lt 1 lc rgb "gray" lw 1
# set grid xtics ytics ls 100
# set grid mxtics mytics ls 101
# set autoscale
# set xrange [min-0.01:max+0.01]
# set yrange [1:1010]


# p fname u (hist($1,width)):(1.0) smooth freq w boxes lc rgb "green" title "histogram", gauss(x) lt 4 lw 2 lc rgb "blue"