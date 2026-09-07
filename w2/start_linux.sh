docker build --platform linux/amd64 -t rbhw-asm .
docker run --rm -it --platform linux/amd64 -v "$PWD":/hw rbhw-asm bash
