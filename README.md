# elk_setup

## DEPLOYMENT
The installation is done on the monitoring namespace. you can create the namespace by running ```kubectl create ns monitoring``` if it doesn't exist already. You can also change the namespace by editing the NS variable in the ```install.sh``` file

The Deployment is done using the  [Named Link] (https://github.com/elastic/helm-charts "Elastic official helm chart"). Customization is achived by modifying the values.yaml file that in the respective folder for reach component. 
The Elastic search is deployed with 3 replicas and a minimumMasternodes value of 2 to ensure the system keeps running even when a node goes down. 

## INSTALLATION GUIDE
To make installation easy, each component of the elastic stack has a folder that holds the values.yaml file. You can make any further changes to the installation by editing the the values.yaml
### Install all components

* Make install.sh executable by running ``` chmod +x install.sh ```
* type the below command to install the entire componenents (Elasticsearch & Kibana) ```./install.sh ```

### Install a specific component

* Make sure install.sh executable by running ``` chmod +x install.sh ```
* type the below command to install the entire componenents (Elasticsearch or Kibana) ```./install.sh  kibana```

