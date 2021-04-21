package com.peter.kist.service;

import com.google.common.collect.Lists;
import com.peter.kist.model.dto.second.GurvicResult;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class SecondMethod extends AbstractMethod {

  private static final Double POSITIVE_OUTCOME = 0.6;


  public GurvicResult calculateAll(List<Double> inputValues, Integer amountOfStage) {
    final var maxValues = findMaxValues(inputValues, amountOfStage);
    final var minValues = findMinValues(inputValues, amountOfStage);
    final var gurvicSums = gurvicMethod(maxValues, minValues);

    final var posRank = ranking(maxValues);
    final var negRank = ranking(minValues);
    final var gurRank = ranking(gurvicSums);

    return new GurvicResult(maxValues, minValues, gurvicSums, posRank, negRank, gurRank);
  }

  private List<Double> gurvicMethod(List<Double> maxValues, List<Double> minValues) {
    List<Double> gurvicSums = new ArrayList<>();
    double currentSum;
    for (int i = 0; i < maxValues.size(); ++i) {
      currentSum = maxValues.get(i) * POSITIVE_OUTCOME + (1 - POSITIVE_OUTCOME) * minValues.get(i);
      gurvicSums.add(currentSum);
    }
    return gurvicSums;
  }

}
