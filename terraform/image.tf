resource "openstack_images_image_v2" "oran-u20-server" {
  name 			        = "oran-u20-server"
  container_format 	= "bare"
  image_source_url 	= "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
  disk_format 		  = "qcow2"
}

resource "openstack_images_image_v2" "oran-u18-server" {
  name 			        = "oran-u18-server"
  container_format 	= "bare"
  image_source_url 	= "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img"
  disk_format 		  = "qcow2"
}