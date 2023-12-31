aws_vpc_id = "vpc-0f4367e913b8e4c79"
aws_security_group_id = "sg-0f41c75290552498f"
prefix = "inv-qa"
#for demo after destroying everything use prefix as jcb-qa
engine = "aurora-postgresql"
engine_mode = "provisioned"
engine_version = "14.6"
master_username = "invadmin"
master_password = "invadmin"
backup_retention_period = 7
skip_final_snapshot = "true"
apply_immediately = true
auto_minor_version_upgrade = true
multi_az = false
publicly_accessible = false
instance_class = "db.t3.medium"
#subnet_ids = ["subnet-00d62f0e1b382499a","subnet-0fe89b6c288878cee","subnet-0cca324e71d62c8fc","subnet-00b5bfa8b1ba41e9c","subnet-0d2f4689ba99f43b3","subnet-061e82e3ce2718286"]
dbname = "inventorymgmt"
dbuser = "invadmin"
dbpwd = "invadmin"
db_dms_sec_grp_id = "sg-05dcb66f5a29581ca"
replication_instance_class = "dms.t3.medium"
source_engine_name = "aurora-postgresql"
target_engine_name = "s3"
db_server = "inv-qa-cluster-identifier.cluster-cefcmch6dncq.us-east-1.rds.amazonaws.com"
migration_type = "full-load-and-cdc"
schema_name = "invmgmtqa"
table_name = "%"
server_name_source_endpoint = "invdev-cluster-identifier.cluster-cefcmch6dncq.us-east-1.rds.amazonaws.com"
user_source_endpoint = "invadmin"
pwd_source_endpoint = "invadmin"
server_name_pcdb_target_endpoint = "pcdb-instance-1.cefcmch6dncq.us-east-1.rds.amazonaws.com"
user_pcdb = "pcdbadmin"
pwd_pcdb = "pcdbadmin"
server_name_kmdb_target_endpoint = "kmdb-instance-1.cefcmch6dncq.us-east-1.rds.amazonaws.com"
user_kmdb = "kmdbadmin"
pwd_kmdb = "kmdbadmin"
start_replication_task = false
replication_subnet_group_id = "tatadev-dms-subnet-group"
replication_instance_id = "tatadev-dms-replication-instance"
source_endpoint_id = "tatadev-source-endpoint"
target_endpoint_id = "tatadev-target-endpoint"
target_endpoint_id_2 = "kmdb-target-endpoint-2"
source_db_name = "tatadevdb"
target_db_name_1 = "pcdb"
target_db_name_2 = "kmdb"
replication_task_id = "tatadev-repl-task"
replication_task_id_2 = "kmdb-repl-task-1"
allocated_storage = 50
dms_s3_access_policy_arn = "arn:aws:iam::050445888400:role/hitachi-dms-s3-access-role"
bucket_name = "tatadev-warehouse-dbdata"
acl_value = "private"
bucket_folder = "warehouse"
