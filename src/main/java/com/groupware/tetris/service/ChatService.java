package com.groupware.tetris.service;

import com.groupware.tetris.dto.chat.ChatContentsDto;
import com.groupware.tetris.dto.chat.ChatParticipantDto;
import com.groupware.tetris.dto.chat.ChatRoomDto;
import com.groupware.tetris.entity.chat.ChatContents;
import com.groupware.tetris.entity.chat.ChatParticipant;
import com.groupware.tetris.entity.chat.ChatRoom;
import com.groupware.tetris.entity.user.Department;
import com.groupware.tetris.entity.user.Employee;
import com.groupware.tetris.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.security.Principal;
import java.util.*;

@Service
@RequiredArgsConstructor
public class ChatService {

    private final ChatRoomRepository chatRoomRepository;
    private final EmployeeRepository employeeRepository;
    private final DepartmentRepository departmentRepository;
    private final ChatParticipantRepository chatParticipantRepository;
    private final ChatContentsRepository chatContentsRepository;

    public List<Employee> getListEmp(){
        return employeeRepository.findAll();
    }

    public List<Department> getListDept(){
        return departmentRepository.findAll();
    }

    public List<ChatRoom> getListChatRoom(String empId){
        return chatRoomRepository.findCRoomListByEmployeeId(empId);
    }

    public ChatRoom createChatRoom(Long empId, String email){
        Employee loginEmp = employeeRepository.findByEmail(email);
        Employee chatEmp = employeeRepository.getEmployeeById(empId);
        String roomId = UUID.randomUUID().toString();
        List<Employee> chatPart = new ArrayList<>();
        chatPart.add(loginEmp);
        chatPart.add(chatEmp);
        String title = "";
        for(int i=0;i<chatPart.size();i++){
            title += chatPart.get(i).getName();
            if(i != chatPart.size()-1){
                title += ", ";
            }else{
                break;
            }
        }
        ChatRoom chatRoom = new ChatRoom();
        chatRoom.setId(roomId);
        chatRoom.setTitle(title);
        chatRoomRepository.save(chatRoom);
        for(int i=0;i<chatPart.size();i++){
            ChatParticipant chatParticipant = new ChatParticipant();
            chatParticipant.setChatRoom(chatRoom);
            chatParticipant.setEmployee(chatPart.get(i));
            chatParticipantRepository.save(chatParticipant);
        }

        return chatRoom;
    }

    public void updateCRoomFavor(ChatParticipantDto chatParticipantDto){
        ChatParticipant chatParticipant = chatParticipantRepository.findById(chatParticipantDto.getId())
                .orElseThrow(EntityNotFoundException::new);
        chatParticipant.updateFavor();
    }

    public void deleteChatRoom(ChatParticipantDto chatParticipantDto){
        ChatParticipant chatParticipant = chatParticipantRepository.findById(chatParticipantDto.getId())
                .orElseThrow(EntityNotFoundException::new);
        chatParticipantRepository.delete(chatParticipant);
    }

    public ChatContents registerChatContents(ChatContentsDto chatContentsDto, String email, String roomId){
        Employee employee = employeeRepository.findByEmail(email);
        ChatRoom chatRoom = chatRoomRepository.findById(roomId)
                .orElseThrow(EntityNotFoundException::new);
        ChatContents chatContents = ChatContents.createChatContents(chatContentsDto, employee, chatRoom);
        chatContentsRepository.save(chatContents);

        return chatContents;
    }

    public List<ChatContents> getListChatContents(String roomId){
        List<ChatContents> chatContentsList = chatContentsRepository.findAllByRoomId(roomId);

        return chatContentsList;
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
