# Modeling the number of COVID19 cases in Ethiopia

## Install and load required packages

```r
# remotes::install_github("joachim-gassen/tidycovid19")
# install.packages("minpack.lm")
# install.packages("propagate")

library(tidycovid19)
library(minpack.lm)
library(propagate)
```

## Import and pre-process data
```r
# today's updates (this has to be done manually)
catch_data <- FALSE
date.today <- "10-6-2020"
cases.today=170
deaths.today=3
recoveries.today=22

source("R/import_updates_EthioCOVID19.R")
source("R/process_data_EthioCOVID19.R")
df <- readRDS("data/EthioCOVID19_updates.rds")
n <- nrow(df)
```

## Richard's growth model

Richards four-parameter nonlinear growth model is a very versatile model for describing many growth processes.It was initially proposed to model plant growth. Richards growth model is given by

$$C(t) = \frac{\beta_0}{\left(1+\exp(-\beta_1(t-t_m))\right)^{\frac{-1}{B3}}}$$


