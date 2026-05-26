resource "aws_vpc" "vpc-app-01" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "subnets" {
  count                   = length(var.subnet_cidrs)
  vpc_id                  = aws_vpc.vpc-app-01.id
  cidr_block              = var.subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name                                            = "${var.vpc_name}-public-${count.index + 1}"
    "kubernetes.io/role/elb"                        = "1"
    "kubernetes.io/cluster/${var.app_cluster_name}" = "owned"

  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-app-01.id
  tags = {
    "Name" = "${var.vpc_name}-igw"
  }
}

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.vpc-app-01.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.subnets)
  route_table_id = aws_route_table.route.id
  subnet_id      = aws_subnet.subnets[count.index].id

}