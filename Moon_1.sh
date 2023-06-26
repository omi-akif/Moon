#!/bin/bash

# Define the countdown durations in seconds
durations=(1800 600)  # 1800 seconds = 30 minutes, 600 seconds = 10 minutes

# Define the sound file path
sound_file="alarm_1.wav"  # Replace with your desired sound file path

# Function to display the countdown timer
display_timer() {
  local remaining=$1
  local minutes=$((remaining / 60))
  local seconds=$((remaining % 60))
  printf "\rTimer remaining: %02d:%02d" "$minutes" "$seconds"
}

# Loop through the countdown durations
while true; do
  for duration in "${durations[@]}"; do
    # Start the countdown timer
    play "$sound_file" >/dev/null 2>&1
    echo "Timer started: $((duration / 60)) minutes"
    for ((sec = duration; sec > 0; sec--)); do
      display_timer "$sec"
      sleep 1
    done
    echo

    # Play the sound file
    play "$sound_file" >/dev/null 2>&1
    play "$sound_file" >/dev/null 2>&1
    # Start the next timer
    echo "Timer finished. Starting the next timer..."
  done
done
