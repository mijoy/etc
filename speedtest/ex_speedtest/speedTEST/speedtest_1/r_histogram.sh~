#!/usr/bin/Rscript

pdf("histogramtest.pdf")

ex7 = read.table("/home/mijoy0909/speedtest/log_result/snmp_speedtest_2014.05.14.09.26_43.txt")
attach(ex7)
myhist <- hist(V2, col="lightgray", main="histogram&gaussian")
multiplier <- myhist$counts / myhist$density
mydensity <- density(V2)
mydensity$y <- mydensity$y * multiplier[1]

myx <- seq(min(V2), max(V2), length.out= 1000)
mymean <- mean(V2)
mysd <- sd(V2)

normal <- dnorm(x = myx, mean = mymean, sd = mysd)
lines(myx, normal * multiplier[1], col = "blue", lwd = 2)

sd_x <- seq(mymean - 3 * mysd, mymean + 3 * mysd, by = mysd)
sd_y <- dnorm(x = sd_x, mean = mymean, sd = mysd) * multiplier[1]

dev.off()