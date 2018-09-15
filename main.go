package main

import (
	"github.com/aws/aws-lambda-go/lambda"
)

func lambdaHandler() (string, error) {
	return "hola!", nil
}

func main() {
	lambda.Start(lambdaHandler)
}
