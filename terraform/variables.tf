variable "token" {
    description = "Токен OAuth для Yandex Cloud"
    type        = string
	default = "${{ vars.TF_OAUTH }}"
	sensitive = true
}

variable "cloud_id" {
    description = "ID Yandex Cloud"
    type        = string
	default = "${{ vars.TF_CLOUD_ID }}"
	sensitive = true
}

variable "folder_id" {
    description = "Folder ID для Yandex Cloud"
    type        = string
	default = "${{ vars.TF_FOLDER_ID }}"
	sensitive = true
}