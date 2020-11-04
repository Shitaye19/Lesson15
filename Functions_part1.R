
library(tidyverse)
library(gapminder)

dir.create("figures")
dir.create("figures/Europe")

##create a list of countries. Calculations go here, not in the for loop

gap_europe <-  gapminder %>% 
  filter(continent == "Europe") %>% 
  mutate(gdpTot = gdpPercap*pop)



country_list <- unique(gap_europe$country)  # ? unique () returns the unique value
  
#(cntry = country_list[1])

for (cntry in country_list){ 
  
  ## filter the country to plot
  
  gap_to_plot <- gap_europe %>% 
    
    filter(country == cntry)
  
  ##add a print message to see what's plotting
  
  print(paste("Plotting", cntry))
  
  ##plot
  
  my_plot <-  ggplot(data = gap_to_plot, aes(x=year, y = gdpTot)) +
    
    geom_point() +
    
    
  ## add title and save
    
    labs (title = paste(cntry, "GDP per capita" , sep = " "))
  
  ggsave(filename = paste("figures/Europe/", cntry, "_gdpTot.png", sep = ""), plot = my_plot)
  
  
}


est <- readr::read_csv('https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/countries_estimated.csv')
gapminder_est <- left_join(gapminder, est)



##


dir.create("figures") 
dir.create("figures/Europe") 

## create a list of countries. Calculations go here, not in the for loop
gap_europe <- gapminder_est %>%  # Here we use the gapminder_est that includes information on whether data were estimated
  filter(continent == "Europe") %>%
  mutate(gdpTot = gdpPercap * pop)

country_list <- unique(gap_europe$country) # ?unique() returns the unique values

for (cntry in country_list) { # (cntry = country_list[1])
  
  ## filter the country to plot
  gap_to_plot <- gap_europe %>%
    filter(country == cntry)
  
  ## add a print message to see what's plotting
  print(paste("Plotting", cntry))
  
  ## plot
  my_plot <- ggplot(data = gap_to_plot, aes(x = year, y = gdpTot)) + 
    geom_point() +
    ## add title and save
    labs(title = paste(cntry, "GDP per capita", sep = " "))
  
  ## if estimated, add that as a subtitle. 
  if (gap_to_plot$estimated == "yes") {
    
    ## add a print statement just to check
    print(paste(cntry, "data are estimated"))
    
    my_plot <- my_plot +
      labs(subtitle = "Estimated data")
  }
  #   Warning message:
  # In if (gap_to_plot$estimated == "yes") { :
  #   the condition has length > 1 and only the first element will be used
  
  ggsave(filename = paste("figures/Europe/", cntry, "_gdpTot.png", sep = ""), 
         plot = my_plot)
  
} 


# Working on the warning --------------------------------------------------



dir.create("figures")
dir.create("figures/Europe")


## create a list of countries. Calculations go here, not in the for loop

gap_europe <-  gapminder_est %>% # here we use the gapminder_est that includes information on w
  #hether data were estimated
  
  filter(continent == "Europe") %>% 
  mutate(gdpTot = gdpPercap * pop)

country_list <- unique(gap_europe$country)
  
  for (cntry in country_list) {
    
    gap_to_plot <- gap_europe %>% 
      
      filter(country ==cntry)
    ##add a print message to see what's ploting
    
    print(paste("Plotting", cntry))
    
    ## plot
    
    my_plot <-  ggplot(data = gap_to_plot, aes(x = year, y = gdpTot))+
      
      geom_point() +
      
      labs(title = paste(cntry, "_GDP per capita", sep = " "), plot = my_plot)
    
  }











