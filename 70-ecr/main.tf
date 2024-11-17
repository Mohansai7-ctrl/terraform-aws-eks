resource "aws_ecr_repository" "backend" {
    name = "expense/backend"   # namespace/repository
    image_tag_mutability = "MUTABLE"

    image_scanning_configuration {
        scan_on_push = true
    }
}


resource "aws_ecr_repository" "frontend" {
    name = "expense/frontend"
    image_tag_mutability = "MUTABLE"
    image_scanning_configuration {
        scan_on_push = true
    }
}

resource "aws_ecr_repository" "mysql" {
    name = "expense/mysql"
    image_tag_mutability = "MUTABLE"
    image_scanning_configuration {
        scan_on_push = true
    }
}




