#!/bin/bash
gunicorn --capture-output --bind 0.0.0.0:80 --workers 2 --worker-connections 100 wsgi:application
