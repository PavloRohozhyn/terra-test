provider "aws" {
    region = "us-east-1"
}

# when we dont have vpc
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
}
# when we dont have subnet
resource "aws_subnet" "main" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
}

resource "aws_instance" "example" {
    ami = "ami-0ec10929233384c7f"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.main.id

    tags = {
        Name = "terra-test-instance"
    }
}