* generate app:

`docker run -it -v $PWD:/app port22/dancer`

* run app:

`docker run -d --name dancer -p 5000:5000 -v $PWD:/app port22/dancer`
