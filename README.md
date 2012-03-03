# freewrite #

A simple script to simplify your free writing.

## What is free writing? ##

[Free writing](http://en.wikipedia.org/wiki/Free_writing) is best described as
way to improve your writing and thinking by writing your thoughts down within a
specific page count or time limit. It's sometimes called stream-of-conscience
writing. The method of the exercise is to write whatever comes to mind. Don't
worry about spelling, punctuation, grammar, etc. Let your mind wander and write
about where it takes you. If you are consistent over time, you will find that
your mind will focus on solving problems, making plans, and exploring innovative
ideas.

I have known about this writing exercise from several books on writing. I came
across it again in _Pragmatic Thinking and Learning_ by Andy Hunt in a section
called "The Morning Pages Technique". I started following Andy's advice and
found, to my surprise, that it worked well for me.

After more than a year using up pens and filling notepads, I wanted to recall
what I wrote instead of having stacks of notepads to flip through. I wanted to
search the content and gather some statistics as well. My biggest concern was
the distraction that a computer could add to the equation. Free writing is about
focusing on what your mind is saying, not what the computer is displaying.

## What is freewrite? ##

freewrite is a script to simplify the process of getting started on free writing
each day, archive the resulting text in an easy to retrieve format and location,
give me a time limit reminder without forcing me to check the clock, and
generate a simple statistic on the result (a word count).

freewrite works for me. It may not work for you. I make no promises on how well
it can help you.

I have some other ideas that I'll be adding over time. I also ask for your input
as well. If it's useful to you, please let me know.

## Requirements ##

freewrite was written in Bash shell but uses one Mac OS X specific feature. The
background timer subshell uses the "say" command to announce the time remaining.
I may make this configurable in the future.

The script uses Dropbox to archive the resulting daily free writing files. You
can specify a different directory if desired.

## Installation ##

Copy freewrite to location in your $PATH. (I use $HOME/bin directory.) Edit the
script to adjust variables that apply to you.

## Bugs, Feature Requests, Questions ##

File a bug on the github project, please. 

Go to my [profile page](http://ikawnoclast.com) for contact details.
