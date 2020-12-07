#!/bin/bash
echo ECS_CLUSTER="ao-mm-cluster" >> /etc/ecs/ecs.config
start ecs
echo "Done"