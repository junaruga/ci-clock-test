#!/bin/bash

set -ex

if command -v rpm; then
    rpm -q kernel-headers
    rpm -q glibc-headers
fi

clocks="CLOCK_BOOTTIME CLOCK_TAI"
for clock in $clocks; do
    echo "== clock: ${clock} =="
    grep -rn "${clock}" /usr/include/ || true
    if command -v rpm; then
        for file in $(grep -rl "${clock}" /usr/include/ | sort | uniq); do
            rpm -qf "${file}"
        done
    fi
done
