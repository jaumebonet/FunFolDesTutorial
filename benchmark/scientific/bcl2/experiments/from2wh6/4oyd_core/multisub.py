import os
import sys

for root, dirs, files in os.walk(sys.argv[1]):
	for f in files:
		if f.startswith("4oyd"):
			f = os.path.join(root, f)
			com = "sbatch {0} {1}".format(sys.argv[2], f)
			print com
			os.system(com)
