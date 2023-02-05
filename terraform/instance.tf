resource "openstack_compute_instance_v2" "oran_mgnt_nodes" {
   count                  = 1
   name                   = "oran-management-${count.index}"
   availability_zone      = "nova"
   image_name             = openstack_images_image_v2.oran-u20-server.name
   key_pair               = "oran-keypair"
   flavor_name            = openstack_compute_flavor_v2.management_node.name
   security_groups        = ["oran_infra"]

   network {
     name = "netflat"
   }
 }

resource "openstack_compute_instance_v2" "oran_smo_nodes" {
   count                  = 1
   name                   = "oran-smo-${count.index}"
   availability_zone      = "nova"
   image_name             = openstack_images_image_v2.oran-u20-server.name
   key_pair               = "oran-keypair"
   flavor_name            = openstack_compute_flavor_v2.smo_node.name
   security_groups        = ["oran_infra"]

   network {
     name = "netflat"
   }
 }
/*
 resource "openstack_compute_instance_v2" "oran_oai_nodes" {
   count                  = 1
   name                   = "oran-oai-${count.index}"
   availability_zone      = "nova"
   image_name             = openstack_images_image_v2.oran-u18-server.name
   key_pair               = "oran-keypair"
   flavor_name            = openstack_compute_flavor_v2.oai_node.name
   security_groups        = ["oran_infra"]

   network {
     name = "provider"
   }
 }
*/
/*
 resource "openstack_compute_instance_v2" "oran_central_nodes" {
   count                  = 1
   name                   = "oran-central-${count.index}"
   availability_zone      = "nova"
   image_name             = openstack_images_image_v2.oran-u20-server.name
   key_pair               = "oran-keypair"
   flavor_name            = openstack_compute_flavor_v2.central_node.name
   security_groups        = ["oran_infra"]

   network {
     name = "provider"
   }
 }
*/
