#!/bin/bash

killall -q picom

picom --backend xrender &
