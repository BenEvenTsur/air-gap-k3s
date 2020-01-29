#!/bin/sh
if [ -z "$PRIVATE_REGISTRY" ]; then echo "PRIVATE_REGISTRY variable is missing!"; exit 1; fi
if [ -z "$USERNAME" ]; then USERNAME=""; fi
if [ -z "$PASSWORD" ]; then PASSWORD=""; fi
eval "echo \"$(cat /tmp/config.toml)\"" > /var/lib/rancher/k3s/agent/etc/containerd/config.toml.tmpl
echo 'alias kubectl="k3s kubectl"' >> ~/.bashrc
k3s server > /dev/null 2>&1 &
/bin/bash
