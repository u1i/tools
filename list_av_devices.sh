# uses ffmpeg to list audio/video devices

ffmpeg -f avfoundation -list_devices true -i "" 2>&1 | grep AVFoundation
