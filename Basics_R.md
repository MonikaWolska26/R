# R

	mean() - średnia
	median() - mediana
	moda/dominanta: library(DescTools) Mode()
	variance()- variancja #wraz ze wzrostem wartości wariancji, zróżnicowanie wyników rośnie
	sd() - odchylenie standardowe # jak szeroko wartości danej wielkości są rozrzucone wokół  średniej

"68% of your data to fall within one standard deviation of the mean, 
95% of your data to fall within two standard deviations of the mean, 
and 99.7% of your data to fall within three standard deviations of the mean"

	quantile(dataset, 0.25) - Q1 
	quantile(dataset, 0.5) - Q2 = median
	quantile(dataset, 0.75) - Q3
	IQR() - interquile range - q3 - q1 - rozstęp ćwiartkowy #Im większy rozstęp kwartylny, tym bardziej zróżnicowana jest cecha 	statystyczna

	max()
	min()

### Hipotezy:
- H0: no difference between sth you comparing
- H1: opposite of H0

### p-value 

p-value is the probability that, assuming the null hypothesis is true, you would see at least such a difference in the sample means of your data.
poziom istotności 

### One Sample T-Test

	t.test(sample_distribution, mu = expected_mean)
	
### Two Sample T-Test

H0: two distributions have the same mean

	t.test(distribution_1, distribution_2)

### Type I Error

A Type I error occurs when a hypothesis test finds a correlation between things that are not related. This error is sometimes called a “false positive” and occurs when the null hypothesis is rejected even though it is true.
	
### Type II Error

Type II error, is failing to find a correlation between things that are actually related. 
This error is referred to as a “false negative” and occurs when the null hypothesis is not rejected even though it is false.

	intersect(vactor1, vector2) - zwraca wektor wartości wspólnych

###  ANOVA

to compare more than two numerical datasets

	aov(score ~ group, data = df_scores)
	summary()

###  HISTOGRAM

	hist()
