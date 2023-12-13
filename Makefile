TAG ?= "latest"

build:
	docker build -t pydocker .

tag:
	docker tag pydocker:latest allrisc/pydocker:$(TAG)
