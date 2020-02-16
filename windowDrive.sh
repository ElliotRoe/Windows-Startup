#!/bin/sh

#Lists all the names of connected (but doesn't have to be mounted) sd_'s
for OUTPUT in $(lsblk -i -o NAME --nodeps /dev/sd?)
do
  #Takes out "NAME" in output
  if [ $OUTPUT != "NAME" ]
  then
    #mounts each sd_ devices
    sudo mount /dev/${OUTPUT} /media/gurgi414
    #checks if the fs is NTFS (the windows file system)
    result = $(lsblk -f | grep ${OUTPUT} | grep NTFS)
    if [ $result != "" ]
    then
      #puts test text file in common start up folder in windows
      nano '/media/gurgi414/ProgramData/Microsoft/Windows/Start Menu/Programs/Startup/test.txt'
    fi
    #unmounts the device after all processes have been finished
    sudo umount /dev/${OUTPUT}
  fi
done
