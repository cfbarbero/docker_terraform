```
docker build -t tf .
```

Must symlink your .aws folder for this to work.  Note this is a crappy insecure way of doing this but it works for now.
```
mklink /d .aws ~\.aws
```

This expects 2 volumes to be mounted:
1) the source files you want to build/manage with terraform (ie /terraform_gig)
2) the .aws folder with your credentials in it.  part of the build will setup the AWS_PROFILE env var to 'saml' so that terraform defaults to using the awssaml managed credentials.
```
docker run -it -v c:/projects\dhi\terraform_gig:/terraform_gig -v c:/users/cris.barbero/.aws:/root/.aws tf /bin/bash
```
