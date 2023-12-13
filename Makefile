TAG ?= "latest"

build:
	docker build -t pydocker . --ulimit nproc=8

tag:
	docker tag pydocker:latest allrisc/pydocker:$(TAG)
