output "secret" {
  value = data.vault_kv_secret_v2.sample.data["name"]
}