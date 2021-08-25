#############################################################
# Title: 
# Date started: 
# Author: 
############################################################


#1. Introduction
#How do musicians choose the chords they use in their songs? 
#Do guitarists, pianists, and singers gravitate towards different kinds of harmony?
#We can uncover trends in the kinds of chord progressions used by popular artists by analyzing the harmonic data provided in the McGill Billboard Dataset. This dataset includes professionally tagged chords for several hundred pop/rock songs representative of singles that made the Billboard Hot 100 list between 1958 and 1991. 
#Using the data-wrangling tools available in the dplyr package, and the visualization tools available in the ggplot2 package, we can explore the most common chords and chord progressions in these songs, and contrast the harmonies of some guitar-led and piano-led artists to see where the "affordances" of those instruments may affect the chord choices artists make.

# TASK 1: Loading individual Tidyverse packages

##Load in the dplyr, readr, and ggplot2 packages.
## Save the dataset 'bb_chords.csv' into your working directory
## Load the data into R using read_csv.  Assign it to an object called bb.
##Display the first rows of bb.
##Make sure to use read_csv (with an underscore) to read in the data. The read.csv function, which is built into R, has a number of problems which the read_csv function avoids.


# .... YOUR CODE FOR TASK 1 ....

# Reading in the McGill Billboard chord data


bb <- ....

# Taking a look at the first rows in bb
# .... YOUR CODE FOR TASK 1 ....


#2. The most common chords
#As seen in the previous task, this is a tidy dataset: each row represents a single observation, and each column a particular variable or attribute of that observation. 
#Note that the metadata for each song (title, artist, year) is repeated for each chord -- like "I Don't Mind" by James Brown, 1961 -- while the unique attributes of each chord (chord symbol, chord quality, and analytical designations like integer and Roman-numeral notation) is included once for each chord change.

#A key element of the style of any popular musical artist is the kind of chords they use in their songs. But not all chords are created equal! 
#In addition to differences in how they sound, some chords are simply easier to play than others. 
#On top of that, some chords are easier to play on one instrument than they are on another. 
#And while master musicians can play a wide variety of chords and progressions with ease, it's not a stretch to think that even the best musicians may choose more "idiomatic" chords and progressions for their instrument.

#To start to explore that, let's look at the most common chords in the McGill Billboard Dataset.
#Count the number of occurrences of each raw chord type in the dataset (bb) using count(), and sort the results from most common (highest count) to least common (lowest count).
#Store the result in bb_count.
#Display the 20 most common chords.
#For readability (and to do things the tidyverse way!), try to write your code as a string of verb-based commands, one command per line, connected by %>%.

# Counting the most common chords
bb_count <- ....

# Displaying the top 20 chords

# .... YOUR CODE FOR TASK 2 ....


# 3. Visualizing the most common chords
#Of course, it's easier to get a feel for just how common some of these chords are if we graph them and show the percentage of the total chord count represented by each chord. Musicians may notice right away that the most common chords in this corpus are chords that are easy to play on both the guitar and the piano: C, G, A, and D major - and to an extent, F and E major. 
#(They also belong to keys, or scales, that are easy to play on most instruments, so they fit well with melodies and solos, as well.) 
#After that, there is a steep drop off in the frequency with which individual chords appear.

#Plot the top 20 chords as a flipped bar plot.
## Starting with the first 20 records from bb_count, use mutate to create a new column share with the percentage of how often each chord type occurs.
## Also using mutate, reorder the chord column according to the value in share.
## Pipe the results into ggplot() and make a column plot where the X axis represents chord and the Y axis is represents share.
## Make your plot more readable by adding labels with xlab() and ylab(), and by flipping the plot using coord_flip().

# Creating a bar plot from bb_count
bb_count %>%
  slice(....) %>%
  mutate(share = ....,
         chord = ....) %>%
  .... +
  .... +
  coord_flip() +
  xlab(....) +
  ylab(....) 

#4. Chord "bigrams"
#Just as some chords are more common and more idiomatic than others, not all chord progressions are created equal. 
#To look for common patterns in the structuring of chord progressions, we can use many of the same modes of analysis used in text-mining to analyze phrases. A chord change is simply a bigram - a two-"word" phrase - composed of a starting chord and a following chord. Here are the most common two-chord "phrases" in the McGill Billboard dataset.

#Create a count of chord bigrams.

## Use mutate() to add two new columns to bb: next_chord and next_title. These should contain the data from the chord and title columns, but shifted one row up. Use the lead() function inside your mutate() command to do this.
## Create a bigram column that concatenates chord with next_chord, with a space in between.
## Use filter() to remove any records in our new data frame where title and next_title are not identical.
## Count the number of occurrences of each bigram type and store the results in bb_bigram_count.
## Display the 20 most common chord bigrams.


