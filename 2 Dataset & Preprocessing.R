library(tidyverse)

AB_NYC_2019 <- read_csv("Desktop/ML team project/AB_NYC_2019.csv",
  col_types = cols(
    id = col_integer(), 
    host_id = col_integer(),
    minimum_nights = col_integer(), 
    number_of_reviews = col_integer(), 
    last_review = col_date(format = "%Y-%m-%d"), 
    calculated_host_listings_count = col_integer(), 
    availability_365 = col_integer()
  )
)

# turn category columns into factors
AB_NYC_2019$neighbourhood_group <- factor(AB_NYC_2019$neighbourhood_group)
levels(AB_NYC_2019$neighbourhood_group)
AB_NYC_2019$neighbourhood <- factor(AB_NYC_2019$neighbourhood)
levels(AB_NYC_2019$neighbourhood)
# checked these are all distinct neighbourhoods - they are
# Bay Terrace & Bay Terrace, Staten Island
# Hollis & Holliswood
# Jamaica & Jamaica Estates & Jamaica Hills
# Kew Gardens & Kew Gardens Hills
# New Dorp & New Dorp Beach
AB_NYC_2019$room_type <- factor(AB_NYC_2019$room_type)
levels(AB_NYC_2019$room_type)

# loop through all columns to find NA values
for (cn in colnames(AB_NYC_2019)) {
  cat(cn, ": ", sum(is.na(AB_NYC_2019[[cn]])), "\n")
}
# name :  16 
# host_name :  21 
# last_review :  10052 
# reviews_per_month :  10052 

# loop through numeric columns to find 0 values
for (cn in c("id", "host_id", "latitude", "longitude", "price", "minimum_nights", "calculated_host_listings_count", "availability_365")) {
  cat(cn, ":\n")
  print(filter(AB_NYC_2019, !!as.symbol(cn) == 0))
}
# 11 rows with price 0
# 17,533 rows with availability_365 0

# check for duplicates in id
table(duplicated(AB_NYC_2019$id))
# FALSE 
# 48895 

# check min and max of latitude
summary(AB_NYC_2019$latitude)
# Min.   Max. 
# 40.50  40.91 

# check min and max of longitude
summary(AB_NYC_2019$longitude)
# Min.   Max. 
# -74.24 -73.71 

# check min and max of price without 0 values
AB_NYC_2019 %>% 
  select(price) %>% 
  filter(price > 0) %>% 
  summary()
# Min.   Max. 
# 10     10000 

# box plot of price without 0 values
AB_NYC_2019 %>% 
  filter(price > 0) %>% 
  ggplot(aes(y = price)) +
  geom_boxplot()
# price has many very large values
print(n = 50,
  AB_NYC_2019 %>%
    select(price) %>% 
    arrange(desc(price))
)
#239 have price of greater than 1000
AB_NYC_2019 %>% 
  filter(price > 1000) 

# check min and max of minimum_nights
summary(AB_NYC_2019$minimum_nights)
# Min.   Max. 
# 1     1250 

# box plot of minimum_nights
AB_NYC_2019 %>% 
  ggplot(aes(y = minimum_nights)) +
  geom_boxplot()
# minimum_nights has many very large values
AB_NYC_2019 %>%
  select(minimum_nights) %>% 
  arrange(desc(minimum_nights))
#14 have minimum_nights greater than 365
AB_NYC_2019 %>% 
  filter(minimum_nights > 365) 
#197 have minimum_nights greater than 90
AB_NYC_2019 %>% 
  filter(minimum_nights > 90) 

# check min and max of number_of_reviews
summary(AB_NYC_2019$number_of_reviews)
# Min.   Max. 
# 0      629 

# check min and max of last_reviews
summary(AB_NYC_2019$last_review)
# Min.         Max. 
# "2011-03-28" "2019-07-08" 

# check min and max of reviews_per_month
summary(AB_NYC_2019$reviews_per_month)
# Min.   Max. 
# 0.010  58.500 

# check min and max of calculated_host_listings_count
summary(AB_NYC_2019$calculated_host_listings_count)
# Min.   Max. 
# 1      327

# box plot of calculated_host_listings_count
AB_NYC_2019 %>% 
  ggplot(aes(y = calculated_host_listings_count)) +
  geom_boxplot()
# calculated_host_listings_count has some very large values
AB_NYC_2019 %>% 
  count(calculated_host_listings_count) %>% 
  arrange(desc(calculated_host_listings_count))

# check min and max of availability_365
summary(AB_NYC_2019$availability_365)
# Min.   Max. 
# 0      365