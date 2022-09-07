[
  {
    "name": "nginx",
    "image": "nginx:latest",
    "cpu": 128,
    "memory": 1024,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 3001
      }
    ]

  }
]
