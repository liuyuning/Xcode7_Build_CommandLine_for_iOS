#!/bin/bash
C=$(dirname $0)

APP_PATH=/Applications/Xcode.app

#echo 'Current path:"'${C}\"
echo 'Xcode path:"'${APP_PATH}\"

echo '== For command line tool(com.apple.product-type.tool, com.apple.package-type.mach-o-executable) =='
mv -n ${APP_PATH}/Contents/PlugIns/IDEiOSSupportCore.ideplugin/Contents/Resources/Embedded-Shared.xcspec ${APP_PATH}/Contents/PlugIns/IDEiOSSupportCore.ideplugin/Contents/Resources/Embedded-Shared.orig.xcspec
cp ${C}/Embedded-Shared.xcspec ${APP_PATH}/Contents/PlugIns/IDEiOSSupportCore.ideplugin/Contents/Resources/Embedded-Shared.xcspec
echo '== Done =='

echo '== For disable code signing on iOS device =='
cp -n ${APP_PATH}/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/SDKSettings.plist ${APP_PATH}/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/SDKSettings.orig.plist
plutil -replace DefaultProperties.CODE_SIGNING_REQUIRED -string "NO" ${APP_PATH}/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/SDKSettings.plist
echo '== Done =='
