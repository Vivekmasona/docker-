# Docker

## Step 1 - Setup

Make sure the following dependencies are met:
- `git`
- `curl`
- `jq`

## Step 2 - Configure

Clone the repo
```sh
$ git clone https://codeberg.org/Hyperpipe/Docker
```

Make the setup script executable
```sh
$ chmod u+x gen.sh
```

Run the setup script
```sh
$ ./gen.sh
```

## Step 3 - Docker

Build
```sh
$ docker-compose build
```

Start the container
```sh
$ docker-compose up
```

## Step 4 - update

Just run the update script
```sh
./update.sh
```

## Step 5 -- clean
You can use this to clean old files but be aware that all docker images that are down will get removed too so if you self host other stuff than hyperpipe, make sure to run all images (incl databases) then run the command down
```sh
sudo docker system prune -a; sudo docker volume prune ; sudo docker network prune; sudo docker image prune
```