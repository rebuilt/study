# Docker

## Docker commands

- Verifying your install

```bash
 docker version
```

- Running a script through docker container

```bash
docker run ruby:2.6 ruby -e "puts :hello"
```

- Listing open docker containers

```bash
docker ps
```

- List open and closed containers

```bash
docker ps -a
```

- Remove container

```bash
docker rm <container id> [<container id2>]
docker rm 974e2bcb8266 7f8d7dddd6b5
```

- Start interactive bash shell with the current folder mapped to the container's /usr/src/app folder. Use a container with ruby 2.6 installed

```bash
docker run -i -t --rm -v ${PWD}:/usr/src/app ruby:2.6 bash
cd /usr/src/app
```

- Install rails inside the container and don't build dependencies since they won't get saved to /usr/src/app anyway

```bash
rails new myapp --skip-test --skip-bundle
```

- Exit the container

```bash
exit
```

- Build a DOCKERFILE

```bash
docker build [options] path/to/build/directory
docker build .
```

- List docker images

```bash
docker images
```

- Run a web server using our build

```bash
docker run -p 3000:3000 a1df0eddba18 \
bin/rails s -b 0.0.0.0
```

- Tag a build

```bash
docker tag a1df0eddba18 railsapp
```

- Add an additional tag for versioning

```bash
docker tag railsapp railsapp:1.0
```

- Add a default command to a dockerfile

```docker
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
```

## Docker Compose commands

- Launch docker-compose

```bash
docker-compose up
```

- Stop docker-compose

```bash
docker-compose stop
docker-compose stop <service_name>
docker-compose stop web
```

- Start service

```bash
docker-compose start web
```

- Restart service

```bash
docker-compose restart web
```

- Resolving errors where rails server does not stop

```bash
rm tmp/pids/server.pid
```

- View running docker processes

```bash
docker-compose ps
```

- View container logs

```bash
docker-compose logs -f web
```

- Run a one-off command in a new, throwaway container

```bash
docker-compose run --rm web echo 'ran a different command'
docker-compose run --rm <service name> <some command>
```

- Run a one-off command in an existing, running container

```bash
docker-compose exec web echo 'ran a different command'
docker-compose exec <service name> <some command>
```

- Build our images with docker-compose

```bash
docker-compose build web
```

- Close a docker-compose resource

```bash
docker-compose down
```

- Remove an app's container

```bash
docker-compose rm web
```

- Remove dangling images

```bash
docker image prune
```

- Remove containers

```bash
docker container prune
```

- Remove everything

```bash
docker system prune
```

- Manage container lifecycle

```bash
docker-compose [start|stop|kill|restart|pause|unpause|rm] \
<service name>
```

## Redis

- Start redis

```bash
docker run --name redis-container redis
```
