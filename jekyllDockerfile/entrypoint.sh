#!/bin/sh
bundle install --retry 5 --jobs 20;
exec "$@"