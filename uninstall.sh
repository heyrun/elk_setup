#!/bin/bash

NS=monitoring
#Install only Elasticsearch and Kibana
COMPONENTS=("elasticsearch" "kibana" "apm-server")

if [[ $# -lt 1 || $# == "-h" ]]
then
    # Loop through all the components to be installed
    STACK=`ls -d */`
    for item in ${STACK}
    do
        item=${item%/}
        helm uninstall ${item}   --namespace ${NS}
        echo "Installed ${item}"
    done
# Install a single component

elif [[ $# == 1 ]]
then
    NAME=$1
    if [[ " ${COMPONENTS[@]} " =~ " ${NAME} " ]]; 
    then
        helm uninstall ${NAME}  --namespace ${NS}
        echo Uninstalled ${NAME}
    else
        echo "false ${NAME}"
        echo "Error!  Please confirm the parameter you passed in"
    fi

else
    echo "you can only provide 0 or 1 parameter"
fi

