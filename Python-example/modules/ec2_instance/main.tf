provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "sampleinstance" {
  ami = var.amiid
  instance_type = var.instancetype
  key_name = var.keyname
  vpc_security_group_ids = var.sgid
  subnet_id = var.subnetid

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host = self.public_ip
  }

  provisioner "file" {
    source = "app.py"
    destination = "/home/ubuntu/appy.py"
  }

  provisioner "remote-exec" {
    inline = [ 
        "echo 'Hello from remote instance'",
        "sudo apt update -y",
        "sudo apt-get install -y python3-pip",
        "cd /home/ubuntu",
        "sudo pip3 install flask",
        "sudo python3 app.py &"
        ]
  }
}