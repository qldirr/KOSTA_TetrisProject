package com.groupware.tetris.controller;

import com.groupware.tetris.constant.TaskStatus;
import com.groupware.tetris.dto.project.BoardAttachDto;
import com.groupware.tetris.dto.project.BoardFormDto;
import com.groupware.tetris.dto.project.BoardReplyDto;
import com.groupware.tetris.dto.project.TaskFormDto;
import com.groupware.tetris.entity.project.BoardAttach;
import com.groupware.tetris.service.BoardAttachService;
import com.groupware.tetris.service.EmployeeService;
import com.groupware.tetris.service.ProjectBoardService;
import com.groupware.tetris.service.ProjectService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.Banner;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.*;

@Controller
@RequiredArgsConstructor
public class ProjectBoardController {

    private final ProjectService projectService;

    private final BoardAttachService attachService;

    private final EmployeeService employeeService;

    private final ProjectBoardService boardService;

    private static Long curProject;


    @GetMapping(value = "/projectdetail/{projectId}")
    public String getListProjectBoard(@PathVariable("projectId") Long projectId, Model model) {

        curProject = projectId;
        model.addAttribute("project", projectService.getProject(projectId));
        model.addAttribute("boards", boardService.getListProjectBoard(projectId));
        model.addAttribute("replies", boardService.getTotalListBoardReplies(projectId));

        return "/projectdetail/board";
    }

    @GetMapping(value = "projectdetail/register")
    public String getBoardRegisterForm(Model model) {
        model.addAttribute("projectId", curProject);
        return "/projectdetail/register";
    }

    @PostMapping(value = "projectdetail/register")
    public String registProjectBoard(@Valid BoardFormDto boardFormDto, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "/projectdetail/register";
        }

        try {
            boardService.saveProjectBoard(boardFormDto);
        } catch (Exception e) {
            e.printStackTrace();
            return "/projectdetail/register";
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


    @PostMapping(value = "/projectdetail/uploadfile")
    public @ResponseBody ResponseEntity uploadBoardAttach(List<MultipartFile> uploadFile) {

        List<BoardAttachDto> attaches = attachService.uploadBoardAttach(uploadFile);

        return new ResponseEntity<List<BoardAttachDto>>(attaches, HttpStatus.OK);
    }

    @GetMapping(value = "/display")
    public @ResponseBody ResponseEntity<byte[]> getFile(String fileName) {

        ResponseEntity<byte[]> result = null;
        List<Object> thumbnailInfo = attachService.getThumbnailImg(fileName);

        byte[] file = (byte[]) thumbnailInfo.get(0);
        HttpHeaders headers = (HttpHeaders) thumbnailInfo.get(1);

        try {
            result = new ResponseEntity<byte[]>(file, headers, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;

    }

    @GetMapping(value = "/projectdetail/taskboard")
    public String getProjectTaskPage() {
        return "projectdetail/taskboard";
    }

    @GetMapping(value = "/projectdetail/taskList")
    public @ResponseBody ResponseEntity getListProjectTask() {
        List<TaskFormDto> tasks = boardService.getListProjectTasks(curProject);
        return new ResponseEntity<List<TaskFormDto>>(tasks, HttpStatus.OK);
    }

    @GetMapping(value = "/projectdetail/registerTask")
    public String TaskRegisterForm(Model model) {
        model.addAttribute("member", boardService.getListProjectMember(curProject));
        return "/projectdetail/registerTask";
    }

    @PostMapping(value = "/projectdetail/registerTask")
    public String registProjectTask(TaskFormDto taskFormDto) {
        boardService.saveProjectTask(curProject, taskFormDto);
        return "redirect:" + "taskboard";
    }

    @PostMapping(value = "/projectdetail/modifyTask")
    public @ResponseBody int modifyTaskStatus(@RequestBody TaskFormDto taskFormDto) {

        Long taskId = taskFormDto.getId();
        TaskStatus status = taskFormDto.getStatus();
        int result = boardService.updateTaskStatus(taskId, status);

        return result;
    }

    @DeleteMapping(value = "/projectdetail/removeTask/{taskId}")
    public @ResponseBody int removeProjectTask(@PathVariable Long taskId) {
        int result = boardService.deleteProjectTask(taskId);
        return result;
    }

    @GetMapping(value = "/projectdetail/tasklist")
    public String getProjectTaskListPage(){
        return "/projectdetail/tasklist";
    }
}
