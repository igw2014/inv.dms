resource "aws_security_group" "dms_sec_grp" {
    vpc_id = var.aws_vpc_id
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_dms_replication_subnet_group" "dms_subnet_group" {
  replication_subnet_group_description = "dms subnet group"  
  replication_subnet_group_id          = var.replication_subnet_group_id  

  subnet_ids = data.aws_subnets.aws_subnets.ids

}

resource "aws_dms_replication_instance" "dms_replication_instance" {
  allocated_storage            = var.allocated_storage
  apply_immediately            = var.apply_immediately
  auto_minor_version_upgrade   = var.auto_minor_version_upgrade
  multi_az                     = var.multi_az
  publicly_accessible          = var.publicly_accessible
  replication_instance_class   = var.replication_instance_class
  engine_version               = "3.5.1"
  replication_instance_id      = var.replication_instance_id
  replication_subnet_group_id  = aws_dms_replication_subnet_group.dms_subnet_group.id
  vpc_security_group_ids = [aws_security_group.dms_sec_grp.id]
}

resource "aws_dms_endpoint" "dms_source_endpoint" {
  endpoint_id                 = var.source_endpoint_id
  endpoint_type               = "source"
  engine_name                 = "aurora-postgresql"
  database_name               = var.source_db_name
  server_name                 = var.server_name_source_endpoint
  username                    = var.user_source_endpoint
  password                    = var.pwd_source_endpoint
  port                        = 5432
}


resource "aws_iam_role" "dms_s3_access_role" {
  name = "dms_s3_access_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "dms.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "dms_s3_access_role_ploicy_attachment" {
  role       = aws_iam_role.dms_s3_access_role.name
  policy_arn = var.dms_s3_access_policy_arn
}

resource "aws_s3_bucket" "target_s3_bucket" {
    bucket = var.bucket_name
    acl = var.acl_value   
}

resource "aws_dms_s3_endpoint" "dms_target_endpoint" {
  endpoint_id             = var.target_endpoint_id
  endpoint_type           = "target"
  bucket_name             = var.bucket_name
  bucket_folder           = var.bucket_folder
  service_access_role_arn = aws_iam_role.dms_s3_access_role.arn
  add_column_name         = true
  timestamp_column_name   = "${var.target_endpoint_id}_timestamp_cdc"
  depends_on = [aws_iam_role.dms_s3_access_role]
}

resource "aws_dms_replication_task" "dms_repl_task" {

  replication_task_id = var.replication_task_id
  start_replication_task    = var.start_replication_task
  migration_type            = var.migration_type
  replication_instance_arn  = aws_dms_replication_instance.dms_replication_instance.replication_instance_arn
  source_endpoint_arn       = aws_dms_endpoint.dms_source_endpoint.endpoint_arn
  target_endpoint_arn       = aws_dms_s3_endpoint.dms_target_endpoint.endpoint_arn
  replication_task_settings = file("${path.module}/config/replication-task-settings.json")
  table_mappings            = file("${path.module}/config/replication-task-table-mappings.json")
}