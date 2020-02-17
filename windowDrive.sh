#!/bin/sh

#finds windows drive name
deviceName = $(lsblk -f --nodeps /dev/sd?? | grep -i ntfs | grep -w -o "sd..")
#processes windows drive
sudo ntfsfix ${deviceName}
#mounts the windows drive
sudo mount ${deviceName} /media/gurgi414
#puts test text file in common start up folder in windows
nano '/media/gurgi414/ProgramData/Microsoft/Windows/Start Menu/Programs/Startup/test.txt'
#unmounts the device after all processes have been finished
sudo umount ${deviceName}
