module "dev-infra" {
  
  source = "/home/ubuntu/terraform-practice/Terraform_for_devops/terraform_module"
  env = "dev"
  bucket_name = "infra18"
  instance_count = 1
  instnace_type = "t2.micro"
  ami_id = "ami-0cb91c7de36eed2cb"
  hash_key = "studentID"
 
}



module "prd-infra" {

  source = "/home/ubuntu/terraform-practice/Terraform_for_devops/terraform_module"
  env = "prd"
  bucket_name = "infra18"
  instance_count = 2
  instnace_type = "t2.medium"
  ami_id = "ami-0cb91c7de36eed2cb"
  hash_key = "studentID"

}


module "stg-infra" {

  source = "/home/ubuntu/terraform-practice/Terraform_for_devops/terraform_module"
  env = "stg"
  bucket_name = "infra18"
  instance_count = 1
  instnace_type = "t2.micro"
  ami_id = "ami-0cb91c7de36eed2cb"
  hash_key = "studentID"

}


