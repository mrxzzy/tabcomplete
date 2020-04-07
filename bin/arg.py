#!/usr/bin/env python

from sys import argv
from sys import exit

if __name__ == "__main__":

  if len(argv) != 2:
    print("required parameter not supplied, need the command we're searching for valid values")
    exit(1)

  command = argv[1]

  if command == 'go':
    output = ['gunit','vroom','speedy']
  elif command == 'stop':
    output = ['screech','drop_anchor','abs']
  elif command == 'restart':
    output = ['turnkey','givergas','fireitup']
  else:
    output = []

  for cmd in output:
    print(cmd)



