#!/usr/bin/env bash
set -e
make
./image_processor images output
