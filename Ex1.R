test

library(dygraphs)
library(tidyverse)
library(dplyr)
library(lubridate)

hauptPfad <- "C:/Users/radtk/OneDrive/Dokumente/Data Management/01_data_raw/hobo/2022/raw/"
dateiname <- "10347355.csv"

importPfad <- paste0(hauptPfad, dateiname) 

data <- read_delim(importPfad, delim = ",", skip = 2, col_names = F) %>% 
	mutate(id = X1,
	       #dttm = X2,
	       dttm = ymd_hms(parse_date_time(X2)),
	       temp = X3,
	       lux = X4) %>% 
	select(id, dttm, temp, lux)

# Daten plotten
Temp_Lux_graph <- data %>% 
	ggplot(aes(x = dttm[], y = Abfluss)) + theme_bw(base_size = 15) +
	geom_line(color = "darkblue") +
	labs(title = "Abfluss im Tagesmittel",
	     subtitle = Name,
	     x = "Datum",
	     y = "Abfluss [mÂ³/s]")





