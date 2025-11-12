package com.maxfit.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CorsConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
            .allowedOriginPatterns(
                // ✅ Domínio do front (Netlify)
                "https://neon-raindrop-7da3fc.netlify.app",
                // ✅ Domínio da API (Render)
                "https://max-fit-api-2.onrender.com",
                // ✅ locais de teste (opcional)
                "http://localhost:5500",
                "http://127.0.0.1:5500"
            )
            .allowedMethods("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS")
            .allowedHeaders("*")
            .allowCredentials(true)
            .maxAge(3600);
    }
}
