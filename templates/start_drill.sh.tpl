apt-get update && apt-get install -yq default-jdk
wget http://apache.mirrors.hoobly.com/drill/drill-1.17.0/apache-drill-1.17.0.tar.gz
mv apache-drill-1.17.0.tar.gz apache-drill.tar.gz
tar -xvzf apache-drill.tar.gz
cd apache-drill-1.17.0
sed -i 's/localhost/${zookeeper_hostname}/' conf/drill-override.conf
/snap/bin/gsutil cp gs://${bucket_name}/${sa_key_subpath} /drill-reader.json
/snap/bin/gsutil cp gs://${bucket_name}/${connector_jar_subpath} /apache-drill-1.17.0/jars/3rdparty/
cat << EOF >> /apache-drill-1.17.0/conf/core-site.xml
${core_site_content}
EOF
bin/drillbit.sh start