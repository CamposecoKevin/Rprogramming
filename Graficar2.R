
| Please choose a lesson, or type 0 to return to course menu.

 1: Principles of Analytic Graphs   2: Exploratory Graphs              3: Graphics Devices in R        
 4: Plotting Systems                5: Base Plotting System            6: Lattice Plotting System      
 7: Working with Colors             8: GGPlot2 Part1                   9: GGPlot2 Part2                
10: GGPlot2 Extras                 11: Hierarchical Clustering        12: K Means Clustering           
13: Dimension Reduction            14: Clustering Example             15: CaseStudy                    


Selection: 3
  |                                                                                                         |   0%

| Graphics_Devices_in_R. (Slides for this and other Data Science courses may be found at github
| https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip
| file and viewed locally. This lesson corresponds to 04_ExploratoryAnalysis/Graphics_Devices_in_R.)

...

  |===                                                                                                      |   3%
| As the title suggests, this will be a short lesson introducing you to graphics devices in R. So, what IS a
| graphics device?

...

  |======                                                                                                   |   6%
| Would you believe that it is something where you can make a plot appear, either a screen device, such as a
| window on your computer, OR a file device?

...

  |=========                                                                                                |   9%
| There are several different kinds of file devices with particular characteristics and hence uses. These include
| PDF, PNG, JPEG, SVG, and TIFF. We'll talk more about these later.

...

|============                                                                                             |  12%
| To be clear, when you make a plot in R, it has to be "sent" to a specific graphics device. Usually this is the
| screen (the default device), especially when you're doing exploratory work. You'll send your plots to files when
| you're ready to publish a report, make a presentation, or send info to colleagues.

...

  |===============                                                                                          |  15%
| How you access your screen device depends on what computer system you're using. On a Mac the screen device is
| launched with the call quartz(), on Windows you use the call windows(), and on Unix/Linux x11().  On a given
| platform (Mac, Windows, Unix/Linux) there is only one screen device, and obviously not all graphics devices are
| available on all platforms (i.e. you cannot launch windows() on a Mac).

...

|===================                                                                                      |  18%
| Run the R command ?Devices to see what graphics devices are available on your system.

> ?diveces
No documentation for ‘diveces’ in specified packages and libraries:
  you could try ‘??diveces’

| That's not the answer I was looking for, but try again. Or, type info() for more options.

| Type ?Devices at the command prompt.

> ?Devices

| You are really on a roll!

  |======================                                                                                   |  21%
| R Documentation shows you what's available.

...

|=========================                                                                                |  24%
| There are two basic approaches to plotting. The first, plotting to the screen, is the most common. It's simple -
| you call a plotting function like plot, xyplot, or qplot (which you call depends on the plotting system you
| favor, but that's another lesson), so that the plot appears on the screen. Then you annotate (add to) the plot
| if necessary.

...

|============================                                                                             |  26%
| As an example, run the R command with with 2 arguments. The first is a dataset, faithful, which comes with R,
| and the second is a call to the base plotting function plot. Your call to plot should have two arguments,
| eruptions and waiting. Try this now to see what happens.

> 
  > with(dataset, plot(eruptions,waiting))
Error in with(dataset, plot(eruptions, waiting)) : 
  object 'dataset' not found
> with(dataset, plot(eruptions,waiting))
Error in with(dataset, plot(eruptions, waiting)) : 
  object 'dataset' not found
> plot(eruptions,waiting))
Error: unexpected ')' in "plot(eruptions,waiting))"
> plot(eruptions,waiting)
Error in plot(eruptions, waiting) : object 'eruptions' not found
> with(faithful, plot(eruptions,waiting))

| You are really on a roll!
  
  |===============================                                                                          |  29%
| See how R created a scatterplot on the screen for you? This shows that relationship between eruptions of the
| geyser Old Faithful and waiting time. Now use the R function title with the argument main set equal to the
| string "Old Faithful Geyser data". This is an annotation to the plot.

> with(faithful, plot(eruptions,waiting, main = "Old Faithful Geyser data"))

