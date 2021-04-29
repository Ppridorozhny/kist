package com.peter.kist.service;


import com.google.common.collect.Lists;
import com.peter.kist.model.dto.fourth.ParetoResultDto;
import org.apache.commons.lang3.tuple.Pair;

import java.util.*;

public class FourthMethod {

    public ParetoResultDto calculateAll(List<Integer> inputValues, int amountOfExperts) {
        var listInput = parsingList(inputValues, amountOfExperts);
        var pairPareto = createParetoAndMap(listInput);
        paretoComparing(pairPareto.getRight(), pairPareto.getLeft());

        return new ParetoResultDto(pairPareto.getRight(), pairPareto.getLeft());
    }

    private List<List<Integer>> parsingList(List<Integer> inputValues, Integer amountOfExperts){
        return Lists.partition(inputValues, amountOfExperts);
    }

    private void paretoComparing(Map<String, List<Integer>> rankedMap, Set<String> pareto) {

        for (String keys : rankedMap.keySet()) {
            for (String keys2 : rankedMap.keySet()) {

                if (keys.equals(keys2))
                    continue;

                var result = new HashSet<Integer>();
                var firstList = rankedMap.get(keys);
                var secondList = rankedMap.get(keys2);

                for (int i = 0; i < firstList.size(); ++i) {
                    result.add(Integer.compare(firstList.get(i), secondList.get(i)));
                }

                if (result.size() <= 2 && !result.containsAll(Set.of(1, -1))) {
                    var sum = result.stream()
                            .reduce(0, Integer::sum);
                    if (sum > 0) {
                        pareto.remove(keys);
                    } else if (sum < 0) {
                        pareto.remove(keys2);
                    }
                }
            }
        }
    }

    private Pair<Set<String>, Map<String, List<Integer>>> createParetoAndMap(List<List<Integer>> inputValues) {
        var rankedMap = new HashMap<String, List<Integer>>();
        var pareto = new HashSet<String>();

        for(int i = 0; i < inputValues.size(); ++i){
            String key = "y" + (i + 1);
            rankedMap.put(key, inputValues.get(i));
            pareto.add(key);
        }

        return Pair.of(pareto, rankedMap);
    }


}
