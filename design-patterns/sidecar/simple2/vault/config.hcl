exit_after_auth = false
pid_file = "/var/run/vault-agent.pid"

auto_auth {
  method "kubernetes" {
    mount_path = "auth/kubernetes"
    config = {
      role = "example-role"
    }
  }
}

sink "file" {
  config = {
    path = "/app/config/config.json"
  }
}
