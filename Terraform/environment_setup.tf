provider "aws" {
  access_key = "Access_Key"
  secret_key = "Secret_Key"
  region     = "eu-north-1"
}

resource "aws_instance" "csbp_staging" {
  ami             = "ami-01996625fff6b8fcc"
  instance_type   = "t3.small"
  key_name        = "prod_key"
  security_groups = ["launch-wizard-1"]

  tags = {
    Name = "Staging"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo get -y update
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
              sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
              sudo apt-get update
              sudo apt-get install -y docker-ce
              sudo usermod -aG docker ubuntu
              sudo systemctl enable docker
              sudo systemctl start docker
              wget https://github.com/prometheus/node_exporter/releases/download/v0.15.2/node_exporter-0.15.2.linux-amd64.tar.gz
              tar -xf node_exporter-0.15.2.linux-amd64.tar.gz
              sudo mv node_exporter-0.15.2.linux-amd64/node_exporter /usr/local/bin
              rm -r node_exporter-0.15.2.linux-amd64*
              sudo useradd -rs /bin/false node_exporter
              EOF
}

resource "aws_instance" "csbp_prod" {
  ami             = "ami-01996625fff6b8fcc"
  instance_type   = "t3.small"
  key_name        = "prod_key"
  security_groups = ["launch-wizard-1"]

  tags = {
    Name = "Prod"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo get -y update
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
              sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
              sudo apt-get update
              sudo apt-get install -y docker-ce
              sudo usermod -aG docker ubuntu
              sudo systemctl enable docker
              sudo systemctl start docker
              wget https://github.com/prometheus/node_exporter/releases/download/v0.15.2/node_exporter-0.15.2.linux-amd64.tar.gz
              tar -xf node_exporter-0.15.2.linux-amd64.tar.gz
              sudo mv node_exporter-0.15.2.linux-amd64/node_exporter /usr/local/bin
              rm -r node_exporter-0.15.2.linux-amd64*
              sudo useradd -rs /bin/false node_exporter
              EOF
}


resource "aws_instance" "csbp_build" {
  ami             = "ami-01996625fff6b8fcc"
  instance_type   = "t3.small"
  key_name        = "prod_key"
  security_groups = ["launch-wizard-1"]
  tags = {
    Name = "Build-Server"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo get -y update
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
              sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
              sudo apt-get update
              sudo apt-get install -y docker-ce
              sudo usermod -aG docker ubuntu
              sudo systemctl enable docker
              sudo systemctl start docker
              wget https://github.com/prometheus/node_exporter/releases/download/v0.15.2/node_exporter-0.15.2.linux-amd64.tar.gz
              tar -xf node_exporter-0.15.2.linux-amd64.tar.gz
              sudo mv node_exporter-0.15.2.linux-amd64/node_exporter /usr/local/bin
              rm -r node_exporter-0.15.2.linux-amd64*
              sudo useradd -rs /bin/false node_exporter
              
              EOF

}

resource "aws_instance" "csbp_monitoring" {
  ami             = "ami-01996625fff6b8fcc"
  instance_type   = "t3.medium"
  key_name        = "prod_key"
  security_groups = ["launch-wizard-1"]

  tags = {
    Name = "Monitoring"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo get -y update
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
              sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
              sudo apt-get update
              sudo apt-get install -y docker-ce
              sudo usermod -aG docker ubuntu
              sudo systemctl enable docker
              sudo systemctl start docker
              wget https://github.com/prometheus/node_exporter/releases/download/v0.15.2/node_exporter-0.15.2.linux-amd64.tar.gz
              tar -xf node_exporter-0.15.2.linux-amd64.tar.gz
              sudo mv node_exporter-0.15.2.linux-amd64/node_exporter /usr/local/bin
              rm -r node_exporter-0.15.2.linux-amd64*
              sudo useradd -rs /bin/false node_exporter

              EOF

}

resource "aws_instance" "csbp_swarmmanager" {
  ami             = "ami-01996625fff6b8fcc"
  instance_type   = "t3.micro"
  key_name        = "prod_key"
  security_groups = ["launch-wizard-1"]

  tags = {
    Name = "Swarm Manager"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo get -y update
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
              sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
              sudo apt-get update
              sudo apt-get install -y docker-ce
              sudo usermod -aG docker ubuntu
              sudo systemctl enable docker
              sudo systemctl start docker
              wget https://github.com/prometheus/node_exporter/releases/download/v0.15.2/node_exporter-0.15.2.linux-amd64.tar.gz
              tar -xf node_exporter-0.15.2.linux-amd64.tar.gz
              sudo mv node_exporter-0.15.2.linux-amd64/node_exporter /usr/local/bin
              rm -r node_exporter-0.15.2.linux-amd64*
              sudo useradd -rs /bin/false node_exporter
              EOF
}

