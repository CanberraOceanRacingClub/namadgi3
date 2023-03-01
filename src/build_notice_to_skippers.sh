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
echo $from_date
echo $OAUTH_KEY
cd meeting_minutes
./gradlew run --args="-u $user -r $repo -o $OAUTH_KEY -f $from_date -l Notice -b -c -n -i -h 'Notice to Skippers' -p /tmp/notice2skippers.pdf"
cd -
