package com.maxfit.dto.response;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class ProgressoResponse {

    private Long id;
    private Long alunoId;
    private String alunoNome;

    private Double peso;
    private Double altura;
    private Double imc;
    private String classificacaoIMC;

    private Double circunferenciaBracos;
    private Double circunferenciaPeito;
    private Double circunferenciaCintura;
    private Double circunferenciaQuadril;
    private Double circunferenciaCoxas;
    private Double circunferenciaPanturrilhas;

    private Double percentualGordura;
    private Double massaMuscular;

    private String observacoes;
    private LocalDateTime dataRegistro;
}