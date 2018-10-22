#!/bin/bash

SNAPSHOTS_DIR="SnapshotsHTMLExampleTests/ReferenceImages_64/"
TEST_TARGET="SnapshotsHTMLExampleTests"

# Get subdirectories
echo "Getting subdirectories…"
SNAPSHOT_SUBDIRECTORIES=$(find $SNAPSHOTS_DIR -type d | sort | awk '$0 !~ last "/" {print last} {last=$0} END {print last}')
subdirectories=""
for subdirectoryPath in $SNAPSHOT_SUBDIRECTORIES
do
 subdirectory=$(echo $subdirectoryPath | cut -d'.' -f 2)
 subdirectories="$subdirectories\n$subdirectory"
done

# Create HTML
echo "Creating HTML file…"
> snapshots_preview.html
echo "<html><body><div style=\"width:100vw;\">" > snapshots_preview.html

# Iterating subdirectories
echo "Iterating subdirectories"
for subdirectory in $(echo $subdirectories)
do
	echo "<h1>Title$subdirectory</h1>" >> snapshots_preview.html
	echo "<div style=\"display: flex; flex-wrap: wrap; flex-direction: row; width: 100vw;\" >" >> snapshots_preview.html
	completePath=$(echo "$SNAPSHOTS_DIR/$TEST_TARGET.$subdirectory/*.png")

	for snapshotFilePath in $completePath
 	do

	filename=$(echo $snapshotFilePath | cut -d'/' -f 5)
	snapshotHTMLCode=$(echo "<div style=\"flex-direction: column; border:1px solid black; justify-content: center;\"><p style=\"margin: 10px\">$filename</p><img src=\"$snapshotFilePath\" style=\"width:300; border:1px solid black;\"></div>")
	echo $snapshotHTMLCode >> snapshots_preview.html
 	done
	echo "</div>" >> snapshots_preview.html
done
echo "</div></body></html>" >> snapshots_preview.html

# Open HTML file
echo "Opening HTML..."
open snapshots_preview.html