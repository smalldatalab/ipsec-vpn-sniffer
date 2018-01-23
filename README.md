# IPSEC VPN Sniffer

Based off of https://github.com/hwdsl2/docker-ipsec-vpn-server, with mild modifications for logging and sniffing HTTPS traffic for SNI indicators.

## Prerequisites:

- Docker container service
- Postgresql (tested with 9.4, anything greater should work)
- An existing installation of slm_histviz (https://github.com/falquaddoomi/slm_histviz/) with a configured database

## Brief Instructions:
From this directory, you'll want to run `docker build -t faisal/ipsec-vpn-sniffer ipsec-vpn-server_rebased/Dockerfile` to register our image. Then, edit `./run_docker_vpn.sh` to reflect your environment (e.g. point it to your postgres server, which should have been set up by slm_histviz), and run it to launch the docker container. With some luck that'll work, but if it doesn't it's likely because this isn't the most up-to-date source or I forgot to commit/document something.

## Script Reference:

- **run_docker_vpn.sh**: creates a docker container from 'faisal/ipsec-vpn-sniffer' and runs it, which should assumedly be built and registered already.
- **shell_vpn_server.sh**: start an interactive shell session within the running docker container.
- **cmd_vpn_server.sh**: execute an arbitrary shell command within the running docker container.
- **sync_changes.sh**: synchronize changes to various files in 'etc' to the container's filesystem.
- **edit_snyc.sh**: watch for changes to any file in the current dictory and synchronize it when it occurs to the container's filesystem.

Additional documentation regrettably TBC.
