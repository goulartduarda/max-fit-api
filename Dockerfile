# =========================
# Stage 1: Build (Maven + JDK 17)
# =========================
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Baixa dependências primeiro (cache mais eficiente)
COPY pom.xml .
RUN mvn -q -DskipTests dependency:go-offline

# Copia o código e compila
COPY src ./src
RUN mvn -q -DskipTests clean package

# =========================
# Stage 2: Runtime (JRE 17)
# =========================
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

# Copia o .jar gerado (qualquer nome)
COPY --from=build /app/target/*.jar app.jar

# Porta padrão da imagem (Render injeta $PORT em runtime)
ENV PORT=8080
EXPOSE 8080

# Permite passar flags opcionais via JAVA_OPTS (ex: -Xms128m -Xmx512m)
# Usa a porta dinâmica do Render
ENTRYPOINT ["sh", "-c", "java -Dserver.port=${PORT} ${JAVA_OPTS} -jar app.jar"]
