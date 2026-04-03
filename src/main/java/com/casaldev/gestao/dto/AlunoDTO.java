package com.casaldev.gestao.dto;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public interface AlunoDTO {

    record Request(
            @NotBlank(message = "O nome é obrigatório")
            @Size(min = 3) 
            String nome,

            @NotBlank(message = "A matrícula é obrigatória") 
            @Pattern(regexp = "\\d+", message = "A matrícula deve conter apenas números") 
            @Size(min = 8, max = 8, message = "A matrícula deve ter 8 dígitos") 
            String matricula) {
    }

    record Response(
            Long id,
            String nome,
            String matricula) {
    }
}