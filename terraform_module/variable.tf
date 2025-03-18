variable "env" {
    description = "this is env"
    type = string

}

variable "bucket_name"{
     description = "this is bucket name"
     type = string
}


variable "instance_count"{
     description = "this is number of ec2 instance" 
     type = number
   
}

variable "instnace_type" {

  description = "this is instnace type "
  type = string
}

variable "ami_id"{
 description = " this is ami id "
 type = string 
}

variable "hash_key" {
   description = " this is hash key "
   type = string
}
