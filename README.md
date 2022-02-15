# Introduction to Sampling Distributions
In real life scenarios we don't know the population parameter <img src="https://latex.codecogs.com/svg.image?\mu&space;" title="\mu " /> and <img src="https://latex.codecogs.com/svg.image?\sigma&space;" title="\sigma " /> , in this case we have to reply on the sample statistics to estimate these population parameters. When we take a single sample and caclutate the sample mean <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" />   it is called the point estimator of the population mean <img src="https://latex.codecogs.com/svg.image?\mu&space;" title="\mu " /> . The population parameters is always fixed, however a statistics can assume different values depending on the sample from which it is computed. If we repeat the process of selecting a simple random sample of size **n** from a population of size **N** over and over again, each time computing the values of sample mean <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> we will have a distribution of sample mean <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> . This distribution of the statistics is called the sampling distribution.

## Sampling Distribution of Sample Mean  
If we consider the process of selecting a simple random sample as an experiement, the sample mean <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> is the numerical description of the outcome of the experiment. Thus, the sample mean <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> is a random variable and just like any other random variable it has a mean or expected value <img src="https://latex.codecogs.com/svg.image?E(\overline{x})" title="E(\overline{x})" /> , a standard deviation <img src="https://latex.codecogs.com/svg.image?\sigma&space;/&space;\sqrt{n}&space;" title="\sigma / \sqrt{n} " /> , and a probability distribution of all possible values of the sample mean <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> .

### It is important to understand here What a Simple Random Sample is?
A **simple random sample** of size **n** from a population of size **N** is a sample selected such that each possible sample of size ***n*** has the same probability **1/N** of being selected. There are two ways of selecting a unit from a sample - with replacement and without replacement. 

## Shape of the Sampling Distribution
* **Population has a normal distribution:** Here, the sampling distribution of <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> is also normal for any sample size. 
* **Population does not have a normal distribution:** Here, the sampling distribution of <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> is non-normal for small samples, but normal for large samples ( <img src="https://latex.codecogs.com/svg.image?n&space;\geq&space;30" title="n \geq 30" /> ). 
## In the example below we will use R-programming to illustrate the effect of sampling distribution of <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> . 
* ***Example:*** Suppose we have been asked to develop a profile of the company's all data science managers. The characteristics to be identified include the mean annual salary for the managers. Now suppose using the details of all the managers in the personnel database we could compute the population mean annual salary <img src="https://latex.codecogs.com/svg.image?\mu&space;" title="\mu " /> = $51,800, and population standard deviation <img src="https://latex.codecogs.com/svg.image?\sigma&space;" title="\sigma " /> = $4000. We will use these population parameters as a reference to check how close our sample mean <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> comes close to the population mean <img src="https://latex.codecogs.com/svg.image?\mu&space;" title="\mu " /> . Now, suppose that we don't have the necessary information on all the managers, and the mean annual salary details is not readily available to us. The question now is how we can obtain estimates of the population parameters by using a sample of managers rather than all the managers in the entire population. Suppose that a sample without replacement of 30 managers will be used, and we will repeat this experiment for 500 times. Clearly, the time and the cost of developing a profile would be substantially less for 30 managers than for the entire population. We will expect that the largest concentration of the <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> values and the mean of the 500 <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> values is near to the population mean <img src="https://latex.codecogs.com/svg.image?\mu&space;" title="\mu " /> = $51,800. As per the Central Limit Theorem the mean of all possible <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> values, which is referred to as the expected value of <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> is <img src="https://latex.codecogs.com/svg.image?E(\overline{x})" title="E(\overline{x})" /> = <img src="https://latex.codecogs.com/svg.image?\mu&space;" title="\mu " /> , the expected value or mean of the sampling distribution of <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> is equal to the mean of the population. Hence the mean of all possible sample mean for our example is also $51800. Now, if the population has a normal distribution, the sampling distribution of <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> is normally distributed. If the population does not have a normal distribution, the simple random sample of 30 managers and the Central Limit Theorem enable us to conclude that the sampling distribution of <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> can be approximated by a normal distribution.  

* Below is the implementation of this example in R-programming:
```
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
```

Let's create bins to see the distribution of all the values of the sample means. 

```
bin_names <- c("[49,500.00-49,999.99)","[50,000.00-50,499.99)", "[50,500.00-50,999.99)",
               "[51,000.00-51,499.99)", "[51,500.00-51,999.99)", "[52,000.00-52,499.99)", 
               "[52,500.00-52,999.99)","[53,000.00-53,499.99)", "[53,500.00-53,999.99)")


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
```

* Because we now have identified the properties of the sampling distribution of sample mean <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> , we can use this distribution to answer the question like: What is the probability that the sample mean computed using a simple random sample of 30 managers will be within $500 of the population mean? i.e. <img src="https://latex.codecogs.com/svg.image?P(51,300&space;\leq&space;\overline{x}&space;\leq&space;52,300)" title="P(51,300 \leq \overline{x} \leq 52,300)" /> , where <img src="https://latex.codecogs.com/svg.image?E(\overline{x})" title="E(\overline{x})" /> = <img src="https://latex.codecogs.com/svg.image?\mu&space;" title="\mu " /> = $51,800 and standard deviation of sample mean <img src="https://latex.codecogs.com/svg.image?\overline{x}" title="\overline{x}" /> is <img src="https://latex.codecogs.com/svg.image?\sigma&space;/&space;\sqrt{n}&space;" title="\sigma / \sqrt{n} " /> = 730.30.
* In R-Programming we can use the below code to calculate the required properties under the curve between these two values: 

```
pnorm(52300, mean=51800, sd=730.30, lower.tail = TRUE) - pnorm(51300, mean=51800, sd=730.30, lower.tail = TRUE)
```

   
