---
# Google Data Analytics Course Capstone (Cyclistic Bike-Share)  

## Gideon Ithenumah
### Date: 2022-06-15

## Introduction  
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.  
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.  
Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.  

## Business Task
Design marketing strategies aimed at converting casual riders into annual members using Cyclistic's historical trip data to identify trends.

## Key Stakeholders
 * Cyclistic executive team.
 * Director of marketing/manager.
 * Cylistic marketing analytics team.

### Data Source.
The data for this analysis was provided by Cyclistics although made available by a third party, Motivate International Inc and downloadable [here](https://divvy-tripdata.s3.amazonaws.com/index.html). Under the [licence](https://www.divvybikes.com/data-license-agreement). The data is original and reliable. However there were some issues with the data such as null values, inability to access purchase history of the two category of riders to confirm for sure which of them brings in more revenue, so I will have to rely on conclusion of the finance analysts that annual riders are more profitable.

## Data Preparation and Manipulation.
The tools employed for this analysis were R for data cleaning and manipulation because the data is very large and could not be handled by spreadsheet, and Tableau for data visualization as I wanted to try my hands on the tool. 
 
 
## Insights  
I used a series of visualizations to answer the question: How do annual members and casual riders use Cyclistic bikes differently in the year 2021?  
 * First I examined total number of bike rides between casual and annual members for the year 2021 by month. It is observed that annual members made up 55.35% of all trips taken in 2021, while casual members accounted for 44.64% of the trips. This will seem to support Cyclistic finance analysts conclusion that annual members are more profitable. from the chart of total trips against months if trips, annual members had higher number of rides compared to casual riders except for July and August where casual riders had more trips.  

 * Next I examined the average ride length between casual and annual members by month. It is seen that although annual members had more rides for the year, casual members had longer trip duration with an average of 1,951 secs (32 mins) compared to 791 secs (13 mins) for annual members. This discovery could provide an opportunity for casual riders to be more profitable by figuring out a way to charge according to trip duration.  

 * I went further to examined the total number of rides per day of the week. Here, it is observed that annual members had more rides during weekdays while casual members had more rides during the weekends. One can infer from this findings that annual members use these bikes to commute to and from work or school, but this is not enough to draw a conclusion. I will be carrying out further investigation on this.  

 * I also examined the examined ride lengths per day of the week for both casual and annual members. Again casual riders had higher trips duration on every day of the week compared to annual members. This reiterates the point that casual riders could be made generators of more revenue is riders are charged by trip duration.  
   
 * To explore the theory that annual members mainly use Cyclistic bikes to commute, I further examined number of rides against the ride start hours. From the first line graph it is observed that annual members ridership level significantly rises between the hours of 6am and 8am when commuters usually leave their homes, and peaks at 5pm which is generally regarded as work close hour and then significantly drops from 7pm. On the other hand however, casual ridership is seen to rise steadily from 6am and peaks also at 5pm without sudden spikes and then began to drop. This will suggest that casual riders mostly ride leisurely.  
  
The visualizations for the above insights can be found [here](https://public.tableau.com/views/GDACCapstone/Story1?:language=en-US&:display_count=n&:origin=viz_share_link)

## Summary of Insights.  
* Annual members make up 55.35% of all trips taken while casual accounted for 44.64% of the trips. However trip duration of casual members more than doubles that of annual members.
* My findings support to a large extent that annual members use rides to commute while casuals ride for leisure, and with the ride hours and trip duration of casual riders it can be inferred that they are mostly tourists.  
* Converting casual riders to annual members may not be safe with the available data which too general, trips not grouped per user which means some might ride multiple times skewing results and the data does not provide qualitative information of users that could help to determine motives of each group.  

## Recommendation.
* I would advice that the statement problem is redefined to find root cause of what makes each group different. Then collect more data that will help answer this question.  

However if the executive team wants to follow through with converting casual riders to annual members;  
 * Advertise for membership at casual riders more frequented stations during peak rides.  
 * Make incentives in forms of discounts and care packages available for new members.






