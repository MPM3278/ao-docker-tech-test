resource "aws_eip" "nat_eip" {
  vpc      = true
  
  
  tags = merge(map( 
            "Name", var.name, 
        ), var.default_tags)
}