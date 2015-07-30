# License : http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en
# Author:   Jeong Han Lee
# email :   jeonghan 'dot' lee 'at' gmail 'dot' com
# Date:     Thursday, August 19 10:39:49 EDT 2010
# Version:  0.0.1
#
#          This script can calculate a running mean, a sample deviation
#          , and a standard deviation from xterm output.
#
# History:
# 0.0.1     Thursday, August 19 10:41:44 EDT 2010  
#          
#


# How to use.....
# $4 is what interests me.
# For example,
# ps aux | grep jhlee | awk '{print $2} '
# 20488
# 20490
# 20528
# 20544
# 20674
# 20805
# 20806
# 20807
# 23841

# then $4 is replaced by $2, then
# ps aux | grep jhlee | awk -f average.awk
# Total count        : 52
# mean               : 10966.7
# Sample Deviation   : 8159.65
# Standard Deviation : 8080.81

# Tuesday, August 17 11:17:02 EDT 2010, jhlee
#awk ' {print "  CPU " $2 " "$3 " " $4 " " $5 " " $6 " s per event)" }'



BEGIN {
    count = 0
    mean0 = 0
    sd0   = 0
    sample_deviation = 0
    standard_deviation = 0
}

{
    x = $2
    count += 1
    #    totalsize += x
    indexI1 = x
    mean1   = mean0 +1/count * ( x - mean0 )
    sd1     = sd0 + ( x - mean0 )*( x - mean1 )
    mean0   = mean1
    sd0     = sd1
    if (count !=0 && sd0 != 0) {
    sample_deviation   = sqrt(1/(count-1)*sd0)
    standard_deviation = sqrt(1/count*sd0)
    }
}

END {
    printf "\n\n"
    printf "Total count        : %10d\n", count
    #   print "average size = " totalsize/count
    printf "Mean               : %8.8lf\n", mean0
    printf "Sample Deviation   : %8.8lf\n", sample_deviation
    printf "Standard Deviation : %8.8lf\n", standard_deviation
    printf "\n\n"

}