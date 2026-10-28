
FROM jrottenberg/ffmpeg:4.4-ubuntu2004
RUN apt-get update && apt-get install -y python3
COPY logo.jpg /logo.jpg
ENTRYPOINT []
CMD sh -c "python3 -m http.server 7860 & exec ffmpeg -re -i https://l1b1-lourdes-france.com/ingest/cam_grotte/playlist.m3u8 -i /logo.jpg -filter_complex \"[1:v]colorkey=0x000000:0.3:0.1[ck];[0:v][ck]overlay=W-w-20:20\" -c:v libx264 -preset veryfast -b:v 2000k -c:a aac -f flv rtmp://a.rtmp.youtube.com/live2/$bgrd-dahh-eepr-esk7-80tb
