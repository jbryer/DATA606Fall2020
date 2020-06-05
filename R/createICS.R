library(stringr)

ics_header <- "BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//DATA606//NONSGML Event Calendar//EN
NAME:DATA 606 Spring 2020
X-WR-CALNAME:DATA 606 Spring 2020
DESCRIPTION:DATA 606 Spring 2020
X-WR-CALDESC:DATA 606 Spring 2020
TIMEZONE-ID:America/New_York
X-WR-TIMEZONE:America/New_York
REFRESH-INTERVAL;VALUE=DURATION:PT6H
X-PUBLISHED-TTL:PT6H
CALSCALE:GREGORIAN
METHOD:PUBLISH"

ics_body <- "
BEGIN:VEVENT
DTSTART:20060912T060000Z
DTEND:20060912T070000Z
DTSTAMP:20191212T211200Z
UID:461092315540@example.com
LOCATION:Somewhere
SUMMARY:new2
DESCRIPTION:Beschreibung des Termines
END:VEVENT"

ics_footer <- "
END:VCALENDAR
"


# Input data.frame must have these columns:
# * `starttime`
# * `endtime`
# * `summary`
# * `description`
# * `location`

#' Create an ICS file from a data.frame
#' 
#' Adapted from https://github.com/cutterkom/convert-csv-to-ics-in-R
#' 
createICS <- function(df) {
	# ics_header <- readLines("ics_template/template_header.ics", warn = F)
	# ics_body <- readLines("ics_template/template_body.ics", warn = F)
	# ics_footer <- readLines("ics_template/template_footer.ics", warn = F)
	
	# iterate over events and insert events data
	ics_events <- ""
	
	for(i in 1:nrow(df)) {
		ics_body <- str_replace(ics_body, "SUMMARY:.*", paste0("SUMMARY:", df$summary[i]))
		ics_body <- str_replace(ics_body, "LOCATION:.*", paste0("LOCATION:", df$location[i]))
		ics_body <- str_replace(ics_body, "DESCRIPTION:.*", paste0("DESCRIPTION:", df$description[i]))
		ics_body <- str_replace(ics_body, "DTSTART:.*", paste0("DTSTART:", 
								format(df$starttime[i], format = '%Y%m%dT%H%M%S')))
		ics_body <- str_replace(ics_body, "DTEND:.*", paste0("DTEND:", 
								format(df$endtime[i], format = '%Y%m%dT%H%M%S')))
		ics_body <- str_replace(ics_body, "DTSTAMP:.*", paste0("DTSTAMP:", 
								format(Sys.time(), format = '%Y%m%dT%H%M%S')))
		# create unique identifier
		ics_body <- str_replace(ics_body, "UID:.*", paste0("UID:", paste0(df$starttime[i], df$endtime[i])))
		ics_events <- paste0(ics_events, ics_body)
	}
	
	# combine template parts to one vector
	ics_events <- paste0(ics_header, ics_events)
	ics_events <- paste0(ics_events, ics_footer)
	
	# See https://stackoverflow.com/questions/33648182/online-ical-feed-wont-work
	ics_events <- gsub('["\n"]', '\r\n', ics_events)
	
	return(ics_events)
}