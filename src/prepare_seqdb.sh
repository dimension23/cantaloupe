#!/bin/bash
sed '/^>/!{N;s/\n//;}' $1 | sed '/.*>/ s/\s.*$//' | sed '/.*>/ s/[^a-zA-Z0-9\>]/_/g' | sed '/.*>/ s/$/#/' | tr -d '\n' | cut -b2- | tr '>' '\n' | sed 's/^/>/' > $2
