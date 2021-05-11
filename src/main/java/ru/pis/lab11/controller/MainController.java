package ru.pis.lab11.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.pis.lab11.model.Equation;
import ru.pis.lab11.model.Func;

import static ru.pis.lab11.model.Func.*;

@Controller
public class MainController {


    @GetMapping("/")
    public String index() {
        return "mainPage";
    }

    @PostMapping("calc")
    public String calc(String first, String second, String third, Model model) {
        Equation equation = Equation.builder()
                .first(getFunctionByName(first))
                .firstName(getFuncDesc(first))
                .second(getFunctionByName(second))
                .secondName(getFuncDesc(second))
                .third(getFunctionByName(third))
                .thirdName(getFuncDesc(third))
                .build();
        model.addAttribute("equation", equation.toString());

        return "mainPage";
    }
}
