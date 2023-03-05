#!/usr/bin/bash
#
# Create the notice_to_skppers PDF
#
# This script assumed:
#
# * the OAUTH key for the Namadgi repository is contained in a .secrets file in this director
# * the project meeting_minutes has been installed as a subdirectory of this directory
#
#--------------------------------------------------
#
#
OAUTH_KEY=`cat .secrets`
user=CanberraOceanRacingClub
repo=namadgi3
from_date=2099-01-01
today=$(date '+%Y-%m-%d')
cd meeting_minutes
echo Generating notice2skippers.pdf
./gradlew run --args="-u $user -r $repo -o $OAUTH_KEY -f $from_date -l Notice -b -c -n  -h 'Notice to Skippers' -p /tmp/notice2skippers.pdf"
cd -
#
# Copy the notice2skippers.pdf to the Google Drive where it is accessible by all members via a permanent URL
# https://drive.google.com/file/d/1i-YuaQUBsnXLdzOwMTpy_5Pxi81VKXi4/view?usp=share_link
#
echo Copying notice2skippers.pdf to Google Drive
rclone copy /tmp/notice2skippers.pdf gdrive:Committee\ Area/Subcommittees/Maintenance/Notice2Skippers
rclone copy /tmp/notice2skippers.pdf gdrive:Committee\ Area/Subcommittees/Maintenance/Notice2Skippers/history/notice2skippers_$today.pdf
