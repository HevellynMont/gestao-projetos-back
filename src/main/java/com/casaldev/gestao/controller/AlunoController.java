package com.casaldev.gestao.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.casaldev.gestao.dto.AlunoDTO;
import com.casaldev.gestao.dto.AlunoDTO.Response;
import com.casaldev.gestao.mapper.AlunoMapper;
import com.casaldev.gestao.model.Aluno;
import com.casaldev.gestao.service.AlunoService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/alunos")
public class AlunoController {

    private final AlunoService alunoService;
    private final AlunoMapper alunoMapper;

    @PostMapping("/cadastrar")
    public ResponseEntity<Response> cadastrarAluno(@RequestBody @Valid AlunoDTO.Request alunoDTO) {
        Aluno aluno = alunoMapper.converteDTO(alunoDTO);
        Aluno alunoCadastrado = alunoService.salvar(aluno);
        if (alunoCadastrado != null) {
            return ResponseEntity.status(HttpStatus.CREATED).body(alunoMapper.converteAluno(alunoCadastrado));
        }
        return ResponseEntity.status(HttpStatus.CONFLICT).build();
    }
}
