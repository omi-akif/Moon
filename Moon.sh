#!/bin/bash

# Define the countdown durations in seconds
durations=(2 2)  # 1800 seconds = 30 minutes, 600 seconds = 10 minutes

# Define the sound file path
sound_file="alarm_1.wav"  # Replace with your desired sound file path

# Loop through the countdown durations
while true; do
  for duration in "${durations[@]}"; do
    # Start the countdown timer
    echo "Timer started: $((duration / 60)) minutes"
    sleep "$duration"

    # Play the sound file
    play "$sound_file" >/dev/null 2>&1

    # Start the next timer
    echo "Timer finished. Starting the next timer..."
  done
done
