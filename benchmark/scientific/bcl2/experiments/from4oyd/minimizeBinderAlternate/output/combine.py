import os
import sys
import re

prefix=sys.argv[1]
outfix=sys.argv[2]
count=sys.argv[3]

combine="/scratch/lpdi/bin/Rosetta/devel/nubinitio/main/source/bin/combine_silent.linuxiccrelease"
flags="-in:file:silent_struct_type binary -out:file:silent_struct_type binary"
input="-in:file:silent {0}"
output="-out:file:silent {0}"

allfiles = []
current = []
for f in os.listdir("."):
    if re.match(prefix + "\d+", f):
        current.append(f)
    if len(current) == int(count):
        allfiles.append(current)
        current=[]
if len(current) != 0:
    allfiles.append(current)

for cg, g in enumerate(allfiles):
    thisin  = input.format(" ".join(g))
    thisout = output.format(outfix + "{0:02d}".format(cg + 1))
    command = " ".join([combine, flags, thisin, thisout])
    print command
    os.system(command)
