# IPSEC VPN Sniffer

Based off of https://github.com/hwdsl2/docker-ipsec-vpn-server, with mild modifications for logging and sniffing HTTPS traffic for SNI indicators. Refer to the documentation in that repo if you'd like to add users and otherwise manage the server.

## Prerequisites:

- Docker container service
- Postgresql (tested with 9.4, anything greater should work)
- An existing installation of slm_histviz (https://github.com/falquaddoomi/slm_histviz/) with a configured database

## Brief Instructions:
First, run `build_docker_imag.sh` to build the VPN server image and set it up for logging. Then, edit `./run_docker_vpn.sh` to reflect your environment (e.g. point it to your postgres server, which should have been set up by slm_histviz), and run it to launch the docker container. With some luck that'll work, but if it doesn't it's likely because this isn't the most up-to-date source or I forgot to commit/document something.

## Script Reference:

- **build_docker_image.sh**: builds the image 'faisal/ipsec-vpn-sniffer' and registers it locally.
- **run_docker_vpn.sh**: creates a docker container from 'faisal/ipsec-vpn-sniffer' and runs it, which should assumedly be built and registered already.
- **shell_vpn_server.sh**: start an interactive shell session within the running docker container.
- **cmd_vpn_server.sh**: execute an arbitrary shell command within the running docker container.
- **sync_changes.sh**: synchronize changes to various files in 'etc' to the container's filesystem.
- **edit_snyc.sh**: watch for changes to any file in the current dictory and synchronize it when it occurs to the container's filesystem.

## Code Reference:

When a user connects or disconnects, `ip-either.local` (located in `ipsec-vpn-server_image/staging/etc/ppp`) is invoked. It first queries `last` for the user's name, using the created interface to establish an association between the connection and the user. The username and other connection info is then passed off to a new python process, `logger-scripts/packets.py`, which performs hostname resolution and packet logging to the postgres db with the help of `tshark`, a packet logging and parsing library. This process persists until the user disconnects, at which point it ends the session in the db and exits.

Additional documentation regrettably TBC.
