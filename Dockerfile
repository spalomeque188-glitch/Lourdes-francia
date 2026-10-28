FROM jrottenberg/ffmpeg:4.4-ubuntu2004
RUN apt-get update && apt-get install -y python3
CMD sh -c "python3 -m http.server 7860 & ffmpeg -re -i https://lb1-live.lourdes-france.com/ingest/cam_grotte/playlist.m3u8 -c:v libx264 -preset veryfast -b:v 1500k -c:a aac -f flv rtmp://a.rtmp.youtube.com/live2/$bgrd-dahh-eepr-esk7-80tb
