#!/bin/bash

# ref: https://discourse.ubuntu.com/t/how-to-close-the-snap-store-to-allow-snapd-to-update-it/30627/13

killall snap-store

sudo snap refresh snap-store
