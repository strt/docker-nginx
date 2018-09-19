location = Dockerfiles

#
# Docker tags
#
base-base = strt/nginx:base
base-development = strt/nginx:base-development
base-production = strt/nginx:base-production

php-development = strt/nginx:php-development
php-production = strt/nginx:php-production

wordpress-development = strt/nginx:wordpress-development
wordpress-production = strt/nginx:wordpress-production

help:
	@printf "%s\n\n" "Generate and build docker images."
	@printf "%s\n" "make build-all:                         Build all images"
	@printf "%s\n" "make rebuild-all:                       Rebuild all images"
	@printf "\n"
	@printf "%s\n" "make build-base:                        Build all base images"
	@printf "%s\n" "make build-php:                         Build all PHP images"
	@printf "%s\n" "make build-wordpress:                   Build all WordPress images"
	@printf "\n"
	@printf "%s\n" "make rebuild-base:                      Rebuild all base images"
	@printf "%s\n" "make rebuild-php:                       Rebuild all PHP images"
	@printf "%s\n" "make rebuild-wordpress:                 Rebuild all WordPress images"
	@printf "\n"
	@printf "%s\n" "make build-base-base:                   Build fully base image"
	@printf "%s\n" "make build-base-development:            Build development base image"
	@printf "%s\n" "make build-base-production:             Build production base image"
	@printf "\n"
	@printf "%s\n" "make build-php-development:             Build development PHP image"
	@printf "%s\n" "make build-php-production:              Build production PHP image"
	@printf "\n"
	@printf "%s\n" "make build-wordpress-development:       Build development WordPress image"
	@printf "%s\n" "make build-wordpress-production:        Build production WordPress image"
	@printf "\n"
	@printf "%s\n" "make rebuild-base-base:                 Rebuild fully base image"
	@printf "%s\n" "make rebuild-base-development:          Rebuild development base image"
	@printf "%s\n" "make rebuild-base-production:           Rebuild production base image"
	@printf "\n"
	@printf "%s\n" "make rebuild-php-development:           Rebuild development PHP image"
	@printf "%s\n" "make rebuild-php-production:            Rebuild production PHP image"
	@printf "\n"
	@printf "%s\n" "make rebuild-wordpress-development:     Rebuild development WordPress image"
	@printf "%s\n" "make rebuild-wordpress-production:      Rebuild production WordPress image"
	@printf "\n"
	@printf "%s\n" "make push-all:                          Build and push all images"
	@printf "%s\n" "make push-fresh-all:                    Rebuild and push all images"
	@printf "\n"
	@printf "%s\n" "make push-base:                         Build and push all base images"
	@printf "%s\n" "make push-php:                          Build and push all PHP images"
	@printf "%s\n" "make push-wordpress:                    Build and push all WordPress images"
	@printf "\n"
	@printf "%s\n" "make push-fresh-base:                   Rebuild and push all base images"
	@printf "%s\n" "make push-fresh-php:                    Rebuild and push all PHP images"
	@printf "%s\n" "make push-fresh-wordpress:              Rebuild and push all WordPress images"
	@printf "\n"
	@printf "%s\n" "make push-base-base:                    Build and push fully base image"
	@printf "%s\n" "make push-base-development:             Build and push development base image"
	@printf "%s\n" "make push-base-production:              Build and push production base image"
	@printf "\n"
	@printf "%s\n" "make push-php-development:              Build and push development PHP image"
	@printf "%s\n" "make push-php-production:               Build and push production PHP image"
	@printf "\n"
	@printf "%s\n" "make push-wordpress-development:        Build and push development WordPress image"
	@printf "%s\n" "make push-wordpress-production:         Build and push production WordPress image"
	@printf "\n"
	@printf "%s\n" "make push-fresh-base-base:              Rebuild and push fully base image"
	@printf "%s\n" "make push-fresh-base-development:       Rebuild and push development base image"
	@printf "%s\n" "make push-fresh-base-production:        Rebuild and push production base image"
	@printf "\n"
	@printf "%s\n" "make push-fresh-php-development:        Rebuild and push development PHP image"
	@printf "%s\n" "make push-fresh-php-production:         Rebuild and push production PHP image"
	@printf "\n"
	@printf "%s\n" "make push-fresh-wordpress-development:  Rebuild and push development WordPress image"
	@printf "%s\n" "make push-fresh-wordpress-production:   Rebuild and push production WordPress image"
	@printf "\n"



