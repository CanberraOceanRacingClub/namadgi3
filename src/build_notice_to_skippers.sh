#!/usr/bin/bash
#
# Create the notice_to_skppers PDF
#
# This script assumed:
#
# * the OAUTH key for the Namadgi repository is contained in a .secrets file in this directory
# * the project meeting_minutes has been installed as a subdirectory of this directory (use ``git clone git@github.com:smr547/meeting_minutes.git``)
# * the [rclone](https://rclone.org/) program has been installed on this host
# * the Google Drive API OAUTH key has been registered with [rclone](https://rclone.org/) on this host
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
./gradlew run --args="-u $user -r $repo -o $OAUTH_KEY -f $from_date -l Notice -b -c -n  -h 'Notice to Skippers of Namadgi 3' -p /tmp/notice2skippers.pdf"
cd -
#
# Copy the notice2skippers.pdf to the Google Drive where it is accessible by all members via a permanent URL
# https://drive.google.com/file/d/1i-YuaQUBsnXLdzOwMTpy_5Pxi81VKXi4/view?usp=share_link
#
# echo Copying notice2skippers.pdf to Google Drive
# rclone copy /tmp/notice2skippers.pdf gdrive:Committee\ Area/Subcommittees/Maintenance/Notice2Skippers
# rclone copy /tmp/notice2skippers.pdf gdrive:Committee\ Area/Subcommittees/Maintenance/Notice2Skippers/history/notice2skippers_$today.pdf
cp /tmp/notice2skippers.pdf /var/www/html
cd driveutil
./build/install/driveutil/bin/driveutil -s /tmp/notice2skippers.pdf -d Notice2Skippers
cd -
