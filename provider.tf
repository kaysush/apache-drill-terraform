provider "google" {
    region = "us-central1"
    project = "groovy-momentum-269710"
    credentials = file("../terraform.json")
}