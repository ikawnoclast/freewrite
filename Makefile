#
# Makefile for the freewrite project.
#
# Copyright (c) 2012 Keith A. Watson
#

PROJECTNAME=	freewrite

MAINSCRIPT=	freewrite
AUXFILES=	README.md freewriterc.sample
FUNCTIONS=	after_append_timestamp		\
		after_collect_stats		\
		after_find_todos 		\
		after_print_final_message	\
		after_print_stats		\
		before_check_directories	\
		before_check_if_file_exists	\
		before_create_session_file	\
		before_get_weather		\
		before_query_mood		\
		during_wait_and_say

CONFIGFILE=	freewriterc.sample
CONFIGLOCATION=	$(HOME)/.freewriterc

ALLFILES=	$(MAINSCRIPT) $(FUNCTIONS) $(AUXFILES)

# Where should the files go? (select one)
# Typical Mac OS X install location for a single user
INSTALLDIR=$(HOME)/Library/$(PROJECTNAME)

# Typical UNIX install location for a single user
#INSTALLDIR=$(HOME)/lib/$(PROJECTNAME)

# Typical path for installation of main script
BINDIR=$(HOME)/bin

install: check
	rm -rf $(INSTALLDIR).old
	rm -f $(BINDIR)/$(MAINSCRIPT)
	-mv $(INSTALLDIR) $(INSTALLDIR).old
	-mv $(CONFIGLOCATION) $(CONFIGLOCATION).old
	mkdir $(INSTALLDIR)
	cp $(ALLFILES) $(INSTALLDIR)
	cp $(CONFIGFILE) $(CONFIGLOCATION)
	cd $(BINDIR) && ln -s $(INSTALLDIR)/$(MAINSCRIPT)
	
uninstall:
	rm -rf $(INSTALLDIR) $(INSTALLDIR).old
	rm -f $(BINDIR)/$(MAINSCRIPT)

test: check
	echo "No tests implemented (yet)."

check:
	for f in $(MAINSCRIPT) $(FUNCTIONS); do \
		bash -n $$f; \
	done