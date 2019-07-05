FROM google/cloud-sdk:alpine

RUN apk add --update --no-cache openjdk8-jre &&\
	gcloud components install cloud-firestore-emulator beta --quiet

VOLUME /opt/data

EXPOSE 9090

ENTRYPOINT ["gcloud", "beta", "emulators", "firestore", "start", "--host-port=0.0.0.0:9090"]
