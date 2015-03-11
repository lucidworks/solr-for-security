__author__ = 'grantingersoll'

import optparse
import random
import re


#
# Small script to create samples from the original Kyoto data
#
def sample(input_file, output_file, rows):
    print "Sampling " + str(rows) + " from " + input_file + " and writing to " + output_file
    p = re.compile('\t\t+')
    j = 0
    output = open(output_file, 'w')
    f = open(input_file)
    lines = f.readlines() # there is probably a better way to do this w/o reading the whole file, but the files are only 150mb
    #output.write(lines.pop(0))//no header in these files
    seen = set()
    length = len(lines)
    for i in range(0, length):
        val = random.randint(0, length)
        if val not in seen:
            # some lines are bad, avoid them if we detect extra spaces
            if not p.search(lines[val]):
                output.write(lines[val])
                seen.add(val)
            j += 1
        if j >= rows:
            print "here"
            break

    print "Wrote " + str(j) + " lines to " + output_file
    output.close()

p = optparse.OptionParser()
p.add_option("-i", "--input", action="store", dest="input")
p.add_option("-o", "--output", action="store", dest="output")
p.add_option("-r", "--rows", action="store", dest="rows")
opts, args = p.parse_args()

sample(opts.input, opts.output, int(opts.rows))
