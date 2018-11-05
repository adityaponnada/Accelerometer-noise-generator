n <- 144000 # number of data points
t <- seq(0,4*pi,100)
a <- 3
b <- 2
c.unif <- runif(n)
c.norm <- rnorm(n)
amp <- 2

# generate data and calculate "y"
set.seed(1)
y1 <- a*sin(b*t)+c.unif*amp # uniform error
y2 <- a*sin(b*t)+c.norm*amp # Gaussian/normal error

# plot results
plot(t, y1, t="l", ylim=range(y1,y2)*c(1,1.2))
lines(t, y2, col=2)
legend("top", legend=c("y1", "y2"), col=1:2, lty=1, ncol=2, bty="n")
