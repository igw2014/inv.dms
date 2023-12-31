module "dms" {
	# source = "./module/dms"
    source = "s3::https://s3.amazonaws.com/dms-modules/dms.zip"
    replication_subnet_group_id = var.replication_subnet_group_id
    aws_vpc_id                  = var.aws_vpc_id
    allocated_storage           = var.allocated_storage
    apply_immediately            = var.apply_immediately
    auto_minor_version_upgrade   = var.auto_minor_version_upgrade
    multi_az                     = var.multi_az
    publicly_accessible          = var.publicly_accessible
    replication_instance_class   = var.replication_instance_class
    replication_instance_id      = var.replication_instance_id
    source_endpoint_id           = var.source_endpoint_id
    source_db_name               = var.source_db_name
    server_name_source_endpoint                 = var.server_name_source_endpoint
    user_source_endpoint                    = var.user_source_endpoint
    pwd_source_endpoint                    = var.pwd_source_endpoint
    dms_s3_access_policy_arn                  = var.dms_s3_access_policy_arn
    bucket_name                      = var.bucket_name
    #bucket_folder               = var.bucket_folder
    acl_value                         = var.acl_value 
    target_endpoint_id          = var.target_endpoint_id
    replication_task_id         = var.replication_task_id
    start_replication_task      = var.start_replication_task
    migration_type              = var.migration_type
}