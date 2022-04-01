# bash prepare-docker.sh --from-release --artemis-version 2.20.0            
# cd _TMP_/artemis/2.20.0                                                   

set -e
ARTEMIS_VERSION=$1 # 2.21.0
ARTCODED_VERSION=$2 # 2022.0.0
bash prepare-docker.sh --from-release --artemis-version $ARTEMIS_VERSION     
cd ./_TMP_/artemis/$ARTEMIS_VERSION                                                            
docker build -f ./docker/Dockerfile-adoptopenjdk-11 -t artcoded/artemis:v$ARTCODED_VERSION .                                                                   
docker tag artcoded/artemis:v$ARTCODED_VERSION nbittich/artemis:v$ARTCODED_VERSION                                                                         
docker push nbittich/artemis:v$ARTCODED_VERSION      