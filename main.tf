resource "random_id" "instance_id" {
 byte_length = 8
}


data "template_file" "start_zkp" {
    template = file("${path.module}/templates/start_zkp.sh.tpl")
}

data "template_file" "core_site_xml" {
    template = file("${path.module}/templates/core-site.xml.tpl")
    vars = {
        gcp_project = "groovy-momentum-269710"
    }
}

data "template_file" "start_drill" {
    template = file("${path.module}/templates/start_drill.sh.tpl")
    vars = {
        zookeeper_hostname = module.zookeeper.zookeeper_hostname
        core_site_content = data.template_file.core_site_xml.rendered
        bucket_name = "sushil-gcp5"
        sa_key_subpath = "drill-reader.json"
        connector_jar_subpath = "gcs-connector-hadoop2-2.1.2-shaded.jar"
    }
}




module "zookeeper" {
    source = "./gcp/zookeeper"
    random_suffix = "${random_id.instance_id.hex}"
    machine_type = "n1-standard-1"
    zone = "us-central1-a"
    image_project = "cos-cloud"
    image_family = "cos-stable"
    metadata_startup_script = data.template_file.start_zkp.rendered
    network = "default"
}

module "drill" {
    instance_count = 3
    source = "./gcp/apache_drill"
    random_suffix = "${random_id.instance_id.hex}"
    machine_type = "n1-standard-2"
    zone = "us-central1-a"
    image_project = "ubuntu-os-cloud"
    image_family = "ubuntu-1804-lts"
    startup_script = data.template_file.start_drill.rendered
    network = "default"
}


