# bash prepare-docker.sh --from-release --artemis-version 2.20.0            
# cd _TMP_/artemis/2.20.0                                                   

set -e
ARTEMIS_VERSION=$1 # 2.24.0
ARTCODED_VERSION=$2 # 2022.1.2-2_24_0-jre-17
bash prepare-docker.sh --from-release --artemis-version $ARTEMIS_VERSION     
cd ./_TMP_/artemis/$ARTEMIS_VERSION                                                            
docker build -f ./docker/Dockerfile-openjdk-17 -t nbittich/artemis:v$ARTCODED_VERSION .                                                                   
docker tag nbittich/artemis:v$ARTCODED_VERSION nbittich/artemis:v$ARTCODED_VERSION                                                                         
docker push nbittich/artemis:v$ARTCODED_VERSION   
cd -
rm -rf _TMP_/   