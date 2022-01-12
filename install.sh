#!/bin/bash

NS=monitoring
NAME=$1
VERSION=7.16
#Install only Elasticsearch and Kibana
COMPONENTS=("elasticsearch" "kibana" "logstash" "metricbeat")

if [[ $# -lt 1 || $# == "-h" ]]
then
    # Loop through all the components to be installed
    STACK=`ls -d */`
    for item in ${STACK}
    do
        item=${item%/}
        helm upgrade ${item} --install  --namespace ${NS} --version ${VERSION} -f ${item}/values.yaml elastic/${item}
        echo "Installed ${item}"
    done
# Install a single component

elif [[ $# == 1 ]]
then
    NAME=$1
    if [[ " ${COMPONENTS[@]} " =~ " ${NAME} " ]]; 
    then
        helm upgrade ${NAME} --install  --namespace ${NS} --version ${VERSION} -f ${NAME}/values.yaml elastic/${NAME}
        echo Installed ${NAME}
    else
        echo "false ${NAME}"
        echo "Error!  Please confirm the parameter you passed in"
    fi

else
    echo "you can only provide 0 or 1 parameter"
fi

