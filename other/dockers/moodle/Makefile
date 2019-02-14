name = moodle

help:
	@echo 'Task:'
	@echo ''
	@echo 'make docker.bash'
	@echo 'make docker.daemon'
	@echo 'make docker.build'

docker.daemon:
	docker run -ti --name $(name) --rm $(name)

docker.bash:
	docker run -ti --name $(name) --rm $(name) bash

docker.build:
	docker build -t $(name) .
