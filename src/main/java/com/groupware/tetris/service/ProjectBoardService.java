package com.groupware.tetris.service;

import com.groupware.tetris.dto.project.BoardAttachDto;
import com.groupware.tetris.dto.project.BoardFormDto;
import com.groupware.tetris.dto.project.BoardReplyDto;
import com.groupware.tetris.entity.project.BoardAttach;
import com.groupware.tetris.entity.project.BoardReply;
import com.groupware.tetris.entity.project.Project;
import com.groupware.tetris.entity.project.ProjectBoard;
import com.groupware.tetris.entity.user.Employee;
import com.groupware.tetris.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
@RequiredArgsConstructor
public class ProjectBoardService {

    private final ProjectBoardRepository boardRepository;

    private final BoardReplyRepository replyRepository;

    private final ProjectRepository projectRepository;

    private final EmployeeRepository employeeRepository;

    private final BoardAttachRepository attachRepository;

    public Long saveProjectBoard(BoardFormDto boardFormDto){

        Long writerId = boardFormDto.getWriterId();
        Employee writer = employeeRepository.getEmployeeById(writerId);
        Long projectId = boardFormDto.getProjectId();
        Project project = projectRepository.findProjectById(projectId);

        boardFormDto.setWriter(writer);
        boardFormDto.setProject(project);

        ProjectBoard projectBoard = ProjectBoard.createBoard(boardFormDto);
        boardRepository.save(projectBoard);

        List<BoardAttach> attaches =
            boardFormDto.getBoardAttachDtos().stream().map(a->BoardAttach.createAttach(a)).collect(Collectors.toList());
        for (int i = 0; i < attaches.size(); i++) {

            BoardAttach boardAttach = attaches.get(i);
            boardAttach.setProjectBoard(projectBoard);
            attachRepository.save(boardAttach);

        }

        return projectBoard.getId();
    }

    public Long saveBoardReply(BoardReplyDto boardReplyDto) {

        Long writerId = boardReplyDto.getWriterId();
        Employee writer = employeeRepository.getEmployeeById(writerId);
        Long projectBoardId = boardReplyDto.getBoardId();
        ProjectBoard board = boardRepository.findProjectBoardById(projectBoardId);

        boardReplyDto.setWriter(writer);
        boardReplyDto.setBoard(board);

        BoardReply boardReply = BoardReply.createReply(boardReplyDto);
        replyRepository.save(boardReply);

        return boardReply.getId();
    }


    @Transactional(readOnly = true)
    public List<BoardFormDto> getListProjectBoard(Long projectId){

        List<ProjectBoard> boards = boardRepository.findProjectBoardsByProject_IdOrderByIdDesc(projectId);
        List<BoardFormDto> boardFormDtos = new ArrayList<>();

        for (ProjectBoard board : boards) {

            List<BoardAttach> attaches = attachRepository.findBoardAttachesByProjectBoard_Id(board.getId());
            List<BoardAttachDto> attachDtos = attaches.stream().map(attach -> BoardAttachDto.toDto(attach)).collect(Collectors.toList());
            boardFormDtos.add(BoardFormDto.toDto(board, attachDtos));
        }

        return boardFormDtos;

    }

    @Transactional(readOnly = true)
    public List<BoardReplyDto> getListBoardReplies(Long boardId) {

        List<BoardReply> replies = replyRepository.findBoardRepliesByProjectBoard_IdOrderByIdDesc(boardId);
        List<BoardReplyDto> boardReplyDtos = replies.stream().map(reply -> BoardReplyDto.toDto(reply))
                .collect(Collectors.toList());

        return boardReplyDtos;
    }


    @Transactional(readOnly = true)
    public List<BoardReplyDto> getTotalListBoardReplies(Long projectId) {

        List<BoardReply> replies = replyRepository.getTotalBoardReply(projectId);
        List<BoardReplyDto> boardReplyDtos = replies.stream().map(reply -> BoardReplyDto.toDto(reply))
                .collect(Collectors.toList());

        return  boardReplyDtos;
    }

    public void deleteBoardReply(Long replyId) {
        BoardReply boardReply = replyRepository.findById(replyId)
                .orElseThrow(EntityNotFoundException::new);
        replyRepository.delete(boardReply);
    }

}
