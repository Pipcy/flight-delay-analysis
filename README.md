# flight-delay-analysis
A project by Pippi Pi, Sydnee Funai, and Elizabeth Ricardo

Link to the full documentation and analysis: https://docs.google.com/document/d/1u3LtYWEx8nykEkIOPc0D0AQOn9bYLUgW4fWfGFp9wXo/edit?usp=sharing



Flight delays are at their highest rates since 2014, with 20.1% of all flights being delayed for more than fifteen minutes. This obviously serves as a great inconvenience for many travelers and airports alike. What is the cause of this increase in the number of delays? Travel experts attribute it to the shortage of pilots and airport workers that occurred as a result of employee cuts during the pandemic. The insufficient number of workers serves as a great challenge that airports must tackle in order to reduce the number of flight delays. One of the airlines that is struggling the most is Endeavor Air, which we take a closer look at in our plot analyses. Endeavor, which is based in Minneapolis and is a subsidy of Delta Airlines, has had a 138.3% increase in delays. In our project we locate exactly which airlines have the most delays, and break the data down over a set of months, in order to give a clear answer as to which airline is best to fly on during any time of year. We also took a particularly close look at Boston airlines, in order to provide a way for students in the Boston area to determine which airline to take if they wish to avoid delays. We believe that our plots displaying airlines of varying sizes and their rates of flight delays will serve as a helpful tool.

Our Dataset: https://www.kaggle.com/datasets/jawadkhattak/us-flight-delay-from-january-2017-july-2022

Our Background Sources: https://www.valuepenguin.com/travel/delays-cancellations-bags-study


We first began by loading in our dataset and extracting data. We removed data from 2020, as we felt the numbers would be too greatly impacted by the no-travel laws put in place during the pandemic. In order to prevent this from impacting our data, we chose to remove all of 2020. We also removed values that were empty or missing. 

We wanted to analyze the airports based on size, we did this by first plotting the number of incoming flights each airline had. Those that had more than 100,000 flights were considered to be large, those in the range of 10,000-100,000 incoming flights were classified as medium, and those with less than 10,000 were considered to be small. 

Next, we wanted to analyze which airlines would be best to use if travelers wish to avoid delays. 