##There are natural language processing (NLP) tools that will tokenize texts by n-grams (phrases of n words).
##However, our chord data is already in a tidy table, rather than in something that looks like paragraph form. Thankfully, dplyr contains functions like lag() and lead() that make it easy to access data from other rows in the data frame efficiently, and we can use them to construct our bigrams using paste() (or str_c from stringr).

##Why we filter in step 3 might not be obvious, but it's incredibly important. 
##The last chord of one song combined with the first chord of the next song is not a bigram. Depending on the order of songs in the dataset, if we skip this step, we could end up with chord "progressions" connecting songs that occur perhaps 30 years apart in history!


# Wrangling and counting bigrams
bb_bigram_count <- bb %>%
    # .... YOUR CODE FOR TASK 4 ....

# Displaying the first 20 rows of bb_bigram_count
# .... YOUR CODE FOR TASK 4 ....

#5. 5. Visualizing the most common chord progressions
  
## We can get a better sense of just how popular some of these chord progressions are if we plot them on a bar graph. 
## Note how the most common chord change, G major to D major, occurs more than twice as often than even some of the other top 20 chord bigrams.
## Create a flipped bar plot that shows the 20 most common chord bigrams.
## Copy your code from Step 3, and modify it to work with bb_bigram_count instead of bb_count.
## Adjust the plot labels to fit chord changes instead of just chords.


##Copy-and-paste isn't cheating! In fact, knowing how to successfully copy, paste, and tweak existing code (yours, or someone else's -- with permission, of course) is an integral part of data science. It not only saves time and brain power, it also limits mistakes in your code when you use code you already know works. The iterative process of tweaking that code can also help you write more efficient code in the future.
##Of course, if you copy-and-paste the same code several times, you may just want to write a custom function instead!

# Creating a column plot from bb_bigram_count
bb_bigram_count %>%
  slice(....) %>%
  mutate(share = ....,
         chord = ....) %>%
  .... +
  .... +
  coord_flip() +
  xlab(....) +
  ylab(....) 

#6. Finding the most common artists

#As noted above, the most common chords (and chord bigrams) are those that are easy to play on both the guitar and the piano. 
# If the degree to which these chords are idiomatic on guitar or piano (or both) determine how common they are, we would expect to find the more idiomatic guitar chords (C, G, D, A, and E major) to be more common in guitar-driven songs, but we would expect the more idiomatic piano chords (C, F, G, D, and B-flat major) to be more common in piano-driven songs. 
# (Note that there is some overlap between these two instruments.)
#The McGill Billboard dataset does not come with songs tagged as "piano-driven" or "guitar-driven," so to test this hypothesis, we'll have to do that manually. Rather than make this determination for every song in the corpus, let's focus on just a few to see if the hypothesis has some validity. 
#If so, then we can think about tagging more artists in the corpus and testing the hypothesis more exhaustively.
#Here are the 30 artists with the most songs in the corpus. 
#From this list, we'll extract a few artists who are obviously heavy on guitar or piano to compare.

#Find and display the 30 artists with the most songs in the McGill Billboard Dataset.

#Using bb, isolate the artist and title columns using select().

#We still have one record per chord. Use unique() to remove duplicates and leave a single record per song.

#As in earlier tasks, use count() to find how many songs each artist has in the dataset, and sort the results in descending order.

#Display the first 30 records in the sorted table.

#In order to tag as many songs as possible quickly in the next task, we can simply identify a small number of prolific artists whose songs we can tag all at once. 

#By isolating the 30 most prolific artists in the dataset, we can look at the results and pick a few good candidates.

#When used in a piped string of commands, unique() does not need to take any arguments, since each command treats the output of the previous command as its first argument.

# Finding 30 artists with the most songs in the corpus
bb_30_artists <- bb %>%
    #.... YOUR CODE FOR TASK 6 ....

# Displaying 30 artists with the most songs in the corpus
#.... YOUR CODE FOR TASK 6 ....

#7. Tagging the corpus
#There are relatively few artists in this list whose music is demonstrably "piano-driven," but we can identify a few that generally emphasize keyboards over guitar: Abba, Billy Joel, Elton John, and Stevie Wonder - totaling 17 songs in the corpus. 
#There are many guitar-centered artists in this list, so for our test, we'll focus on three well known, guitar-heavy artists with a similar number of songs in the corpus: The Rolling Stones, The Beatles, and Eric Clapton (18 songs).

