# Makefile

setup:
	conda env create -f environment.yml

run:
	uvicorn src.api.main:app --reload

docker-build:
	docker build -t mlops-boilerplate .

docker-run:
	docker run -p 8000:8000 mlops-boilerplate

test:
	pytest -v
