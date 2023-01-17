provider "aws" {
  // asia pacific south east aka Sydney
  // for a list of other regions see https://gist.github.com/dwmkerr/58bfbf55eb9f05c8603958806add00cc
  region        = "ap-southeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-006fd15ab56f0fbe6"
  instance_type = "t3.nano"
}
