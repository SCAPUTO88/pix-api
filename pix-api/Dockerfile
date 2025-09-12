# Etapa 1: Build
FROM maven:3.9.7-eclipse-temurin-21 AS build
WORKDIR /app

# Copia todos os poms primeiro (melhora cache)
COPY pom.xml .
COPY pix-domain/pom.xml pix-domain/
COPY pix-storage/pom.xml pix-storage/
COPY pix-events/pom.xml pix-events/
COPY pix-ledger/pom.xml pix-ledger/
COPY pix-monitoring/pom.xml pix-monitoring/
COPY pix-api/pom.xml pix-api/
COPY pix-e2e-tests/pom.xml pix-e2e-tests/

# Copia o código-fonte
COPY pix-domain pix-domain
COPY pix-storage pix-storage
COPY pix-events pix-events
COPY pix-ledger pix-ledger
COPY pix-monitoring pix-monitoring
COPY pix-api pix-api
COPY pix-e2e-tests pix-e2e-tests

# Compila todos os módulos
RUN mvn -q -DskipTests clean package

# Etapa 2: Runtime
FROM gcr.io/distroless/java21-debian12:nonroot
WORKDIR /app
COPY --from=build /app/pix-api/target/pix-api-*.jar app.jar
USER nonroot
EXPOSE 8080
ENTRYPOINT ["java","-XX:+UseSerialGC","-XX:MaxRAMPercentage=60","-XX:+ExitOnOutOfMemoryError","-jar","/app/app.jar"]