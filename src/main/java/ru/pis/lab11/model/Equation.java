package ru.pis.lab11.model;

import lombok.Builder;
import lombok.Data;

import java.util.function.Function;

@Data
@Builder
public class Equation {
    private Function<Double, Double> first;
    private Function<Double, Double> second;
    private Function<Double, Double> third;

    private String firstName;
    private String secondName;
    private String thirdName;

    public Double calculate(Double x) {
        Double thirdRes = third.apply(x);
        System.out.println("Третья функция: " + thirdRes);
        Double secondRes = second.apply(thirdRes);
        System.out.println("Вторая функция: " + secondRes);
        Double firstRes = first.apply(secondRes);
        System.out.println("Первая функция: " + firstRes);
        return first.apply(this.second.apply(this.third.apply(x)));
    }

    @Override
    public String toString() {
        return "y = " + thirdName + "(" + secondName + "(" + firstName + "(x)))";
    }
}
