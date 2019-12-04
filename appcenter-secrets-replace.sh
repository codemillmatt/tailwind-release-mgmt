# This is used during the build pipeline to replace the App Center Secrets

echo "Loading App Center Secrets"

if [ ! -n "$ANDROID_APP_CENTER_SECRET" ] || [ ! -n "$IOS_APP_CENTER_SECRET" ]  ; then
    echo "**** not all needed app center variables are set ****"
    exit
fi

ANDROID_APPCENTER_SECRET_PLACEHOLDER="< ENTER YOUR APP CENTER ANDROID SECRET HERE >"
IOS_APPCENTER_SECRET_PLACEHOLDER="< ENTER YOUR APP CENTER IOS SECRET HERE >"

APPCENTER_CONSTANT_FILE=$BUILD_SOURCESDIRECTORY/src/TailwindTraders.Mobile/TailwindTraders.Mobile.Core/Helpers/AppCenterConstants.cs

echo $APPCENTER_CONSTANT_FILE

if [ -e "$APPCENTER_CONSTANT_FILE" ]
then
    echo "updating the android app center secrets"
    sed -i ".bak" -e "s,$ANDROID_APPCENTER_SECRET_PLACEHOLDER,$ANDROID_APP_CENTER_SECRET,g" $APPCENTER_CONSTANT_FILE

    echo "updating the ios app center secrets"
    sed -i ".bak" -e "s,$IOS_APPCENTER_SECRET_PLACEHOLDER,$IOS_APP_CENTER_SECRET,g" $APPCENTER_CONSTANT_FILE

    echo "the app center secrets file:"
    cat $APPCENTER_CONSTANT_FILE
fi
