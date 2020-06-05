# Setup R environment for DATA 606. See http://data606.net for more information.

# Install R packages
install.packages(c('tidyverse', 'devtools', 'shiny', 'psych', 'reshape2',
				   'openintro', 'OIdata', 'fivethrityeight', 'knitr'))
devtools::install_github('jbryer/DATA606')
devtools::install_github("seankross/lego")

# Getting started with Lab 1
library(DATA606)
getwd() # This is your current working directory. The startLab function will
        # create a Lab1 directory there with all the required files.
DATA606::startLab('Lab1')
