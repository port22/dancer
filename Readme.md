* build
`
docker build -t dancer .
`

* generate app:

`
docker run -it --rm -v $PWD:/app port22/dancer dancer2 -a app
`

* run app:

`docker run --restart=always -d --name dancer -p 5000:5000 -v $PWD/app:/app dancer`
