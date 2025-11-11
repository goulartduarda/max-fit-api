# =========================
# Stage 1: Build (Maven + JDK 17)
# =========================
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

COPY pom.xml .
RUN mvn -q -DskipTests dependency:go-offline

COPY src ./src
RUN mvn -q -DskipTests clean package

# =========================
# Stage 2: Runtime (JRE 17)
# =========================
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

# Render (Docker) expõe tráfego na 10000. Faça a app escutar nela.
ENV PORT=10000
EXPOSE 10000

# Força o Spring a escutar na 10000 (0.0.0.0)
ENTRYPOINT ["sh", "-c", "java -Dserver.port=${PORT} -jar app.jar"]
