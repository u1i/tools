#!/usr/bin/python
# usage: echo teststring | shuffle_string.py
import string, random, sys

s=raw_input()

print ''.join(random.sample(s,len(s)))
