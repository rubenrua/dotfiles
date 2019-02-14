name = pipewire

help:
	@echo 'WIP'
	@echo ''
	@echo 'Task:'
	@echo ''
	@echo 'make docker.bash'
	@echo 'make docker.daemon'
	@echo 'make docker.build'

docker.daemon:
	docker run -ti --name $(name) --rm $(name)

docker.bash:
	xhost +local:root
	docker run -ti \
		-e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix \
		-e XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR} -v ${XDG_RUNTIME_DIR}:${XDG_RUNTIME_DIR} \
		-v /dev/snd:/dev/snd --privileged \
		-v /dev/video0:/dev/video0 \
		--name $(name) --rm $(name) bash

docker.build:
	docker build -t $(name) .