#
# Build all
#
build-all: build-base build-php build-wordpress
rebuild-all: rebuild-base rebuild-php rebuild-wordpress



#
# Build categories
#
build-base: build-base-base build-base-development build-base-production
build-php: build-php-development build-php-production
build-wordpress: build-wordpress-development build-wordpress-production



#
# Rebuild categories
#
rebuild-base: rebuild-base-base rebuild-base-development rebuild-base-production
rebuild-php: rebuild-php-development rebuild-php-production
rebuild-wordpress: rebuild-wordpress-development rebuild-wordpress-production



#
# Build separately
#
build-base-base: pull-from-base
	docker build -t $(base-base) -f $(location)/base/Dockerfile-base $(location)/base
build-base-development:
	docker build -t $(base-development) -f $(location)/base/Dockerfile-development $(location)/base
build-base-production:
	docker build -t $(base-production) -f $(location)/base/Dockerfile-production $(location)/base

build-php-development:
	docker build -t $(php-development) -f $(location)/php/Dockerfile-development $(location)/php
build-php-production:
	docker build -t $(php-production) -f $(location)/php/Dockerfile-production $(location)/php

build-wordpress-development:
	docker build -t $(wordpress-development) -f $(location)/wordpress/Dockerfile-development $(location)/wordpress
build-wordpress-production:
	docker build -t $(wordpress-production) -f $(location)/wordpress/Dockerfile-production $(location)/wordpress



#
# Rebuild separately
#
rebuild-base-base: pull-from-base
	docker build --no-cache -t $(base-base) -f $(location)/base/Dockerfile-base $(location)/base
rebuild-base-development:
	docker build --no-cache -t $(base-development) -f $(location)/base/Dockerfile-development $(location)/base
rebuild-base-production:
	docker build --no-cache -t $(base-production) -f $(location)/base/Dockerfile-production $(location)/base

rebuild-php-development:
	docker build --no-cache -t $(php-development) -f $(location)/php/Dockerfile-development $(location)/php
rebuild-php-production:
	docker build --no-cache -t $(php-production) -f $(location)/php/Dockerfile-production $(location)/php

rebuild-wordpress-development:
	docker build --no-cache -t $(wordpress-development) -f $(location)/wordpress/Dockerfile-development $(location)/wordpress
rebuild-wordpress-production:
	docker build --no-cache -t $(wordpress-production) -f $(location)/wordpress/Dockerfile-production $(location)/wordpress



#
# Pull base FROM image
#
pull-from-base:
	docker pull $(shell grep FROM $(location)/base/Dockerfile-base | sed 's/^FROM//g')



#
# Push all
#
push-all: push-base push-php push-wordpress
push-fresh-all: push-fresh-base push-fresh-php push-fresh-wordpress



#
# Push categories
#
push-base: push-base-base push-base-development push-base-production
push-php: push-php-development push-php-production
push-wordpress: push-wordpress-development push-wordpress-production



#
# Push fresh categories
#
push-fresh-base: push-fresh-base-base push-fresh-base-development push-fresh-base-production
push-fresh-php: push-fresh-php-development push-fresh-php-production
push-fresh-wordpress: push-fresh-wordpress-development push-fresh-wordpress-production



#
# Push separately
#
push-base-base: build-base-base
	docker push $(base-base)
push-base-development: build-base-development
	docker push $(base-development)
push-base-production: build-base-production
	docker push $(base-production)

push-php-development: build-php-development
	docker push $(php-development)
push-php-production: build-php-production
	docker push $(php-production)

push-wordpress-development: build-wordpress-development
	docker push $(wordpress-development)
push-wordpress-production: build-wordpress-production
	docker push $(wordpress-production)



#
# Push fresh separately
#
push-fresh-base-base: rebuild-base-base
	docker push $(base-base)
push-fresh-base-development: rebuild-base-development
	docker push $(base-development)
push-fresh-base-production: rebuild-base-production
	docker push $(base-production)

push-fresh-php-development: rebuild-php-development
	docker push $(php-development)
push-fresh-php-production: rebuild-php-production
	docker push $(php-production)

push-fresh-wordpress-development: rebuild-wordpress-development
	docker push $(wordpress-development)
push-fresh-wordpress-production: rebuild-wordpress-production
	docker push $(wordpress-production)
