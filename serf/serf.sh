#!/bin/sh

exec serf agent -tag role=$SERF_ROLE -join=$(ip route | cut -d " " -f 3 | head -n 1)
