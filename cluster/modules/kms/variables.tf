variable "kms_key" {
  type        = string
  description = "Name of the kms key"

}

variable "kms_key_ring_id" {
  type        = string
  description = "key ring id"

}

variable "kms_key_encrypter_and_decrypter_iam_members" {
  type        = list(string)
  description = "list of IAM memvbers to grant access to the key"

}

variable "kms_key_rotation" {
  type        = string
  description = "rotation period in seconds. eg 86400s"

}
