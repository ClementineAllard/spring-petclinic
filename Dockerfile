# Utilisez une image de base légère avec JDK installé
FROM openjdk:8-jre-slim

# Définissez la version de JMeter que vous souhaitez utiliser
ENV JMETER_VERSION 5.6.3

# Définir le dossier d'installation de JMeter
ENV JMETER_HOME C:\Program Files\apache-jmeter-${JMETER_VERSION}
ENV	JMETER_BIN	$JMETER_HOME/bin
ENV PATH $PATH:$JMETER_BIN

# Définir le répertoire de travail par défaut
COPY entrypoint.sh /

WORKDIR	$JMETER_HOME

ENTRYPOINT ["/entrypoint.sh"]