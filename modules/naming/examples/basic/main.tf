module "naming" {
  source = "../.."

  project     = "sample"
  environment = "dev"
}

output "name" {
  value = module.naming.name
}
