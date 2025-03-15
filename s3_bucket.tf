resource aws_s3_bucket my_bucket {
         bucket = "1-tf-bucket"

  tags = {
        Name         = "1-tf-bucket"
        Environment = "dev"
  }
}