| One more time. You can do it! Or, type info() for more options.

| Type title(main = "Old Faithful Geyser data") at the command prompt.

> title(main = "Old Faithful Geyser data")

| All that practice is paying off!
  
  |==================================                                                                       |  32%
| Simple, right?  Now run the command dev.cur(). This will show you the current plotting device, the screen.

> dev.cur()
RStudioGD 
2 

| All that practice is paying off!
  
  |=====================================                                                                    |  35%
| The second way to create a plot is to send it to a file device. Depending on the type of plot you're making, you
| explicitly launch a graphics device, e.g., a pdf file. Type the command pdf(file="myplot.pdf") to launch the
| file device. This will create the pdf file myplot.pdf in your working directory.

> pdf(file = "myplot.pdf")

| You got it right!

  |========================================                                                                 |  38%
| You then call the plotting function (if you are using a file device, no plot will appear on the screen). Run the
| with command again to plot the Old Faithful data. Use the up arrow key to recover the command and save yourself
| some typing.

> plotting(file = "myplot.pdf")
Error in plotting(file = "myplot.pdf") : 
  could not find function "plotting"
> plotting()
Error in plotting() : could not find function "plotting"
> with(faithful, plot(eruptions, waiting))

| Excellent job!

  |===========================================                                                              |  41%
| Now rerun the title command and annotate the plot. (Up arrow keys are great!)

> title(main = "Old Faithful Geyser data")

| Your dedication is inspiring!

  |==============================================                                                           |  44%
| Finally, when plotting to a file device, you have to close the device with the command dev.off(). This is very
| important! Don't do it yet, though. After closing, you'll be able to view the pdf file on your computer.

...

  |=================================================                                                        |  47%
| There are two basic types of file devices, vector and bitmap devices. These use different formats and have
| different characteristics. Vector formats are good for line drawings and plots with solid colors using a modest
| number of points, while bitmap formats are good for plots with a large number of points, natural scenes or
| web-based plots.

...

  |====================================================                                                     |  50%
| We'll mention 4 specific vector formats. The first is pdf, which we've just used in our example. This is useful
| for line-type graphics and papers. It resizes well, is usually portable, but it is not efficient if a plot has
| many objects/points.

...

  |========================================================                                                 |  53%
| The second is svg which is XML-based, scalable vector graphics. This supports animation and interactivity and is
| potentially useful for web-based plots.

...

  |===========================================================                                              |  56%
| The last two vector formats are win.metafile, a Windows-only metafile format, and postscript (ps), an older
| format which also resizes well, is usually portable, and can be used to create encapsulated postscript files.
| Unfortunately, Windows systems often don’t have a postscript viewer.

...

  |==============================================================                                           |  59%
| We'll also mention 4 different bitmap formats. The first is png (Portable Network Graphics) which is good for
| line drawings or images with solid colors. It uses lossless compression (like the old GIF format), and most web
| browsers can read this format natively. In addition, png is good for plots with many points, but it does not
| resize well.

...

|=================================================================                                        |  62%
| In contrast, jpeg files are good for photographs or natural scenes. They use lossy compression, so they're good
| for plots with many points. Files in jpeg format don't resize well, but they can be read by almost any computer
| and any web browser. They're not great for line drawings.

...

  |====================================================================                                     |  65%
| The last two bitmap formats are tiff, an older lossless compression meta-format and bmp which is a native
| Windows bitmapped format.

...

  |=======================================================================                                  |  68%
| Although it is possible to open multiple graphics devices (screen, file, or both), when viewing multiple plots
| at once, plotting can only occur on one graphics device at a time.

...

  |==========================================================================                               |  71%
| The currently active graphics device can be found by calling dev.cur(). Try it now to see what number is
| assigned to your pdf device.

> dev.cur()
pdf 
  4 

| You got it!

  |=============================================================================                            |  74%
| Now use dev.off() to close the device.

> dev.off()
RStudioGD 
        2 

| You are amazing!

  |================================================================================                         |  76%
| Now rerun dev.cur() to see what integer your plotting window is assigned.

