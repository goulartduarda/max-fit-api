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
                // ✅ seu site atual no Netlifys
                "https://neon-raindrop-7da3fc.netlify.app",
                // (opcional) outro domínio antigo seu
                "https://cheerful-klepon-54ef0e.netlify.app",
                // (opcional) páginas que você já usou
                "https://maxfit-tcc.onrender.com",
                // (opcional) para testes locais (Live Server)
                "http://localhost:5500",
                "http://127.0.0.1:5500"
            )
            .allowedMethods("GET","POST","PUT","PATCH","DELETE","OPTIONS")
            .allowedHeaders("*")
            .allowCredentials(true)
            .maxAge(3600);
    }
}
