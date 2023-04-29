resource "aws_nat_gateway" "private_nat" {
  allocation_id = aws_eip.prod_eip.id
  subnet_id     = aws_subnet.public_subnet.0.id
  depends_on    = [aws_eip.prod_eip]

  tags = merge(
    local.common_tags,
    {
      Name = "VisualpathProd-public-ngw"
    }
  )
}