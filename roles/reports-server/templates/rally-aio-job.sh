#!/bin/bash
# Credits to RDO team: https://www.rdoproject.org/Testing_RDO_with_Rally
NOW=`date +"%Y%m%d-%H%M%S"`

rally --log-file /opt/rally-tests/logs/rally_$date.log task start --task /opt/rally-tests/tasks/allinone.yaml

# Create rally report
TASKID=`rally task status | awk '{print $2}' | tr -d :`
rally task report $TASKID \
    --out {{ reports_server_root_path }}/{{ reports_server_index_path }}/$NOW.html

rally task report $TASKID --out {{ reports_server_root_path}}/index.html
