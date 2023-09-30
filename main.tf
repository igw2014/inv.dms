resource "aws_dms_replication_subnet_group" "dms_subnet_group" {
  replication_subnet_group_description = "dms subnet group"  
  replication_subnet_group_id          = var.replication_subnet_group_id  

  subnet_ids = data.aws_subnets.aws_subnets.ids

}

resource "aws_dms_replication_instance" "dms_replication_instance" {
  allocated_storage            = 50
  apply_immediately            = true
  auto_minor_version_upgrade   = true
  multi_az                     = false
  publicly_accessible          = false
  replication_instance_class   = var.replication_instance_class
  engine_version               = "3.5.1"
  replication_instance_id      = var.replication_instance_id
  replication_subnet_group_id  = aws_dms_replication_subnet_group.dms_subnet_group.id
  vpc_security_group_ids = [data.aws_security_group.aws_security_group.id]
}

resource "aws_dms_endpoint" "setupdb_source_endpoint" {
  endpoint_id                 = var.source_endpoint_id
  endpoint_type               = "source"
  engine_name                 = "aurora-postgresql"
  database_name               = var.source_db_name
  server_name                 = var.server_name_source_endpoint
  username                    = var.user_source_endpoint
  password                    = var.pwd_source_endpoint
  port                        = 5432
}

resource "aws_dms_endpoint" "pcdb_target_endpoint" {
  endpoint_id                 = var.target_endpoint_id_1
  endpoint_type               = "target"
  engine_name                 = "aurora-postgresql"
  database_name               = var.target_db_name_1
  server_name                 = var.server_name_pcdb_target_endpoint
  username                    = var.user_pcdb
  password                    = var.pwd_pcdb
  port                        = 5432
}

resource "aws_dms_endpoint" "kmdb_target_endpoint" {
  endpoint_id                 = var.target_endpoint_id_2
  endpoint_type               = "target"
  engine_name                 = "aurora-postgresql"
  database_name               = var.target_db_name_2
  server_name                 = var.server_name_kmdb_target_endpoint
  username                    = var.user_kmdb
  password                    = var.pwd_kmdb
  port                        = 5432
}

resource "aws_dms_replication_task" "pcdb_repl_task" {

  replication_task_id = var.replication_task_id_1
  start_replication_task    = var.start_replication_task
  migration_type            = var.migration_type
  replication_instance_arn  = aws_dms_replication_instance.dms_replication_instance.replication_instance_arn
  source_endpoint_arn       = aws_dms_endpoint.setupdb_source_endpoint.endpoint_arn
  target_endpoint_arn       = aws_dms_endpoint.pcdb_target_endpoint.endpoint_arn
  replication_task_settings = file("${path.module}/config/pcdb-replication-task-settings.json")
  table_mappings = file("${path.module}/config/pcdb-replication-task-table-mappings.json")
}

resource "aws_dms_replication_task" "kmdb_repl_task" {

  replication_task_id = var.replication_task_id_2
  start_replication_task    = var.start_replication_task
  migration_type            = var.migration_type
  replication_instance_arn  = aws_dms_replication_instance.dms_replication_instance.replication_instance_arn
  source_endpoint_arn       = aws_dms_endpoint.setupdb_source_endpoint.endpoint_arn
  target_endpoint_arn       = aws_dms_endpoint.kmdb_target_endpoint.endpoint_arn
  replication_task_settings = file("${path.module}/config/kmdb-replication-task-settings.json")
  table_mappings            = file("${path.module}/config/kmdb-replication-task-table-mappings.json")
}