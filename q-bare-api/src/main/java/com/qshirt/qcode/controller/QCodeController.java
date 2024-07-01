package com.qshirt.qcode.controller;

import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/qcodes")
public class QCodeController {

    List<String> qcodes = new ArrayList<>();

    @GetMapping
    public List<String> getAllQCodes() {
        return qcodes;
    }


    @PostMapping
    public String createQCode(@RequestBody String qcode) {
        qcodes.add(qcode);
        return "Qcode created: " + qcode;
    }

    @DeleteMapping("/{qcode}")
    public String deleteQCode(@PathVariable String qcode) {
        if (qcodes.contains(qcode)) {
            qcodes.remove(qcode);
            return "Qcode deleted: " + qcode;
        }
        return "QCode not found";
    }

}
