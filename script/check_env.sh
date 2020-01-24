#!/bin/bash

set -ex

clocks="CLOCK_BOOTTIME CLOCK_TAI"
for clock in $clocks; do
    echo "== clock: ${clock} =="
    grep -rn "${clock}" /usr/include/ || true
    if command -v rpm; then
        grep -rl "${clock}" /usr/include/ | sort | uniq | xargs rpm -qf
    fi
done