> dev.cur()
RStudioGD 
        2 

| Your dedication is inspiring!

  |===================================================================================                      |  79%
| The device is back to what it was when you started. As you might have guessed, every open graphics device is
| assigned an integer greater than or equal to 2. You can change the active graphics device with
| dev.set(<integer>) where <integer> is the number associated with the graphics device you want to switch to.

...

  |======================================================================================                   |  82%
| You can also copy a plot from one device to another. This can save you some time but beware! Copying a plot is
| not an exact operation, so the result may not be identical to the original. R provides some functions to help
| you do this. The function dev.copy copies a plot from one device to another, and dev.copy2pdf specifically
| copies a plot to a PDF file.

...

  |==========================================================================================               |  85%
| Just for fun, rerun the with command again, with(faithful, plot(eruptions, waiting)), to plot the Old Faithful
| data. Use the up arrow key to recover the command if you don't feel like typing.

> with(faithful, plot(eruptions, waiting))

| Excellent work!
  
  |=============================================================================================            |  88%
| Now rerun the title command, title(main = "Old Faithful Geyser data"), to annotate the plot. (Up arrow keys are
                                                                                                | great!)

> title(main = "Old Faithful Geyser data")

| Nice work!
  
  |================================================================================================         |  91%
| Now run dev.copy with the 2 arguments. The first is png, and the second is file set equal to "geyserplot.png".
| This will copy your screen plot to a png file in your working directory which you can view AFTER you close the
| device.

> dev.copy2pdf(png,file="geyserplot.png")
Error in pdfFonts(family) : 
  invalid arguments in 'pdfFonts' (must be font names)
> dev.copy(png, file = "geyserplot.png")
png 
4 

| You are doing so well!
  
  |===================================================================================================      |  94%
| Don't forget to close the PNG device! Do it NOW!!! Then you'll be able to view the file.

> dev.off()
RStudioGD 
2 

| Great job!
  
  |======================================================================================================   |  97%
| Congrats! We hope you found this lesson deviced well!
  
  ...

|=========================================================================================================| 100%
| Would you like to receive credit for completing this course on Coursera.org?
  
  1: Yes
2: No

Selection: 1
What is your email address? harlicamposeco@gmail.com
What is your assignment token? 43Ii01lJTU4jHbQc
Grade submission succeeded!
  
  | You got it!
  
  | You've reached the end of this lesson! Returning to the main menu...

| Would you like to continue with one of these lessons?

1: Getting and Cleaning Data Manipulating Data with dplyr
2: R Programming Basic Building Blocks
3: R Programming Missing Values
4: No. Let me start something new.

Selection: 4

| Please choose a course, or type 0 to exit swirl.

1: Exploratory Data Analysis
2: Getting and Cleaning Data
3: R Programming
4: Take me to the swirl course repository!

Selection: 1

| Please choose a lesson, or type 0 to return to course menu.

 1: Principles of Analytic Graphs   2: Exploratory Graphs              3: Graphics Devices in R        
 4: Plotting Systems                5: Base Plotting System            6: Lattice Plotting System      
 7: Working with Colors             8: GGPlot2 Part1                   9: GGPlot2 Part2                
10: GGPlot2 Extras                 11: Hierarchical Clustering        12: K Means Clustering           
13: Dimension Reduction            14: Clustering Example             15: CaseStudy                    


Selection: 4

| Attempting to load lesson dependencies...

| Package ‘ggplot2’ loaded correctly!

| Package ‘lattice’ loaded correctly!

| Package ‘jpeg’ loaded correctly!

  |                                                                                                         |   0%

| Plotting_Systems. (Slides for this and other Data Science courses may be found at github
| https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip
| file and viewed locally. This lesson corresponds to 04_ExploratoryAnalysis/PlottingSystems.)

...

  |===                                                                                                      |   3%
| In this lesson, we'll give you a brief overview of the three plotting systems in R, their differences,
| strengths, and weaknesses. We'll only cover the basics here to give you a general idea of the systems and in
| later lessons we'll cover each system in more depth.

