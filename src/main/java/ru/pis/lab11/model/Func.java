package ru.pis.lab11.model;

import lombok.Data;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.function.Function;

@Data
public class Func {
    private static final Function<Double, Double> F1 = Math::sqrt;
    private static final String F1Name = "sqrt";
    private static final Function<Double, Double> F2 = (x) -> new BigDecimal("1").divide(BigDecimal.valueOf(x), RoundingMode.CEILING).doubleValue();
    private static final String F2Name = "1/";
    private static final Function<Double, Double> F3 = Math::exp;
    private static final String F3Name = "e^";

    public static Function<Double, Double> getFunctionByName(String name) {
        if ("F1".equalsIgnoreCase(name)) {
            return F1;
        } else if ("F2".equalsIgnoreCase(name)) {
            return F2;
        } else if ("F3".equalsIgnoreCase(name)) {
            return F3;
        }

        throw new RuntimeException("Function not found");
    }

    public static String getFuncDesc(String desc) {
        if ("F1".equalsIgnoreCase(desc)) {
            return F1Name;
        } else if ("F2".equalsIgnoreCase(desc)) {
            return F2Name;
        } else if ("F3".equalsIgnoreCase(desc)) {
            return F3Name;
        }

        throw new RuntimeException("Function not found");
    }
}
