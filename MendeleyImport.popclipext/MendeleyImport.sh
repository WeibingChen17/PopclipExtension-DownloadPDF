watchFolder=${POPCLIP_OPTION_MENDELEYWATCHEDFOLDER%/}
downloadFile=${POPCLIP_TEXT##*/}
downloadFile="${downloadFile%.pdf}.pdf"
echo $watchFolder, $downloadFile >> /tmp/message

#if the url does not start with http:// or https://, add it
target=$POPCLIP_TEXT
if [[ $target != http* ]];then
    target="http://$target"
fi
echo $target >> /tmp/message

if [ -n $watchFolder ]; then
    if [ ! -d $watchFolder ]; then
       mkdir $watchFolder
    fi 
    wget "$target" -O $watchFolder/$downloadFile
    exit $?
else
    exit 1
fi
