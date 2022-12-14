# quickly deploy a vpn endpoint with wireguard

## usage

|command          |description                                            |
|-----------------|-------------------------------------------------------|
|./prepare.sh     |Install docker, etc.                                   |
|./run.sh         |Deploy the containers with wireguard on multiple ports |
|./get_peer.sh FOO|Show the QR code for the peer. FOO needs to be a number|
|./kill.sh        |Remove all containers again                            |
