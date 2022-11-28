package com.groupware.tetris.service;

import com.groupware.tetris.entity.chat.ChatRoom;
import com.groupware.tetris.entity.user.Department;
import com.groupware.tetris.entity.user.Employee;
import com.groupware.tetris.repository.ChatRoomRepositoryCustom;
import com.groupware.tetris.repository.DepartmentRepository;
import com.groupware.tetris.repository.EmployeeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@RequiredArgsConstructor
public class ChatService {

    private ChatRoomRepositoryCustom chatRoomRepository;
    private EmployeeRepository employeeRepository;
    private DepartmentRepository departmentRepository;

    public List<Employee> getListEmp(){
        return employeeRepository.findAll();
    }

    public List<Department> getListDept(){
        return departmentRepository.findAll();
    }

    public List<ChatRoom> getListChatRoom(String employeeId){
        return chatRoomRepository.findCRoomListByEmployeeId(employeeId);
    }

    public ChatRoom registerChatRoom(ChatRoom chatRoom){
        return null;
    }

//    private Map<String, ChatRoomDto> chatRooms;
//
//    //의존관계 주입시 실행
//    @PostConstruct
//    private void init(){
//        chatRooms = new LinkedHashMap<>();
//    }
//
//    //전체 채팅방 최근 생성순으로 불러오기
//    public List<ChatRoomDto> finnAllRoom(){
//        List<ChatRoomDto> result = new ArrayList<>(chatRooms.values());
//        Collections.reverse(result);
//
//        return result;
//    }
//
//    //특정 채팅방 불러오기
//    public ChatRoomDto findById(String roomId){
//        return chatRooms.get(roomId);
//    }
//
//    //채팅방 생성
//    public ChatRoomDto createRoom(String roomName){
//        ChatRoomDto chatRoomDto = ChatRoomDto.create(roomName);
//        chatRooms.put(chatRoomDto.getRoomId(), chatRoomDto);
//
//        return chatRoomDto;
//    }

}
