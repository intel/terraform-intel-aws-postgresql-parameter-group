variable "db_parameters" {
  type = object({
    postgres = optional(object({
      temp_buffers = optional(object({
        value        = optional(string, 4096 * 1024 / 8)
        apply_method = optional(string, "immediate")
      }))
      work_mem = optional(object({
        value        = optional(string, 4096 * 1024)
        apply_method = optional(string, "immediate")
      }))
      maintenance_work_mem = optional(object({
        value        = optional(string, 512 * 1024)
        apply_method = optional(string, "immediate")
      }))
      autovacuum_work_mem = optional(object({
        value        = optional(string, "-1")
        apply_method = optional(string, "immediate")
      }))
      max_stack_depth = optional(object({
        value        = optional(string, 7 * 1024)
        apply_method = optional(string, "immediate")
      }))
      effective_io_concurrency = optional(object({
        value        = optional(string, "32")
        apply_method = optional(string, "immediate")
      }))
      synchronous_commit = optional(object({
        value        = optional(string, "off")
        apply_method = optional(string, "immediate")
      }))
      min_wal_size = optional(object({
        value        = optional(string, "256")
        apply_method = optional(string, "immediate")
      }))
      max_wal_size = optional(object({
        value        = optional(string, "512")
        apply_method = optional(string, "immediate")
      }))
      checkpoint_warning = optional(object({
        value        = optional(string, 1 * 60 * 60)
        apply_method = optional(string, "immediate")
      }))
      random_page_cost = optional(object({
        value        = optional(string, "1.1")
        apply_method = optional(string, "immediate")
      }))
      cpu_tuple_cost = optional(object({
        value        = optional(string, "0.03")
        apply_method = optional(string, "immediate")
      }))
      effective_cache_size = optional(object({
        value        = optional(string, 350 * 1024 * 1024 / 8)
        apply_method = optional(string, "immediate")
      }))
      autovacuum = optional(object({
        value        = optional(string, "1")
        apply_method = optional(string, "immediate")
      }))
      autovacuum_vacuum_cost_limit = optional(object({
        value        = optional(string, "3000")
        apply_method = optional(string, "immediate")
      }))
      vacuum_freeze_min_age = optional(object({
        value        = optional(string, "10000000")
        apply_method = optional(string, "immediate")
      }))
      max_connections = optional(object({
        value        = optional(string, "256")
        apply_method = optional(string, "pending-reboot")
      }))
      huge_pages = optional(object({
        value        = optional(string, "on")
        apply_method = optional(string, "pending-reboot")
      }))
      shared_buffers = optional(object({
        value        = optional(string, "{DBInstanceClassMemory*3/32768}")
        apply_method = optional(string, "pending-reboot")
      }))
      max_files_per_process = optional(object({
        value        = optional(string, "4000")
        apply_method = optional(string, "pending-reboot")
      }))
      max_worker_processes = optional(object({
        value        = optional(string, "{DBInstanceVCPU}")
        apply_method = optional(string, "pending-reboot")
      }))
      wal_buffers = optional(object({
        value        = optional(string, "-1")
        apply_method = optional(string, "pending-reboot")
      }))
      max_wal_senders = optional(object({
        value        = optional(string, "5")
        apply_method = optional(string, "pending-reboot")
      }))
      timezone = optional(object({
        value        = optional(string, "UTC")
        apply_method = optional(string, "pending-reboot")
      }))
      max_locks_per_transaction = optional(object({
        value        = optional(string, "64")
        apply_method = optional(string, "pending-reboot")
      }))
      max_pred_locks_per_transaction = optional(object({
        value        = optional(string, "64")
        apply_method = optional(string, "pending-reboot")
      }))
      checkpoint_completion_target = optional(object({
        value        = optional(string, "0.9")
        apply_method = optional(string, "pending-reboot")
      }))
      autovacuum_max_workers = optional(object({
        value        = optional(string, "10")
        apply_method = optional(string, "pending-reboot")
      }))
      autovacuum_freeze_max_age = optional(object({
        value        = optional(string, "750000000")
        apply_method = optional(string, "pending-reboot")
      }))
    }))
  })
  default = {
    postgres = {
      autovacuum                     = {}
      autovacuum_freeze_max_age      = {}
      autovacuum_max_workers         = {}
      autovacuum_vacuum_cost_limit   = {}
      autovacuum_work_mem            = {}
      checkpoint_completion_target   = {}
      checkpoint_warning             = {}
      cpu_tuple_cost                 = {}
      effective_cache_size           = {}
      effective_io_concurrency       = {}
      huge_pages                     = {}
      maintenance_work_mem           = {}
      max_connections                = {}
      max_files_per_process          = {}
      max_locks_per_transaction      = {}
      max_pred_locks_per_transaction = {}
      max_stack_depth                = {}
      max_wal_senders                = {}
      max_wal_size                   = {}
      max_worker_processes           = {}
      min_wal_size                   = {}
      random_page_cost               = {}
      shared_buffers                 = {}
      synchronous_commit             = {}
      temp_buffers                   = {}
      timezone                       = {}
      vacuum_freeze_min_age          = {}
      wal_buffers                    = {}
      work_mem                       = {}
    }
  }
  description = "Intel Cloud optimizations for Xeon processors"
}

variable "db_engine" {
  description = "Database engine version for AWS database instance."
  type        = string
  validation {
    condition     = contains(["mysql", "postgres"], var.db_engine)
    error_message = "The db_engine must be \"mysql\" or \"postgres\"."
  }
  default = "postgres"
}

variable "db_parameter_group_name" {
  description = "Name for the RDS database parameter group."
  type        = string
  default     = "postgres"
}

variable "db_parameter_group_family" {
  description = "Family identifier for the RDS database parameter group."
  type        = string
  default     = "postgres14"
}

variable "db_user_parameters" {
  type        = map(any)
  description = <<DESC
  "Customer provided db parameters. These should adhere to a similar structure as the above map.
  db_user_parameters = {
    db_param_user = {
      "apply_method" = "immediate"
      "value" = "1"
    }
    other_db_param = {
      apply_method = "immediate"
      value = "3.50"
    }
  DESC
  default     = {}
}