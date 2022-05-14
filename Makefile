TAG_VERSION := 0.0.1

build:
	docker build -t dotnet-service .

run:
	docker run -p 5196:5196 dotnet-service

auth:
	grep -v '^#' .env.local | grep -e "CR_PAT" | sed -e 's/.*=//' | docker login ghcr.io -u USERNAME --password-stdin

tag:
	docker tag dotnet-service ghcr.io/apinanyogaratnam/dotnet-service:${TAG_VERSION}
	git tag -m "v${TAG_VERSION}" v${TAG_VERSION}

push:
	docker push ghcr.io/apinanyogaratnam/dotnet-service:${TAG_VERSION}
	git push --tags
