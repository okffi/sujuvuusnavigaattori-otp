sujuvuusnavigaattori-otp
========================

Sujuvuusnavigaattori OpenTripPlanner Docker Server

OTP-docker server is a utility that facilitates deployment and running
of Open Trip Planner via Docker container with the use of Packer.

[Packer](https://packer.io/) is a utility to streamline creation and deployment of virtual
machine images.

[Docker](http://docker.io/) is a flavor of machine virtualization tools with neat features.

This script allows you to:

    a) create Docker image from official ubuntu:latest and build OTP inside it

    b) build graphs using custom downloaded OSM/GTFS data

    c) run OTP server as a Docker container

    d) view running Docker containers

    e) stop a running Docker container

The script is also capable of updating the version of OTP and base operating 
system.

Run script to see the usage help.

### OTP compatibility note

It's worth it to note that OSM data for Finland causes exceptino in OTP code after commit 707351c2ff767814279de6bbe680f310064a44d5