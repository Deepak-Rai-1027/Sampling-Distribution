# Sample R-script to generate sampling distribution of 500 random samples of size 30.

mean_x = 0

for (i in 1:500){
  
  # Random Sample with mu=51800 sd=4000 
  x <- rnorm(30, mean = 51800, sd = 4000)
  mean_x[i] = mean(x)
}

length(mean_x)
summary(mean_x)
mean(mean_x)
sd(mean_x)
hist(mean_x, main="Sampling Distribution of sample mean", 
     xlab="Sample Means")


# Creating BINS

bin_names <- c("[49,500.00-49,999.99)","[50,000.00-50,499.99)", "[50,500.00-50,999.99)",
               "[51,000.00-51,499.99)", "[51,500.00-51,999.99)", "[52,000.00-52,499.99)", 
               "[52,500.00-52,999.99)","[53,000.00-53,499.99)", "[53,500.00-53,999.99)")


#?cut()
bin_distribution <- cut(mean_x, breaks=9, include.lowest=TRUE, right=FALSE, 
                        labels=bin_names)

summary(bin_distribution)


# Plotting the Bin Distribution
install.packages("tidyverse")
library(tidyverse)


ggplot(data = as_tibble(bin_distribution), mapping = aes(x=value)) + 
  geom_bar(fill="bisque",color="white",alpha=0.7) + 
  stat_count(geom="text", aes(label=sprintf("%.4f",..count../length(bin_distribution))), vjust=-0.5) +
  labs(x='Sampling Distribution of mean') +
  theme_minimal() 
