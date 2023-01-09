resource "openstack_networking_secgroup_v2" "secgroup_oran_infra" {
  name        = "oran_infra"
  description = "Security group for oran infra"
}

resource "openstack_networking_secgroup_rule_v2" "default_rule_tcp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  security_group_id = "${openstack_networking_secgroup_v2.secgroup_oran_infra.id}"
}

resource "openstack_networking_secgroup_rule_v2" "default_rule_udp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  security_group_id = "${openstack_networking_secgroup_v2.secgroup_oran_infra.id}"
}

resource "openstack_networking_secgroup_rule_v2" "default_rule_icmp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  security_group_id = "${openstack_networking_secgroup_v2.secgroup_oran_infra.id}"
}
