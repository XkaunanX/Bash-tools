#!/bin/bash

mkdir -p execu
mkdir -p no-execu

find . type f -executable -exec cp {} execu/ \;
find . type f ! -executable -exec cp {} no-execu/ \;