#!/usr/bin/env bash

# Helper script to restart SketchyBar
# Useful when making configuration changes

echo "Stopping SketchyBar..."
sketchybar --exit

echo "Starting SketchyBar..."
sketchybar

echo "SketchyBar restarted successfully!"
