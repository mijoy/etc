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
    count_real = 0
    mean0_real = 0
    sd0_real   = 0
    sample_deviation_real = 0
    standard_deviation_real = 0

    count_user = 0
    mean0_user = 0
    sd0_user   = 0
    sample_deviation_user = 0
    standard_deviation_user = 0

    count_sys = 0
    mean0_sys = 0
    sd0_sys   = 0
    sample_deviation_sys = 0
    standard_deviation_sys = 0
}

{
    x = $1
    count_real += 1
    #    totalsize += x
    indexI1_real = x
    mean1_real   = mean0_real +1/count_real * ( x - mean0_real )
    sd1_real     = sd0_real + ( x - mean0_real )*( x - mean1_real )
    mean0_real   = mean1_real
    sd0_real     = sd1_real
    if (count_real !=0 && sd0_real != 0) {
    sample_deviation_real   = sqrt(1/(count_real-1)*sd0_real)
    standard_deviation_real = sqrt(1/count_real*sd0_real)
    }

    x = $2
    count_user += 1
    #    totalsize += x
    indexI1_user = x
    mean1_user   = mean0_user +1/count_user * ( x - mean0_user )
    sd1_user     = sd0_user + ( x - mean0_user )*( x - mean1_user )
    mean0_user   = mean1_user
    sd0_user     = sd1_user
    if (count_user !=0 && sd0_user != 0) {
    sample_deviation_user   = sqrt(1/(count_user-1)*sd0_user)
    standard_deviation_user = sqrt(1/count_user*sd0_user)
    }

    x = $3
    count_sys += 1
    #    totalsize += x
    indexI1_sys = x
    mean1_sys   = mean0_sys +1/count_sys * ( x - mean0_sys )
    sd1_sys     = sd0_sys + ( x - mean0_sys )*( x - mean1_sys )
    mean0_sys   = mean1_sys
    sd0_sys     = sd1_sys
    if (count_sys !=0 && sd0_sys != 0) {
    sample_deviation_sys   = sqrt(1/(count_sys-1)*sd0_sys)
    standard_deviation_sys = sqrt(1/count_sys*sd0_sys)
    }
    mean_user_sys = (mean0_user + mean0_sys)*0.5
    SD_user_sys = sqrt(((sample_deviation_user)^2)+((sample_deviation_sys)^2))

}

END {
    printf "<real>\n"
    printf "\n"
    printf "Total count        : %10d\n", count_real
    #   print "average size = " totalsize/count_real
    printf "Mean               : %8.8lf\n", mean0_real
    printf "Sample Deviation   : %8.8lf\n", sample_deviation_real
    printf "Standard Deviation : %8.8lf\n", standard_deviation_real
    printf "\n"

    printf "-----------------------------------------------"
    printf "\n<user>\n"
    printf "\n"

    printf "Total count        : %10d\n", count_user
    #   print "average size = " totalsize/count_user
    printf "Mean               : %8.8lf\n", mean0_user
    printf "Sample Deviation   : %8.8lf\n", sample_deviation_user
    printf "Standard Deviation : %8.8lf\n", standard_deviation_user
    printf "\n"

    printf "-----------------------------------------------"
    printf "\n<sys>\n"
    printf "\n"
    printf "Total count        : %10d\n", count_sys
    #   print "average size = " totalsize/count_sys
    printf "Mean               : %8.8lf\n", mean0_sys
    printf "Sample Deviation   : %8.8lf\n", sample_deviation_sys
    printf "Standard Deviation : %8.8lf\n", standard_deviation_sys
    printf "\n"

    printf "***********************************************"
    printf "\n\n"

    printf "Mean(user+sys)             : %8.8lf\n", mean_user_sys
    printf "Sample Deviation(user+sys) : %8.8lf\n", SD_user_sys
    printf "\n"
    printf "***********************************************"


}
