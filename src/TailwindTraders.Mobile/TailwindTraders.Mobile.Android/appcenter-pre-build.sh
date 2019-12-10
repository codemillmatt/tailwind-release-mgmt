#!/usr/bin/env bash

echo "Arguments for updating:"
echo " - iOS App Center: $IOS_APP_CENTER"
echo " - Android App Center: $ANDROID_APP_CENTER"
echo " - Google Project Number: $GOOGLE_PROJECT_NUMBER"

# Updating ids

AppCenterConstantsFile=$BUILD_REPOSITORY_LOCALPATH/src/TailwindTraders.Mobile/TailwindTraders.Mobile.Core/Helpers/AppCenterConstants.cs
GoogleServicesFile=$BUILD_REPOSITORY_LOCALPATH/src/TailwindTraders.Mobile/TailwindTraders.Mobile.Android/google-services.json

sed -i '' "s/< ENTER YOUR APP CENTER IOS SECRET HERE >/$IOS_APP_CENTER/g" $AppCenterConstantsFile
sed -i '' "s/< ENTER YOUR APP CENTER ANDROID SECRET HERE >/$ANDROID_APP_CENTER/g" $AppCenterConstantsFile
sed -i '' "s/NO PROJECT NUMBER/$GOOGLE_PROJECT_NUMBER/g" $GoogleServicesFile

# Print out file for reference
cat $AppCenterConstantsFile
cat $GoogleServicesFile

echo "Updated id!"