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

# Function to handle pausing the timer
handle_pause() {
  read -n 1 -s -r -p "Timer paused. Press any key to resume..."
}

# Loop through the countdown durations
while true; do
  for duration in "${durations[@]}"; do
    # Start the countdown timer
    echo "Timer started: $((duration / 60)) minutes"
    for ((sec = duration; sec > 0; sec--)); do
      display_timer "$sec"
      
      # Check for pause key press (p or P)
      read -n 1 -s -t 1 key
      if [[ $key == "p" ]] || [[ $key == "P" ]]; then
        handle_pause
        display_timer "$sec"  # Resume timer display
      fi
      
      sleep 1
    done
    echo

    # Play the sound file
    play "$sound_file" >/dev/null 2>&1

    # Start the next timer
    echo "Timer finished. Starting the next timer..."
  done
done
