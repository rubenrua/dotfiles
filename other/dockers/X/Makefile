name = withx

help:
	@echo 'Task:'
	@echo ''
	@echo 'make docker.run'
	@echo 'make docker.build'

docker.run:
	docker run -ti --name $(name) --rm -e DISPLAY=$$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix $(name)

docker.build:
	docker build -t $(name) .
