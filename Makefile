.PHONY: default
default: create_db
	cd labtrendig && bundle install --system

create_db: bundle_install
	cd labtrendig && bundle exec rake db:create

migrate_db: create_db
	cd labtrendig && bundle exec rake db:migrate

.PHONY: backend
backend:
	docker-compose run --rm --service-ports --use-aliases backend --shell


.PHONY: run_server
runserver:
	cd labtrendig && rails s -b 0.0.0.0 -p 8000

build:
	cd docker && docker build \
		--target base \
		--tag ruby-alpine:latest \
		.

	cd docker && docker build \
		--target develop \
		--tag ruby-alpine:develop \
		.