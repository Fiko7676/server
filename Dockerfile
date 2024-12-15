# Dockerfile
# Basis-Image verwenden
FROM ubuntu:24.04

# Umgebung aktualisieren und benötigte Pakete installieren
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Code-Server GPG-Schlüssel und Repository hinzufügen
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Arbeitsverzeichnis setzen
WORKDIR /config

# Standard-Port freigeben
EXPOSE 8080

# Code-Server starten
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none"]
