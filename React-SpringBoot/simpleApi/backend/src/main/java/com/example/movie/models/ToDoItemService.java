package com.example.movie.models;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ToDoItemService {

    public ToDoItem get(final String id) {
// do id validation
        return ToDoItem.builder()
                .title("Add an id validation")
                .build();
    }

}
