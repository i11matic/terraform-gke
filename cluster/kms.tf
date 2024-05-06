resource "google_kms_key_ring" "key_ring" {
  project  = var.project_id
  name     = var.kms_key_ring
  location = var.region
}

data "google_iam_policy" "encrypter_and_decrypter" {
  binding {
    role    = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
    members = var.kms_key_ring_encrypter_and_decrypter_iam_members
  }
}

resource "google_kms_key_ring_iam_policy" "key_ring_iam" {
  key_ring_id = google_kms_key_ring.key_ring.id
  policy_data = data.google_iam_policy.encrypter_and_decrypter.policy_data
}

module "kms" {
  source                                      = "./modules/kms"
  for_each                                    = var.kms_keys
  kms_key                                     = each.key
  kms_key_ring_id                             = google_kms_key_ring.key_ring.id
  kms_key_rotation                            = each.value.rotation_period
  kms_key_encrypter_and_decrypter_iam_members = each.value.members
}
