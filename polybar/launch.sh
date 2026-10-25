#!/usr/bin/env bash

killall -q polybar

polybar left -r &
polybar mid -r &
polybar right -r &
