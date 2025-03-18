resource "aws_dynamodb_table" "my_dynamo_table"{
         name = "${var.env}-infra-dynamo_table"
         billing_mode = "PAY_PER_REQUEST"
         hash_key = var.hash_key

          attribute {
              name = var.hash_key
              type = "S"
        }
         tags = {
         name = "${var.env}-infra-dynamo_table"
         Environment = var.env
    }

}
