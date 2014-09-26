#!/bin/sh

exec serf agent -tag role=serf -join=$(ip route | cut -d " " -f 3 | head -n 1)
