#!/bin/sh
sidekiqctl stop /www/gnerc/tmp/pids/sidekiq.pid
bundle exec sidekiq -d -L /www/gnerc/log/sidekiq.log -e production --pidfile /www/gnerc/tmp/pids/sidekiq.pid