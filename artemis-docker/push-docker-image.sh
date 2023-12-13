# bash prepare-docker.sh --from-release --artemis-version 2.28.0            
# cd _TMP_/artemis/2.20.0                                                   

set -e
ARTEMIS_VERSION=$1 # 2.31.2
ARTCODED_VERSION=$2 # 2024.0.0-2_31_2-jre-21
KEYCLOAK_VERSION=$3 # 23.0.1
bash prepare-docker.sh --from-release --artemis-version $ARTEMIS_VERSION     
cd ./_TMP_/artemis/$ARTEMIS_VERSION                                                            
docker build --build-arg KEYCLOAK_VERSION=${KEYCLOAK_VERSION} -f ./docker/Dockerfile-openjdk-21 -t nbittich/artemis:v$ARTCODED_VERSION .                                                                   
docker tag nbittich/artemis:v$ARTCODED_VERSION nbittich/artemis:v$ARTCODED_VERSION                                                                         
docker push nbittich/artemis:v$ARTCODED_VERSION   
cd -
rm -rf _TMP_/   
