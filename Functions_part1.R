
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
  
  if(any(gap_to_plot$estimated == "yes")) {
    
    ## add a print statment just to check
    
    print(paste(cntry, "data are estimated"))
    
    my_plot <- my_plot +
      
      labs(subtitle = "Estimated data")
    
  } else {
    
    print(paste(cntry, "data are reported"))
    
    my_plot <- my_plot + 
      
      labs(subtitle = "Reported data")}
    
  
  
  ggsave(filename = paste("figures/Europe/", cntry, "_gdpTot.png", sep = ""), plot = my_plot)
  
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



if (any(gap_to_plot$estimated == "yes")) { # any() will return a single TRUE or FALSE
  
  
  print(paste(cntry, "data are estimated"))
  
}else if(any(gap_to_plot$estimated == "no")) {
  
  
  print(paste (cntry, "data are reported"))
  
  my_plot <-  my_plot +
    
    labs(subtitle = "Reported data")
  
}

dir.create("figures")
dir.create("figures/Europe")

## create a list of countries. calculations go here, not in the for loop

gap_europe <- gapminder_est %>% 
  
  filter (continent == "Europe")%>% 
  
  mutate(gdpTot = gdpPercap * pop)

country_list <- unique(gap_europe$country)

for (cntry in country_list) {
  
  gap_to_plot <- gap_europe %>% 
    
    filter(country == cntry)
  
  #plot
  
  my_plot <- ggplot(dat = gap_to_plot, aes(x = year, y = gdpTot)) +
    
    labs(title= paste(cntry, "GDP per capita", sep = " "), 
         subtitle = ifelse(any(gap_to_plot$estimated =="yes"), "Estimated data", "Reportd data"))
  
  
  ggsave(filename = paste("figures/Europe/", cntry, "_gdpTot.png", sep = ""), plot = my_plot)
  
  
}


##looping with an index and storing results

for (i in 1:10) {
  
  print(paste("Part_", i, sep = ""))
  
}


##try this code I may be able to do the calculation of CI and linearized scale simply without forloop
gap_europe <-  gapminder_est %>% 
  
  filter(continent == "Europe") %>% 
  
  mutate(gdpTot = gdpPercap * pop)

#The below that I used to calculate CI or linerized scale could be inefficint try to look an option for this

gapminder$gdpTot = vector(length = nrow(gapminder))

for (i in 1:nrow(gapminder)) {
  
  gapminder$gdpTot[i]<-gapminder$gdpPercap[i]*gapminder$pop[i]
}


##Functions

dir.create("figures")
dir.create("figures/Europe")

gap_europe <-   gapminder %>% 
  
  filter(continent == "Europe") %>% 
  
mutate(gdpTot = gdpPercap * pop)


country_list <-gap_europe$country

for(cntry in country_list) {
  
  ## filter the country to plot
  
  gap_to_plot <-  gap_europe %>% 
    
    filter(country == cntry)
  
  print(paste("Plotting", cntry))
  
  ## plot
  
  my_plot <- (ggplot(gap_to_plot, aes(x = year, y = gdpTot)))+
    
    geom_point()+
  
  labs(title = paste(cntry, "GDP per capita", sep = " "))
  
  
  ggsave(filename = paste("figures/Europe/", cntry, "_gdpTot.png", sep = ""), plot = my_plot)
  
  
}

dir.create("figures")

dir.create("figures/Europe")


## calculations go here, not in the for loop

gap_europe<- gapminder %>% 
  
  filter (continent == "Europe") %>% 
  
  filter(continent == "Europe") %>% 
  
  mutate(gdpTot = gdpPercap * pop)



#country_list <-gap_europe$country We no longer need country list
#for(cntry in country_list) { we are not looping at first


print_plot <- function(cntry){ # instead we define a function that will operate on whatever we assign to cntry
  
  ## filter the country to plot
  
  gap_to_plot <-  gap_europe %>% 
    
    filter(country == cntry)
  
  ## add a print message to see what's plotting
  
  print(paste("Plotting", cntry))
  
  ## plot
  
  my_plot <-  ggplot(data = gap_to_plot, aes (x = year, y = gdpTot)) +
    
    geom_point() +
    
    ## add title and save
    
    labs(title = paste(cntry, "GDP per capita", sep = " "))
  
  ggsave(filename = paste("figures/Europe/", cntry, "_gdpTot.png", sep = ""), plot = my_plot)
  
  
  
} # We close the body of our function with a cruly bracket



ap_europe <- gapminder %>%
  filter(continent == "Europe") %>%
  mutate(gdpTot = gdpPercap * pop)

#define our function
print_plot <- function(cntry) {
  
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
  
  ggsave(filename = paste("figures/Europe/", cntry, "_gdpTot.png", sep = ""), plot = my_plot)
} 











