sujuvuusnavigaattori-otp
========================

Sujuvuusnavigaattori OpenTripPlanner Docker Server

OTP-docker server is a utility that facilitates deployment and running
of Open Trip Planner via Docker container with the use of Packer.

[Packer](https://packer.io/) is a utility to streamline creation and deployment of virtual
machine images.

[Docker](http://docker.io/) is a flavor of machine virtualization tools with neat features.

This script allows you to:

1. create Docker image from official ubuntu:latest and build OTP inside it
2. build graphs using custom downloaded OSM/GTFS data
3. run OTP server as a Docker container
4. view running Docker containers
5. stop a running Docker container

The script is also capable of updating the version of OTP and base operating 
system.

Run script to see the usage help.

### OTP compatibility note

It's worth it to note that OSM data for Finland causes an exception in recent OTP code, known working commit: [707351c2ff767814279de6bbe680f310064a44d5](https://github.com/opentripplanner/OpenTripPlanner/commit/707351c2ff767814279de6bbe680f310064a44d5)