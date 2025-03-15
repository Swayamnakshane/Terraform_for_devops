resource "aws_key_pair" "my_key"{

      key_name = "terraformserver"
      public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILxFD0lfpvwwrxjlK/6Gpxm66/XfmQqzKJlGg2mW2rzt ubuntu@ip-172-31-17-140"
}


resource "aws_default_vpc" "default"{
}


resource "aws_security_group" "my_security"{

         name        = "wizhard_sec"
         description = "inbound security rules"
         vpc_id      = aws_default_vpc.default.id
         tags = {
              name = "wizhard_sec"
       }


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

}

resource "aws_instance" "ec2_instance"{

     key_name = aws_key_pair.my_key.key_name
     security_groups = [aws_security_group.my_security.name]
     instance_type = "t2.micro"
     ami = "ami-03fd334507439f4d1"
     
     root_block_device {
          volume_size = 8
          volume_type = "gp3"
   }
      tags = {
          name = "terraform_server"
    }
}
