# Rsync daemon to serve Hackage

This is a Docker image to serve Hackage packages through an anonymous rsync
daemon.

It is used at http://hackage.reesd.com/. The whole archive is about 3.6G.

## Create the Docker image

Assuming you want to name the resulting image `noteed/rsync-hackage`, you can
run the following command to build it:

    > docker build -t noteed/rsync-hackage .

## Run the Docker image

Assuming you have built a `static` directory (that can be served with Nginx, as
explained at https://github.com/noteed/nginx-hackage), you can expose it
through rsync with:

    > docker run -d \
        -p 873:873 \
        -v `pwd`/static:/hackage \
        noteed/rsync-hackage

## Downloading from the daemon

You can make a copy of the exposed directory with:

    > rsync -az rsync://xxx.xxx.xxx.xxx/hackage static

This will create a `static` directory in the current directory. Ready to be
served with either rsync or Nginx.
