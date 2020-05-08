build:
	cd docker && docker build \
		--target base \
		--tag ruby-alpine:latest \
		.

	cd docker && docker build \
		--target develop \
		--tag ruby-alpine:develop \
		.

.PHONY: backend
backend:
	docker-compose run --rm --service-ports --use-aliases backend --shell
