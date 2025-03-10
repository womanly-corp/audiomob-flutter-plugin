# audiomob

A new Flutter plugin project.

## Publishing AudioMob SDK to AWS CodeArtifact repository

```zsh
cd android
export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain wromance --domain-owner 237520028262 --region us-east-1 --query authorizationToken --output text`
./gradlew publish
```
