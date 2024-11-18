# Utilisez une image de base légère avec JDK installé
FROM openjdk:8-jre-slim

# Définissez la version de JMeter que vous souhaitez utiliser
ENV JMETER_VERSION 5.6.3

# Définir le dossier d'installation de JMeter
ENV JMETER_HOME C:\Program Files\apache-jmeter-${JMETER_VERSION}
ENV PATH $JMETER_HOME/bin:$PATH

# Définir le répertoire de travail par défaut
WORKDIR $JMETER_HOME

# Commande par défaut pour JMeter (afficher l'aide)
CMD ["jmeter", "-h"]