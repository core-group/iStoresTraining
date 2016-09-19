#! /bin/sh
# install XCode Command Line Tools
/usr/bin/touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD" -v;
#Create coretraining folder in Shared folder
mkdir -p /Shared\ Items/Techs/coretraining
# Clone the iStore-Training Repo into Library
git clone https://github.com/core-group/iStoresTraining.git /Library/iStore\ Training
# Copy LaunchDaemon
