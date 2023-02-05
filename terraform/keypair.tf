resource "openstack_compute_keypair_v2" "oran-keypair" {
  name       = "oran-keypair"
  // insert your own public key
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtzPrhyImubrNk6/muCnZTD3hjmS7XIrEGmZZ4CQLa3F+TtxU6oI/f+8fL/U04i2c2+15J0hcYvnGSJcmmJEUkseRvScEYgRfkeXjedT1/8kvGx5rL2ICpxv0eebR2yMlq5aWv3cJYS3BePDVB5S2SHFt9Xcju7Wwj6cPjh1Fk8ju/pGIHMgzl0vctCNA7d7crjvDmKbTsNy0wNKgzF2Mcre/1iLijWcjO3vMiOsy+tVXAg+BX3BYoBzmeYI6WM4KvxfbryxwUlBxfvn+v6RwuM8BWgfIMwqt5BdsTsHaY/7jDJlLIw56gjtIBHdOsxfzEHcZF+FBIXvhCFmPUNXueYa6gwH04WIcJgJJrwoyXr32bQyt1N7c5pmepy4eXMZ9B73DrMKFCKhxdTVwTNqx4tvnDDQPsW3/48fOOJh31G72AA5YTqX62zxQ27cz8TRKnraZtVPr9lhr8AMADXEfvH2xpFJQqkc+gIaVwWkV28iSXDXRamZPVB5G8iyF73f8= ubuntu@bastion"
}
