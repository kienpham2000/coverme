.PHONY: coverme deploy update-lib
.SILENT: coverme deploy update-lib

REGION = us-east-1
APP_NAME = coverme
LAMBDA_BUCKET = lambda-coverme

coverme:
	rm -rf bin/* && cd api && env GOOS=linux go build -ldflags '-d -s -w' -a -tags netgo -installsuffix netgo -o ../bin/${APP_NAME} .

deploy:
	aws cloudformation deploy --template-file cfn/infra.yml --stack-name ${APP_NAME}-infra --capabilities CAPABILITY_IAM --region ${REGION} --no-fail-on-empty-changeset
	aws cloudformation wait stack-update-complete

update-lib:
	go mod download && go mod vendor
