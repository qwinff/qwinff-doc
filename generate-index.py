#!/usr/bin/env python
# create index html page

import sys

items=[]
for arg in sys.argv[1:]:
    items.extend(arg.split())

fout=open("index.html", "w")
fout.write("<ul>\n")
for item in items:
    fout.write("\t<li><a href=\"%1s\">%2s</a></li>\n"
               % (item, item))
fout.write("</ul>\n")
fout.close()
