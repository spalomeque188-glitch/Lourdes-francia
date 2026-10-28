FROM jrottenberg/ffmpeg:4.4-ubuntu2004
RUN apt-get update && apt-get install -y python3 curl
ENTRYPOINT []
CMD sh -c "curl -L -o /logo.jpg https://raw.githubusercontent.com/Jhonatan-Cortez-Luminosity/Lourdes-francia/main/logo.jpg || curl -L -o /logo.png https://raw.githubusercontent.com/Jhonatan-Cortez-Luminosity/Lourdes-francia/main/logo.png; LOGO=$(ls /logo.* | head -n 1); python3 -m http.server 7860 & exec ffmpeg -re -i https://l1b1-lourdes-france.com/ingest/cam_grotte/playlist.m3u8 -i $LOGO -filter_complex \"[1:v]colorkey=0x000000:0.3:0.1[ck];[0:v][ck]overlay=W-w-20:20\" -c:v libx264 -preset veryfast -b:v 2000k -c:a aac -f flv rtmp://a.rtmp.youtube.com/live2/$YOUTUBE_KEY"
