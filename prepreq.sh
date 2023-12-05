#!/bin/bash
sudo subscription-manager release --set=9.2
sudo subscription-manager repos --disable=*
sudo subscription-manager repos --enable=rhel-9-for-x86_64-baseos-eus-rpms --enable=rhel-9-for-x86_64-appstream-eus-rpms --enable=rhel-9-for-x86_64-highavailability-eus-rpms --enable=openstack-17.1-for-rhel-9-x86_64-rpms --enable=fast-datapath-for-rhel-9-x86_64-rpms
sudo dnf update -y
sudo dnf install -y python3-tripleoclient
openstack tripleo container image prepare default  --local-push-destination --output-env-file /home/stack/containers-prepare-parameter.yaml
sudo reboot
