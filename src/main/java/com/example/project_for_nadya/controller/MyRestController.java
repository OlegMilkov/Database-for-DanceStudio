package com.example.project_for_nadya.controller;

import com.example.project_for_nadya.entity.Child;
import com.example.project_for_nadya.exeption_handling.NoSuchChildExeption;
import com.example.project_for_nadya.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@RestController
@RequestMapping("/data")
public class MyRestController {

    @Autowired
    private ReportService reportService;

    @GetMapping("/child")
    public List<Child> showAllChildren() {
        List<Child> allChildren = reportService.getAllChildren();
        return allChildren;
    }

    @GetMapping("/child/{id}")
    public Child getChild(@PathVariable int id) {
        Child child = reportService.getChild(id);
        if (child == null) {
            throw new NoSuchChildExeption("There is no Child with " + id + " in our Database");
        }
        return child;
    }

    @PostMapping("/child")
    public Child addNewChild(@RequestBody Child child) {
        reportService.saveChild(child);
        return child;
    }

    @PutMapping("/child")
    public Child updateChild(@RequestBody Child child) {
        reportService.saveChild(child);
        return child;
    }

    @DeleteMapping("/child/{id}")
    public String deleteChild(@PathVariable int id) {
        Child child = reportService.getChild(id);
        if (child == null) {
            throw new NoSuchChildExeption("There is no Child with" + id + " in our Database");
        }
        reportService.deleteChild(id);
        return "Child with ID =" + id + " was deleted";
    }

    @GetMapping("/children/{group_name}")
    public List<Child> getChildrenByGroup(@PathVariable String group_name) {
        List<Child> allChildByGroup = reportService.getChildrenByGroup(group_name);
        return allChildByGroup;
    }

    @GetMapping("/count-by-group/{group_name}")
    public ResponseEntity<String> getNumberOfChildrenInEachGroup(@PathVariable String group_name) {
        int count = reportService.getNumberOfChildrenInEachGroup(group_name);
        String message = "Кількість дітей  у группі " + group_name + ": " + count;

        return ResponseEntity.ok(message);
    }

    @GetMapping("/showAllDebtor")
    public List<Child> getAllDebtors() {
        List<Child> allDebtors = reportService.getAllDebtors();
        return allDebtors;
    }

    @GetMapping("/ChildrenByName/{name}")
    public List<Child> getChildrenByName(@PathVariable String name) {
        List<Child> getChildrenName = reportService.getChildrenByName(name);
        return getChildrenName;

    }

    @GetMapping("/allDistinctGroupNames")
    public List<Child> getAllDistinctGroupNames() {
        List<Child> allDistinctGroupNames = reportService.getAllDistinctGroupNames();
        return allDistinctGroupNames;
    }
}
