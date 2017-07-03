'use strict';

var sbsSource = 'http://streaming.campusdomar.es/live/hlstestsbs/playlist.m3u8';

if(false && Hls.isSupported()) {
    var sbsVideo = document.getElementById('sbsVideo');

    var sbsHls = new Hls();
    sbsHls.loadSource(sbsSource);
    sbsHls.attachMedia(sbsVideo);
    sbsHls.on(Hls.Events.MANIFEST_PARSED,function() {
        sbsVideo.play();
    });
}



var preSource = 'http://streaming.campusdomar.es/live/hlstestpre/playlist.m3u8';
var pptSource = 'http://streaming.campusdomar.es/live/hlstestppt/playlist.m3u8';


if(true && Hls.isSupported()) {
    var preVideo = document.getElementById('preVideo');
    var pptVideo = document.getElementById('pptVideo');

    var preHls = new Hls();
    preHls.loadSource(preSource);
    preHls.attachMedia(preVideo);

    var prePromese = new Promise(function(resolve, reject) {
        preHls.on(Hls.Events.MANIFEST_PARSED,function() {
            resolve();
            //preVideo.play();
        });
    });


    var pptHls = new Hls();
    pptHls.loadSource(pptSource);
    pptHls.attachMedia(pptVideo);
    var pptPromese = new Promise(function(resolve, reject) {
        pptHls.on(Hls.Events.MANIFEST_PARSED,function() {
            resolve();
        });
    });
}


Promise.all([pptPromese, prePromese]).then(function(){
    pptVideo.play();
    preVideo.play();
});
