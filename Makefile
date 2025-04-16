#
# Makefile for the freewrite project.
#
# Copyright (c) 2012-2025 Keith A. Watson
#

PROJECTNAME=	freewrite

MAINSCRIPT=	freewrite
AUXFILES=	README.md freewriterc.sample final_messages.txt
FUNCTIONS=	\
		internal_functions		\
		after_append_timestamp		\
		after_collect_stats		\
		after_find_todos 		\
		after_print_final_message	\
		after_print_stats		\
		after_tweet_results		\
		before_check_directories	\
		before_check_if_file_exists	\
		before_create_session_file	\
		before_get_weather		\
		before_print_first_message	\
		before_query_mood		\
		during_wait_and_say

CONFIGFILE=	freewriterc.sample
CONFIGLOCATION=	$(HOME)/.freewriterc

ALLFILES=	$(MAINSCRIPT) $(FUNCTIONS) $(AUXFILES)

# detect operating systems to determine where to place files
OS:=$(shell uname -s)
ifeq ($(strip $(OS)),Darwin)
	# Typical Mac OS X install location for a single user
	INSTALLDIR=$(HOME)/Library/$(PROJECTNAME)
else
	# Typical Linux install locations for a single user
	INSTALLDIR=$(HOME)/lib/$(PROJECTNAME)
endif

# Typical path for installation of main script
BINDIR=$(HOME)/bin

directory-select: check
	@echo "OS detected:" $(OS)
	@echo "Installing script files into:" $(INSTALLDIR)
	@echo "Creating executable link into:" $(BINDIR)

install: directory-select
	rm -rf $(INSTALLDIR).old
	rm -f $(BINDIR)/$(MAINSCRIPT)
	-mv $(INSTALLDIR) $(INSTALLDIR).old
	mkdir -p $(INSTALLDIR)
	cp $(ALLFILES) $(INSTALLDIR)
	cp $(CONFIGFILE) $(CONFIGLOCATION)-new
	cd $(BINDIR) && ln -s $(INSTALLDIR)/$(MAINSCRIPT)
# conditional needed here on new installs
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
