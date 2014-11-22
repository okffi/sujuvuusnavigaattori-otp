sujuvuusnavigaattori-otp
========================

Sujuvuusnavigaattori OpenTripPlanner Docker Server

OTP-docker server is a utility that facilitates deployment and running
of Open Trip Planner via Docker container with the use of Packer.

Packer is a utility to streamline creation and deployment of virtual
machine images.

Docker is a flavor of machine virtualization tools with neat features.

This script allows you to:

    a) create Docker image from official ubuntu:latest and build OTP inside it

    b) build graphs using custom downloaded OSM/GTFS data

    c) run OTP server as a docker container

    d) view running docker containers

    e) stop a running docker container

The script is also capable of updating the version of OTP and base operating 
system.

Run script to see the usage help.