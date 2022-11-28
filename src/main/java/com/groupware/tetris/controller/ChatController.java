package com.groupware.tetris.controller;

import com.groupware.tetris.entity.chat.ChatRoom;
import com.groupware.tetris.service.ChatService;
import com.groupware.tetris.service.EmployeeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/messanger")
@RequiredArgsConstructor
public class ChatController {

    private final ChatService chatService;

    @GetMapping(value = {"/main", "/main/emplist"})
    public String main(Model model){
        model.addAttribute("empList", chatService.getListEmp());
        model.addAttribute("deptList", chatService.getListDept());
        return "/messanger/main/emplist";
    }

    @GetMapping("/main/chatroomlist")
    public void chatRoomList(Principal principal, Model model){
        String employeeId = principal.getName();
        List<ChatRoom> chatRoomList = chatService.getListChatRoom(employeeId);
        model.addAttribute("chatRoomList", chatRoomList);
    }

    @PostMapping("/createchatroom")
    public void createChatRoom(){

    }

    //채팅방 목록 조회
//    @GetMapping("/main/chatroomlist")
//    public void chatRoomList(Model model){
//        model.addAttribute("chatRoomList", chatService.finnAllRoom());
//    }

    //채팅방 생성
//    @PostMapping("/main/createchatroom")
//    public String register(@RequestParam String roomName, RedirectAttributes rttr){
//        rttr.addFlashAttribute("roomName", chatService.createRoom(roomName));
//
//        return "redirect:/messanger/main/chatroomlist";
//    }

    //채팅방 입장
//    @GetMapping("/main/enter/{roomId}")
//    public String roomDetail(Model model, @PathVariable String roomId){
//        model.addAttribute("roomId", roomId);
//
//        return "/messanger/chatting";
//    }

    //특정 채팅방 조회
//    @GetMapping("/main/getchatroom/{roomId}")
//    public void getChatRoom(@PathVariable String roomId, Model model){
//        model.addAttribute("chatRoom", chatService.findById(roomId));
//    }

}
