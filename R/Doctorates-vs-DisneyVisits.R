library(ggplot2)

# Source: http://tylervigen.com/view_correlation?id=28735
# visits = Visitors to Disney Worlds Magic Kingdom (millions)
# doctorates = Math doctorates awarded (US) Degrees awarded (National Science Foundation)
thedata <- data.frame(
	visits = c(17.06, 17.063, 17.233),
	doctorates = c(1393, 1399, 1554)
)

cor.test(thedata$visits, thedata$doctorates)

ggplot(thedata, aes(x = visits, y = doctorates)) +
	geom_point()


library(tidyverse)
load("/Users/jb2329/Dropbox (Personal)/Projects/pisa/data/2012/pisa.student.rda")

# 1 0-10 books
# 2 11-25 books
# 3 26-100 books
# 4 101-200 books
# 5 201-500 books
# 6 More than 500 books
# 7 N/A
# 8 Invalid
# 9 Missing

books <- pisa.student %>%
	select(CNT, # Country
		   ST28Q01, #How many books at home
		   paste0('PV', 1:5, 'READ') # Reading scores
		   ) %>%
	filter(CNT == 'USA')
books$ST28Q01 <- factor(books$ST28Q01,
						levels = 1:6,
						labels = c('<= 10', '11-25', '26-100', '101-200', '201-500', '>500'))
table(books$ST28Q01, useNA = 'ifany')

ggplot(books[!is.na(books$ST28Q01),], aes(x = ST28Q01, y = PV1READ)) +
	geom_jitter(alpha = 0.1) +
	xlab('How many books at home') +
	ylab('PISA Reading Score') +
	ggtitle('Number of books in home and reading comprehension',
			subtitle = paste0('Correlation = ', round(
				cor(as.integer(books$ST28Q01), books$PV1READ, use='complete.obs'), digits = 2),
				'\nSource: Programme of Internation Student Assessment (2012)'))

cor.test(as.integer(books$ST28Q01), books$PV1READ)


