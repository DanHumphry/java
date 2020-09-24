package com.example.movie.models;

import com.example.movie.ApiResponse.ApiResponse;
import lombok.Builder;
import java.util.List;

public class TodoItemResponse extends ApiResponse<ToDoItem> {

    @Builder
    public TodoItemResponse(final ToDoItem toDoItem, final List<String> errors) {
        super(toDoItem);
        this.setErrors(errors);
    }
}
