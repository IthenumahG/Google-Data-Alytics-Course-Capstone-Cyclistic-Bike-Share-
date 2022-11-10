# Set working directory
setwd('/Users/gideon/Documents/RScripts')

# Load R packages

library(tidyverse)
library(lubridate)
library(ggplot2)
library(janitor)

# Upload all twelve months of data to R.

jan_trip_data <- read_csv('jan.csv')
feb_trip_data <- read_csv('feb.csv')
mar_trip_data <- read_csv('mar.csv')
apr_trip_data <- read_csv('apr.csv')
may_trip_data <- read_csv('may.csv')
jun_trip_data <- read_csv('jun.csv')
jul_tirp_data <- read_csv('jul.csv')
aug_trip_data <- read_csv('aug.csv')
sep_trip_data <- read_csv('sep.csv')
oct_trip_data <- read_csv('oct.csv')
nov_trip_data <- read_csv('nov.csv')
dec_trip_data <- read_csv('dec.csv')

str(jan_trip_data)

# Merge into a single dataframe using the bind_rows() function, after first checking to confirm all variables are uniform.

merged_trips <- bind_rows(jan_trip_data, feb_trip_data, mar_trip_data, apr_trip_data, may_trip_data, 
jun_trip_data, jul_tirp_data, aug_trip_data, sep_trip_data, oct_trip_data, nov_trip_data, dec_trip_data)

merged_trips <- clean_names(merged_trips)

table(merged_trips$member_casual)
table(merged_trips$rideable_type)
summary(merged_trips)

merged_trips$date <- as.Date(merged_trips$started_at)
merged_trips$month <- format(as.Date(merged_trips$date), "%b")
merged_trips$day <- format(as.Date(merged_trips$date), "%d")
merged_trips$ride_start_hour <- format(as.POSIXct(merged_trips$started_at), format = "%H")
merged_trips$year <- format(as.Date(merged_trips$date), "%y")
merged_trips$day_of_week <- format(as.Date(merged_trips$date), "%A")
merged_trips$ride_length <- difftime(merged_trips$ended_at, merged_trips$started_at)

str(merged_trips)
cleaned_trips <- remove_empty(merged_trips, which = c())


library(skimr)

cleaned_trips <- mutate(cleaned_trips, ride_length = as.numeric(ride_length))
cleaned_trips <- drop_na(cleaned_trips)
cleaned_trips <- distinct(cleaned_trips)
cleaned_trips <- cleaned_trips[!(cleaned_trips$ride_length <= 0),]
cleaned_trips <- cleaned_trips[!(cleaned_trips$start_station_name == "HQ QR"),]
skim_without_charts(cleaned_trips)

cleaned_trips <- rename(cleaned_trips, bike_type = rideable_type, user_type = member_casual)

cleaned_trips <- cleaned_trips %>%  select(-c(start_lng, start_lat, end_lng, end_lat))

aggregate(cleaned_trips$ride_length ~ cleaned_trips$user_type, FUN = mean)
aggregate(cleaned_trips$ride_length ~ cleaned_trips$user_type, FUN = median)
aggregate(cleaned_trips$ride_length ~ cleaned_trips$user_type, FUN = max)
aggregate(cleaned_trips$ride_length ~ cleaned_trips$user_type, FUN = min)
cleaned_trips$day_of_week <- ordered(cleaned_trips$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
aggregate(cleaned_trips$ride_length ~ cleaned_trips$user_type + cleaned_trips$day_of_week, FUN = mean)


# analyze ridership data by type and weekday

summary_table <- cleaned_trips %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>%    #creates weekday field using wday()
  group_by(user_type, month, weekday,) %>%                    #groups by usertype and weekday
  summarise(number_of_rides = n()							            #calculates the number of rides and average duration 
            ,average_duration = mean(ride_length)) %>% 		# calculates the average duration
  arrange(user_type, month, weekday)								      



# Visualizations in R

cleaned_trips %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(user_type, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(user_type, weekday)  %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = user_type)) +
  geom_col(position = "dodge")

cleaned_trips %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(user_type, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(user_type, weekday)  %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = user_type)) +
  geom_col(position = "dodge")


write_csv(cleaned_trips,'cleaned_tripdata.csv')
write.csv(summary_table, 'summary_table.csv')
