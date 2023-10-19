variable "prefix" {
  type = string
  default = "inv"
}
variable "aws_vpc_id" {
  type = string
  default = "vpc-0f1173895f32ddf98"
}
variable "aws_security_group_id" {
 type = string
  default = "sg-05dcb66f5a29581ca"
}
variable "engine" {
 type = string
  default = "test"
}
variable "engine_mode" {
 type = string
  default = "test"
}
variable "engine_version" {
 type = string
  default = "test"
}
variable "master_username" {
 type = string
  default = "test"
}
variable "master_password" {
 type = string
  default = "test"
}
variable "backup_retention_period" {
 type = string
 default = "test"
}
variable "skip_final_snapshot" {
 type = string
  default = "test"
}
variable "apply_immediately" {
  type = bool
  default = false
}
variable "auto_minor_version_upgrade" {
  type = bool
  default = false
}
variable "multi_az" {
  type = bool
  default = false
}
variable "publicly_accessible" {
  type = bool
  default = false
}
variable "instance_class" {
 type = string
  default = "test"
}
variable "allocated_storage"{
  type = number
  default = 50
}
variable "subnet_ids" {
 type = string
  default = "subnet-00d62f0e1b382499a,subnet-0fe89b6c288878cee,subnet-0cca324e71d62c8fc,subnet-00b5bfa8b1ba41e9c,subnet-0d2f4689ba99f43b3,subnet-061e82e3ce2718286"
}
variable "bucket_name" {
 type = string
  default = "test"
}
variable "acl_value" {
 type = string
  default = "private"
}
variable "dbname" {
 type = string
  default = "test"
}
variable "dbuser" {
 type = string
  default = "test"
}
variable "dbpwd" {
 type = string
  default = "test"
}
variable "db_dms_sec_grp_id" {
 type = string
  default = "test"
}
variable "source_engine_name" {
 type = string
  default = "test"
}
variable "target_engine_name" {
 type = string
  default = "test"
}
variable "db_server" {
 type    = string
 default = "test"
}
variable "schema_name" {
 type = string
  default = "test"
}
variable "table_name" {
 type = string
  default = "test"
}
variable "server_name_target_endpoiint" {
 type = string
  default = "test"
}
variable "server_name_source_endpoint" {
 type = string
  default = "test"
}
variable "user_source_endpoint" {
 type = string
  default = "test"
}
variable "pwd_source_endpoint" {
 type = string
  default = "test"
}
variable "server_name_pcdb_target_endpoint" {
  type = string
  default = "test"
}
variable "dms_s3_access_policy_arn" {
  type = string
  default = "test"
}
variable "user_pcdb" {
  type = string
  default = "test"
}
variable "pwd_pcdb" {
  type = string
  default = "test"
}
variable "server_name_kmdb_target_endpoint" {
  type = string
  default = "test"
}
variable "user_kmdb" {
  type = string
  default = "test"
}
variable "pwd_kmdb" {
  type = string
  default = "test"
}
variable "start_replication_task" {
  type        = bool
  description = "If set to `true`, the created replication tasks will be started automatically"
  default     = false
}
variable "migration_type" {
  type        = string
  description = "The migration type. Can be one of `full-load`, `cdc`, `full-load-and-cdc`"
  default     = "full-load-and-cdc"
}

variable "replication_instance_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) of the replication instance"
  default = "test"
}

variable "source_endpoint_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) string that uniquely identifies the source endpoint"
  default = "test"
}

variable "target_endpoint_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) string that uniquely identifies the target endpoint"
  default = "test"
}

variable "table_mappings" {
  type        = string
  description = "An escaped JSON string that contains the table mappings. See https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TableMapping.html for more details"
  default =  "test"
}

variable "replication_task_settings" {
  type        = string
  description = "An escaped JSON string that contains the task settings. See https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TaskSettings.html for more details"
  default     = null
}
variable "replication_subnet_group_id" {
  type        = string
  description = "Replication Subnet Group Id"
  default = "test"
}
variable "replication_instance_class" {
  type = string
  default = "test"
}
variable "replication_instance_id" {
  type = string
  default = "test"
}
variable "source_endpoint_id" {
  type = string
  default = "test"
}
variable "target_endpoint_id" {
  type = string
  default = "test"
}
variable "target_endpoint_id_2" {
  type = string
  default = "test"
}
variable "source_db_name"{
  type = string
  default = "test"
}
variable "target_db_name" {
  type = string
  default = "test"
}
variable "target_db_name_2" {
  type = string
  default = "test"
}
variable "replication_task_id" {
  type = string
  default = "test"
}
variable "replication_task_id_2" {
  type = string
  default = "test"
}
# variable "bucket_folder" {
#   type = string
#   default = "test"
# }
variable "dms_s3_access_role_name" {
  type = string
  default = "test"
}