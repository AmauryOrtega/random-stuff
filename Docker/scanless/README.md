# scanless

## Build

To build the docker image, run:

```shell
$ docker build -t scanless .
```

## Usage

To use the docker image previously created, run the following with whichever options you want like `--help`:

```shell
$ docker run --rm -it scanless --help
```

If the that long command it's too troublesome, you can make an alias with this: `alias scanless="docker run --rm -it scanless"` and you can make use of the `scanless` alias like before:

 ```shell
$ scanless --help
$ scanless -l
$ scanless -t somedomain.com -s yougetsignal
```