...

|======                                                                                                   |   5%
| The first plotting system is the Base Plotting System which comes with R. It's the oldest system which uses a
| simple "Artist's palette" model. What this means is that you start with a blank canvas and build your plot up
| from there, step by step.

...

  |=========                                                                                                |   8%
| Usually you start with a plot function (or something similar), then you use annotation functions to add to or
| modify your plot. R provides many annotating functions such as text, lines, points, and axis. R provides
| documentation for each of these. They all add to an already existing plot.

...

  |===========                                                                                              |  11%
| What do you think is a disadvantage of the Base Plotting System?

1: It's intuitive and exploratory
2: It mirrors how we think of building plots and analyzing data
3: A complicated plot is a series of simple R commands
4: You can't go back once a plot has started

Selection: 4

| All that practice is paying off!

  |==============                                                                                           |  14%
| Yes! The base system is very intuitive and easy to use when you're starting to do exploratory graphing and
| looking for a research direction. You can't go backwards, though, say, if you need to readjust margins or fix a
| misspelled a caption. A finished plot will be a series of R commands, so it's difficult to translate a finished
| plot into a different system.

...

  |=================                                                                                        |  16%
| We've loaded the dataset cars for you to demonstrate how easy it is to plot. First, use the R command head with
| cars as an argument to see what the data looks like.

> names(cars)
[1] "speed" "dist" 

| Not quite! Try again. Or, type info() for more options.

| Type head(cars) at the command prompt.

> head(cars)
  speed dist
1     4    2
2     4   10
3     7    4
4     7   22
5     8   16
6     9   10

| Nice work!

  |====================                                                                                     |  19%
| So the dataset collates the speeds and distances needed to stop for 50 cars. This data was recorded in the
| 1920's.

...

  |=======================                                                                                  |  22%
| We'll use the R command with which takes two arguments. The first specifies a dataset or environment in which to
| run the second argument, an R expression. This will save us a bit of typing. Try running the command with now
| using cars as the first argument and a call to plot as the second. The call to plot will take two arguments,
| speed and dist. Please specify them in that order.

> names(cars)
[1] "speed" "dist" 

| You're close...I can feel it! Try it again. Or, type info() for more options.

| Type with(cars, plot(speed, dist)) at the command prompt.

> with(cars, plot(speed, dist))

| All that practice is paying off!

  |==========================                                                                               |  24%
| Simple, right? You can see the relationship between the two variables, speed and distance. The first variable is
| plotted along the x-axis and the second along the y-axis.

...

  |============================                                                                             |  27%
| Now we'll show you what the function text does. Run the command text with three arguments. The first two, x and
| y coordinates, specify the placement of the third argument, the text to be added to the plot. Let the first
| argument be mean(cars$speed), the second max(cars$dist), and the third the string "SWIRL rules!". Try it now.

> with(cars, plot(speed, dist))

| Try again. Getting it right on the first try is boring anyway! Or, type info() for more options.

| Type text(mean(cars$speed),max(cars$dist),"SWIRL rules!") at the command prompt.

> text(mean(cars$speed), max(cars$dist), "SWIRL rules!")

| Your dedication is inspiring!

  |===============================                                                                          |  30%
| Ain't it the truth?

...

  |==================================                                                                       |  32%
| Now we'll move on to the second plotting system, the Lattice System which comes in the package of the same name.
| Unlike the Base System, lattice plots are created with a single function call such as xyplot or bwplot. Margins
| and spacing are set automatically because the entire plot is specified at once.

...

  |=====================================                                                                    |  35%
| The lattice system is most useful for conditioning types of plots which display how y changes with x across
| levels of z. The variable z might be a categorical variable of your data. This system is also good for putting
| many plots on a screen at once.

...

  |========================================                                                                 |  38%
| The lattice system has several disadvantages. First, it is sometimes awkward to specify an entire plot in a
| single function call. Annotating a plot may not be especially intuitive. Second, using panel functions and
| subscripts is somewhat difficult and requires preparation. Finally, you cannot "add" to the plot once it is
| created as you can with the base system.

