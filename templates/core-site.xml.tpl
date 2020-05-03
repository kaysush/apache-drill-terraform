<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
   <property>
      <name>fs.gs.impl</name>
      <value>com.google.cloud.hadoop.fs.gcs.GoogleHadoopFileSystem</value>
   </property>
   <property>
      <name>fs.AbstractFileSystem.gs.impl</name>
      <value>com.google.cloud.hadoop.fs.gcs.GoogleHadoopFS</value>
      <description>The AbstractFileSystem for gs: uris.</description>
   </property>
   <property>
      <name>fs.gs.project.id</name>
      <value>${gcp_project}</value>
      <description>Optional. Google Cloud Project ID with access to GCS buckets.
      Required only for list buckets and create bucket operations.</description>
   </property>
   <property>
      <name>fs.gs.auth.service.account.json.keyfile</name>
      <value>/drill-reader.json</value>
   </property>
   <property>
      <name>fs.gs.auth.service.account.enable</name>
      <value>true</value>
      <description>Whether to use a service account for GCS authorization. If an email and
      keyfile are provided (see fs.gs.auth.service.account.email and
      fs.gs.auth.service.account.keyfile), then that service account
      will be used. Otherwise the connector will look to see if it is running on
      a GCE VM with some level of GCS access in it's service account scope, and
      use that service account.</description>
   </property>
   <property>
      <name>fs.gs.working.dir</name>
      <value>/</value>
      <description>The directory relative gs: uris resolve in inside of the default bucket.</description>
   </property>
   <property>
      <name>fs.gs.implicit.dir.repair.enable</name>
      <value>true</value>
      <description>Whether or not to create objects for the parent directories of objects
      with / in their path e.g. creating gs://bucket/foo/ upon deleting or
      renaming gs://bucket/foo/bar.</description>
   </property>
   <property>
      <name>fs.gs.glob.flatlist.enable</name>
      <value>true</value>
      <description>Whether or not to prepopulate potential glob matches in a single list
      request to minimize calls to GCS in nested glob cases.</description>
   </property>
   <property>
      <name>fs.gs.copy.with.rewrite.enable</name>
      <value>true</value>
      <description>Whether or not to perform copy operation using Rewrite requests. Allows
      to copy files between different locations and storage classes.</description>
   </property>
</configuration>