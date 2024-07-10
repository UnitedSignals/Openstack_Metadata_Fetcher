# Verwende das offizielle Golang Image als Basis
FROM golang:1.18

# Installiere zusätzliche Werkzeuge, falls erforderlich
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Setze das Arbeitsverzeichnis im Container
WORKDIR /app

# Kopiere die go.mod und go.sum Dateien und installiere Abhängigkeiten
COPY go.mod go.sum ./
RUN go mod download

# Kopiere den Rest des Projektverzeichnisses in das Arbeitsverzeichnis
COPY . .

# Setze den Befehl, der ausgeführt wird, wenn der Container gestartet wird
CMD ["tail", "-f", "/dev/null"]
