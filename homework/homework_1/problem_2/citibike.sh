#!/bin/bash
#
# add your solution after each of the 10 comments below
#

# count the number of unique stations
cut -d, -f5 201402-citibike-tripdata.csv | sort | uniq | wc -l

# count the number of unique bikes
cut -d, -f12 201402-citibike-tripdata.csv | sort | uniq | wc -l

# extract all of the trip start times
cut -d, -f2 201402-citibike-tripdata.csv | sort 

# count the number of trips per day
#   Note: one trip belongs to day I if its starting time is in day I.
# 	this is to clarify for situations where a trip starts on day I 
# 	and ends on day II
cut -d, -f2 201402-citibike-tripdata.csv | cut -c 2-11 | uniq -c

# find the day with the most rides
cut -d, -f2 201402-citibike-tripdata.csv | cut -c 2-11 | uniq -c | sort -k 1,5 -nr | head

# find the day with the fewest rides
cut -d, -f2 201402-citibike-tripdata.csv | cut -c 2-11 | uniq -c | sort -k 1,5 -n | head

# find the id of the bike with the most rides
cut -d, -f12 201402-citibike-tripdata.csv | sort | uniq -c | sort -nr 

# count the number of riders by gender and birth year
awk -F, '{counts[$15]++ counts[$14]++} END {for (entry in counts) print counts[entry]"\t"entry}' | sort -k2.3n

# count the number of trips that start on cross streets that both contain numbers (e.g., "1 Ave & E 15 St", "E 39 St & 2 Ave", ...)
awk -F, '$5 ~ /[0-9]/ && $9 ~ /[0-9]/' 201402-citibike-tripdata.csv | wc -l

# compute the average trip duration


