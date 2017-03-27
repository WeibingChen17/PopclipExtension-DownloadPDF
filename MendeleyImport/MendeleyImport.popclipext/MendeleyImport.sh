Target=${POPCLIP_OPTION_MENDELEYWATCHEDFOLDER%/}
if [ -n $Target ]; then
    if [ ! -d $Target ]; then
       mkdir $Target
    fi 
    wget "$POPCLIP_TEXT" -O $Target/${POPCLIP_TEXT##*/}
    exit $?
else
    exit 1
fi
