package com.casaldev.gestao.mapper;

import java.util.List;

import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

import com.casaldev.gestao.dto.AlunoDTO;
import com.casaldev.gestao.model.Aluno;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface AlunoMapper {

    Aluno converteDTO (AlunoDTO.Request request);
    AlunoDTO.Response converteAluno (Aluno aluno);
    List<AlunoDTO.Response> converteAlunos (List<Aluno> alunos);
}