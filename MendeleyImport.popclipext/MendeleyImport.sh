watchFolder=${POPCLIP_OPTION_MENDELEYWATCHEDFOLDER%/}
downloadFile=${POPCLIP_TEXT##*/}
downloadFile="${downloadFile%.pdf}.pdf"

#if the url does not start with http://, add it
if [ ${POPCLIP_TEXT#http://} == $POPCLIP_TEXT ]; then 
    POPCLIP_TEXT="http://$POPCLIP_TEXT"
fi

if [ -n $watchFolder ]; then
    if [ ! -d $watchFolder ]; then
       mkdir $watchFolder
    fi 
    wget "$POPCLIP_TEXT" -O $watchFolder/$downloadFile
    exit $?
else
    exit 1
fi
