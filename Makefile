#
# Makefile for the freewrite project.
#
# Copyright (c) 2012-2024 Keith A. Watson
#

PROJECTNAME=	freewrite

MAINSCRIPT=	freewrite
AUXFILES=	README.md freewriterc.sample final_messages.txt
FUNCTIONS=	\
		internal_functions			\
		after_append_timestamp		\
		after_collect_stats			\
		after_find_todos 			\
		after_print_final_message	\
		after_print_stats			\
		after_tweet_results			\
		before_check_directories	\
		before_check_if_file_exists	\
		before_create_session_file	\
		before_get_weather			\
		before_query_mood			\
		during_wait_and_say

CONFIGFILE=	freewriterc.sample
CONFIGLOCATION=	$(HOME)/.freewriterc

ALLFILES=	$(MAINSCRIPT) $(FUNCTIONS) $(AUXFILES)

# Where should the files go? (select one)
# Typical Mac OS X install location for a single user
#INSTALLDIR=$(HOME)/Library/$(PROJECTNAME)

# Typical UNIX install locations for a single user
#INSTALLDIR=$(HOME)/.$(PROJECTNAME)
INSTALLDIR=$(HOME)/lib/$(PROJECTNAME)

# Typical path for installation of main script
BINDIR=$(HOME)/bin

install: check
	rm -rf $(INSTALLDIR).old
	rm -f $(BINDIR)/$(MAINSCRIPT)
	-mv $(INSTALLDIR) $(INSTALLDIR).old
	mkdir $(INSTALLDIR)
	cp $(ALLFILES) $(INSTALLDIR)
	cd $(BINDIR) && ln -s $(INSTALLDIR)/$(MAINSCRIPT)
	cp $(CONFIGFILE) $(CONFIGLOCATION)-new
	echo "Here are the differences in the repo version of the $(MAINSCRIPT) config file and your current config file:"
	-diff $(CONFIGLOCATION) $(CONFIGLOCATION)-new
	
uninstall:
	rm -rf $(INSTALLDIR) $(INSTALLDIR).old
	rm -f $(BINDIR)/$(MAINSCRIPT)

test: check
	echo "No tests implemented (yet)."

check:
	for f in $(MAINSCRIPT) $(FUNCTIONS); do \
		bash -n $$f; \
	done
