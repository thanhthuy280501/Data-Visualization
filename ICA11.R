# Use read.csv for text files like .csv
flights <- read.csv("C:/Users/Owner/Downloads/DATA-20260321T034134Z-3-001/DATA/flights.csv")

# Check if it loaded correctly
head(flights)

library(ggplot2)
library(dplyr)
# 2. Fix the month order (Crucial so it doesn't stay alphabetical)
flights$month <- factor(flights$month, levels = month.name)

# 3. The final "Perfect" Plot
ggplot(flights, aes(x = year, y = passengers, color = month, group = month)) +
  geom_line(linewidth = 1) +  # Use 'linewidth' instead of 'size' to avoid warnings
  geom_point() +              # Adds the dots to the lines
  labs(
    title = "Flight Performance by Month (1949 - 1960)",
    x = "Year",               # Name for x-axis
    y = "Number of Passengers" # Name for y-axis
  ) +
  theme_minimal()