#Once we've subset the corpus to only songs by these seven artists and applied the "piano" and "guitar" tags, we can compare the chord content of piano-driven and guitar-driven songs.

tags <- tibble(
  artist = c('Abba', 'Billy Joel', 'Elton John', 'Stevie Wonder', 'The Rolling Stones', 'The Beatles', 'Eric Clapton'),
  instrument = c('piano', 'piano', 'piano', 'piano', 'guitar', 'guitar', 'guitar'))

# Creating a new dataframe bb_tagged that includes a new column instrument from tags
bb_tagged <- bb %>%
    # .... YOUR CODE FOR TASK 7 ....
    
# Displaying the new data frame
# .... YOUR CODE FOR TASK 7 ....

#8. Comparing chords in piano-driven and guitar-driven songs
# Let's take a look at any difference in how common chords are in these two song groups. To clean things up, we'll just focus on the 20 chords most common in the McGill Billboard dataset overall.
# While we want to be careful about drawing any conclusions from such a small set of songs, we can see that the chords easiest to play on the guitar do dominate the guitar-driven songs, especially G, D, E, and C major, as well as A major and minor. Similarly, "flat" chords (B-flat, E-flat, A-flat major) occur frequently in piano-driven songs, though they are nearly absent from the guitar-driven songs. 
#In fact, the first and fourth most frequent piano chords are "flat" chords that occur rarely, if at all, in the guitar songs.

#So with all the appropriate caveats, it seems like the instrument-based-harmony hypothesis does have some merit and is worth further examination.

#Created a faceted plot that shows the frequency of the most common chords side-by-side for songs by piano- and guitar-driven artists.

#Starting with bb_tagged, use filter() to keep only the top_20 chords.
#Use count() to find the number of times each chord occurs for each instrument, and sort the results.
#Pipe the results to ggplot() and make a bar plot, using chord as the X axis and n (the result of count()) as your Y axis.
#Use facet_grid() to place guitar and piano plots side by side for comparison. Then use coord_flip() for readability, and provide appropriate labels for the X and Y axes.
#If you like, add a splash of color with fill (and if so, set theme(legend.position='none')).

#facet_wrap() and facet_grid() are incredibly powerful visualization tools. They allow you to add dimensions to your data visualization story without making things hard on your readers.

#Try playing around with faceting a bit. What happens when you count chord and artist and pass artist to facet_grid()? What other parameters could you visualize in this way that tell a compelling story?

# The top 20 most common chords
top_20 <- bb_count$chord[1:20]

# Comparing the frequency of the 20 most common chords in piano- and guitar-driven songs
bb_tagged %>%
  filter(....) %>%
  count(....) %>%
  .... +
  .... +
  .... +
  .... +
  xlab(....) +
  ylab(....) 


#9. Comparing chord bigrams in piano-driven and guitar-driven songs
#Since chord occurrence and chord bigram occurrence are naturally strongly tied to each other, it would not be a reach to expect that a difference in chord frequency would be reflected in a difference in chord bigram frequency. Indeed that is what we find.

#Create the same faceted plot as in Task 8, but for chord bigrams.

# Copy and modify your code from Task 4 to add a bigram column, this time to bb_tagged.
# Copy and modify your code from Task 8 to produce a faceted plot of bigram frequency from the top_20_bigrams that compares guitar- and piano-driven songs.
# Remember to change all references to chords (including in the axis labels) to bigrams.
# The top 20 most common bigrams
top_20_bigram <- bb_bigram_count$bigram[1:20]

# Creating a faceted plot comparing guitar- and piano-driven songs for bigram frequency
bb_tagged %>%
  # .... MODIFIED CODE FROM TASK 4 .... 
  # .... MODIFIED CODE FROM TASK 8 ....

#10. Conclusion (No questions here)
#We set out asking if the degree to which a chord is "idiomatic" on an instrument affects how frequently it is used by a songwriter. 
# It seems that is indeed the case. In a large representative sample of pop/rock songs from the historical Billboard charts, the chords most often learned first by guitarists and pianists are the most common. 
# In fact, chords commonly deemed easy or beginner-friendly on both piano and guitar are far and away the most common in the corpus.

#We also examined a subset of 35 songs from seven piano- and guitar-heavy artists and found that guitarists and pianists tend to use different sets of chords for their songs. This was an extremely small (and likely not representative) sample, so we can do nothing more than hypothesize that this trend might carry over throughout the larger dataset. 
#But it seems from this exploration that it's worth a closer look.


#Great work! You've uncovered some interesting things about musical chord progressions and learned a little about how natural language processing (NLP) analysis techniques can be used to study musical symbolic data.