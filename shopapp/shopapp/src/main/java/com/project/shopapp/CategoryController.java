package com.project.shopapp;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/v1/categories")

public class CategoryController {
    //Hiện tất cả các categories
    @GetMapping("") //http://localhost:8088/api/v1/categories
    public ResponseEntity<String> getAllCategories(){
        return ResponseEntity.ok("chao ban haha");

    }
    @PostMapping("")
    public ResponseEntity<String> insertCategory(){
        return ResponseEntity.ok( "This is insertCategory");
    }
    @PutMapping("/{id}")
    public ResponseEntity<String> updateCategory(@PathVariable Long id){
        return ResponseEntity.ok( "insertCategory with id ="+ id);
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteCategory(@PathVariable Long id){
        return ResponseEntity.ok( "deleteCategory with id=" +id);
    }


}
