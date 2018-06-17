#!/bin/bash
#This *should* return the total length (in seconds) of the video files in the folder.

#Returns a floating-point number
#find -E . -maxdepth 4 -regex '.*\.(avi|mp4|flv|mkv|mpg|mpeg|m4v)' -exec ffprobe -v quiet -of csv=p=0 -show_entries format=duration {} \; | paste -sd+ -| bc


#Returns cumulative length of all videos in folder, in days.
find -E . -maxdepth 4 -regex '.*\.(avi|mp4|flv|mkv|mpg|mpeg|m4v)' -exec ffprobe -v quiet -of csv=p=0 -show_entries format=duration {} \; | awk '{s+=$1} END {print s/3660/24, "days of video."}'
