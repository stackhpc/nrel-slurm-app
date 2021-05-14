#!/usr/bin/env python
""" Terraform external data source to get Openstack configuration for a given cloud.
    Should be passed a json dict on stdin containing (keys/values as strings):
        cloud: name of cloud to query
        
    Returns a dict of strings TODO: handle nonstrings.
    Requires `openstack` CLI client.
 """

from __future__ import print_function
import sys, json, pprint, subprocess
import openstack
import pprint

if len(sys.argv) == 1: # using from terraform
    query = json.load(sys.stdin)
else:
    query = {'cloud':sys.argv[1]}
    pprint.pprint(query)

config = subprocess.check_output(['openstack', 'configuration', 'show', '--os-cloud', query['cloud'], '-f', 'json'], universal_newlines=True)
config = json.loads(config)

# TF can only handle strs in keys/values, so convert values (keys are all strings anyway):
config = dict((k, str(v)) for k, v in config.items())

if len(sys.argv) == 1: # using from terraform
    print(json.dumps(config))
else:
    pprint.pprint(config)