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
    user = "ubuntu"  # Replace with the appropriate username for your EC2 instance
    private_key = file("~/.ssh/id_rsa")  # Replace with the path to your private key
    host = self.public_ip
  }

  # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source = "app.py"  # Replace with the path to your local file
    destination = "/home/ubuntu/appy.py" # Replace with the path on the remote instance
  }

  provisioner "remote-exec" {
    inline = [ 
        "echo 'Hello from remote instance'",
        "sudo apt update -y",  # Update package lists (for ubuntu)
        "sudo apt-get install -y python3-pip",  # Example package installation
        "cd /home/ubuntu",
        "sudo pip3 install flask",
        "sudo python3 app.py &"
        ]
  }
}