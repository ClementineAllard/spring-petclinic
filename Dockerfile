# Utilisez une image de base légère avec JDK installé
FROM openjdk:8-jre-slim

# Définissez la version de JMeter que vous souhaitez utiliser
ENV JMETER_VERSION 5.5

# Définir le dossier d'installation de JMeter
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV PATH $JMETER_HOME/bin:$PATH

# Installation de JMeter
RUN apt-get update -y && \
    apt-get install -y wget unzip && \
    wget https://downloads.apache.org/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz -O /tmp/apache-jmeter.tgz && \
    tar -xzf /tmp/apache-jmeter.tgz -C /opt && \
    rm /tmp/apache-jmeter.tgz && \
    apt-get remove -y wget unzip && \
    apt-get autoremove -y && \
    apt-get clean

# Définir le répertoire de travail par défaut
WORKDIR $JMETER_HOME

# Commande par défaut pour JMeter (afficher l'aide)
CMD ["jmeter", "-h"]