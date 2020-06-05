# devtools::install_github('gadenbuie/ggweekly')

library(ggweekly)
library(rlang) # Needed for the ggweekly.R script to work
source('R/ggweekly.R') # Fixes issue with loading PT Sans fonts with PDF output
library(ggplot2)
library(readxl)
library(lubridate)

semester <- 'Spring 2020'

palette <- c('#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462',
			 '#b3de69','#fccde5','#d9d9d9','#bc80bd','#ccebc5','#ffed6f')

meetups <- read_excel('Schedule.xlsx', sheet = 'Meetups')
meetups$day <- as.Date(meetups$Date)
meetups$label <- paste0('Meetup ', meetups$StartTime, '\n', meetups$Topic)
# meetups$label <- meetups$Topic
meetups$color <- '#4A235A'
meetups$fill <- NA

officeHours <- read_excel('Schedule.xlsx', sheet = 'Office_Hours')
officeHours$day <- as.Date(officeHours$Date)
officeHours$label <- paste0('Office Hours\n', officeHours$StartTime, '')
officeHours$color <- '#145A32'
officeHours$fill <- NA

schedule <- rbind(meetups[,c('day', 'label', 'color', 'fill')],
				  officeHours[,c('day', 'label', 'color', 'fill')])

topics <- read_excel('Schedule.xlsx', sheet = 'Schedule')
topics$Start <- as.Date(topics$Start)
topics$End <- as.Date(topics$End)
for(i in 1:nrow(topics)) {
	schedule <- rbind(schedule, data.frame(
		day = topics[i,]$Start,
		label = topics[i,]$Topic,
		color = '#000000',
		fill = palette[i]
	))
	dates <- seq(topics[i,]$Start, topics[i,]$End, by = 'day')[-1]
	for(j in seq_along(dates)) {
		schedule <- rbind(schedule, data.frame(
			day = dates[j],
			label = NA,
			color = NA,
			fill = palette[i]
		))
	}
}

start_day <- lubridate::floor_date(min(meetups$day), "month")
end_day <- lubridate::ceiling_date(max(meetups$day), "month") - 1

##### iCal

source('R/createICS.R')

meetups$starttime <- parse_date_time(paste0(as.character(meetups$Date), ' ', meetups$StartTime),
							    orders = "%Y-%m-%d %H:%M %p", tz = "America/New_York")
meetups$endtime <- parse_date_time(paste0(as.character(meetups$Date), ' ', meetups$EndTime),
								   orders = "%Y-%m-%d %H:%M %p", tz = "America/New_York")
meetups$location <- 'Zoom'
meetups$summary <- meetups$Topic
meetups$description <- ''

createICS(meetups) %>% cat()
createICS(meetups) %>% write(file = 'docs/DATA606.ics')

##### Full Calendar
ggweek_planner(
	start_day = start_day, 
	end_day = end_day, 
	show_month_boundaries = FALSE, 
	show_month_start_day = FALSE,
	week_start = "epiweek",
	week_start_label = "week",
	base_font_family = '',
	font_label_text = 'Helvetica',
	holidays = NULL,
	highlight_days = schedule) +
	ggplot2::ggtitle("DATA606 - Spring 2020") +  
	ggplot2::facet_wrap(~ month, scales = 'free', ncol=2)

ggsave(paste0("DATA606-", gsub(' ', '-', semester), "-Schedule-1page.pdf"), width = 11, height = 8.5)

# PDF of each month
months <- seq(start_day, end_day, by = "1 month")
pdf(paste0("DATA606-", gsub(' ', '-', semester), "-Schedule.pdf"), width = 11, height = 8.5)
for(i in seq_along(months)) {
	gcal <- ggweek_planner(
		start_day = months[i],
		end_day = months[i] + days_in_month(month(months[i])) - 1,	
		show_month_boundaries = FALSE, 
		show_month_start_day = FALSE,
		week_start = "epiweek",
		week_start_label = "week",
		base_font_family = '',
		font_label_text = 'Helvetica',
		holidays = NULL,
		highlight_days = schedule
		) +
		ggplot2::theme(plot.margin = ggplot2::margin(0.5, 0.5, 0.5, 0.5, "in")) +
		ggplot2::ggtitle(paste0('DATA 606 - ', semester, ' - ', month(months[i], label = TRUE, abbr = FALSE)))
	print(gcal)
}
dev.off()

