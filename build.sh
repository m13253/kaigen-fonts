#!/bin/bash

# Copyright © 2017 Star Brilliant (https://github.com/m13253/kaigen-fonts)
# All rights reserved for this script file

set -e
export LC_ALL=en_US.UTF-8

if [ -z "$1" ]
then
    echo "Usage: $0 input.otf"
    exit 1
fi

if basename "$1" .otf | grep -q 'SourceHan\(Sans\|Serif\|Mono\)\(HW\)\?-'
then
    ttf_filename="$(basename "$1" .otf | sed -e 's/SourceHan\(Sans\|Serif\|Mono\)\(HW\)\?/\0J/g' -e 's/SourceHan/Kaigen/g').ttf"
else
    ttf_filename="$(basename "$1" .otf | sed -e 's/SourceHan/Kaigen/g').ttf"
fi

echo "Input: $1" >&2
echo "Output: $ttf_filename" >&2

time otfccdump -o "$ttf_filename"-temp1.json "$1"
echo "Stage 1/5 clear" >&2

if basename "$1" .otf | grep -q 'SourceHan\(Sans\|Serif\|Mono\)\(HW\)\?-'
then
    time sed \
        -e 's/"nameString": \?"[^"]*SourceHan\(Sans\|Serif\|Mono\)\(HW\)\?/\0J/g' \
        -e 's/"nameString": \?"Source Han \(Sans\|Serif\|Mono\)\( HW\)\?/\0 J/g' \
        -e 's/"fontName": \?"SourceHan\(Sans\|Serif\|Mono\)\(HW\)\?/\0J/g' \
        -e 's/"fullName": \?"Source Han \(Sans\|Serif\|Mono\)\( HW\)\?/\0 Japanese/g' \
        -e 's/"familyName": \?"Source Han \(Sans\|Serif\|Mono\)\( HW\)\?/\0 Japanese/g' \
        "$ttf_filename"-temp1.json > "$ttf_filename"-temp2.json
    echo "Stage 2/5 clear" >&2
else
    mv "$ttf_filename"-temp1.json "$ttf_filename"-temp2.json
    echo >&2
    echo "Stage 2/5 skip" >&2
fi

time sed \
    -e 's/Source \?Han/Kaigen/g' \
    -e 's/思源黑体/怀源黑体/g' \
    -e 's/思源黑體/懷源黑體/g' \
    -e 's/思源宋体/怀源宋体/g' \
    -e 's/思源宋體/懷源宋體/g' \
    -e 's/思源等宽/怀源等宽/g' \
    -e 's/思源等寬/懷源等寬/g' \
    -e 's/源ノ/懐源/g' \
    -e 's/본/회원/g' \
    -e 's/ \xa9/ ©/g' \
    -e 's|"Copyright \([^"]*\)"|"Copyright \1\\nCopyright © 2017 Star Brilliant (https://github.com/m13253/kaigen-fonts), James Swineson, Dingyuan Wang."|g' \
    "$ttf_filename"-temp2.json > "$ttf_filename"-temp3.json
echo "Stage 3/5 clear" >&2

time otfcc-c2q < "$ttf_filename"-temp3.json | cat > "$ttf_filename"-temp4.json
echo "Stage 4/5 clear" >&2

time otfccbuild -o "$ttf_filename" "$ttf_filename"-temp4.json
echo "Stage 5/5 clear" >&2

rm -f "$ttf_filename"-temp1.json "$ttf_filename"-temp2.json "$ttf_filename"-temp3.json "$ttf_filename"-temp4.json
