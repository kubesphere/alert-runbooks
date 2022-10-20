URL ?= "http://localhost:8000"
	
build:
	@hugo --gc --minify --buildFuture -b $(URL) --config=config.yaml

run: build
	python3 -m http.server -d public 8000
