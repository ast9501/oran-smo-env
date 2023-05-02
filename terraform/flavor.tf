resource "openstack_compute_flavor_v2" "management_node" {
  name = "n2-r8-d32"
  ram = "8192"
  vcpus = "2"
  disk = "64"
  is_public = "true"
  region = "RegionOne"
}

resource "openstack_compute_flavor_v2" "smo_node" {
  name = "n10-r32-d64"
  ram = "40960"
  vcpus = "10"
  disk = "64"
  is_public = "true"
  region = "RegionOne"
}
resource "openstack_compute_flavor_v2" "oai_node" {
  name = "n10-r16-d128"
  ram = "16384"
  vcpus = "10"
  disk = "128"
  is_public = "true"
  region = "RegionOne"
}
/*
resource "openstack_compute_flavor_v2" "central_node" {
  name = "n4-r8-d48"
  ram = "8192"
  vcpus = "4"
  disk = "48"
  is_public = "true"
  region = "RegionOne"
}
*/
