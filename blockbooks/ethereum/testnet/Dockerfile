
# Dockerfile References: https://docs.docker.com/engine/reference/builder/
FROM debian:bullseye 

# Add Maintainer Info
LABEL maintainer="Yusaku Senga <yusaku@swingby.network>"

# Set the Current Working Directory inside the container
WORKDIR /app

COPY . .

RUN apt-get update -y && apt-get install -y logrotate libc6 libsnappy1v5 libzmq5

RUN dpkg -i backend-ethereum-testnet-goerli_1.10.26-e5eb32ac-satoshilabs-1_amd64.deb

RUN dpkg -i blockbook-ethereum-testnet-goerli_0.4.0_amd64.deb

RUN chmod 775 entrypoint.sh

EXPOSE 9030 9130
# Command to run the executable
CMD ["./entrypoint.sh"]