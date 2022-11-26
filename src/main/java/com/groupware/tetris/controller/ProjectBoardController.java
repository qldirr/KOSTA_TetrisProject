package com.groupware.tetris.controller;

import com.groupware.tetris.dto.project.BoardFormDto;
import com.groupware.tetris.service.EmployeeService;
import com.groupware.tetris.service.ProjectBoardService;
import com.groupware.tetris.service.ProjectService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
public class ProjectBoardController {

    private final ProjectService projectService;

    private final EmployeeService employeeService;

    private final ProjectBoardService boardService;

    private static Long curProject;


    @GetMapping(value = "/projectdetail/{projectId}")
    public String getListProjectBoard(@PathVariable("projectId") Long projectId, Model model){

        curProject = projectId;
        model.addAttribute("project", projectService.getProject(projectId));
        model.addAttribute("boards", boardService.getListProjectBoard(projectId));


        return "/projectdetail/board";
    }

    @GetMapping(value = "projectdetail/register")
    public String getBoardRegisterForm(){
        return "/projectdetail/register";
    }

    @PostMapping(value = "projectdetail/register")
    public String registProjectBoard(@Valid BoardFormDto boardFormDto, BindingResult bindingResult){

        if (bindingResult.hasErrors()) {
            return "/projectdetail/register";
        }

        try {
            boardService.saveProjectBoard(boardFormDto);
        } catch (Exception e) {
            e.printStackTrace();
            return  "/projectdetail/register";
        }

        return "redirect:" + curProject;
    }

}
