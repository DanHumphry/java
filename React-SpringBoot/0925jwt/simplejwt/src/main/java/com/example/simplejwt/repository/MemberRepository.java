package com.example.simplejwt.repository;

import com.example.simplejwt.models.Member;
import org.springframework.data.repository.CrudRepository;

public interface MemberRepository extends CrudRepository<Member, Long> {

    Member findByUsername(String username);

}
