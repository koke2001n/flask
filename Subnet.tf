resource "aws_subnet" "alb_public_subnet_1a"{
    vpc_id            = aws_vpc.tf_vpc.id
    cidr_block        = "10.2.1.0/24"
    availability_zone = "ap-northeast-1a"
    tags = {
        "Name" = "tf-alb-public-subnet-1a"

    }
}

resource "aws_subnet" "app_private_subnet_1a"{
    vpc_id            = aws_vpc.tf_vpc.id
    cidr_block        = "10.2.2.0/24"
    availability_zone = "ap-northeast-1a"
    tags = {
        "Name" = "tf-app-private-subnet-1a"

    }
}

resource "aws_subnet" "alb_public_subnet_1c"{
    vpc_id            = aws_vpc.tf_vpc.id
    cidr_block        = "10.2.3.0/24"
    availability_zone = "ap-northeast-1c"
    tags = {
        "Name" = "tf-alb-public-subnet-1c"

    }
}

resource "aws_subnet" "app_private_subnet_1c"{
    vpc_id            = aws_vpc.tf_vpc.id
    cidr_block        = "10.2.4.0/24"
    availability_zone = "ap-northeast-1c"
    tags = {
        "Name" = "tf-app-private-subnet-1c"
    }
}