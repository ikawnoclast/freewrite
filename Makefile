#
# Makefile for the freewrite project.
#
# Copyright (c) 2012 Keith A. Watson <ikawnoclast@gmail.com>
#
# MIT License
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

PROJECTNAME=	freewrite

MAINSCRIPT=	freewrite
AUXFILES=	README.md freewriterc.sample
FUNCTIONS=	after_append_timestamp		\
		after_find_todos 		\
		after_print_final_message	\
		after_print_word_count		\
		before_check_directories	\
		before_check_if_file_exists	\
		before_create_session_file	\
		before_get_weather		\
		before_query_mood		\
		during_wait_and_say

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
	mkdir $(INSTALLDIR)
	cp $(ALLFILES) $(INSTALLDIR)
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