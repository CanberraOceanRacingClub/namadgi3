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
user=smr547
repo=Trilogy
from_date=2099-01-01
today=$(date '+%Y-%m-%d')
cd meeting_minutes
echo Generating priority_1.pdf
./gradlew run --args="-u $user -r $repo -o $OAUTH_KEY -f $from_date -l Priority_1 -b -n  -h 'Priority_1 Issues' -p /tmp/priority_1.pdf"
cd -
