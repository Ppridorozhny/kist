package com.peter.kist.controller;


import com.peter.kist.model.dto.MarkDTO;
import com.peter.kist.model.entity.Mark;
import com.peter.kist.service.MarkService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.peter.kist.AppConstants.MARK_LIST_TYPE;

@Controller
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@RequestMapping("/mark")
public class MarkController {

    private final MarkService markService;

    private final ModelMapper mapper;

    @GetMapping("/{id}")
    public String getMark(Model model, @PathVariable Integer id) {

        log.debug("getMark");

        Mark mark = markService.getMark(id);

        model.addAttribute("markForm", mapper.map(mark, MarkDTO.class));

        return "mark/markView";
    }

    @GetMapping("/create")
    public String createMark(Model model) {

        log.debug("createMark");

        model.addAttribute("markForm", new MarkDTO());

        return "mark/markCreation";
    }

    @PostMapping("/create")
    public String createMark(@ModelAttribute("markForm") MarkDTO markForm, BindingResult bindingResult) {

        log.debug("Mark creation");

        Mark mark = mapper.map(markForm, Mark.class);

        markService.createMark(mark);

        return "redirect:/mark/" + mark.getId();
    }

    @PostMapping("/edit")
    public String edit(@ModelAttribute("markForm") MarkDTO mark, Model model) {
        log.debug("editMark");

        return "mark/markCreation";
    }

    @DeleteMapping("/{id}")
    public String delete(@PathVariable Integer id) {

        log.debug("deleteMark");

        markService.deleteMark(id);

        return "redirect:/mark/all";
    }

    @GetMapping("/all")
    public String findAll(Model model) {

        log.debug("findAllMark");

        List<Mark> mark = markService.findAll();

        model.addAttribute("mark", mapper.map(mark, MARK_LIST_TYPE));

        return "mark/markTableView";
    }
}
