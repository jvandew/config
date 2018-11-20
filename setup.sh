#! /bin/bash

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

cp -r "$root/home/".* ~
