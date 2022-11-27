package com.groupware.tetris.controller;

import com.groupware.tetris.dto.project.BoardFormDto;
import com.groupware.tetris.dto.project.BoardReplyDto;
import com.groupware.tetris.service.EmployeeService;
import com.groupware.tetris.service.ProjectBoardService;
import com.groupware.tetris.service.ProjectService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

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
        model.addAttribute("replies", boardService.getTotalListBoardReplies(projectId));

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


    @PostMapping(value = "projectdetail/registerReply/{boardId}")
    public @ResponseBody ResponseEntity registerReply(@RequestBody BoardReplyDto boardReplyDto, @PathVariable Long boardId,
                                                      BindingResult bindingResult) {

        List<BoardReplyDto> replies = new ArrayList<>();
        try {
            boardService.saveBoardReply(boardReplyDto);
            replies = boardService.getListBoardReplies(boardId);

        } catch (Exception e) {

        }

        return new ResponseEntity<List<BoardReplyDto>>(replies, HttpStatus.OK);
    }

    @DeleteMapping(value = "projectdetail/removeReply/{boardId}/{replyId}")
    public @ResponseBody ResponseEntity removeBoardReply(@PathVariable Long boardId, @PathVariable Long replyId) {

        boardService.deleteBoardReply(replyId);
        List<BoardReplyDto> replies = boardService.getListBoardReplies(boardId);

        return new ResponseEntity<List<BoardReplyDto>>(replies, HttpStatus.OK);
    }

}
