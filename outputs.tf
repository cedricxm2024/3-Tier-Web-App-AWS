output "web_ip" {
  value = module.web.web_public_ip
}

output "app_ip" {
  value = module.app.app_private_ip
}

output "db_endpoint" {
  value = module.db.db_endpoint
}
