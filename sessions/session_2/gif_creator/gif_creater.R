# Title: Reproducible GIF Generator for HTML Animation
# Author: Gemini
# Date: 2025-06-29

# --- Step 1: Install and load required packages ---
# Ensure the necessary packages are installed.
if (!require(av)) install.packages("av")
if (!require(magick)) install.packages("magick")
if (!require(here)) install.packages("here") # Optional but good practice

library(av)
library(magick)
library(here) # Makes file paths easier

# --- Step 2: Define parameters for the recording ---
# The HTML file must be in your project directory
html_file <- here::here("api_flow_single_run.html") 
# Check if the file exists before proceeding
if (!file.exists(html_file)) {
  stop("The HTML file was not found. Please make sure 'api_flow_single_run.html' is in your project directory.")
}

output_video_file <- here::here("animation_capture.mp4")
output_gif_file <- here::here("api_flow.gif")

# Total duration of the animation in seconds.
# The JS animation is about 9 seconds long. We add a buffer.
record_duration <- 10 
gif_fps <- 15 # Frames per second for the final GIF

# --- Step 3: Open the animation in a browser ---
# This will open the local HTML file in your default web browser.
# IMPORTANT: Before running the next step, make sure the browser window is
# visible on your screen and positioned where you want to record.
# Do not minimize it.
browseURL(html_file)

# Give yourself a moment to ensure the browser window is ready.
message("You have 5 seconds to position your browser window for recording...")
Sys.sleep(5)
message("Starting recording now!")

# --- Step 4: Record the screen using the 'av' package ---
# This starts recording the screen. It will run for `record_duration` seconds.
av::av_capture_graphics(
  output = output_video_file,
  duration = record_duration,
  vfilter = "null" # Use 'null' for direct screen capture without resizing
)

message(paste("Screen recording saved to:", output_video_file))

# --- Step 5: Convert the recorded video to a GIF ---
# We use the 'magick' package for a high-quality conversion.
message("Reading video frames...")
animation_frames <- magick::image_read_video(output_video_file, fps = gif_fps)

# Optional: You can optimize the GIF here if needed, e.g., scaling.
# animation_frames <- image_scale(animation_frames, "800x") # Resize to 800px wide

message("Optimizing and writing GIF...")
magick::image_write_gif(
  image = animation_frames,
  path = output_gif_file,
  delay = 1 / gif_fps # Set the delay between frames
)

message(paste("Success! Your final GIF is available at:", output_gif_file))

# You can view the GIF directly in the RStudio viewer (if supported)
# or open it with your system's default image viewer.
browseURL(output_gif_file)

