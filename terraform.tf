provider "aws" {
  region = "us-east-1" # ou sua região preferida
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-0360c520857e3138f" # AMI Ubuntu 24.04 (verifique no console da AWS)
  instance_type = "t3.micro"
  key_name      = "sre"
  vpc_security_group_ids = ["sg-0399fff0ef3a85fea"]
  user_data = file("setup.sh") # script de inicialização

  tags = {
    Name = "sre-terraform"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ubuntu.id
  allocation_id = "eipalloc-02c3e88dd18415db1"
}