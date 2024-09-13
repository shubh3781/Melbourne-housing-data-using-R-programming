# Melbourne Housing Data Analysis

## Objective

This project aims to analyze the housing dataset of Melbourne, focusing on the relationships between different variables such as house types, price distribution, and correlation between price and land size. The goal is to gain insights into the Melbourne housing market and explore the relationships between these features.

## Libraries and Tools Used

- **tidyverse**: For data manipulation and visualization.
- **plotly**: For interactive visualizations.
- **psych**: For statistical analysis.
- **dplyr**: For data wrangling.
- **ggplot2**: For creating visualizations.
- **ggthemes**: For additional themes in ggplot2.

## Dataset

The dataset used in this analysis contains various attributes of houses in Melbourne, including:

- **Rooms**: Number of rooms in the house.
- **Bathroom**: Number of bathrooms.
- **Car**: Number of car spots available.
- **Price**: Price of the house.
- **Landsize**: Size of the land in square meters.
- **Type**: Type of the house (e.g., house, townhouse, or unit).

The dataset was cleaned by removing any missing values using the `na.omit()` function, ensuring that the analysis is performed on complete data.

```R
housing.dataset <- na.omit(housing.dataset)
```

## Data Analysis

### House Types Distribution

The distribution of house types was visualized using a pie chart, showing the breakdown of houses (H), townhouses (T), and units (U).

```R
type <- c(6628, 726, 1541)
labels <- c("H", "T", "U")
pie(type, labels, main = 'House Types', col = c("green", "blue", "red"))
```

### Car Spaces in Houses

A bar chart was created to visualize the number of cars that can be parked in the available houses.

```R
barplot(housing.dataset$Car, xlab = 'Car', ylab = 'Number of cars', main = 'Bar chart of cars in one house')
```

### Price Distribution

A histogram was created to show the distribution of house prices in the dataset, along with statistical measures such as the mean, median, and variance.

```R
hist(housing.dataset$Price, xlab = 'Price', main = 'Histogram of price')
mean(housing.dataset$Price)
median(housing.dataset$Price)
var(housing.dataset$Price)
```

### Scatter Plot of Rooms vs. Bathrooms

A scatter plot was generated to visualize the relationship between the number of rooms and the number of bathrooms in houses.

```R
plot(x = housing.dataset$Rooms, y = housing.dataset$Bathroom, xlab = "Rooms", ylab = "Bathrooms", main = "Rooms vs Bathrooms")
```

### Price Categories: Low, Medium, and High

The dataset was divided into three categories based on price: low, medium, and high. The summary statistics for each category were examined to understand the differences.

```R
lowprice <- subset(housing.dataset, Price <= 640500)
medprice <- subset(housing.dataset, Price <= 1092524)
highprice <- subset(housing.dataset, Price > 1092524)
summary(lowprice)
summary(medprice)
summary(highprice)
```

### Box Plot of Price by House Type

A box plot was generated to compare the prices of different types of houses, providing a clear view of the price range for each type.

```R
boxplot(housing.dataset$Price ~ housing.dataset$Type, xlab = 'Price', ylab = 'Type', main = 'Price by House Type')
```

### Correlation Analysis

The correlation between house price, land size, and the number of rooms was calculated using the `cor()` function.

```R
hdpc <- data.frame(housing.dataset$Price, housing.dataset$Landsize, housing.dataset$Rooms)
cor(hdpc)
```

## Visualization

- **Scatter Plot of Price vs. Land Size**: A scatter plot was generated to visualize the relationship between house price and land size.

```R
ggplot(housing.dataset, aes(Price, Landsize, color = Price)) + geom_point(size = 2) + theme_classic()
```

- **Scatter Plot of Type vs. Price**: A scatter plot to compare house type against price.

```R
ggplot(housing.dataset, aes(Type, Price, color = Price)) + geom_point(size = 2) + theme_linedraw()
```

## Conclusion

This analysis provided insights into the distribution of house types, price ranges, and the relationships between various features such as price, land size, and house type. Key findings include:
- **Most houses** are priced between a specific range, with clear outliers.
- **House type** has a significant impact on the price.
- There is a notable **correlation** between price and land size.

## License

This project is licensed under the MIT License.
