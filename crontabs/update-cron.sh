#!/bin/bash
cat ${HOME}/crontabs/*.crontab | /usr/bin/crontab -
