#
#  Simple makefile to build the website for http://gnump3d.org/
#
#  This uses the HTMLPP tool available from:
#
#     http://www.imatix.com/html/htmlpp/index.htm
#
#  The two upload targets allow the site to be uploaded, either
# just the HTML pages which will change infrequantly, or the full
# site.
#
#
# Steve
# ---
# $Revision: 1.1 $
#

ALL:  template.txt prelude.def
	htmlpp template.txt

clean:
	rm -f *.html *.wrk anchor.def errors.lst *~

upload:
	scp *.html stevekemp@gnump3d.sourceforge.net:/home/groups/g/gn/gnump3d/htdocs

upload-all:
	scp *.html *.jpg *.cc *.png *.css *.ico stevekemp@gnump3d.sourceforge.net:/home/groups/g/gn/gnump3d/htdocs
	scp thumbs/*.jpg  stevekemp@gnump3d.sourceforge.net:/home/groups/g/gn/gnump3d/htdocs/thumbs