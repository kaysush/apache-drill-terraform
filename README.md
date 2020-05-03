Apache Drill
============

This repository host the terraform modules to setup an Apache Drill cluster on GCP.

### Modules

**Zookeeper**
Setup a 1 node zookeeper instance needed to start Apache Drill in [distributed mode](https://drill.apache.org/docs/distributed-mode-prerequisites/).

**Apache Drill**

Setup the cluster for Apache Drill cluster.


Currently the code is a bit messy, I'll be updating and refactoring the code as I'm learning terraform. The code is fully functional however.

**External Requirement**
The Drill needs GCS Hadoop Connector to query data from GCS and also need a service account JSON file to allow Drill to make requests. 

You need to put `gcs-connector-hadoop2-2.1.2-shaded.jar` and `sa.json` file in a bucket which can then be passed as variables in `main.tf`.

| Variable              | Description                                                      |
|-----------------------|------------------------------------------------------------------|
| bucket_name           | Bucket where JAR and service account json key is placed.         |
| sa_key_subpath        | Sub-path where JSON key is placed in the bucket.                 |
| connector_jar_subpath | Sub-path where gcs-hadoop-connector jar is placed in the bucket. |

### Deployment
Once requirements are fullfilled, you can use following command to launch the cluster.

```hcl
terraform init
terraform apply --auto-approve
```