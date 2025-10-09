
library(dplyr)
library(ggplot2)
library(tidyr)
library(scales)
library(corrplot)

data("EuStockMarkets")
head(EuStockMarkets)

stocks <- as.data.frame(EuStockMarkets)

stocks$date <- seq(as.Date("1991-01-01"), by = "days", length.out = nrow(stocks))

glimpse(stocks)
summary(stocks)
View(stocks)

colSums(is.na(stocks))

stocks <- stocks %>% distinct()

# univariate analysis
# Due to time series, line plot is best
ggplot(stocks, aes(x = date, y = DAX)) +
  geom_line(color = "darkblue") +
  labs(title = "DAX Index Trend", x = "Date", y = "Index Value") +
  theme_minimal()

ggplot(stocks, aes(x = date, y = SMI)) +
  geom_line(color = "darkblue") +
  labs(title = "SMI Index Trend", x = "Date", y = "Index Value") +
  theme_minimal()

ggplot(stocks, aes(x = date, y = CAC)) +
  geom_line(color = "darkblue") +
  labs(title = "CAC Index Trend", x = "Date", y = "Index Value") +
  theme_minimal()

ggplot(stocks, aes(x = date, y = FTSE)) +
  geom_line(color = "darkblue") +
  labs(title = "FTSE Index Trend", x = "Date", y = "Index Value") +
  theme_minimal()

# Histograms are used for distribution
ggplot(stocks, aes(x = DAX)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  labs(title = "Distribution of DAX Values")

ggplot(stocks, aes(x = CAC)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  labs(title = "Distribution of CAC Values")

ggplot(stocks, aes(x = SMI)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  labs(title = "Distribution of SMI Values")

ggplot(stocks, aes(x = FTSE)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  labs(title = "Distribution of FTSE Values")

# Boxplots to check for outliers and check spread
stocks %>%
  pivot_longer(
    cols = c(DAX, SMI, CAC, FTSE),
    names_to = "Index",
    values_to = "Value"
  ) %>%
  ggplot(aes(x = Index, y = Value, fill = Index)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Boxplot of European Stock Indices",
       x = "Index", y = "Value")

#Bivariate analysis
ggplot(stocks, aes(x = DAX, y = CAC)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "loess", se = FALSE, color = "red") +
  labs(title = "DAX vs CAC", x = "DAX", y = "CAC")

ggplot(stocks, aes(x = DAX, y = SMI)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "loess", se = FALSE, color = "red") +
  labs(title = "DAX vs SMI", x = "DAX", y = "SMI")

ggplot(stocks, aes(x = DAX, y = FTSE)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "loess", se = FALSE, color = "red") +
  labs(title = "DAX vs FTSE", x = "DAX", y = "FTSE")

ggplot(stocks, aes(x = CAC, y = SMI)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "loess", se = FALSE, color = "red") +
  labs(title = "CAC vs SMI", x = "CAC", y = "SMI")
ggplot(stocks, aes(x = CAC, y = FTSE)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "loess", se = FALSE, color = "red") +
  labs(title = "CAC vs FTSE", x = "CAC", y = "FTSE")

ggplot(stocks, aes(x = SMI, y = FTSE)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "loess", se = FALSE, color = "red") +
  labs(title = "SMI vs FTSE", x = "SMI", y = "FTSE")

cor(stocks[, 1:4])
pairs(stocks[, 1:4], main = "Pairwise Relationships of European Stock Indices")

# Multivariate analysis
stocks %>%
  pivot_longer(cols = c(DAX, SMI, CAC, FTSE), names_to = "Index", values_to = "Value") %>%
  ggplot(aes(x = date, y = Value, color = Index)) +
  geom_line() +
  labs(title = "Trends of European Stock Indices (1991–1998)", x = "Date", y = "Index Value") +
  theme_minimal()


corr_matrix <- cor(stocks[, c("DAX", "SMI", "CAC", "FTSE")])
corrplot(corr_matrix, method = "color", type = "upper", 
         addCoef.col = "black", tl.col = "black",
         title = "Correlation Heatmap of European Stock Indices", mar = c(0,0,2,0))









