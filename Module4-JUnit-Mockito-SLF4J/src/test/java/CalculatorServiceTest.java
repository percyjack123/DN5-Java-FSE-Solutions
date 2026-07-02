package com.cognizant.service;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class CalculatorServiceTest {

    @Test
    void testAdd() {

        CalculatorService calculatorService = new CalculatorService();

        assertEquals(5, calculatorService.add(2, 3));

    }

}