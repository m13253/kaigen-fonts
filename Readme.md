Kaigen Fonts / 怀源字体 / 懷源字體 / 懐源フォント / 회원글꼴
============================================================

Adobe Source Han (also known as Google Noto CJK) font family converted to
TrueType format.

## Introduction

Adobe Source Han (also known as Google Noto CJK) is an open-source computer
font family created by Adobe and Google, suitable for Japanese, Simplified
Chinese, Traditional Chinese and Korean typesetting.

The problem is, these fonts were originally released in OpenType-CFF fornat,
which is not well supported in many buggy applications, including
[Microsoft Word](https://answers.microsoft.com/en-us/msoffice/forum/msoffice_word-mso_win10/word-2016-is-not-working-reliably-with-opentype/20511ac9-a701-4b61-bcdc-a94622682dda) and
[LibreOffice](https://bugs.documentfoundation.org/show_bug.cgi?id=107056).
Kaigen Fonts is the project to convert them into TrueType format, increasing
its compatibility with those buggy applications.

The conversion is not lossless. OpenType-CFF uses cubic Bézier curves while
TrueType uses quadratic ones, resulting a slightly changed shape after
converting. Furthermore, you will lose all OpenType features available in the
original fonts including localization support, vertical writing support and
「⿺辶⿳穴⿰月⿰⿲⿱幺長⿱言馬⿱幺長刂心」(biáng).

## Download

Click [releases](https://github.com/m13253/kaigen-fonts/releases) to download
the latest release.

## Contents

This repository contains the following typefaces:

| File name                | Font family       | Original file name       | Original font family  |
| ------------------------ | ----------------- | ------------------------ | --------------------- |
| KaigenSansJ-\*.ttf       | Kaigen Sans J     | SourceHanSans-\*.otf     | Source Han Sans       |
| KaigenSansK-\*.ttf       | Kaigen Sans K     | SourceHanSansK-\*.otf    | Source Han Sans K     |
| KaigenSansHC-\*.ttf      | Kaigen Sans HC    | SourceHanSansHC-\*.otf   | Source Han Sans HC    |
| KaigenSansSC-\*.ttf      | Kaigen Sans SC    | SourceHanSansSC-\*.otf   | Source Han Sans SC    |
| KaigenSansTC-\*.ttf      | Kaigen Sans TC    | SourceHanSansTC-\*.otf   | Source Han Sans TC    |
| KaigenSansHWJ-\*.ttf     | Kaigen Sans HW J  | SourceHanSansHW-\*.otf   | Source Han Sans HW    |
| KaigenSansHWK-\*.ttf     | Kaigen Sans HW K  | SourceHanSansHWK-\*.otf  | Source Han Sans HW K  |
| KaigenSansHWHC-\*.ttf    | Kaigen Sans HW HC | SourceHanSansHWSC-\*.otf | Source Han Sans HW HC |
| KaigenSansHWSC-\*.ttf    | Kaigen Sans HW SC | SourceHanSansHWSC-\*.otf | Source Han Sans HW SC |
| KaigenSansHWTC-\*.ttf    | Kaigen Sans HW TC | SourceHanSansHWTC-\*.otf | Source Han Sans HW TC |
| KaigenSerifJ-\*.ttf      | Kaigen Serif J    | SourceHanSerif-\*.otf    | Source Han Serif      |
| KaigenSerifK-\*.ttf      | Kaigen Serif K    | SourceHanSerifK-\*.otf   | Source Han Serif K    |
| KaigenSerifSC-\*.ttf     | Kaigen Serif SC   | SourceHanSerifSC-\*.otf  | Source Han Serif SC   |
| KaigenSerifTC-\*.ttf     | Kaigen Serif TC   | SourceHanSerifTC-\*.otf  | Source Han Serif TC   |
| KaigenMonoJ-\*.ttf       | Kaigen Mono J     | SourceHanMono-\*.otf     | Source Han Mono       |
| KaigenMonoK-\*.ttf       | Kaigen Mono K     | SourceHanMonoK-\*.otf    | Source Han Mono K     |
| KaigenMonoHC-\*.ttf      | Kaigen Mono HC    | SourceHanMonoHC-\*.otf   | Source Han Mono HC    |
| KaigenMonoSC-\*.ttf      | Kaigen Mono SC    | SourceHanMonoSC-\*.otf   | Source Han Mono SC    |
| KaigenMonoTC-\*.ttf      | Kaigen Mono TC    | SourceHanMonoTC-\*.otf   | Source Han Mono TC    |

They are converted from:

- [Source Han Sans](https://github.com/adobe-fonts/source-han-sans), version 2.002

- [Source Han Serif](https://github.com/adobe-fonts/source-han-serif), version 1.001

- [Source Han Mono](https://github.com/adobe-fonts/source-han-mono), version 1.002

## The “J” suffix

The Japanese version has an additional “J” suffix, which does not exist in the
original font files. This is because the original version features OpenType
localization support, you simply select “Source Han Sans / Serif / Mono” and the
computer matches your language settings automatically; while the converted
version loses this ability, the additional “J” suffix reminds you to select the
correct version for your language.

## About the name, “Kaigen”

I have to rename the fonts because Adobe forbids any derived work from being
called “Source”.

The name “Kaigen” is a Japanese romanization of
「懐源<sup>[\[1\]](#footnote1)</sup>」(“nostalgia of the source”), which is a
word play deriving from the Chinese name of the original font, “思源” (“drink
water and think of its source; —gratitude for source of
benefit”<sup>[\[2\]](#footnote2)</sup>).

## As the continuation of KaiGen Gothic project

[KaiGen Gothic](https://github.com/minjiex/kaigen-gothic) is another project
doing the same thing, but unmaintained for years, without disclosure of any
build script or conversion program. Kaigen Font project aims to be the
continuation of KaiGen Gothic project, with the build script and conversion
toolchain open-sourced.

These fonts differs slightly in its name, so you can install both of them to
your computer.

## Building on your own

You can build Kaigen Fonts on your own from the original Source Han Fonts.

Make sure you have plenty of RAM (16 GiB will work), plenty of disk space (5
GiB will work) and plenty of time (several minutes for a single font file).

### Use precompiled Docker image for easy environment setup

See [Jamesits/docker-otfcc-dev](https://github.com/Jamesits/docker-otfcc-dev).
You may need this if you don't want to mess up with multiple version of Node.js
on your machine. 

### Configure manually

- Install [Node.js](https://nodejs.org) >=8.0

- Install [otfcc](https://github.com/caryll/otfcc)

- Install [otfcc-cubic2quad](https://github.com/caryll/otfcc-cubic2quad)

- Execute the `build.sh` script, with the input file name as a single argument

- Gather the output file in the current working directory

You may want to use a `for`-loop to iterate through all `*.otf` files.

## License

Copyright © 2014-2017 Adobe Systems Incorporated (http://www.adobe.com/), with
Reserved Font Name ‘Source’. Source is a trademark of Adobe Systems
Incorporated in the United States and/or other countries.

Copyright © 2017-2020 Star Brilliant (https://github.com/m13253/kaigen-fonts),
James Swineson, Dingyuan Wang, extratype.

This Font Software is licensed under the SIL Open Font License, Version 1.1.
This Font Software is distributed on an **“AS IS” BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND**, either express or implied. See the SIL Open Font
License for the specific language, permissions and limitations governing your
use of this Font Software.

---

<a name="footnote1">[1]</a>: 北周‧庾信《徵調曲》「落其實者思其樹，飲其流者懷其源。」

<a name="footnote2">[2]</a>: Lin Yutang’s Chinese-English Dictionary of Modern Usage
