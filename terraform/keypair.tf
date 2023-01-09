resource "openstack_compute_keypair_v2" "oran-keypair" {
  name       = "oran-keypair"
  // insert your own public key
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDu7VeNP2413enlQG91wk9X0eYQjxYgssP7lSnIPMV80rqZtMaakCDudpbEwXcx1dsWE7DLvLY1sXASyOFdGdlhZNw02RJP6J4ajMcp8nesrFioCYBndsIJgEpySMVhHZUhxOm0CWwYCFqxZg8MlEFrC5A2KX+2w3pTvh15qt2hp/1/+md6DheM20oo7oW5HrA8TD7+b+13+lC/bOWTpzBpy60jlObACp/xNN2ZR7gmKIKkLeM8nQTlJ+3E/odRNmOBBzAIZcbYN8+9OLWaxlSTLdg+tS7T83+FB/s0+NS+4bc9RfjgPgwtYnLz3XVpOCFzb25h4MbztSMdkXIWnKyBYUE1F7PjoWhXgcNjoglQUbkHSNTWL1kbPh1HZU4lhSwk01+vJp9WNvIk0QrgdaEB+kRV9QnVZP8dC8LWjynlbGpF+AWaiA91qa58lKMDqWheo/sZwHw2BxyTBXIJHXkw9t4YcVQK5vDXao7uXdmS8BVEqjH6r5TA9G0QVEaFYJ8= cheng-yu@LAPTOP-PCHOA1SF"
}