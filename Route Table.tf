## Route Table ##
## ALB ##
resource "aws_route_table" "alb_route_table"{
    vpc_id = aws_vpc.tf_vpc.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.tf_internet_gateway.id
        
    }
    tags = {
        "Name" = "tf-alb-route-table"
    }
}

resource "aws_route_table_association" "alb_table_association_1a"{
    subnet_id      = aws_subnet.alb_public_subnet_1a.id
    route_table_id = aws_route_table.alb_route_table.id
}

resource "aws_route_table_association" "alb_table_association_1c"{
    subnet_id      = aws_subnet.alb_public_subnet_1c.id
    route_table_id = aws_route_table.alb_route_table.id
}

## App ##
# ap-northeast-1a
resource "aws_route_table" "app_route_table_1a"{
    vpc_id = aws_vpc.tf_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.tf_nat_gateway_1a.id
    }

    tags = {
        "Name" = "tf-app-route-table-1a"
    }
}

resource "aws_route_table_association" "app_route_table_association_1a"{
    subnet_id = aws_subnet.app_private_subnet_1a.id
    route_table_id = aws_route_table.app_route_table_1a.id
}

# ap-northeast-1c
resource "aws_route_table" "app_route_table_1c"{
    vpc_id = aws_vpc.tf_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.tf_nat_gateway_1c.id
    }

    tags = {
        "Name" = "tf-app-route-table-1c"
    }
}

resource "aws_route_table_association" "app_route_table_association_1c"{
    subnet_id = aws_subnet.app_private_subnet_1c.id
    route_table_id = aws_route_table.app_route_table_1c.id
}