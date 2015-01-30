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

OSM data for Finland causes an exception in OTP code as of Jan 2015. Here's the commit that has been tested and is known to work: [fbb0f5a689b06a70f09cf897a5b3440906fd8237](https://github.com/opentripplanner/OpenTripPlanner/commit/fbb0f5a689b06a70f09cf897a5b3440906fd8237)

Reportedly, the Exception is caused by this OSM object: http://www.openstreetmap.org/node/2229626127#map=9/63.1965/26.1118