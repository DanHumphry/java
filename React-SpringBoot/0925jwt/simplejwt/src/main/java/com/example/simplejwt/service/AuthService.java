package com.example.simplejwt.service;

import com.example.simplejwt.models.Member;

public interface AuthService {
    void signUpUser(Member member);

    Member loginUser(String id, String password);
}
