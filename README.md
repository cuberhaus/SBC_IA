# Segunda práctica de IA sobre Sistemas Basados en el Conocimiento.

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [Segunda práctica de IA sobre Sistemas Basados en el Conocimiento.](#segunda-práctica-de-ia-sobre-sistemas-basados-en-el-conocimiento)
    - [Installation](#installation)
    - [Convert](#convert)
    - [Usage](#usage)

<!-- markdown-toc end -->

## Installation

``` shell
pip install owl2clips
```

## Convert
protege to clips:
1. save ontology as turtle

``` shell
owl2clips --input file --format turtle
```

## Usage
```shell
(load sbc.clp)
(load instancias.clp)
(load main.clp)
(reset)
(run)
```
