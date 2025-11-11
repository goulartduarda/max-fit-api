# =========================
# Etapa 1: Build (Maven + JDK 17)
# =========================
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copia o pom.xml e baixa dependências (melhora cache do build)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copia o restante do código e empacota o projeto
COPY src ./src
RUN mvn clean package -DskipTests

# =========================
# Etapa 2: Runtime (JRE 17)
# =========================
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

# Copia o .jar gerado (qualquer nome de jar)
COPY --from=build /app/target/*.jar app.jar

# Render define a variável PORT automaticamente
ENV PORT=8080
EXPOSE 8080

# Executa a aplicação usando a porta dinâmica do Render
ENTRYPOINT ["sh", "-c", "java -Dserver.port=${PORT} -jar app.jar"]
