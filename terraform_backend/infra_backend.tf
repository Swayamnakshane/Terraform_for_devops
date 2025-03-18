resource "aws_s3_bucket" "bucky"{
       bucket = var.bucky
       tags = {
         name = var.bucky
    }
}

resource "aws_dynamodb_table" "my_dynamo_table"{
         name = var.dynamo_table
         billing_mode = "PAY_PER_REQUEST"
         hash_key = "LockID"

          attribute {
              name = "LockID"
              type = "S"
        }
         tags = {
         name = var.dynamo_table
    }

}

