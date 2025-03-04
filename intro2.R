cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_catnip = c(1, 0, 1))
cats$weight
cats$coats
cats
cats$coat


typeof(cats$weight)
typeof(cats$coat)
typeof(cats$likes_catnip)
typeof(1L)  # long (int)
typeof(1+1i) # complex
typeof(TRUE)  # logical
typeof("hi")  # character
typeof(cats$likes_catnip)  # double

as.logical(cats$likes_catnip)
cats$likes_catnip <- as.logical(cats$likes_catnip)
cats

as.character(TRUE)

# a vector is a a data type where all of the elements have the same type
c(3.14, TRUE, "banana")

list(3.14, TRUE, "banana")

# a dataframe is a list of vectors of the same length
typeof(cats)

# indexing starts at 1, first index is row, second is column
cats[1,2]

cats

cats[1,]
cats[, 2]

getwd()
setwd("data")
getwd()
ls()

write.csv(x = cats, file = "feline-data.csv", row.names = FALSE)

str(cats)

additional_cat <- data.frame(coat = "tabby", weight = "2.3 or 2.4", likes_catnip = TRUE)
additional_cat

cats2 <- rbind(cats, additional_cat)
cats2
typeof(cats2$weight)
str(cats2)

my_vector <- vector(length = 3)
my_vector

another_vector <- vector(mode='character', length=3)
another_vector

str(another_vector)
str(cats$weight)

# Default coercion rules: logical -> integer -> double (“numeric”) -> complex -> character
quiz_vector <- c(2,6,'3')
coercion_vector <- c('a', TRUE)
another_coercion_vector <- c(0, TRUE)

# Coercion in the other direction need to be forced
character_vector_example <- c('0','2','4')
character_coerced_to_double <- as.double(character_vector_example)
as.double(my_vector)

a_vector <- 1:26
a_vector * 2

list_example <- list(1, "a", TRUE, 1+4i)

pizza_price <- c( pizzasubito = 5.64, pizzafresh = 6.60, callapizza = 4.50 )
pizza_price["pizzafresh"]
names(pizza_price)
str(names(pizza_price))

letter_no <- 1:26
LETTERS
names(letter_no) <- LETTERS
letter_no["C"]
letter_no["J"]

cats
cats[1]
typeof(cats[1])
names(cats[1])
str(cats[1])

cats[[1]]
typeof(cats[[1]])
str(cats[[1]])

cats$coat
str(cats$coat)
cats[1] == cats["coat"]

cats[1, 1]
cats[, 1]
cats[1, ]

names(cats)[2] <- "weight_kg"

matrix_example <- matrix(0, ncol=6, nrow=3)
matrix_example
length(matrix_example)

matrix2 <- matrix(1:50, ncol = 5, nrow = 10)
matrix2

matrix3 <- matrix(1:50, ncol = 5, nrow = 10, byrow = TRUE)
matrix3

# get data
gapminder <- read.csv("data/gapminder_data.csv")

getwd()

str(gapminder)
summary(gapminder)
dim(gapminder)

head(gapminder)

library("ggplot2")
ggplot(data = gapminder)

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) +
  geom_line()

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, group=country, color=continent)) +
  geom_line() + geom_point()

ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, group=country)) +
  geom_line(mapping = aes(color=continent)) + geom_point()

ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, group=country)) +
  geom_point() + geom_line(mapping = aes(color=continent))

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10()

rm(cats)
rm(gapminder)


# Start of last afternoon

library(ggplot2)

# get data
gapminder <- read.csv("data/gapminder_data.csv")

americas <- gapminder[gapminder$continent == "Americas",]

ggplot(americas, mapping = aes(x=year, y=lifeExp)) + 
  geom_line() + facet_wrap(~country)

panel_plot <- 
  ggplot(americas, mapping = aes(x=year, y=lifeExp, color=continent)) + 
  geom_line() + facet_wrap(~country) + 
  theme(axis.text.x = element_text(angle=45, size=8), axis.text.y = element_text(size=6)) +
  labs(title = "Life Expectancy by Year", x = "Year", 
       y = "Life Expectancy", color = "Continent")

ggsave("results/panelplot.pdf", plot = panel_plot)
