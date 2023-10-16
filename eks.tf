locals {
  cluster_name = "my-eks-cluster"
}
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.1.0"
  cluster_name    = local.cluster_name
  cluster_version = "1.22"
  subnets         = module.vpc.private_subnets

  tags = {
    Name = "MY-EKS-Cluster"
  }

  vpc_id = module.vpc.vpc_id
  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "Worker-Group-1"
      instance_type                 = "t2.micro"
      asg_desired_capacity          = 2
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    },
    {
      name                          = "Worker-Group-2"
      instance_type                 = "t2.micro"
      asg_desired_capacity          = 1
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
    },
  ]
}

