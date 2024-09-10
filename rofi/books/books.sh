#!/usr/bin/env bash

# Set the directory to search for PDFs
PDF_DIR="$HOME/Documents/books"

# Find all PDF files in the directory and format the output to show only the file name without the .pdf extension
PDF_FILES=$(find "$PDF_DIR" -type f -name "*.pdf" -exec basename {} .pdf \;)

# Check if there are any PDF files found
if [ -z "$PDF_FILES" ]; then
    notify-send "No PDFs found in $PDF_DIR"
    exit 1
fi

# Display the list of PDFs in Rofi and get the selected file
SELECTED_BOOK=$(echo "$PDF_FILES" | rofi -dmenu -i -p "Select a PDF" -theme "~/.config/rofi/books/books.rasi")

# If a book was selected, reconstruct the full path and open it with the default PDF viewer
if [ -n "$SELECTED_BOOK" ]; then
    xdg-open "$PDF_DIR/$SELECTED_BOOK.pdf"
fi
