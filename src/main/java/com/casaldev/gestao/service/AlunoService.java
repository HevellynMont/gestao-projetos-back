package com.casaldev.gestao.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.casaldev.gestao.model.Aluno;
import com.casaldev.gestao.repository.AlunoRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AlunoService {

    private final AlunoRepository alunoRepository;

    @Transactional
    public Aluno salvar(Aluno aluno) {
        Aluno buscaAluno = alunoRepository.findByMatricula(aluno.getMatricula());
        if (buscaAluno != null) {
            if (buscaAluno.getMatricula().equals(aluno.getMatricula()) || buscaAluno.getNome().equals(buscaAluno.getNome())) {
                return null;
            }
        }
        return alunoRepository.save(aluno);
    }
}
