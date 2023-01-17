provider "aws" {
  // asia pacific south east aka Sydney
  // for a list of other regions see https://gist.github.com/dwmkerr/58bfbf55eb9f05c8603958806add00cc
  region        = "ap-southeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-006fd15ab56f0fbe6"
  instance_type = "t3.nano"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World" > index.html
    nohup busybox httpd -f -p 8080 &
    EOF

  tags = {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