...

  |===========================================                                                              |  41%
| As before, we've loaded some data for you in the variable state. This data comes with the lattice package and it
| concerns various characteristics of the 50 states in the U.S. Use the R command head to see the first few
| entries of state now.

> 
> head(state)
           Population Income Illiteracy Life.Exp Murder HS.Grad Frost   Area region
Alabama          3615   3624        2.1    69.05   15.1    41.3    20  50708  South
Alaska            365   6315        1.5    69.31   11.3    66.7   152 566432   West
Arizona          2212   4530        1.8    70.55    7.8    58.1    15 113417   West
Arkansas         2110   3378        1.9    70.66   10.1    39.9    65  51945  South
California      21198   5114        1.1    71.71   10.3    62.6    20 156361   West
Colorado         2541   4884        0.7    72.06    6.8    63.9   166 103766   West

| Great job!

  |=============================================                                                            |  43%
| As you can see state holds 9 pieces of information for each of the 50 states. The last variable, region,
| specifies a category for each state. Run the R command table with the argument state$region to see how many
| categories there are and how many states are in each.

> table(state$region)

    Northeast         South North Central          West 
            9            16            12            13 

| You're the best!

  |================================================                                                         |  46%
| So there are 4 categories and the 50 states are sorted into them appropriately. Let's use the lattice command
| xyplot to see how life expectancy varies with income in each of the four regions.

...

  |===================================================                                                      |  49%
| To do this we'll give xyplot 3 arguments. The first is the most complicated. It is this R formula, Life.Exp ~
| Income | region, which indicates we're plotting life expectancy as it depends on income for each region. The
| second argument, data, is set equal to state. This allows us to use "Life.Exp" and "Income" in the formula
| instead of specifying the dataset state for each term (as in state$Income). The third argument, layout, is set
| equal to the two-long vector c(4,1). Run xyplot now with these three arguments.

> xyplot(Life.Exp ~ Income | region, data = state, layout = c(4, 1))

| You got it right!

  |======================================================                                                   |  51%
| We see the data for each of the 4 regions plotted in one row. Based on this plot, which region of the U.S. seems
| to have the shortest life expectancy?

1: West
2: Northeast
3: South
4: North Central

Selection: 3

| That's the answer I was looking for.

  |=========================================================                                                |  54%
| Just for fun rerun the xyplot and this time set layout to the vector c(2,2). To save typing use the up arrow to
| recover the previous xyplot command.

> xyplot(Life.Exp ~ Income | region, data = state, layout = c(2, 2))

| Keep working like that and you'll get there!

  |============================================================                                             |  57%
| See how the plot changed? No need for you to worry about margins or labels. The package took care of all that
| for you.

...

  |==============================================================                                           |  59%
| Now for the last plotting system, ggplot2, which is a hybrid of the base and lattice systems. It automatically
| deals with spacing, text, titles (as Lattice does) but also allows you to annotate by "adding" to a plot (as
| Base does), so it's the best of both worlds.

...

  |=================================================================                                        |  62%
| Although ggplot2 bears a superficial similarity to lattice, it's generally easier and more intuitive to use. Its
| default mode makes many choices for you but you can still customize a lot. The package is based on a "grammar of
| graphics" (hence the gg in the name), so you can control the aesthetics of your plots. For instance, you can
| plot conditioning graphs and panel plots as we did in the lattice example.

...

  |====================================================================                                     |  65%
| We'll see an example now of ggplot2 with a simple (single) command. As before, we've loaded a dataset for you
| from the ggplot2 package. This mpg data holds fuel economy data between 1999 and 2008 for 38 different models of
| cars. Run head with mpg as an argument so you get an idea of what the data looks like.

> 
> head(mpg)
# A tibble: 6 x 11
  manufacturer model displ  year   cyl trans      drv     cty   hwy fl    class  
  <chr>        <chr> <dbl> <int> <int> <chr>      <chr> <int> <int> <chr> <chr>  
