#!/usr/bin/env python

import sys, json, os

query = json.loads(sys.stdin.read())
output = {}
for patt, nodetype in query.items():
    names = os.popen('eval echo %s' % patt).read().split()
    for name in names:
        output[name] = nodetype
print(json.dumps(output))
