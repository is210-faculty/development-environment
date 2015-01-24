#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Tests that your environment is correctly installed."""

import base64
import hashlib

try:
    import unittest
    import pylint
    import pep8
except ImportError:
    print 'Your environment is not correctly configured for running tests.'
    raise


out = 'Success! Your environment is correctly configured! Your code is: {}'
code =  base64.b64encode(hashlib.sha512('Great job!').digest())
print out.format(code)