1 audi         a4      1.8  1999     4 auto(l5)   f        18    29 p     compact
2 audi         a4      1.8  1999     4 manual(m5) f        21    29 p     compact
3 audi         a4      2    2008     4 manual(m6) f        20    31 p     compact
4 audi         a4      2    2008     4 auto(av)   f        21    30 p     compact
5 audi         a4      2.8  1999     6 auto(l5)   f        16    26 p     compact
6 audi         a4      2.8  1999     6 manual(m5) f        18    26 p     compact

| You are amazing!

  |=======================================================================                                  |  68%
| Looks complicated. Run dim with the argument mpg to see how big the dataset is.

> dim(mpg)
[1] 234  11

| That's the answer I was looking for.

  |==========================================================================                               |  70%
| Holy cow! That's a lot of information for just 38 models of cars. Run the R command table with the argument
| mpg$model. This will tell us how many models of cars we're dealing with.

> table(mpg$model)

           4runner 4wd                     a4             a4 quattro             a6 quattro                 altima 
                     6                      7                      8                      3                      6 
    c1500 suburban 2wd                  camry           camry solara            caravan 2wd                  civic 
                     5                      7                      7                     11                      9 
               corolla               corvette      dakota pickup 4wd            durango 4wd         expedition 2wd 
                     5                      5                      9                      7                      3 
          explorer 4wd        f150 pickup 4wd           forester awd     grand cherokee 4wd             grand prix 
                     6                      7                      6                      8                      5 
                   gti            impreza awd                  jetta        k1500 tahoe 4wd land cruiser wagon 4wd 
                     5                      8                      9                      4                      2 
                malibu                 maxima        mountaineer 4wd                mustang          navigator 2wd 
                     5                      3                      4                      9                      3 
            new beetle                 passat         pathfinder 4wd    ram 1500 pickup 4wd            range rover 
                     6                      7                      4                     10                      4 
                sonata                tiburon      toyota tacoma 4wd 
                     7                      7                      7 

| That's the answer I was looking for.

  |=============================================================================                            |  73%
| Oh, there are 38 models. We're interested in the effect engine displacement (displ) has on highway gas mileage
| (hwy), so we'll use the ggplot2 command qplot to display this relationship. Run qplot now with three arguments.
| The first two are the variables displ and hwy we want to plot, and the third is the argument data set equal to
| mpg. As before, this allows us to avoid using the mpg$variable notation for the first two arguments.

> qplot(displ, hwy, data = mpg)

| That's the answer I was looking for.

  |===============================================================================                          |  76%
| Not surprisingly we see that the bigger the engine displacement the lower the gas mileage.

...

  |==================================================================================                       |  78%
| Let's review!

...

  |=====================================================================================                    |  81%
| Which R plotting system is based on an artist's palette?

1: lattice
2: base
3: Winsor&Newton
4: ggplot2

Selection: 2

| Keep up the great work!

  |========================================================================================                 |  84%
| Which R plotting system does NOT allow you to annotate plots with separate calls?

1: Winsor&Newton
2: lattice
3: base
4: ggplot2

Selection: 3

| You're close...I can feel it! Try it again.

| Recall that with the lattice system the whole plot has to be drawn with just one call.

1: lattice
2: Winsor&Newton
3: ggplot2
4: base

Selection: 1

| You're the best!

  |===========================================================================================              |  86%
| Which R plotting system combines the best features of the other two?

1: ggplot2
2: Winsor&Newton
3: lattice
4: base

Selection: 1

| Perseverance, that's the answer.

  |==============================================================================================           |  89%
| Which R plotting system uses a graphics grammar?

1: Winsor&Newton
2: ggplot2
3: lattice
4: base

Selection: 2

| Your dedication is inspiring!

  |================================================================================================         |  92%
| Which R plotting system forces you to make your entire plot with one call?

1: ggplot2
2: lattice
3: base
4: Winsor&Newton

Selection: 2

| Excellent job!

  |===================================================================================================      |  95%
| Which of the following sells high quality artists' brushes?

1: lattice
2: Winsor&Newton
3: ggplot2
4: base
