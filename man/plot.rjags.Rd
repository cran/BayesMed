\name{plot.rjags}
\alias{plot.rjags}

\title{
Plot the chains of the JAGS samples
}
\description{
Displays a plot of iterations vs. sampled values for each variable in the chain, with a separate plot per variable (see \code{traceplot} of the package \code{R2jags}; Su & Yajima, 2012).
}
\usage{
\method{plot}{rjags}(x,\dots)
}
\arguments{
  \item{x}{
an \code{rjags} object.
}
  \item{\dots}{
additional arguments to be passed on to the traceplot method, such as graphical parameters (see \code{traceplot}).
}
}
\references{
Nuijten, M. B., Wetzels, R., Matzke, D., Dolan, C. V., & Wagenmakers, E.-J. (2014). A default Bayesian hypothesis test for mediation. Behavior Research Methods. doi: 10.3758/s13428-014-0470-2

Su, Y.-S., & Yajima, M. (2012). R2jags: A package for running jags from Rb[Computer software manual]. Available from http://CRAN.R-project.org/package=R2jags (R package version 0.03-08)
}
\author{
Michele B. Nuijten <m.b.nuijten@uvt.nl>, Ruud Wetzels, Dora Matzke, Conor V. Dolan, and Eric-Jan Wagenmakers.
}

\examples{
\dontrun{
# simulate correlational data
X <- rnorm(50,0,1)
Y <- .3*X + rnorm(50,0,1)

# save jzs_cor output
res <- jzs_cor(X,Y)

# plot results
plot(res$jagssamples)

############

# simulate mediational data
a <- .5 
b <- .6
t_prime <- .3

X <- rnorm(50,0,1)
M <- a*X + rnorm(50,0,1)
Y <- t_prime*X + b*M + rnorm(50,0,1)

# run jzs_med
res2 <- jzs_med(independent=X,dependent=Y,mediator=M)

# plot resulting chains for alpha, beta, and tau_prime
plot(res2$jagssamplesA)
plot(res2$jagssamplesTB)
}
}