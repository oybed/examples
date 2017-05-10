#!/bin/bash

# for development, it may help to ln -s a local set of roles instead of cloning them from the master repo
# for everyone else, this makes it easy
if [ ! -d roles ]; then
  git clone https://github.com/rht-labs/ansible-stacks.git
  mv ansible-stacks/roles .
fi

ansible-playbook ci-cd-starter-playbook.yml -i inventory_cluster
