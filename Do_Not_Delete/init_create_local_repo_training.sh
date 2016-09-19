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
sudo mkdir -pv /Shared\ Items/coretraining
# Clone the iStore-Training Repo into Library
sudo git clone https://github.com/core-group/iStoresTraining.git /Shared\ Items/coretraining
#Create link of coretraining to Web Server
sudo ln -fs /Shared\ Items/coretraining/ /Library/Server/Web/Data/Sites/Default/
# Copy LaunchDaemon
sudo cp /Shared\ Items/coretraining/com.core.istore.run_training_gitpull.plist /Library/LaunchDaemons/
sudo launchctl load -w /Library/LaunchDaemons/com.core.istore.run_training_gitpull.plist
