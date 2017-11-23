#!/usr/bin/env bash

find . -name '.stack-work' | while read F; do
    rm -r $F
done
