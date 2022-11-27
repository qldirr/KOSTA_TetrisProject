package com.groupware.tetris.service;

import com.groupware.tetris.dto.project.BoardFormDto;
import com.groupware.tetris.dto.project.BoardReplyDto;
import com.groupware.tetris.entity.project.BoardReply;
import com.groupware.tetris.entity.project.Project;
import com.groupware.tetris.entity.project.ProjectBoard;
import com.groupware.tetris.entity.user.Employee;
import com.groupware.tetris.repository.BoardReplyRepository;
import com.groupware.tetris.repository.EmployeeRepository;
import com.groupware.tetris.repository.ProjectBoardRepository;
import com.groupware.tetris.repository.ProjectRepository;
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

    public Long saveProjectBoard(BoardFormDto boardFormDto){

        Long writerId = boardFormDto.getWriterId();
        Employee writer = employeeRepository.getEmployeeById(writerId);
        Long projectId = boardFormDto.getProjectId();
        Project project = projectRepository.findProjectById(projectId);

        boardFormDto.setWriter(writer);
        boardFormDto.setProject(project);

        ProjectBoard projectBoard = ProjectBoard.createBoard(boardFormDto);
        boardRepository.save(projectBoard);

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

        List<BoardFormDto> boardFormDtos = boards.stream().map(board -> BoardFormDto.toDto(board))
                .collect(Collectors.toList());

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
