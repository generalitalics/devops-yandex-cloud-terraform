# ***YANDEX CLOUD*** deploying and configuration ***[Nginx + Redmine]*** on ***2 VMS, Balancer, PostgreeSQL*** with using ***[Terraform + Ansible]*** 

<img src="https://img.shields.io/badge/terraform%20-%235835CC.svg?&style=for-the-badge&logo=terraform&logoColor=white"/><img src="https://img.shields.io/badge/ansible%20-%231A1918.svg?&style=for-the-badge&logo=ansible&logoColor=white"/><img src="https://img.shields.io/badge/docker%20-%230db7ed.svg?&style=for-the-badge&logo=docker&logoColor=white"/><img src="https://img.shields.io/badge/nginx%20-%23009639.svg?&style=for-the-badge&logo=nginx&logoColor=white"/>

Parts:
- Terraform configuration files
  - DNS
  - Network Load Balancer
  - Compute Clouds(VMS) x2
  - PG DataBase
- Ansible configuration files
  - Nginx proxy (docker)
  - Redmine (docker)
  - DataDog monitoring
---
Сommands in ____Makefile____:

- `make encrypt` - *ansible encrypt terraform/variables.tf*
- `make decrypt` - *ansible decrypt terraform/variables.tf*
- `make init` - *terraform initialisation YC*
- `make plan` - *terraform planning all file in terraform folder*
- `make apply` - *terraform applying all file in terraform folder*
- `make install` - *ansible installing roles on local MS*
- `make deploy` - *ansible deploying all Compute Clouds(VMS)*
- `make destroy` - *terraform destroying all infrastucture in YC*
---
## *Quick start*

First of all, change variables in variables.tf(use *terraform/variables.tf.example*): 
```
variable "token" {
    description = "Token OAuth for Yandex Cloud"
    type        = string
	default = "y0_AgAAa5Hd69z0AmajOAAGXIZJ3Dr0ASAADaAAAo9kTmTuwQArG7nJLQ0"
	sensitive = true
}

variable "cloud_id" {
    description = "ID Yandex Cloud"
    type        = string
	default = "boifdh5jh3jhker"
	sensitive = true
}

variable "folder_id" {
    description = "Folder ID для Yandex Cloud"
    type        = string
	default = "b6gregjkkllljhgf"
	sensitive = true
}

variable "site_url" {
    description = "Site URL"
    type        = string
	default = "site.com."
	sensitive = true
}

variable "db_user" {
    description = "DB User"
    type        = string
	default = "user"
	sensitive = true
}

variable "db_pwd" {
    description = "DB Password"
    type        = string
	default = "password"
	sensitive = true
}

variable "datadog_api_key" {
    description = "DataDog key"
    type        = string
	default = "lsfhkhrfju3j3bjkbjb4jkklllkl"
	sensitive = true
}

variable "ssh_user" {
    description = "SSH User"
    type        = string
	default = "sshlogin"
	sensitive = true
}

variable "ssh_path" {
    description = "SSH path on the local"
    type        = string
	default = "~/.ssh/id_ed25519.pub"
	sensitive = true
}
```
Than add two private-files in *ansible* folder: *certificate.cer* and *private.key* issued to you during registration new domain.
The next steps consist of different make commands in the following order: 
`make init` (may use VPN) to token initialisation Yandex Cloud connection, `make plan` to planning all cloud infrastructure, `make apply` to create all cloud infrastructure, `make install` to install roles and collections from requirements.yml on local and `make deploy` to deploy apps to the Compute Clouds(VMS)

---

### Hexlet tests and linter status: [![Actions Status](https://github.com/generalitalics/devops-for-programmers-project-77/workflows/hexlet-check/badge.svg)](https://github.com/generalitalics/devops-for-programmers-project-77/actions)

### Nginx version: [![NGINX:NGINX](https://repology.org/badge/latest-versions/nginx.svg)](https://repology.org/project/nginx/versions)