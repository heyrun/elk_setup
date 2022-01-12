#!/bin/bash

NS=monitoring
NAME=$1
VERSION=7.7.1
COMPONENTS=("elasticsearch" "kibana" "metricbeat" "logstash")
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

# Add the Elastic helm chart repository
# helm repo add elastic https://helm.elastic.co
# Verify the values files are updated and install the Elastic Search Statefulset

