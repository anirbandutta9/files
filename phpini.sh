#!/usr/bin/env bash

upload_max_filesize=2048M
post_max_size=500M
max_execution_time=300
max_input_time=223

for key in upload_max_filesize post_max_size max_execution_time max_input_time
do
 sed -i "s/^\($key\).*/\1 $(eval echo = \${$key})/" /etc/php/7.4/apache2/php.ini
done
