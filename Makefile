URL ?= "http://localhost:8000"
	
build:
	scripts/preprocess.sh
	@hugo --gc --buildFuture -b $(URL) --config=config.yaml --contentDir=content-pre-processed

run: build
	@hugo server --config config.yaml -v
