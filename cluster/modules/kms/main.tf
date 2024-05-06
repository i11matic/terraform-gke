resource "google_kms_crypto_key" "key" {
  name            = var.kms_key
  key_ring        = var.kms_key_ring_id
  purpose         = "ENCRYPT_DECRYPT"
  rotation_period = var.kms_key_rotation
}


data "google_iam_policy" "admin" {
  binding {
    role = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

    members = var.kms_key_encrypter_and_decrypter_iam_members
  }
}

resource "google_kms_crypto_key_iam_policy" "crypto_key" {
  crypto_key_id = google_kms_crypto_key.key.id
  policy_data   = data.google_iam_policy.admin.policy_data
}
