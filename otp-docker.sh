#!/bin/sh

base="ubuntu:latest"
image="okffi/otp"
otpcmd="java -Xmx6G -jar target/otp.jar"

usage() {
    echo "Usage: $0 {create|update|updateall|show|build|run|stop} [options]"
    echo ""
    echo "Utility script for docker-packaged Open Trip Planner."
    echo "Requires that packer and docker are properly installed (See https://packer.io/ or https://docs.docker.com/#installation-guides)"
    echo ""
    echo "Commands:"
    echo "	create					creates OTP docker image ($image) from ($base) and imports it into local repository"
    echo "	update					updates OTP within docker image"
    echo "	updateall				updates operating system and OTP within docker image"
    echo "	shell					runs docker container in interactive mode with a shell"
    echo "	show					displays installed OTP images and running containers"
    echo "	build <data-dir>			builds OTP graph based on OSM and GTFS files located in <data-dir>"
    echo "	start <data-dir> [port]			runs OTP docker container with graph from specified <data-dir> and TCP port on the host system"
    echo "	run <data-dir> [port]			is an alias for start"
    echo "	stop <containerID>			stops a running container with containerID (first column in show command output)"
}


rc=255
case "$1" in
	create)
		packer build -color=false -var "base_image=$base" -var "otp_image=$image" otp-create.json
		;;
	update)
		packer build -color=false -var "base_image=$image" -var "otp_image=$image" otp-update.json
		;;
	updateall)
		packer build -color=false -var "base_image=$image" -var "otp_image=$image" otp-updateos.json
		packer build -color=false -var "base_image=$image" -var "otp_image=$image" otp-update.json
		;;
	shell)
		docker run -w /otp/OpenTripPlanner -it "$image" /bin/bash
		;;
	show)
		echo "\nIMAGES:"
		docker images | grep "$image"
		echo "\nCONTAINERS (running docker instances):"
		docker ps | grep "$image"
		;;
	build)
		if [ ! -d "$2"  ]; then
		    echo "Error: $2 is not a directory"
		    exit 1
		fi
		datadir=$2
		docker run -w /otp/OpenTripPlanner -v $datadir:/mnt/otp-data "$image" $optcmd --useStreetsForLinking --longDistance --build /mnt/otp-data 
		rc=$?
		;;
	start|run)
		if [ "$2" = "" ]; then
		    usage
		    exit 1
		fi
		datadir=$2
		port=80
		if [ "$3" != "" ]; then
		    port=$3
		fi
		docker run -d -w /otp/OpenTripPlanner -p $port:8080 -v "$datadir":/mnt/otp-data "$image" $otpcmd --longDistance --analyst --server --graphs /mnt/otp-data -p 8080
		rc=$?
		;;
	stop)
		if [ "$2" = "" ]; then
		    usage
		    exit 1
		fi
		docker stop "$2"
		rc=$?
		;;
	*)
		usage
		rc=1
		;;
esac
exit $rc
