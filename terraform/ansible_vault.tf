resource "local_file" "ansible_vault_gen" {
    filename = "${path.module}/../ansible/group_vars/webservers/vault.yml"
    file_permission  = "0644"
    content = format("REDMINE_DB_POSTGRES: \"${yandex_mdb_postgresql_cluster.pg-1.host.0.fqdn}\"\nREDMINE_DB_PORT: \"6432\"\nREDMINE_DB_DATABASE: \"db_name\"\nREDMINE_DB_USERNAME: \"%s\"\nREDMINE_DB_PASSWORD: \"%s\"\ndatadog_api_key: \"%s\"\ndatadog_site: \"datadoghq.eu\"", var.db_user, var.db_pwd, var.datadog_api_key)
}