package com.casaldev.gestao.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.casaldev.gestao.model.Aluno;

public interface AlunoRepository extends JpaRepository<Aluno, Long> {
    List<Aluno> findByNome(String nome);
    Aluno findByMatricula(String nome);
}
