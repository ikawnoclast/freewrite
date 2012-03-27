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

I have some other ideas for features that I'll be adding over time. I also ask
for your input as well. If it's useful to you, please let me know.

## Requirements ##

This is the basic requirement:

* Bash shell (tested with 3.2 [Mac OS X default] and 4.2 [from
  Homebrew/Fink/MacPorts])

freewrite uses external functions to implement whatever your heart's desire may
be. You can use other utilities how ever you would like. That said, the included
functions use the following optional utilities:

* `say(1)` [Mac OS X], a command-line tool that uses the Speech Synthesis
  manager to convert a string into audible speech. The `during_wait_and_say`
  function uses it.

* [Dropbox](http://dropbox.com/), a cloud-based storage service used to store
  free write session files. freewrite can use a Dropbox directory to archive the
  free write session files. You can specify any directory you want though.

## Installation ##

The freewrite tool includes a Makefile to install and uninstall the files
associated with freewrite. Just type "make install" from the freewrite
directory to install.

KAW: Adjust this text when the .freewriterc infrastructure works.

Edit the script to adjust variables that apply to you.

## freewrite included functions ##

freewrite uses external functions to provided additional capabilities. You can
create your own external functions. The following external functions are
provided:

* `after_append_timestamp` -- Creates a timestamp and "footer" text for the free
  write session file.

* `after_find_todos` -- Scans the free write session file to find lines that
  appear to be to-do items. It looks for lines that begin with "TODO: " and
  prints them out.

* `after_print_final_message` -- Provides a simple message congratulating the
  free write upon the conclusion of the free write session.

* `after_print_word_count` -- Provides a simple message with the number of words
  written in the free write session. It does not count the template file at the
  beginning of the session file.

* `before_check_directories` -- Checks that the Dropbox directory exists and
  complains and exits if it does not. It checks that the directory that will
  contain free write session files exists, otherwise it creates it.

* `before_create_session_file` -- Creates the free write session file from a
  template file.

* `before_query_mood` -- Queries the writer about her mood before starting the
  free write editing session.

* `before_weather` -- Grabs basic weather data for the configured location to
  include with the free write session file. The idea to capture external
  influences that may "color" the content of the free write session.

* `during_wait_and_say` -- Waits a predetermined amount of time and uses the
  `say(1)` command to speak a message. The intention is to allow the free writer
  a distraction-free way of keeping track of free writing time.

## Bugs, Feature Requests, Questions ##

File a bug on the github project, please. 

Go to my [profile page](http://ikawnoclast.com) for contact details.
