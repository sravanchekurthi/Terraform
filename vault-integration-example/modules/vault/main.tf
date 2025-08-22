provider "vault" {
  address = "<>:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "<>"
      secret_id = "<>"
    }
  }
}

data "vault_kv_secret_v2" "sample" {
  mount = "secret"  // change it according to your mount
  name = "sample-secret"  //change it according to your secret
}