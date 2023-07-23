resource "yandex_mdb_postgresql_cluster" "pg-1" {
  name        = "db_name"
  environment = "PRODUCTION"
  network_id  = yandex_vpc_network.network_terraform.id
 
  config {
    version = 12
    resources {
      resource_preset_id = "s3-c2-m8"
      disk_type_id       = "network-hdd"
      disk_size          = 10
    }
    postgresql_config = {
      max_connections                   = 395
      enable_parallel_hash              = true
      vacuum_cleanup_index_scale_factor = 0.2
      autovacuum_vacuum_scale_factor    = 0.34
      default_transaction_isolation     = "TRANSACTION_ISOLATION_READ_COMMITTED"
      shared_preload_libraries          = "SHARED_PRELOAD_LIBRARIES_AUTO_EXPLAIN,SHARED_PRELOAD_LIBRARIES_PG_HINT_PLAN"
    }
  }
 
  database {
    name  = "db_name"
    owner = "generalitalics"
  }
 
  user {
    name       = var.db_user
    password   = var.db_pwd
    conn_limit = 50
    permission {
      database_name = "db_name"
    }
    settings = {
      default_transaction_isolation = "read committed"
      log_min_duration_statement    = 5000
    }
  }
 
  host {
    zone      = "ru-central1-b"
    subnet_id = yandex_vpc_subnet.subnet_terraform.id
  }
}