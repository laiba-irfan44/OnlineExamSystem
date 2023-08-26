#!/bin/sh
set -e
rm -f /home/app/tmp/pids/server.pid
RAILS_ENV=development rails db:migrate && rails db:seed || true