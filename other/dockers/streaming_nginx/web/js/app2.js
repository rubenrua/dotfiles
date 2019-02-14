'use strict';

var sbsSource = 'http://streaming.campusdomar.es/live/hlstestsbs/playlist.m3u8';




function updateBigVideo(v,c,w,h) {
    if(v.paused || v.ended) return false;
    c.drawImage(v, 640, 0, 640, 720, 0, 0, 640, 720);
    setTimeout(updateBigVideo,20,v,c,w,h);
}


if(Hls.isSupported()) {
    var sbsVideo = document.getElementById('sbsVideo');

    var canvas = document.getElementById('bigVideo');
    var context = canvas.getContext('2d');
    var cw = Math.floor(canvas.clientWidth);
    var ch = Math.floor(canvas.clientHeight);
    canvas.width = cw;
    canvas.height = ch;



    var sbsHls = new Hls();
    sbsHls.loadSource(sbsSource);
    sbsHls.attachMedia(sbsVideo);
    sbsHls.on(Hls.Events.MANIFEST_PARSED,function() {
        sbsVideo.play();
        updateBigVideo(sbsVideo,context,cw,ch);
    });
}
