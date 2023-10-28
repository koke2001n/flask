### EIP ###
resource "aws_eip" "tf_eip_1a" {
  vpc = true
  tags = {
    "Name" = "tf-eip-1a"
  }
}

resource "aws_eip" "tf_eip_1c" {
  vpc = true
  tags = {
    "Name" = "tf-eip-1c"
  }
}

## NatGateway ###
resource "aws_nat_gateway" "tf_nat_gateway_1a" {
  allocation_id = aws_eip.tf_eip_1a.id
  subnet_id = aws_subnet.alb_public_subnet_1a.id

  tags = {
    "Name" = "tf-nat-gateway-1a"
  }

  depends_on = [aws_internet_gateway.tf_internet_gateway]
}

resource "aws_nat_gateway" "tf_nat_gateway_1c" {
  allocation_id = aws_eip.tf_eip_1c.id
  subnet_id = aws_subnet.alb_public_subnet_1c.id

  tags = {
    "Name" = "tf-nat-gateway-1c"
  }

  depends_on = [aws_internet_gateway.tf_internet_gateway]
}