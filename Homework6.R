library(tidyr)
library(ggplot2)

# Load data
load("C:/Users/Owner/Downloads/house_prices.rda")
colnames(house_prices)
head(house_prices)
library(dplyr)

# Extract year from date
house_prices <- house_prices %>% mutate(year = as.numeric(format(date, "%Y")))

# (a) Facet wrap line plot
ggplot(house_prices, aes(x = year, y = house_price_index)) +
  geom_line() +
  facet_wrap(~ state) +
  scale_x_continuous(
    breaks = c(1980, 2000, 2020),
    labels = c("'80", "'00", "'20")
  ) +
  labs(title = "House Price Index by State", x = "Year", y = "House Price Index")

# (b) Reshape with gather()
house_reshaped <- house_prices %>%
  gather(measure, value, house_price_index, unemploy_perc,
         -state, -year)

# (c) Two lines per state
ggplot(house_reshaped, aes(x = year, y = value, color = measure)) +
  geom_line() +
  facet_wrap(~ state) +
  scale_x_continuous(
    breaks = c(1980, 2000, 2020),
    labels = c("'80", "'00", "'20")
  ) +
  labs(title = "House Price Index vs Unemployment by State",
       x = "Year", y = "Value", color = "Measure")

# Comment: This is NOT a good graph because house_price_index and
# unemploy_perc are on completely different scales, making it very
# hard to compare them on the same y-axis.