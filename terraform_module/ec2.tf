resource "aws_key_pair" "my_key_new"{

      key_name = "${var.env}-infra-app-key"
      public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILxFD0lfpvwwrxjlK/6Gpxm66/XfmQqzKJlGg2mW2rzt ubuntu@ip-172-31-17-140"
      tags = {
       
	Environment = var.env
  }
}


resource "aws_default_vpc" "default"{
}


resource "aws_security_group" "my_security"{

         name        = "${var.env}-infra-wizhard_sec"
         description = "inbound security rules"
         vpc_id      = aws_default_vpc.default.id


         ingress {
               from_port   = 22
               to_port     = 22
               protocol    = "tcp"
               cidr_blocks = ["0.0.0.0/0"]
               description = "ssh port open"
   }
          ingress {
               from_port   =  80
               to_port     =  80
               protocol    = "tcp"
               cidr_blocks = ["0.0.0.0/0"]
               description = "http port open"
   }
           egress {
               from_port   = 0
               to_port     = 0 
               protocol    = "-1"
               cidr_blocks = ["0.0.0.0/0"]
               description = "all port open"
   }
          tags = {
           Environment = "${var.env}-infra-wizhard_sec"
     }

}

resource "aws_instance" "ec2_instance"{
     count = var.instance_count
     key_name = aws_key_pair.my_key_new.key_name
     security_groups = [aws_security_group.my_security.name]
     instance_type = var.instnace_type 
     ami = var.ami_id
     
     root_block_device {
          volume_size = 10
          volume_type = "gp3"
   }
      tags = {
          name = "${var.env}-infra_server"
          Environment =var.env
    }
}
