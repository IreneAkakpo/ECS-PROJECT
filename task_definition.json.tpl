{
    "requiresCompatibilities": [
        "FARGATE"
    ],
    "family": "ecs-project",
    "containerDefinitions": [
        {
            "name": "mynginx",
            "image": "mynginx:latest",
            "essential": true
        }
    ],
    "volumes": [],
    "networkMode": "awsvpc",
    "memory": "3 GB",
    "cpu": "1 vCPU",
    "executionRoleArn": "arn:aws:iam::332984147329:role/ecsTaskExecutionRole"
}