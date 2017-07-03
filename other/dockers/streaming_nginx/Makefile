name = streaming

help:
	@echo 'Task:'
	@echo ''
	@echo 'make docker.bash'
	@echo 'make docker.daemon'
	@echo 'make docker.build'
	@echo 'make rtmp.server'
	@echo 'make rtmp.client'

docker.daemon:
	docker run -ti --name $(name) --rm $(name)

docker.bash:
	docker run -ti --name $(name) --rm $(name) bash

docker.build:
	docker build -t $(name) .

rtmp.server:
	$(eval FROM=$(shell docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(name)))
	GST_DEBUG=3 gst-launch-1.0 v4l2src ! video/x-raw, width=800 ! queue ! identity single-segment=true ! videorate ! videoconvert ! x264enc pass=pass1 threads=0 bitrate=900 tune=zerolatency ! queue ! h264parse ! video/x-h264,stream-format=avc ! flvmux name=fmux streamable=true ! rtmpsink location=rtmp://$(FROM)/sbs/sbs

rtmp.client:
	$(eval FROM=$(shell docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(name)))
	ffplay rtmp://$(FROM)/sbs/sbs
