# Docker - Nginx (WIP)

Repository for our nginx docker images, these are not made to be used directly but rather from Docker Hub.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

To run this project you need:

* [Docker Engine 18.02.0+](https://www.docker.com/products/docker-engine)
* [Make](https://www.gnu.org/software/make/)

### Installing

Simply run one of the make commands to build an image.

**Build all images**

```
make build-all
```

**Rebuild all images**

```
make rebuild-all
```

There's also more specific commands, to see a full list run

```
make help
```

## Deployment

Simply login using the Docker CLI and then run the following command to build and deploy all images

```
make push-all
```

You can also rebuild and push all images

```
make push-fresh-all
```

There's also more targeted push commands as well, to see a full list run

```
make help
```

## Roadmap

1. Decide if prod SSL should be handled within container or seperately then implement it.
2. Implement development self-signed certificate for SSL.
3. Look into automation for generating all the different Docker Images.
4. Make nginx config files more modular to avoid having to rewrite minor parts per image.
5. Setup TravisCI for auto-tagging and uploading versioned images.

## Authors

* **Alexander Karlsson** - *Initial work* - [alexkstrt](https://github.com/alexkstrt)
* **Cytopia** - *Inspiration for Make* - [cytopia](https://github.com/cytopia)

See also the list of [contributors](https://github.com/strt/docker-nginx/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [license](license) file for details
